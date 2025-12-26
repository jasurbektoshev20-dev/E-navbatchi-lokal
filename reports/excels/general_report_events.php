<?php
error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
ini_set('display_errors', 0);

set_time_limit(0);
ini_set('memory_limit', '512M');

require_once __DIR__ . '/../../PHPExcel-1.8/Classes/PHPExcel.php';
require_once __DIR__ . '/../../includes/db.php';

/* ===============================
   DB ULANISH (ENG MUHIM QISM)
================================ */

// ⚠️ BU YERDA O'Z MA'LUMOTLARINGIZNI YOZING
$sql = new DB(
    '10.10.80.20',        // host
    'e-gvardiya',    // db name
    'postgres',          // user
    'Qwerty123',
     0,      // password
     5432                // port
);

// DB ni ochamiz
$sql->open();

// encoding (ixtiyoriy, lekin tavsiya)
$sql->encode('UTF8');
/* ===============================
   1. REGIONLAR
================================ */
$query = "
    SELECT t.id, t.name{$slang} AS name
    FROM hr.v_head_structure t
    WHERE t.id > 1 AND t.id < 16
    ORDER BY t.turn ASC
";
$sql->query($query);
$Regions = $sql->fetchAll();

/* ===============================
   2. EVENT TYPE LAR
================================ */
$qt = "SELECT id, name1 AS name FROM tur.public_event_types ORDER BY id";
$sql->query($qt);
$EventTypesFromDB = $sql->fetchAll();

$eventTypes = [];
foreach ($EventTypesFromDB as $t) {
    $eventTypes[$t['id']] = $t['name'];
}

/* ===============================
   3. ASOSIY QUERY
================================ */
$query = "
    SELECT
        s.id AS structure_id,
        s.name1 AS structure_name,
        json_agg(
            json_build_object(
                'event_type', et.id,
                'total_events', COALESCE(cnt.total_events, 0)
            ) ORDER BY et.id
        ) AS event_types
    FROM hr.structure s
    CROSS JOIN tur.public_event_types et
    LEFT JOIN (
        SELECT 
            pe.region_id,
            pe.event_type,
            COUNT(*) AS total_events
        FROM hr.public_event1 pe
        GROUP BY pe.region_id, pe.event_type
    ) cnt
        ON cnt.region_id = s.id AND cnt.event_type = et.id
    WHERE s.parent = 1
    GROUP BY s.id, s.name1
    ORDER BY s.id
";
$sql->query($query);
$events = $sql->fetchAll();

/* ===============================
   4. REGION MAP
================================ */
$regions = [];
foreach ($events as $r) {
    $regions[$r['structure_id']] = $r['structure_name'];
}

/* ===============================
   5. JADVAL DATA
================================ */
$table = [];
foreach ($events as $row) {
    $regionId = $row['structure_id'];
    $types = json_decode($row['event_types'], true);

    foreach ($types as $t) {
        $table[$t['event_type']][$regionId] = $t['total_events'];
    }
}

/* ===============================
   6. REGION TOTAL
================================ */
$regionTotals = array_fill_keys(array_keys($regions), 0);

foreach ($table as $rows) {
    foreach ($rows as $regionId => $val) {
        $regionTotals[$regionId] += $val;
    }
}

$grandTotal = array_sum($regionTotals);

/* ===============================
   7. EXCEL BOSHLANADI
================================ */
$objPHPExcel = new PHPExcel();
$sheet = $objPHPExcel->setActiveSheetIndex(0);
$sheet->setTitle('HR Events Report');

/* ===== HEADER ===== */
$sheet->setCellValue('A1', 'Tadbir turi ');

$col = 'B';
foreach ($regions as $regionName) {
    $sheet->setCellValue($col.'1', $regionName);
    $col++;
}
$sheet->setCellValue($col.'1', 'Jami');

$sheet->getStyle('A1:'.$col.'1')->getFont()->setBold(true);

/* ===== BODY ===== */
$rowNum = 2;
foreach ($eventTypes as $typeId => $typeName) {

    $sheet->setCellValue('A'.$rowNum, $typeName);

    $col = 'B';
    $rowSum = 0;

    foreach ($regions as $regionId => $rName) {
        $val = $table[$typeId][$regionId] ?? 0;
        $sheet->setCellValue($col.$rowNum, $val);
        $rowSum += $val;
        $col++;
    }

    $sheet->setCellValue($col.$rowNum, $rowSum);
    $rowNum++;
}

/* ===== FOOTER ===== */
$sheet->setCellValue('A'.$rowNum, 'JAMI');
$sheet->getStyle('A'.$rowNum)->getFont()->setBold(true);

$col = 'B';
foreach ($regionTotals as $total) {
    $sheet->setCellValue($col.$rowNum, $total);
    $col++;
}
$sheet->setCellValue($col.$rowNum, $grandTotal);

/* ===== AUTO SIZE ===== */
foreach (range('A', $col) as $c) {
    $sheet->getColumnDimension($c)->setAutoSize(true);
}

ob_end_clean();

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="hr_general_report_events.xlsx"');
header('Cache-Control: max-age=0');

$writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$writer->save('php://output');
exit;
