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