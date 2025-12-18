<?php
header('Content-Type: application/json');

/* =======================
   HYTERA CONFIG
======================= */
$HYTERA   = 'http://10.10.80.21:9780';
$USERNAME = 'admin';
$PASSWORD = '123456';

/* =======================
   POSTGRES CONFIG
======================= */
$PG_DSN  = "pgsql:host=10.10.80.20;port=5432;dbname=e-gvardiya";
$PG_USER = "postgres";
$PG_PASS = "Qwerty123";

/* =======================
   DB CONNECT
======================= */
try {
    $pdo = new PDO($PG_DSN, $PG_USER, $PG_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'error' => 'DB CONNECT FAILED',
        'msg'   => $e->getMessage()
    ]);
    exit;
}

/* =======================
   HELPERS
======================= */
function curl_json($url, $headers, $body) {
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST           => true,
        CURLOPT_HTTPHEADER     => $headers,
        CURLOPT_POSTFIELDS     => json_encode($body),
        CURLOPT_TIMEOUT        => 10,
    ]);
    $res = curl_exec($ch);
    curl_close($ch);
    return json_decode($res, true);
}

/* =======================
   HYTERA LOGIN
======================= */
function hytera_get_token() {
    global $HYTERA, $USERNAME, $PASSWORD;

    $tokenFile = __DIR__ . '/hytera_token.json';
    $now = time();

    // 1️⃣ Agar token fayli bor bo‘lsa
    if (file_exists($tokenFile)) {
        $data = json_decode(file_get_contents($tokenFile), true);

        // token hali amal qilsa
        if (!empty($data['token']) && $data['expire_at'] > $now) {
            return $data['token'];
        }
    }

    // 2️⃣ Yangi token olamiz
    $ts = time();
    $step1 = hash('sha256', $USERNAME . '_' . $PASSWORD);
    $step2 = hash('sha256', $step1 . '_' . $ts);
    $encrypted = 'SHA256_T:' . $step2;

    $json = curl_json(
        $HYTERA . '/bvcsp/v1/auth/login',
        ['Content-Type: application/json'],
        [
            'Username'           => $USERNAME,
            'password_encrypted' => $encrypted,
            'timestamp'          => $ts
        ]
    );

    if (!isset($json['code']) || $json['code'] != 0) {
        http_response_code(500);
        echo json_encode(['error' => 'LOGIN FAILED', 'detail' => $json]);
        exit;
    }

    // 🔥 Hytera odatda tokenni 30–60 min beradi
    $token     = $json['data']['token'];
    $expireAt  = $now + 25 * 60; // 25 minut

    file_put_contents($tokenFile, json_encode([
        'token'     => $token,
        'expire_at'=> $expireAt
    ]));

    return $token;
}


/* =======================
   ROUTER
======================= */
$action = $_GET['action'] ?? '';

/* =======================
   DEVICE LIST + FULL SYNC
======================= */
if ($action === 'devices') {

    $token = hytera_get_token();

    $json = curl_json(
        $HYTERA . '/bvcsp/v1/pu/list',
        [
            'Content-Type: application/json',
            'Authorization: ' . $token
        ],
        [
            'page'       => 0,
            'pageSize'   => 1000,
            'needStatus' => true
        ]
    );

    if (!isset($json['data']) || !is_array($json['data'])) {
        echo json_encode($json);
        exit;
    }

    /* =======================
       1️⃣ INSERT / UPDATE
    ======================= */
    $activeCamCodes = [];

    $sqlUpsert = "
        INSERT INTO hr.body_cameras
          (cam_code, comment, lat, long, status)
        VALUES
          (:cam_code, :comment, :lat, :long, :status)
        ON CONFLICT (cam_code)
        DO UPDATE SET
          comment = EXCLUDED.comment,
          lat     = EXCLUDED.lat,
          long    = EXCLUDED.long,
          status  = EXCLUDED.status
    ";

    $stmtUpsert = $pdo->prepare($sqlUpsert);

    foreach ($json['data'] as $cam) {
        $camCode = $cam['id'];

        $activeCamCodes[] = $camCode;

        $stmtUpsert->execute([
            ':cam_code' => $camCode,
            ':comment'  => $cam['name'] ?? '',
            ':lat'      => $cam['gps']['lat'] ?? null,
            ':long'     => $cam['gps']['lng'] ?? null,
            ':status'   => $cam['status'] ?? 0
        ]);
    }

    /* =======================
       2️⃣ OFFLINE QILISH
       Hytera’da yo‘qlari
    ======================= */
    if (!empty($activeCamCodes)) {
        $placeholders = implode(',', array_fill(0, count($activeCamCodes), '?'));

        $sqlOff = "
            UPDATE hr.body_cameras
            SET status = false
            WHERE cam_code NOT IN ($placeholders)
        ";

        $stmtOff = $pdo->prepare($sqlOff);
        $stmtOff->execute($activeCamCodes);
    }

    echo json_encode([
        'code'    => 0,
        'synced'  => count($activeCamCodes),
        'message' => 'Body cameras synced successfully'
    ]);
    exit;
}

/* =======================
   WEBRTC OPEN
======================= */
if ($action === 'webrtc') {

    $input = json_decode(file_get_contents('php://input'), true);
    $id  = $input['id']  ?? null;
    $sdp = $input['sdp'] ?? null;

    if (!$id || !$sdp) {
        http_response_code(400);
        echo json_encode(['error' => 'id or sdp missing']);
        exit;
    }

    $token = hytera_get_token();


    $json = curl_json(
        $HYTERA . '/bvcsp/v1/dialog/device/webrtc',
        [
            'Content-Type: application/json',
            'Authorization: ' . $token
        ],
        [
            'id'    => $id,
            'index' => 0,
            'sdp'   => $sdp
        ]
    );

    echo json_encode($json);
    exit;
}

/* =======================
   DEFAULT
======================= */
http_response_code(404);
echo json_encode(['error' => 'Invalid action']);
