<?php
define('ARM_IN', true);
require_once("includes/functions.php");

header('Content-Type: application/json; charset=utf-8');

// only allow POST from your frontend origin (optionally check session/user)
$input = json_decode(file_get_contents('php://input'), true);

// --- Get and Sanitize Input Parameters ---
$objectId = isset($_GET['object-id']) ? intval($_GET['object-id']) : 0;
$startDate = isset($_GET['start-date']) ? $_GET['start-date'] : date('Y-m-d', strtotime('-7 days'));
$endDate = isset($_GET['end-date']) ? $_GET['end-date'] : date('Y-m-d');
$contractId = isset($_GET['contractId']) ? intval($_GET['contractId']) : 0;

// --- API Token Retrieval ---
$token = getToken($contractId); 

// --- Build the URL Safely using http_build_query() ---
$baseURL = 'https://smpo.uzgps.uz/api/sdx/mobject/track-by-day';

// Create an associative array of all query parameters
$queryParams = array(
    'object-id'        => $objectId,
    'start-date'       => $startDate,
    'end-date'         => $endDate,
);

// http_build_query() automatically handles all necessary URL encoding
$fullURL = $baseURL . '?' . http_build_query($queryParams);

// --- cURL Request ---
$curl = curl_init();

curl_setopt_array($curl, array(
    CURLOPT_URL => $fullURL,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30, // Increased timeout to 30 seconds (0 means indefinite, which is risky)
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'GET',
    CURLOPT_HTTPHEADER => array(
        'Accept: application/json',
        'Authorization: Bearer ' . $token['result']['map']['jwtToken'],
    ),
));

$response = curl_exec($curl);
$http = curl_getinfo($curl, CURLINFO_HTTP_CODE); // Capture the HTTP status code

// echo '<pre>';
// print_r($response);
// echo '</pre>';
// die();

// Production-ready output (if you remove the debugging block above)
http_response_code($http);
echo $response;
