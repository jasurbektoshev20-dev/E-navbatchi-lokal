<?php
date_default_timezone_set('Asia/Tashkent');
include_once("includes/error_reporting.php");
define('ARM_IN', true);
require_once("includes/constants.php");
require_once("includes/dbphpbb.php");
require_once("includes/set_language.php");
require_once("includes/functions.php");
require_once("includes/sessions.php");
require_once("includes/check.php");


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

$region = isset($_GET['region']) ? $_GET['region'] : 0;

$query = "SELECT uzg.id, s.shortname{$slang} as region, cr.plate_number as plate_number,
    uzg.angle, uzg.lat, uzg.lon, uzg.speed, TO_CHAR(uzg.tp_timestamp_fmt, 'DD.MM.YYYY HH24:MI') as time,
    cm.name as car_name, cm.photo as car_photo, cm.car_width, cm.car_height
    FROM hr.tech_guard_cars cr
    LEFT JOIN reports.uzgps uzg on uzg.mobject_id = cr.uzgps_id
    left join hr.structure s on s.id = cr.structure_id
    left join ref.car_models cm on cm.id = cr.car_model_id
    WHERE 1=1 ";
if ($region > 0) {
    $query .= " AND s.id = {$region}";
}

$query .= " order by uzg.speed asc";
$sql->query($query);
$Tracks = $sql->fetchAll();

// echo '<pre>';
// print_r($query);
// echo '</pre>';
// die();

echo $res = json_encode($Tracks);
