<?php
header('Content-Type: application/json');

// ====== HYTERA CONFIG ======
$HYTERA   = 'http://10.10.80.21:9780';
$USERNAME = 'admin';
$PASSWORD = '123456';

// ====== POSTGRES CONFIG ======
$PG_DSN  = "pgsql:host=10.10.80.20;port=5432;dbname=e-gvardiya";
$PG_USER = "postgres";
$PG_PASS = "Qwerty123";

// ====== DB CONNECT ======
try {
    $pdo = new PDO($PG_DSN, $PG_USER, $PG_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => 'DB CONNECT FAILED', 'msg' => $e->getMessage()]);
    exit;
}

// ====== SHA256 ======
function sha256($str) {
    return hash('sha256', $str);
}

// ====== CURL JSON REQUEST ======
function curl_json($url, $headers, $body) {
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => $headers,
        CURLOPT_POSTFIELDS => json_encode($body),
        CURLOPT_TIMEOUT => 10,
    ]);
    $res = curl_exec($ch);
    curl_close($ch);
    return json_decode($res, true);
}

// ====== LOGIN ======
function hytera_login() {
    global $HYTERA, $USERNAME, $PASSWORD;

    $ts = time(); // seconds

    // 1️⃣ step1 = SHA256(username_password)
    $step1 = hash('sha256', $USERNAME . '_' . $PASSWORD);

    // 2️⃣ step2 = SHA256(step1_timestamp)
    $step2 = hash('sha256', $step1 . '_' . $ts);

    // 3️⃣ final
    $encrypted = 'SHA256_T:' . $step2;

    $json = curl_json(
        $HYTERA . '/bvcsp/v1/auth/login',
        ['Content-Type: application/json'],
        [
            'Username' => $USERNAME,
            'password_encrypted' => $encrypted,
            'timestamp' => $ts
        ]
    );

    if (!isset($json['code']) || $json['code'] != 0) {
        http_response_code(500);
        echo json_encode([
            'error' => 'LOGIN FAILED',
            'detail' => $json
        ]);
        exit;
    }

    return $json['data']['token'];
}


// ====== ROUTER ======
$action = $_GET['action'] ?? '';

// ====== DEVICE LIST + SAVE TO DB ======
if ($action === 'devices') {
    global $pdo;

    $token = hytera_login();

    $json = curl_json(
        $HYTERA . '/bvcsp/v1/pu/list',
        [
            'Content-Type: application/json',
            'Authorization: ' . $token
        ],
        [
            'page' => 0,
            'pageSize' => 1000,
            'needStatus' => true
        ]
    );

    // 🔥 DB GA SAQLASH
    if (isset($json['data']) && is_array($json['data'])) {
        $sql = "
            INSERT INTO hr.body_cameras
              (cam_code, comment, lat, long, status)
            VALUES
              (:cam_code, :comment, :lat, :long, :status)
            ON CONFLICT (cam_code)
            DO UPDATE SET
              comment = EXCLUDED.comment,
              lat = EXCLUDED.lat,
              long = EXCLUDED.long,
              status = EXCLUDED.status
        ";

        $stmt = $pdo->prepare($sql);

        foreach ($json['data'] as $cam) {
            $stmt->execute([
                ':cam_code' => $cam['id'],
                ':comment'  => $cam['name'] ?? '',
                ':lat'      => $cam['gps']['lat'] ?? null,
                ':long'     => $cam['gps']['lng'] ?? null,
                ':status'   => $cam['status'] ?? 0
            ]);
        }
    }

    echo json_encode($json);
    exit;
}

// ====== WEBRTC OPEN ======
if ($action === 'webrtc') {
    $input = json_decode(file_get_contents('php://input'), true);
    $id  = $input['id']  ?? null;
    $sdp = $input['sdp'] ?? null;

    if (!$id || !$sdp) {
        http_response_code(400);
        echo json_encode(['error' => 'id or sdp missing']);
        exit;
    }

    $token = hytera_login();

    $json = curl_json(
        $HYTERA . '/bvcsp/v1/dialog/device/webrtc',
        [
            'Content-Type: application/json',
            'Authorization: ' . $token
        ],
        [
            'id' => $id,
            'index' => 0,
            'sdp' => $sdp
        ]
    );

    echo json_encode($json);
    exit;
}

// ====== DEFAULT ======
http_response_code(404);
echo json_encode(['error' => 'Invalid action']);
