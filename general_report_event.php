<?php
require __DIR__ . '/TCPDF/tcpdf.php';
define('ARM_IN', true);
require_once("includes/all_includes.php");
/* =======================
   1) REGIONLAR
======================= */
$query  = "SELECT t.id, t.name{$slang} as name 
           FROM hr.v_head_structure t 
           WHERE t.id > 1 AND t.id < 16
           ORDER BY t.turn ASC";
$sql->query($query);
$RegionsFromDB = $sql->fetchAll();

/* =======================
   2) EVENT TYPES
======================= */
$qt = "SELECT id, name1 AS name FROM tur.public_event_types ORDER BY id";
$sql->query($qt);
$EventTypesFromDB = $sql->fetchAll();

/* =======================
   3) ASOSIY MA’LUMOT
======================= */
$query  = "SELECT
                s.id AS structure_id,
                s.name1 AS structure_name,
                json_agg(
                    json_build_object(
                        'event_type', et.id,
                        'event_type_name', et.name1,
                        'total_events', COALESCE(cnt.total_events, 0)
                    ) ORDER BY et.id
                ) AS event_types
            FROM hr.structure s
            CROSS JOIN tur.public_event_types et
            LEFT JOIN (
                SELECT pe.region_id, pe.event_type, COUNT(*) AS total_events
                FROM hr.public_event1 pe
                GROUP BY pe.region_id, pe.event_type
            ) cnt ON cnt.region_id = s.id AND cnt.event_type = et.id
            WHERE s.parent = 1
            GROUP BY s.id, s.name1
            ORDER BY s.id";
$sql->query($query);
$events = $sql->fetchAll();

/* =======================
   4) MA’LUMOTNI TAYYORLASH
======================= */

// event types
$eventTypes = [];
foreach ($EventTypesFromDB as $t) {
    $eventTypes[$t['id']] = $t['name'];
}

// regions
$regions = [];
foreach ($events as $r) {
    $regions[$r['structure_id']] = $r['structure_name'];
}

// jadval
$table = [];
foreach ($events as $row) {
    $types = json_decode($row['event_types'], true);
    foreach ($types as $t) {
        $table[$t['event_type']][$row['structure_id']] = $t['total_events'];
    }
}

// region jami
$regionTotals = array_fill_keys(array_keys($regions), 0);
foreach ($table as $rows) {
    foreach ($rows as $rid => $val) {
        $regionTotals[$rid] += $val;
    }
}
$grandTotal = array_sum($regionTotals);

/* =======================
   5) HTML YIG‘AMIZ
======================= */

$html = '<h1 style="text-align:center;font-size:15;margin-top:20px;color:blue;">Миллий гвардия жавобгарлик ҳудудларида режалаштирилган сиёсий, маданий, спорт ва бошқа оммавий тадбирлар тўғрисида
маълумот</h1>';
$html .= '<table border="1" cellpadding="2" width="100%">';

// header
$html .= '<tr>';
$html .= '<th width="30">№</th>';
$html .= '<th width="70">Тадбир тури </th>';

foreach ($regions as $regionName) {
    $html .= '<th style="font-size:7px;">'.$regionName.'</th>';
}
$html .= '<th style="font-size:7px;">Жами</th>';
$html .= '</tr>';

// body
$i = 1;
foreach ($eventTypes as $typeId => $typeName) {
    $rowTotal = 0;
    $html .= '<tr>';
    $html .= '<td align="center">'.$i.'</td>';
    $html .= '<td>'.$typeName.'</td>';

    foreach ($regions as $rid => $rname) {
        $val = $table[$typeId][$rid] ?? 0;
        $rowTotal += $val;
        $html .= '<td align="center">'.$val.'</td>';
    }

    $html .= '<td align="center"><b>'.$rowTotal.'</b></td>';
    $html .= '</tr>';
    $i++;
}

// footer
$html .= '<tr>';
$html .= '<td colspan="2"><b>Жами</b></td>';
foreach ($regions as $rid => $rname) {
    $html .= '<td align="center" style="font-size:10px;"><b>'.$regionTotals[$rid].'</b></td>';
}
$html .= '<td align="center">'.$grandTotal.'</td>';
$html .= '</tr>';

$html .= '</table>';
$html .= '<br><br><h1 style="text-align:left;font-size:10;margin-top:20px;">        20-декабр 2025-йил</h1>';
/* =======================
   6) PDF CHIQARAMIZ
======================= */

$pdf = new TCPDF('L', 'mm', 'A4', true, 'UTF-8', false);
$pdf->SetMargins(3, 23,3);
$pdf->AddPage();
$pdf->SetFont('dejavusans', '', 10);

if (ob_get_length()) {
    ob_end_clean();
}

$pdf->writeHTML($html);
$pdf->Output('general_report_events.pdf', 'I');
exit;
