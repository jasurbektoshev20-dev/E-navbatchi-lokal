<?php
// SmartEye server
$url = "http://10.10.80.21/bvcsp/v1/auth/login";

// Login ma'lumotlari
$username = "admin";
$password = "123456"; // REAL password

// Parolni shifrlash: SHA256(account_password)
$raw = $username . "_" . $password;
$hash = hash("sha256", $raw);
$encrypted = "SHA256:" . $hash;

// Request body
$data = [
    "Username" => $username,
    "password_encrypted" => $encrypted,
    "timestamp" => time()
];

$ch = curl_init($url);
curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POST => true,
    CURLOPT_HTTPHEADER => [
        "Content-Type: application/json"
    ],
    CURLOPT_POSTFIELDS => json_encode($data)
]);

$response = curl_exec($ch);
curl_close($ch);

// JSON chiqaramiz
header("Content-Type: application/json");
echo $response;
