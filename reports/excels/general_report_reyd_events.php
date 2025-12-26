<?php

error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
ini_set('display_errors', 0);

set_time_limit(0);
ini_set('memory_limit', '512M');

require_once __DIR__ . '/../../PHPExcel-1.8/Classes/PHPExcel.php';
require_once __DIR__ . '/../../includes/db.php';

/* ===============================
   DB ULANISH
================================ */
$sql = new DB(
    '10.10.80.20',
    'e-gvardiya',
    'postgres',
    'Qwerty123',
    0,
    5432
);

$sql->open();
$sql->encode('UTF8');

/* ===============================
   1. STRUCTURE NOMLARI (2–15)
   ⚠️ FAQAT SHU YERDAN HEADER OLAMIZ
================================ */
$query = "
    SELECT id, name1 AS name
    FROM hr.structure
    WHERE id BETWEEN 2 AND 15
    ORDER BY turn
";
$sql->query($query);
$rows = $sql->fetchAll();

$regions = [];
foreach ($rows as $r) {
    $regions[(int)$r['id']] = trim($r['name']);
}
// echo '<pre>';
// print_r($regions);
// echo '<pre>';
// die();
/* ===============================
   2. EVENT TYPE LAR
================================ */
$sql->query("SELECT id, name1 AS name FROM ref.reyd_event_types ORDER BY id");
$typesDB = $sql->fetchAll();

$eventTypes = [];
foreach ($typesDB as $t) {
    $eventTypes[(int)$t['id']] = $t['name'];
}

/* ===============================
   3. ASOSIY AGGREGATION
   parent 2–15 bo‘lsa → parent ga yig‘iladi
================================ */
$query = "SELECT
    r.id AS structure_id,
    json_agg(
        json_build_object(
            'event_type', et.id,
            'total_events', COALESCE(cnt.total_events, 0)
        )
        ORDER BY et.id
    ) AS event_types
FROM (
    SELECT id
    FROM hr.structure
    WHERE id BETWEEN 2 AND 15
) r
CROSS JOIN ref.reyd_event_types et
LEFT JOIN (
    SELECT
        CASE
            WHEN s.id BETWEEN 2 AND 15 THEN s.id
            WHEN s.parent BETWEEN 2 AND 15 THEN s.parent
            WHEN s.parent = 0 THEN 11          -- 🔥 ASOSIY QO‘SHIMCHA
        END AS parent_id,
        pe.type AS event_type,
        COUNT(*) AS total_events
    FROM tur.reyd_events pe
    JOIN hr.structure s
        ON s.id = pe.structure_id
    WHERE
        s.id BETWEEN 2 AND 15
        OR s.parent BETWEEN 2 AND 15
        OR s.parent = 0                       -- 🔥 BU HAM SHART
    GROUP BY
        CASE
            WHEN s.id BETWEEN 2 AND 15 THEN s.id
            WHEN s.parent BETWEEN 2 AND 15 THEN s.parent
            WHEN s.parent = 0 THEN 11
        END,
        pe.type
) cnt
    ON cnt.parent_id = r.id
   AND cnt.event_type = et.id
GROUP BY r.id
ORDER BY r.id;


";
$sql->query($query);
$events = $sql->fetchAll();

/* ===============================
   4. TABLE DATA
================================ */
$table = [];
foreach ($events as $row) {
    $sid = (int)$row['structure_id'];
    $types = json_decode($row['event_types'], true);

    foreach ($types as $t) {
        $table[(int)$t['event_type']][$sid] = (int)$t['total_events'];
    }
}

/* ===============================
   5. TOTAL LAR
================================ */
$regionTotals = array_fill_keys(array_keys($regions), 0);

foreach ($table as $rows) {
    foreach ($rows as $sid => $val) {
        $regionTotals[$sid] += $val;
    }
}

$grandTotal = array_sum($regionTotals);

/* ===============================
   6. EXCEL
================================ */
$objPHPExcel = new PHPExcel();
$sheet = $objPHPExcel->setActiveSheetIndex(0);
$sheet->setTitle('HR Reyd Events');

/* HEADER */
$sheet->setCellValue('A1', 'Tadbir turi');

$col = 'B';
foreach ($regions as $regionName) {
    $sheet->setCellValue($col.'1', $regionName);
    $col++;
}
$sheet->setCellValue($col.'1', 'Jami');
$sheet->getStyle('A1:'.$col.'1')->getFont()->setBold(true);

/* BODY */
$rowNum = 2;
foreach ($eventTypes as $typeId => $typeName) {

    $sheet->setCellValue('A'.$rowNum, $typeName);

    $col = 'B';
    $rowSum = 0;

    foreach ($regions as $sid => $rName) {
        $val = $table[$typeId][$sid] ?? 0;
        $sheet->setCellValue($col.$rowNum, $val);
        $rowSum += $val;
        $col++;
    }

    $sheet->setCellValue($col.$rowNum, $rowSum);
    $rowNum++;
}

/* FOOTER */
$sheet->setCellValue('A'.$rowNum, 'JAMI');
$sheet->getStyle('A'.$rowNum)->getFont()->setBold(true);

$col = 'B';
foreach ($regionTotals as $total) {
    $sheet->setCellValue($col.$rowNum, $total);
    $col++;
}
$sheet->setCellValue($col.$rowNum, $grandTotal);

/* AUTO SIZE */
foreach (range('A', $col) as $c) {
    $sheet->getColumnDimension($c)->setAutoSize(true);
}

ob_end_clean();

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="hr_reyd_events_2_15.xlsx"');
header('Cache-Control: max-age=0');

PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007')
    ->save('php://output');
exit;
