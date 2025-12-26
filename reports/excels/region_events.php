<?php
// ===============================
// SOZLAMALAR
// ===============================
error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
ini_set('display_errors', 0);

require_once __DIR__ . '/../../includes/set_language.php';
require_once __DIR__ . '/../../PHPExcel-1.8/Classes/PHPExcel.php';
require_once __DIR__ . '/../../includes/db.php';

// ===============================
// DB
// ===============================
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

// ===============================
// REGION_ID
// ===============================
$regionId = (int)($_GET['region_id'] ?? 0);
if ($regionId <= 0) {
    die('Region topilmadi');
}

// ===============================
// TIL
// ===============================
$slang = '1'; // sizda qanday bo‘lsa shuni qo‘ying

// ===============================
// REGION NOMI
// ===============================
$q = "
    SELECT name1 AS name
    FROM hr.structure
    WHERE id = {$regionId}
";
$sql->query($q);
$regionArr = $sql->fetchAll();
$regionName = $regionArr[0]['name'] ?? '';

// ===============================
// EVENTLAR
// ===============================
$q = "
    SELECT 
        pe.id,
        et.name1 AS event_type,
        pe.event_direction,
        pe.object_name,
        pe.responsible_name,
        pe.responsible_phone,
        pe.event_view,
        pe.start_event,
        pe.finish_event,
        pe.event_name,
        pe.organizer,
        pe.event_responsible_organization,
        pe.people_count,
        pe.responsible_iiv_name,
        pe.responsible_fvv_name,
        pe.responsible_mg_name,
        pe.reserve_name,
        pe.reserve_count,
        pe.iiv_count,
        pe.fvv_count,
        pe.mg_counts,
        pe.sapyor_count,
        pe.spring_count,
        pe.responsible_msgr_name,
        pe.responsible_spring_name,
        ec.name{$slang} AS event_category,
        (
            COALESCE(pe.mg_counts, 0) +
            COALESCE(pe.fvv_count, 0) +
            COALESCE(pe.iiv_count, 0) +
            COALESCE(pe.sapyor_count, 0) +
            COALESCE(pe.spring_count, 0)
        ) AS all_troops
    FROM hr.public_event1 pe
    LEFT JOIN tur.public_event_types et ON et.id = pe.event_type
    LEFT JOIN tur.event_category ec ON ec.id = pe.event_category_id
    WHERE pe.region_id = {$regionId}
    ORDER BY pe.start_event
";
$sql->query($q);
$events = $sql->fetchAll();

// ===============================
// EXCEL BOSHLASH
// ===============================
$objPHPExcel = new PHPExcel();
$sheet = $objPHPExcel->setActiveSheetIndex(0);
$sheet->setTitle('Public events');

// ===============================
// SARLAVHA
// ===============================
$sheet->setCellValue('A1', 'Hudud:');
$sheet->setCellValue('B1', $regionName);
$sheet->mergeCells('B1:T1');
$sheet->getStyle('A1:B1')->getFont()->setBold(true);

// ===============================
// HEADER
// ===============================
$headers = [
    '№',
    'Tadbir nomi',
    'Tadbir turi',
    'Kategoriya',
    'Yo‘nalish',
    'Obyekt',
    'Mas’ul shaxs',
    'Telefon',
    'Boshlanish vaqti',
    'Tugash vaqti',
    'Ishtirokchilar',
    'IIV javobgari',
    'FVV javobgari',
    'MG javobgari',
    'Zaxira',
    'Zaxira soni',
    'IIV',
    'FVV',
    'MG',
    'Jami kuch'
];

$col = 'A';
foreach ($headers as $h) {
    $sheet->setCellValue($col . '3', $h);
    $col++;
}
$sheet->getStyle('A3:O3')->getFont()->setBold(true);

// ===============================
// BODY
// ===============================
$row = 4;
$i = 1;

foreach ($events as $e) {
    $sheet->setCellValue('A'.$row, $i++);
    $sheet->setCellValue('B'.$row, $e['event_name']);
    $sheet->setCellValue('C'.$row, $e['event_type']);
    $sheet->setCellValue('D'.$row, $e['event_category']);
    $sheet->setCellValue('E'.$row, $e['event_direction']);
    $sheet->setCellValue('F'.$row, $e['object_name']);
    $sheet->setCellValue('G'.$row, $e['responsible_name']);
    $sheet->setCellValue('H'.$row, $e['responsible_phone']);
    $sheet->setCellValue('I'.$row, $e['start_event']);
    $sheet->setCellValue('J'.$row, $e['finish_event']);
    $sheet->setCellValue('K'.$row, $e['people_count']);
    $sheet->setCellValue('L'.$row, $e['responsible_iiv_name']);
    $sheet->setCellValue('M'.$row, $e['responsible_fvv_name']);
    $sheet->setCellValue('N'.$row, $e['responsible_mg_name']);
    $sheet->setCellValue('O'.$row, $e['reserve_name']); 
    $sheet->setCellValue('P'.$row, $e['reserve_count']);
    $sheet->setCellValue('Q'.$row, $e['iiv_count']);
    $sheet->setCellValue('R'.$row, $e['fvv_count']);
    $sheet->setCellValue('S'.$row, $e['mg_counts']);
    $sheet->setCellValue('T'.$row, $e['all_troops']);
    $row++;
}

// ===============================
// AUTO SIZE
// ===============================
foreach (range('A', 'T') as $c) {
    $sheet->getColumnDimension($c)->setAutoSize(true);
}

// ===============================
// OUTPUT
// ===============================
if (ob_get_length()) {
    ob_end_clean();
}

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="public_events_region_'.$regionId.'.xlsx"');
header('Cache-Control: max-age=0');

$writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$writer->save('php://output');
exit;
