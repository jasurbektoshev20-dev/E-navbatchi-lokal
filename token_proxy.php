<?php
// token_proxy.php
header('Content-Type: application/json; charset=utf-8');

// only allow POST from your frontend origin (optionally check session/user)
$input = json_decode(file_get_contents('php://input'), true);
$contractId = isset($input['contractId']) ? intval($input['contractId']) : 0;

if (!$contractId) {
    echo json_encode(['success'=>false, 'msg'=>'No contractId']);
    exit;
}

// credentials should be stored in server config / env, not in code
$username = 'mg_api@uzgps.uz';
$password = 'hc_b1c5vW%';
$payload = json_encode([
    'username' => $username,
    'password' => $password,
    'contractId' => $contractId,
    'show-objects-of-all-contracts' => true
]);

$ch = curl_init('https://smpo.uzgps.uz/api/auth/login');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
$res = curl_exec($ch);
$http = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

http_response_code($http);
echo $res;
