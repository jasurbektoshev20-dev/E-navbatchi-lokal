<?php
// track_proxy.php
header('Content-Type: application/json; charset=utf-8');

// optional: only allow your origin or check session
// header('Access-Control-Allow-Origin: https://e-gvardiya.uz');

$qs = $_SERVER['QUERY_STRING']; // saqlangan query stringni tashqi APIga o'tkazamiz
$target = 'https://smpo.uzgps.uz/sdx/mobject/track-by-day?' . $qs;

// tokenni olish: agar sessionda token bo'lsa oling, yoki serverdan token olish logikasini chaqiring
$token = 'YOUR_JWT_HERE'; // ideal: session yoki token_proxy bilan avval olgan tokenni saqlang

$ch = curl_init($target);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
  'Authorization: Bearer ' . $token,
  'Accept: application/json'
]);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true); // follow redirects server-side
$res = curl_exec($ch);
$http = curl_getinfo($ch, CURLINFO_HTTP_CODE);
if ($res === false) {
  $err = curl_error($ch);
  curl_close($ch);
  http_response_code(502);
  echo json_encode(['success'=>false,'error'=>$err]);
  exit;
}
curl_close($ch);
http_response_code($http);
echo $res;
