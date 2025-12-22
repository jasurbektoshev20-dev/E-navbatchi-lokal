<?php

if (!defined('ARM_IN'))
	die("Hacking attempt");

function MyPiCrypt($data)
{
	for ($i = 0, $key = 27, $c = 48; $i <= 255; $i++) {
		$c = 255 & ($key ^ ($c << 1));
		$table[$key] = $c;
		$key = 255 & ($key + 1);
	}
	$len = strlen($data);
	for ($i = 0; $i < $len; $i++) {
		$data[$i] = chr($table[ord($data[$i])]);
	}

	$data = base64_encode($data);
	$data = str_replace('+', 'pp', $data);
	$data = str_replace('=', 'tt', $data);
	$data = str_replace('/', 'ss', $data);

	return $data;
}

function MyPiDeCrypt($data)
{
	$data = str_replace('pp', '+', $data);
	$data = str_replace('tt', '=', $data);
	$data = str_replace('ss', '/', $data);
	$data = base64_decode($data);

	for ($i = 0, $key = 27, $c = 48; $i <= 255; $i++) {
		$c = 255 & ($key ^ ($c << 1));
		$table[$c] = $key;
		$key = 255 & ($key + 1);
	}
	$len = strlen($data);
	for ($i = 0; $i < $len; $i++) {
		$data[$i] = chr($table[ord($data[$i])]);
	}
	return $data;
}

function MyEscapeSymbols($data)
{
	$data = str_replace("G'", "Gʻ", $data);
	$data = str_replace("g'", "g‘", $data);
	$data = str_replace("O'", "Oʻ", $data);
	$data = str_replace("o'", "o‘", $data);
	$data = str_replace("'", "ʼ", $data);
	return $data;
}


function GetCamUrl($camindex)
{
	// AppKey va AppSecret
	$app_key = "19237793";
	$app_secret = "qPXC2OjLk66wyrbxJMRb";

	// So'rov uchun URL
	$uri = "/artemis/api/video/v1/cameras/previewURLs";
	$base_url = "https://10.10.80.12:443";
	$full_url = $base_url . $uri;

	// Sana va vaqt
	$date = gmdate("D, d M Y H:i:s T");
	$timestamp = round(microtime(true) * 1000);

	// X-Ca-Nonce (UUID)
	$nonce = uniqid();

	// So'rov tanasi (body)
	$body = json_encode([
		"cameraIndexCode" => $camindex, // Kamera index kodingizni kiriting
		"streamType" => 0,
		"protocol" => "websocket",
		"transmode" => 1,
		"requestWebsocketProtocol" => 0
	]);

	// Content-MD5 hisoblash
	$content_md5 = base64_encode(md5($body, true));

	// CanonicalizedHeaders (header'larni alfavit bo'yicha tartiblash)
	$headers = [
		"x-ca-key" => $app_key,
		"x-ca-timestamp" => $timestamp,
		"x-ca-nonce" => $nonce
	];
	ksort($headers); // Headerlarni alfavit bo'yicha tartiblash

	$canonicalized_headers = "";
	foreach ($headers as $key => $value) {
		$canonicalized_headers .= strtolower($key) . ":" . $value . "\n";
	}

	// CanonicalizedResource
	$canonicalized_resource = $uri;

	// X-Ca-Signature-Headers
	$x_ca_signature_headers = implode(",", array_keys($headers));

	// Imzo uchun matn yaratish
	$sign_string = "POST\n"
		. "application/json\n"
		. $content_md5 . "\n"
		. "application/json;charset=UTF-8\n"
		. $date . "\n"
		. $canonicalized_headers
		. $canonicalized_resource;

	// HMAC-SHA256 bilan X-Ca-Signature yaratish
	$signature = base64_encode(hash_hmac('sha256', $sign_string, $app_secret, true));

	// cURL so'rovni yuborish
	$curl = curl_init();
	curl_setopt_array($curl, array(
		CURLOPT_URL => $full_url,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_SSL_VERIFYPEER => false,
		CURLOPT_SSL_VERIFYHOST => false,
		CURLOPT_ENCODING => '',
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 3,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => 'POST',
		CURLOPT_POSTFIELDS => $body,
		CURLOPT_HTTPHEADER => array(
			"Accept: application/json",
			"Content-Type: application/json;charset=UTF-8",
			"Date: $date",
			"Content-MD5: $content_md5",
			"X-Ca-Key: $app_key",
			"X-Ca-Timestamp: $timestamp",
			"X-Ca-Nonce: $nonce",
			"X-Ca-Signature-Headers: $x_ca_signature_headers",
			"X-Ca-Signature: $signature"
		),
	));

	$response = curl_exec($curl);
	curl_close($curl);
	$data  = json_decode($response, true);

	return $data;
}

