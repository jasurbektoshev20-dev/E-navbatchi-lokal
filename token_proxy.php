<?php
// token_proxy.php
header('Content-Type: application/json; charset=utf-8');

// only allow POST from your frontend origin (optionally check session/user)
$input = json_decode(file_get_contents('php://input'), true);
$contractId = isset($input['contractId']) ? intval($input['contractId']) : 0;

if (!$contractId) {
    echo json_encode(['success' => false, 'msg' => 'No contractId']);
    exit;
}

$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => 'https://smpo.uzgps.uz/api/auth/login',
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 0,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'POST',
    CURLOPT_POSTFIELDS => '{
        "username": "mg_api@uzgps.uz",
        "password": "hc_b1c5v%W",
        "contractId": ' . $contractId . ',
        "show-objects-of-all-contracts": true
    }',
    CURLOPT_HTTPHEADER => array(
        'Content-Type: application/json',
        'Accept: application/json',
    ),
));

$response = curl_exec($curl);

// echo '<pre>';
// print_r($payload);
// echo '</pre>';
// die();

http_response_code($http);
echo $response;
