<?php
// ===============================
// SOZLAMALAR
// ===============================
error_reporting(E_ALL & ~E_DEPRECATED & ~E_NOTICE);
ini_set('display_errors', 1);
// require_once __DIR__ . '/var/www/e-gvardiya/includes/set_language.php';
// // PHPExcel
// require_once __DIR__ . '/var/www/e-gvardiya/PHPExcel-1.8/Classes/PHPExcel.php';
// require_once __DIR__ . '/var/www/e-gvardiya/includes/db.php';

require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/set_language.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/includes/DB.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/PHPExcel-1.8/Classes/PHPExcel.php';

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
// URL DAN REGION_ID OLISH
// ===============================
$typeId = (int)($_GET['type_id'] ?? 0);
if ($typeId <= 0) {
    die('turi topilmadi');
}

// ===============================
// TIL QO‘SHIMCHASI
// ===============================
$slang = ''; // masalan: _uz, _ru bo‘lsa shu yerda belgilang

// ===============================
// REGION NOMI
// ===============================
$q = "SELECT name1 AS name
    FROM ref.reyd_event_types
    WHERE id = {$typeId}
";
$sql->query($q);
$type = $sql->fetchAll();
$typeName = $type['name'] ?? '';

// ===============================
// REYD EVENTLAR
// ===============================
$q = "
    SELECT 
        pe.id,
        s.name1 AS structure_name,
        str.name1 AS region_name,
        et.name1 AS event_type,
        CONCAT(r.name1, ' ', st.lastname, ' ', st.firstname) AS responsible_name,
        pe.exercises_type,
        pe.start_date,
        pe.end_date,
        pe.staff_count,
        pe.vehicles_count,
        pe.description
    FROM tur.reyd_events pe
    LEFT JOIN ref.reyd_event_types et ON et.id = pe.type
    LEFT JOIN hr.structure s ON s.id = pe.structure_id
    left join hr.structure str on str.id = pe.region_id
    LEFT JOIN hr.staff st ON st.id = pe.responsible_id
    LEFT JOIN ref.ranks r ON r.id = st.rank_id
    WHERE pe.type = {$typeId}
    ORDER BY pe.start_date
";
$sql->query($q);
$events = $sql->fetchAll();
// echo '<pre>';
// print_r($events);
// echo '</pre>';
// die();
// ===============================
// EXCEL BOSHLASH
// ===============================
$objPHPExcel = new PHPExcel();
$sheet = $objPHPExcel->setActiveSheetIndex(0);
$sheet->setTitle('Reyd events');

// ===============================
// SARLAVHA
// ===============================
// $sheet->setCellValue('A1', 'Hudud:');
// $sheet->setCellValue('B1', $regionName);
$sheet->mergeCells('B1:K1');
$sheet->getStyle('A1:B1')->getFont()->setBold(true);

// ===============================
// HEADER
// ===============================
$headers = [
    '№',
    'Hudud',
    'Bo‘linma',
    'Tadbir turi',
    'Mas’ul shaxs',
    'Mashg‘ulot turi',
    'Boshlanish vaqti',
    'Tugash vaqti',
    'Xodimlar soni',
    'Texnika soni',
    'Izoh'
];

$col = 'A';
foreach ($headers as $h) {
    $sheet->setCellValue($col . '3', $h);
    $col++;
}
$sheet->getStyle('A3:J3')->getFont()->setBold(true);

// ===============================
// BODY
// ===============================
$row = 4;
$i = 1;

foreach ($events as $e) {
    $sheet->setCellValue('A' . $row, $i++);
    $sheet->setCellValue('B' . $row, $e['region_name']);
    $sheet->setCellValue('C' . $row, $e['structure_name']);
    $sheet->setCellValue('D' . $row, $e['event_type']);
    $sheet->setCellValue('E' . $row, $e['responsible_name']);
    $sheet->setCellValue('F' . $row, $e['exercises_type']);
    $sheet->setCellValue('G' . $row, $e['start_date']);
    $sheet->setCellValue('H' . $row, $e['end_date']);
    $sheet->setCellValue('I' . $row, $e['staff_count']);
    $sheet->setCellValue('J' . $row, $e['vehicles_count']);
    $sheet->setCellValue('K' . $row, $e['description']);
    $row++;
}

// ===============================
// AUTO SIZE
// ===============================
foreach (range('A', 'K') as $c) {
    $sheet->getColumnDimension($c)->setAutoSize(true);
}

// ===============================
// OUTPUT (YUKLASH)
// ===============================
ob_end_clean();

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="reyd_events_region_' . $typeId . '.xlsx"');
header('Cache-Control: max-age=0');

$writer = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$writer->save('php://output');
exit;