function GetCamUrlBody($camindex)
{
	// AppKey va AppSecret
		$app_key = "19237793";
	$app_secret = "qPXC2OjLk66wyrbxJMRb";
	


	// So'rov uchun URL
	$uri = "/artemis/api/video/v1/cameras/previewURLs";
	$base_url = "https://10.10.80.12:443";
	$full_url = $base_url . $uri;

	// Sana va vaqt
	$date = gmdate("D, d M Y H:i:s T");
	$timestamp = round(microtime(true) * 1000);

	// X-Ca-Nonce (UUID)
	$nonce = uniqid();

	// So'rov tanasi (body)
	$body = json_encode([
		"cameraIndexCode" => $camindex, // Kamera index kodingizni kiriting
		"streamType" => 0,
		"protocol" => "websocket",
		"transmode" => 1,
		"requestWebsocketProtocol" => 0
	]);

	// Content-MD5 hisoblash
	$content_md5 = base64_encode(md5($body, true));

	// CanonicalizedHeaders (header'larni alfavit bo'yicha tartiblash)
	$headers = [
		"x-ca-key" => $app_key,
		"x-ca-timestamp" => $timestamp,
		"x-ca-nonce" => $nonce
	];
	ksort($headers); // Headerlarni alfavit bo'yicha tartiblash

	$canonicalized_headers = "";
	foreach ($headers as $key => $value) {
		$canonicalized_headers .= strtolower($key) . ":" . $value . "\n";
	}

	// CanonicalizedResource
	$canonicalized_resource = $uri;

	// X-Ca-Signature-Headers
	$x_ca_signature_headers = implode(",", array_keys($headers));

	// Imzo uchun matn yaratish
	$sign_string = "POST\n"
		. "application/json\n"
		. $content_md5 . "\n"
		. "application/json;charset=UTF-8\n"
		. $date . "\n"
		. $canonicalized_headers
		. $canonicalized_resource;

	// HMAC-SHA256 bilan X-Ca-Signature yaratish
	$signature = base64_encode(hash_hmac('sha256', $sign_string, $app_secret, true));

	// cURL so'rovni yuborish
	$curl = curl_init();
	curl_setopt_array($curl, array(
		CURLOPT_URL => $full_url,
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_SSL_VERIFYPEER => false,
		CURLOPT_SSL_VERIFYHOST => false,
		CURLOPT_ENCODING => '',
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 3,
		CURLOPT_FOLLOWLOCATION => true,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => 'POST',
		CURLOPT_POSTFIELDS => $body,
		CURLOPT_HTTPHEADER => array(
			"Accept: application/json",
			"Content-Type: application/json;charset=UTF-8",
			"Date: $date",
			"Content-MD5: $content_md5",
			"X-Ca-Key: $app_key",
			"X-Ca-Timestamp: $timestamp",
			"X-Ca-Nonce: $nonce",
			"X-Ca-Signature-Headers: $x_ca_signature_headers",
			"X-Ca-Signature: $signature"
		),
	));

	$response = curl_exec($curl);
	curl_close($curl);
	$data  = json_decode($response, true);
	return $data;
}

function Logon($login, $password)
{
	global $sql, $slang;
	$query = "SELECT a.*, r.role_menu, r.role_name,  r.dashboard_menu,  r.role_object, a.photo, a.menu as role_id
					FROM v_users a
					LEFT JOIN bcms.roles r ON r.id = a.menu
					WHERE a.username = '" . $login . "' and a.password = '" . md5($password) . "'";

	$sql->query($query);
	$userdata = $sql->fetchAssoc();


	if ($userdata['id']) {
		return $userdata;
	} else {
		return "Логин ёки пароль хато!";
	}
}

function encode_ip($dotquad_ip)
{
	$ip_sep = explode('.', $dotquad_ip);
	return sprintf('%02x%02x%02x%02x', $ip_sep[0], $ip_sep[1], $ip_sep[2], $ip_sep[3]);
}

function decode_ip($int_ip)
{
	$hexipbang = explode('.', chunk_split($int_ip, 2, '.'));
	return hexdec($hexipbang[0]) . '.' . hexdec($hexipbang[1]) . '.' . hexdec($hexipbang[2]) . '.' . hexdec($hexipbang[3]);
}

function getToken($contractId)
{

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
	$data = json_decode($response, true);

	return $data;
}
