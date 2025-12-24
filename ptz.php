
<?php
date_default_timezone_set('Asia/Tashkent');

define("SMARTY_DIR", $_SERVER["DOCUMENT_ROOT"] . "/Smarty/");

require(SMARTY_DIR . "Smarty.class.php");
$smarty = new Smarty;

include_once("includes/error_reporting.php");

define('ARM_IN', true);

require_once("includes/constants.php");
require_once("includes/dbphpbb.php");
require_once("includes/set_language.php");
require_once("includes/functions.php");
require_once("includes/sessions.php");
require_once("includes/check.php");

/** @var TYPE_NAME $sql */

if ($user_data == 0) {
	print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='login.php'; </script>";
	exit;
}

if (count($_GET) > 0) {
	$SQLCommands = array('select', 'drop', 'concat', 'union', ' and', ' or', 'database', 'null', 'benchmark', 'load_file');

	foreach ($SQLCommands as $sInd => $sVal) {
		foreach ($_GET as $ind => $val) {
			if (strpos(strtolower($val), $sVal) > 0) {
				$_GET[$ind] = 0;
			}
		}
	}
}

foreach ($_POST as $ind => $val) {
	$_POST[$ind] = MyEscapeSymbols($val);
}

$Command[0] = "RIGHT_UP";
$Command[1] = "RIGHT";
$Command[2] = "RIGHT_DOWN";
$Command[3] = "DOWN";
$Command[4] = "LEFT_DOWN";
$Command[5] = "LEFT";
$Command[6] = "LEFT_UP";
$Command[7] = "UP";
$Command[8] = "ZOOM_IN";
$Command[9] = "ZOOM_OUT";

$camcode   = $_GET['cam_code'];
$source   = $_GET['camera_source'];
$command   = isset($Command[$_GET['command']]) ? $Command[$_GET['command']] : 0;



$curl = curl_init();
if ($source == 1) {
    curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://10.10.80.12:443/artemis/api/video/v1/ptzs/controlling',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => '{
        "cameraIndexCode": "' . $camcode . '",
        "command": "' . $command . '",
        "action": 0,
        "speed": 30,
        "presetIndex": 1
    }',
        CURLOPT_HTTPHEADER => array(
            'Accept: application/json',
            'Content-Type: application/json;charset=UTF-8',
            'X-Ca-Key: 19237793',
            'X-Ca-Signature: TU/ce83Ldg0Gp1qg1lnJAnJxpP076arU5lU20eX4DIc='
        ),
    ));
} else {
    curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://10.10.80.12:443/artemis/api/video/v1/ptzs/controlling',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => '{
        "cameraIndexCode": "' . $camcode . '",
        "command": "' . $command . '",
        "action": 0,
        "speed": 30,
        "presetIndex": 1
    }',
        CURLOPT_HTTPHEADER => array(
            'Accept: application/json',
            'Content-Type: application/json;charset=UTF-8',
            'X-Ca-Key: 25554795',
            'X-Ca-Signature: yJA9Sen+RQvAUkWCwtd7ZoxiX7h+t20r539n/qhCDuo='
        ),
    ));
}

$response = curl_exec($curl);
curl_close($curl);

// echo '<pre>';
// print_r($response);
// echo '</pre>';
// die();

function m_sleep($milliseconds)
{
    return usleep($milliseconds * 1000); // Microseconds->milliseconds
}

m_sleep(500);

$curl = curl_init();
if ($source == 1) {
    curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://10.10.80.12:443/artemis/api/video/v1/ptzs/controlling',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => '{
        "cameraIndexCode": "' . $camcode . '",
        "command": "' . $command . '",
        "action": 1,
        "speed": 30,
        "presetIndex": 1
    }',
        CURLOPT_HTTPHEADER => array(
            'Accept: application/json',
            'Content-Type: application/json;charset=UTF-8',
            'X-Ca-Key: 19237793',
            'X-Ca-Signature: TU/ce83Ldg0Gp1qg1lnJAnJxpP076arU5lU20eX4DIc='
        ),
    ));
} else {
    curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://10.10.80.12:443/artemis/api/video/v1/ptzs/controlling',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => '{
        "cameraIndexCode": "' . $camcode . '",
        "command": "' . $command . '",
        "action": 1,
        "speed": 30,
        "presetIndex": 1
    }',
        CURLOPT_HTTPHEADER => array(
            'Accept: application/json',
            'Content-Type: application/json;charset=UTF-8',
            'X-Ca-Key: 19237793',
            'X-Ca-Signature: yJA9Sen+RQvAUkWCwtd7ZoxiX7h+t20r539n/qhCDuo='
        ),
    ));
}


$response = curl_exec($curl);
curl_close($curl);

echo $response;
die();