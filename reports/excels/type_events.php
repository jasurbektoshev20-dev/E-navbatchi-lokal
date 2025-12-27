<?php
// ===============================
// SOZLAMALAR
// ===============================
error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
// require_once __DIR__ . '/var/www/e-gvardiya/includes/set_language.php';
// require_once __DIR__ . '/var/www/e-gvardiya/PHPExcel-1.8/Classes/PHPExcel.php';
// require_once __DIR__ . '/var/www/e-gvardiya/includes/db.php';

require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/set_language.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/DB.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/PHPExcel-1.8/Classes/PHPExcel.php';


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
$typeId = (int)($_GET['type_id'] ?? 0);
if ($typeId <= 0) {
    die('turi topilmadi');
}

// ===============================
// TIL
// ===============================
$slang = '1'; // sizda qanday bo‘lsa shuni qo‘ying

// ===============================
// REGION NOMI
// ===============================
$q = "SELECT name1 as name
	FROM tur.public_event_types
	WHERE id = {$typeId}
		";
	$sql->query($q);
	$type = $sql->fetchAll();

$typeName = $type[0]['name'] ?? '';

// ===============================
// EVENTLAR
// ===============================
$q = "
    SELECT 
        pe.id,
        s.name1 as region_name,
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
    left join hr.structure s on s.id = pe.region_id
    WHERE pe.event_type = {$typeId}
    ORDER BY pe.start_event
";
$sql->query($q);
$events = $sql->fetchAll();

// echo '<pre>';
// print_r($ $_SERVER['DOCUMENT_ROOT']);
// echo '</pre>';
// die();


// ===============================
// EXCEL BOSHLASH
// ===============================
$objPHPExcel = new PHPExcel();
$sheet = $objPHPExcel->setActiveSheetIndex(0);
$sheet->setTitle('Public events');

// ===============================
// SARLAVHA
// ===============================
$sheet->setCellValue('A1', 'Тадбир тури:');
$sheet->setCellValue('B1', $typeName);
$sheet->mergeCells('B1:U1');
$sheet->getStyle('A1:B1')->getFont()->setBold(true);

// ===============================
// HEADER
// ===============================
$headers = [
    '№',
    'Ҳудуд',
    'Тадбир номи',
    'Тадбир тури',
    'Категория',
    'Йўналиш',
    'Объект номи',
    'Масъул шахс',
    'Телефон рақами',
    'Бошланиш вақти',
    'Тугаш вақти',
    'Иштирокчилар сони',
    'ИИВ жавобгари',
    'ФВВ жавобгари',
    'МГ жавобгари',
    'Захира маъсул шахс',
    'Захира сони',
    'ИИВ сони',
    'ФВВ сони',
    'МГ сони',
    'Жалб қилинган шахслар сони'
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
    $sheet->setCellValue('B'.$row, $e['region_name']);
    $sheet->setCellValue('C'.$row, $e['event_name']);
    $sheet->setCellValue('D'.$row, $e['event_type']);
    $sheet->setCellValue('E'.$row, $e['event_category']);
    $sheet->setCellValue('F'.$row, $e['event_direction']);
    $sheet->setCellValue('G'.$row, $e['object_name']);
    $sheet->setCellValue('H'.$row, $e['responsible_name']);
    $sheet->setCellValue('I'.$row, $e['responsible_phone']);
    $sheet->setCellValue('J'.$row, $e['start_event']);
    $sheet->setCellValue('K'.$row, $e['finish_event']);
    $sheet->setCellValue('L'.$row, $e['people_count']);
    $sheet->setCellValue('M'.$row, $e['responsible_iiv_name']);
    $sheet->setCellValue('N'.$row, $e['responsible_fvv_name']);
    $sheet->setCellValue('O'.$row, $e['responsible_mg_name']);
    $sheet->setCellValue('P'.$row, $e['reserve_name']); 
    $sheet->setCellValue('Q'.$row, $e['reserve_count']);
    $sheet->setCellValue('R'.$row, $e['iiv_count']);
    $sheet->setCellValue('S'.$row, $e['fvv_count']);
    $sheet->setCellValue('T'.$row, $e['mg_counts']);
    $sheet->setCellValue('U'.$row, $e['all_troops']);
    $row++;
}

// ===============================
// AUTO SIZE
// ===============================
foreach (range('A', 'U') as $c) {
    $sheet->getColumnDimension($c)->setAutoSize(true);
}

// ===============================
// OUTPUT
// ===============================
if (ob_get_length()) {
    ob_end_clean();
}

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="public_events_region_'.$typeId.'.xlsx"');
header('Cache-Control: max-age=0');

$writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$writer->save('php://output');
exit;
