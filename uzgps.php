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

// $region = isset($_GET['region']) ? $_GET['region'] : 0;
$region = 0;

$query = "SELECT 
            uzg.id,
            s.shortname{$slang} AS region,
            cr.plate_number AS plate_number,
            cr.id AS car_id,
            uzg.angle,
            uzg.lat,
            uzg.lon,
            uzg.speed,
            TO_CHAR(uzg.tp_timestamp_fmt, 'DD.MM.YYYY HH24:MI') AS time,
            cm.name AS car_name,
            cm.photo AS car_photo,
            cm.car_width,
            cm.car_height
        FROM reports.uzgps uzg
        INNER JOIN hr.tech_guard_cars cr ON cr.uzgps_id = uzg.mobject_id
        INNER JOIN (
            SELECT 
                DISTINCT drd_inner.car_id 
            FROM 
                hr.dailiy_routine_date drd_inner
            INNER JOIN 
                hr.daily_routine dr_inner ON dr_inner.id = drd_inner.routine_id
            WHERE 
                dr_inner.date = CURRENT_DATE -- Bugungi sana bo'yicha filtrlash
        ) AS today_cars ON today_cars.car_id = cr.id
        LEFT JOIN hr.structure s ON s.id = cr.structure_id
        LEFT JOIN ref.car_models cm ON cm.id = cr.car_model_id
        WHERE 1=1 ";

if ($region > 0) {
    $query .= " AND s.id = {$region} ";
}

$query .= " order by uzg.speed asc";
$sql->query($query);
$Tracks = $sql->fetchAll();

// echo '<pre>';
// print_r($query);
// echo '</pre>';
// die();

echo $res = json_encode($Tracks);
