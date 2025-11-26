<?php
define('ARM_IN', true);
require_once("includes/all_includes.php");
if ($user_data == null) {
	print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='login.php'; </script>";
	exit;
}
$TheAct = isset($_GET['act']) ? (($_GET['act'] != "") ? $_GET['act'] : "index") : "index";
$SubAct = isset($_GET['sub']) ? (($_GET['sub'] != "") ? $_GET['sub'] : "") : "";


$ThisMenuId = isset($_GET['mid']) ? MyPiDeCrypt($_GET['mid']) : 24;
$query = "select name{$slang} as name, menu_icon, url from bcms.dashboard_menu where id = {$ThisMenuId}";
$sql->query($query);
$ThisMenu = $sql->fetchAssoc();

if ($TheAct == "uzl" || $TheAct == "rus" || $TheAct == "uzb") {
	$_GET['slang'] = $TheAct;
	$TheAct = $ThisMenu['url'];
	include("includes/set_language.php");
}

$sql->query("select id, name{$slang} as lname, keyword from bcms.languages order by id");
$Langs = $sql->fetchAll();

foreach ($Langs as $key => $item) {
	if ($slang == $item['id']) {
		$Langs[$key]['class'] = "active";
	} else {
		$Langs[$key]['class'] = "";
	}
}

$query = "SELECT r.dashboard_menu as menu FROM v_users a INNER JOIN bcms.roles r ON a.menu = r.id
WHERE a.id = {$UserId}";
$sql->query($query);
$usermenu = $sql->fetchAssoc();

$query = "SELECT t.*, t.name{$slang} as name, t.menu_icon, t.has_children FROM bcms.dashboard_menu t where t.status_id = 1 and t.id IN (" . $usermenu['menu'] . ") order by t.turn asc";
$sql->query($query);
$Menu = $sql->fetchAll();

foreach ($Menu as $key => $menu_item) {
	if ($Menu[$key]['url']) {
		if ($Menu[$key]['has_children'] == 5) {
			$Menu[$key]['url'] = $menu_item['url'];
		} else {
			$Menu[$key]['url'] = $menu_item['url'] . "&mid=" . MyPiCrypt($menu_item['id']);
		}
	}

	if ($TheAct === substr($menu_item['url'], strpos($menu_item['url'], '=') + 1)) {
		$Menu[$key]['class'] = "active";

		foreach ($Menu as $key => $sub_menu_item) {
			if ($menu_item['parent'] == $sub_menu_item['id']) {
				$Menu[$key]['parent_class'] = "active";
			}
		}
	} else {
		$Menu[$key]['class'] = "";
	}
}

// echo '<pre>';
// print_r($Menu);
// echo '</pre>';
// die();

$sql->query("SELECT name{$slang} as name, keyword from bcms.s_dictionary");
$Dictionary = $sql->fetchAll();
foreach ($Dictionary as $id => $value) {
	$Dict[$value['keyword']] = $value['name'];
}

$smarty->assign(array(
	'Langs' 			=> $Langs,
	// 'CurrLang' 			=> $Langs[$slang],
	'Dict' 				=> $Dict,
	'Menu' 				=> $Menu,
	'ThisMenu' => $ThisMenu,
));

$Act = isset($_GET['act']) ? "hr_" . $_GET['act'] : "hr_structure";

switch ($Act) {
	// hr_all_thg
	case "hr_all_thg":
		$query = "SELECT t.*, t.name{$slang} as name, t.name1, t.name2, t.name3 from hr.structure t";
		if ($UserStructure > 1) {
			$query .= " WHERE t.id = {$UserStructure}";
		} else {
			$query .= " WHERE t.id != 1 and t.id < 16";
		}
		$query .= " order by t.turn";
		$sql->query($query);
		$HrStructure = $sql->fetchAll();

		// echo '<pre>';
		// print_r($HrStructure);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'HrStructure' => $HrStructure,
		));
		break;
	// hr_all_thg

	// hr_thg_cars
	case "hr_thg_cars":
		// $StructureId = MyPiDeCrypt($_GET['str']);

		$query  = "SELECT id, name from ref.car_models";
		$sql->query($query);
		$RefCarModels = $sql->fetchAll();

		$query  = "SELECT id, name{$slang} as name from hr.structure order by turn";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		$query = "SELECT t.id
			,st.name{$slang} as structure_id
			,(SELECT count(*) FROM hr.tech_guard_car_cameras s WHERE s.car_id = t.id and camera_types = 1 LIMIT 1) as camera
			,(SELECT name FROM ref.car_models s WHERE s.id = t.car_model_id LIMIT 1) as car_model_id
			,t.plate_number
			,t.uzgps_id
			,t.internal_cam
			,t.external_cam
			from hr.tech_guard_cars t
			left join hr.structure st on st.id = t.structure_id
			left join ref.car_models cm on cm.id = t.car_model_id
			order by t.id";
		$sql->query($query);
		$HrTechGuardCars = $sql->fetchAll();

		// echo '<pre>';
		// print_r($HrTechGuardCars);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			// 'StructureId'        => $StructureId,
			'RefCarModels'        => $RefCarModels,
			'Structures'         => $Structures,
			'HrTechGuardCars'         => $HrTechGuardCars,
		));
		break;
	// hr_thg_cars

	// hr_dictionary
	case "hr_dictionary":
		$query  = "SELECT * FROM bcms.s_dictionary ORDER BY id ASC ";
		$sql->query($query);
		$Dictionary = $sql->fetchAll();


		// echo '<pre>';
		// print_r($Dictionary);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Dictionary'            =>    $Dictionary,
		));
		break;

	case "hr_menus":
		$query  = "SELECT t.*, s.name{$slang} as has_children FROM bcms.dashboard_menu t 
		left join bcms.s_yesno s on s.id = t.has_children  ORDER BY id ASC";
		$sql->query($query);
		$Menus = $sql->fetchAll();

		$query  = "SELECT id, name{$slang} as name FROM bcms.s_yesno ORDER BY id ASC";
		$sql->query($query);
		$YesNo = $sql->fetchAll();

		$query  = "SELECT id, name{$slang} as name FROM bcms.s_status ORDER BY id ASC";
		$sql->query($query);
		$BcmsStatus = $sql->fetchAll();




		$smarty->assign(array(
			'Menus'            =>    $Menus,
			'YesNo'            =>    $YesNo,
			'BcmsStatus'	   =>    $BcmsStatus,
		));
		break;


	/// hr_dictionary

	/// hr_roles
	case "hr_roles":
		$query = "SELECT t.id, t.role_name as name, t.dashboard_menu as menu FROM bcms.roles t ORDER BY t.id ASC";
		$sql->query($query);
		$Roles = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM bcms.dashboard_menu t ORDER BY t.id ASC";
		$sql->query($query);
		$Menus = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Menus);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Roles' => $Roles,
			'Menus' => $Menus,
		));
		break;
	/// hr_roles

	/// hr_staff
	case "hr_staff":
		$query = "SELECT t.id, t.lastname, t.firstname, t.surname, t.username, t.phone, t.photo, 
		s.name{$slang} as structure, r.role_name, p.name{$slang} as position, ra.name{$slang} as rank
		FROM hr.staff t 
		left join hr.structure s on s.id  = t.structure_id
		left join bcms.roles r on r.id  = t.role_id
		left join hr.positions p on p.id  = t.position_id
		left join ref.ranks ra on ra.id  = t.rank_id
		ORDER BY t.id ASC";
		$sql->query($query);
		$Staffs = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 0 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.structure t 
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		$query  = "SELECT t.id, t.role_name as name FROM bcms.roles t
		ORDER BY t.id ASC";
		$sql->query($query);
		$Roles = $sql->fetchAll();

		$query = "SELECT id,name{$slang} as name from hr.positions";
		$sql->query($query);
		$HrPositions = $sql->fetchAll();

		$query = "SELECT id,name{$slang} as name from ref.ranks order by turn desc";
		$sql->query($query);
		$RefRanks = $sql->fetchAll();

		$smarty->assign(array(
			'Staffs' => $Staffs,
			'Regions' => $Regions,
			'Structures' => $Structures,
			'Roles' => $Roles,
			'HrPositions' => $HrPositions,
			'RefRanks' => $RefRanks,
		));
		break;
	/// hr_staff







	case "hr_events":

		$query = "SELECT id, name{$slang} as name FROM hr.structure ";
		if ($UserStructure > 1) {
			$query .= " where id = {$UserStructure}";
		} else {
			$query .= " where id != 1 and id < 16 order by turn";
		}
		$sql->query($query);
		$Regions = $sql->fetchAll();

		// $query = "SELECT id, name{$slang} as name FROM hr.structure";
		// if ($UserStructure > 1) {
		// 	$query .= " where parent = {$UserStructure}";
		// } else {
		// 	$query .= " where id > 999 order by id";
		// }
		// $sql->query($query);
		// $Distcity = $sql->fetchAll();

		$query = "SELECT id, name{$slang} as event_type FROM tur.public_event_types";
		$sql->query($query);
		$EventTypes = $sql->fetchAll();


		$query = "SELECT id, object_name as name FROM hr.jts_objects";
		$sql->query($query);
		$jts_objects = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.structure t 
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();


		$query  = "SELECT t.id, CONCAT(t.lastname,' ',t.firstname,' ', t.surname) as name
		FROM hr.staff t ";
		if ($UserStructure > 1) {
			$query .= " WHERE t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$Responsible = $sql->fetchAll();



		$query = "SELECT m.id, t.name{$slang} as event_type , m.name{$slang} as event_name, m.citizens_count,m.direction_event, m.iiv_count, 
		m.fvv_count, p.lastname,p.firstname,mg_count,m.command,m.start_time,m.end_time,m.iiv_spring_count,
		j.object_name as obj_name,m.organizer,s.name{$slang} as region_name 
		FROM hr.public_event1 m
		left join tur.public_event_types t on t.id = m.public_event_type
		left join hr.structure s on s.id = m.structure_id
		left join hr.staff p on p.id = m.respons_person_id
		left join hr.jts_objects j on j.id = m.jts_object_id
		";


		$query .= " order by m.id";
		$sql->query($query);
		$Events = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Events);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Regions'        =>    $Regions,
			// 'Distcity'       =>    $Distcity,
			'EventTypes'       =>    $EventTypes,
			'Events'       =>    $Events,
			'jts_objects' => $jts_objects,
			'structures' => $Structures,
			'responsible' => $Responsible,
		));
		break;






	case "hr_public_event_duty":
		$query = "SELECT id, name{$slang} as name FROM hr.structure ";
		if ($UserStructure > 1) {
			$query .= " where id = {$UserStructure}";
		} else {
			$query .= " where id != 1 and id < 16 order by turn";
		}
		$sql->query($query);
		$Structure = $sql->fetchAll();


		$query = "SELECT id, name{$slang} as name FROM hr.structure ";
		if ($UserStructure > 1) {
			$query .= " where id = {$UserStructure}";
		} else {
			$query .= " where id != 1 and id >= 1 order by turn";
		}
		$sql->query($query);
		$StructureAll = $sql->fetchAll();


		$query  = "SELECT t.id, CONCAT(t.lastname,' ',t.firstname,' ', t.surname) as name
		FROM hr.staff t ";
		if ($UserStructure > 1) {
			$query .= " WHERE t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$duties = $sql->fetchAll();


		$query  = "SELECT e.id, e.name{$slang} as name FROM ref.epic e";
		$sql->query($query);
		$epic = $sql->fetchAll();

		$query  = "SELECT e.id, e.plate_number as name FROM hr.tech_guard_cars e";
		$sql->query($query);
		$cars = $sql->fetchAll();



		$query = "SELECT 
			m.id, 
			public_event1_id,
			s.name{$slang} as structure_name,
			CONCAT(t.lastname,' ',t.firstname,' ', t.surname) AS staff, 
			bodycam_id,
			c.plate_number as car_name,
			(
            SELECT 
                STRING_AGG(e.name{$slang}, ', ') 
            FROM 
                unnest(m.epikirofka_id) AS single_epic_id
            JOIN 
                ref.epic e ON e.id = single_epic_id
         ) AS epic
		FROM hr.public_event_duty m
		left join hr.structure s on s.id = m.structure_id
		left join hr.staff t on t.id = m.staff_id
		left join hr.tech_guard_cars c on c.id = m.car_id
		";


		$query .= " order by m.id";
		$sql->query($query);
		$EventDuties = $sql->fetchAll();

		// echo '<pre>';
		// print_r($StructureAll);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'EventDuties'       =>    $EventDuties,
			'Structure'       =>    $Structure,
			'StructureAll'       =>    $StructureAll,
			'duties'       =>    $duties,
			'epic'       =>    $epic,
			'cars'       =>    $cars,
		));
		break;








	case "hr_reyd_events":
		$query = "SELECT id, name{$slang} as name FROM hr.structure ";
		if ($UserStructure > 1) {
			$query .= " where id = {$UserStructure}";
		} else {
			$query .= " where id != 1 and id < 16 order by turn";
		}
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query = "SELECT id, name{$slang} as name FROM hr.structure";
		if ($UserStructure > 1) {
			$query .= " where parent = {$UserStructure}";
		} else {
			$query .= " where id > 999 order by id";
		}
		$sql->query($query);
		// $Distcity = $sql->fetchAll();

		$query = "SELECT m.id, r.shortname{$slang} as region_id, d.name{$slang} as distcity_id, m.date, m.staff_count, 
		m.stand, m.responsible, m.text FROM tur.reyd_events m
		left join hr.v_head_structure r on r.id = m.region_id
		left join hr.v_structure d on d.id = m.distcity_id where 1=1";
		if ($UserStructure > 1) {
			$query .= " and m.region_id = {$UserStructure}";
		}
		$query .= " order by m.id";
		$sql->query($query);
		$Events = $sql->fetchAll();

		echo '<pre>';
		print_r($Events);
		echo '</pre>';
		die();

		$smarty->assign(array(
			'Regions'        =>    $Regions,
			'Distcity'       =>    $Distcity,
			'Events'       =>    $Events,
		));
		break;
	case "hr_violations":
		$query = "SELECT id, name{$slang} as name FROM hr.structure where id != 1 and id < 16 order by turn";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query = "SELECT id, name{$slang} as name FROM hr.structure where id > 999 order by id";
		$sql->query($query);
		$Distcity = $sql->fetchAll();

		$query = "SELECT id, name{$slang} as name FROM tur.violation_types order by turn";
		$sql->query($query);
		$ViolationTypes = $sql->fetchAll();

		$query = "SELECT m.id, r.shortname{$slang} as region_id, t.name{$slang} as violation_type, m.lat, m.lon,
		m.type, m.date, m.incident_place, m.citizen, m.birthdate, m.live_adress, m.work_place, m.text 
		FROM tur.violations m
		left join hr.v_head_structure r on r.id = m.region_id
		left join tur.violation_types t on t.id = m.violation_type where 1=1";
		if ($UserStructure > 1) {
			$query .= " and m.region_id = {$UserStructure}";
		}
		$query .= " order by m.id";
		$sql->query($query);
		$Violations = $sql->fetchAll();
		// echo '<pre>';
		// print_r($Violations);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Regions'        =>    $Regions,
			'Distcity'       =>    $Distcity,
			'ViolationTypes'       =>    $ViolationTypes,
			'Violations'       =>    $Violations,
		));
		break;

	case "hr_duty":
		$query = "SELECT id, name1 as name1, name2 as name2, name3  as name3 
		FROM hr.structure ";
		if ($UserStructure > 1) {
			$query .= " where id = {$UserStructure}";
		} else {
			$query .= " where id < 100 order by turn";
		}
		$sql->query($query);
		$Regions = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Regions);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'RegDyns' => $Regions
		));
		break;
	case "hr_duty_staff":
		$RegDyn = MyPiDeCrypt($_GET['regdyn']) ? MyPiDeCrypt($_GET['regdyn']) : 0;

		$query = "SELECT d.id, TO_CHAR(d.date, 'DD.MM.YYYY') AS date,
		CONCAT(r1.shortname{$slang}, ' ', t1.lastname, ' (', p1.name{$slang}, ')' ) AS name1, t1.photo AS photo1,
		CONCAT(r2.shortname{$slang}, ' ', t2.lastname, ' (', p2.name{$slang}, ')' ) AS name2, t2.photo AS photo2,
		CONCAT(r3.shortname{$slang}, ' ', t3.lastname, ' (', p3.name{$slang}, ')' ) AS name3, t3.photo AS photo3
		FROM hr.duty_staff d 
		LEFT JOIN hr.staff t1 ON t1.id = d.staff1
		LEFT JOIN hr.positions p1 ON p1.id = t1.position_id
		LEFT JOIN ref.ranks r1 ON r1.id = t1.rank_id

		LEFT JOIN hr.staff t2 ON t2.id = d.staff2
		LEFT JOIN hr.positions p2 ON p2.id = t2.position_id
		LEFT JOIN ref.ranks r2 ON r2.id = t2.rank_id

		LEFT JOIN hr.staff t3 ON t3.id = d.staff3
		LEFT JOIN hr.positions p3 ON p3.id = t3.position_id
		LEFT JOIN ref.ranks r3 ON r3.id = t3.rank_id

		WHERE d.structure_id = {$RegDyn}
		ORDER BY d.date desc";
		$sql->query($query);
		$Duty = $sql->fetchAll();

		$query = "SELECT t.id, CONCAT(r.shortname{$slang}, ' ', t.lastname, ' (', p.name{$slang}, ')' ) AS name
		FROM hr.staff t
		LEFT JOIN hr.positions p ON p.id = t.position_id
		LEFT JOIN ref.ranks r ON r.id = t.rank_id 
		where t.structure_id = {$RegDyn} ORDER BY id";
		$sql->query($query);
		$Staffs = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Staffs);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Duty' => $Duty,
			'Staffs' => $Staffs,
			'RegDyn' => $RegDyn,
		));
		break;

	/// hr_cooperate
	case "hr_cooperate":
		$query = "SELECT * FROM hr.cooperate t ORDER BY t.id ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Structures);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Structures' => $Structures,
		));
		break;

	case "hr_cooperate_duty":
		$RegDyn = MyPiDeCrypt($_GET['id']) ? MyPiDeCrypt($_GET['id']) : 0;

		$query = "SELECT d.id, TO_CHAR(d.date, 'DD.MM.YYYY') AS date, s.name as staff, s.phone
		FROM hr.cooperate_duty d 
		LEFT JOIN hr.coop_staff s ON ',' || d.staffs || ',' LIKE '%,' || s.id || ',%'
		WHERE d.structure = {$RegDyn}
		ORDER BY d.date;";
		$sql->query($query);
		$Duty = $sql->fetchAll();

		$query = "SELECT t.id, t.name FROM hr.coop_staff t
		where t.structure = {$RegDyn} ORDER BY id";
		$sql->query($query);
		$Staffs = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Duty);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Duty' => $Duty,
			'Staffs' => $Staffs,
			'RegDyn' => $RegDyn,
		));
		break;
	/// hr_cooperate

	/// coop_staff
	case "hr_coop_staff":
		$query = "SELECT t.id, t.name, t.phone, s.name{$slang} as structure FROM hr.coop_staff t 
		left join hr.cooperate s on s.id  = t.structure
		ORDER BY t.id ASC";
		$sql->query($query);
		$Staffs = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.cooperate t 
		ORDER BY t.id ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Staffs);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Staffs' => $Staffs,
			'Structures' => $Structures,
		));
		break;
	/// coop_staff

	/// personal_staff
	case "hr_personal_staff":
		$query  = "SELECT t.id, t.name FROM hr.jts_objects t
		left join hr.structure s on s.id = t.structure_id
		where 1=1";
		if ($UserStructure > 1) {
			$query .= " and s.parent = {$UserStructure}";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();
		$sql->query($query);
		$Objects = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.involved_objects t ORDER BY t.id ASC";
		$sql->query($query);
		$ObjectTypes = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM ref.patrul_types t ORDER BY t.id ASC";
		$sql->query($query);
		$PatrulTypes = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where 1=1";
		if ($UserStructure > 1) {
			$query .= " and id = {$UserStructure}";
		} else {
			$query .= " and id > 1 and id < 16";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		$query  = "SELECT t.id, hs.name{$slang} as region, TO_CHAR(t.date, 'DD.MM.YYYY') AS date,
		ot.name{$slang} as object_type, o.name{$slang} as object,
		(SUM(t.pp_mg) + SUM(t.ap_mg) + SUM(t.mp_mg) + SUM(t.op_mg)) AS mg_staff,
		(SUM(t.pp_qb) + SUM(t.ap_qb) + SUM(t.mp_qb) + SUM(t.op_qb)) AS qb_staff,
		(SUM(t.pp_direction) + SUM(t.ap_direction) + SUM(t.mp_direction) + SUM(t.op_direction)) AS direction_count
		FROM hr.personal_staff t 
		left join hr.jts_objects o on o.id = t.object
		left join hr.involved_objects ot on ot.id = o.type
		left join hr.v_head_structure hs on hs.id = t.structure
		where 1=1";
		if ($UserStructure > 1) {
			$query .= " and t.structure = {$UserStructure}";
		}
		$query .= " GROUP BY t.id, hs.name{$slang}, ot.name{$slang}, o.name{$slang} ORDER BY t.id ASC";
		$sql->query($query);
		$Tables = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Objects);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'PatrulTypes' => $PatrulTypes,
			'Objects' => $Objects,
			'ObjectTypes' => $ObjectTypes,
			'Structures' => $Structures,
			'Tables' => $Tables,
		));
		break;
	/// personal_staff

	/// jts_objects
	case "hr_jts_objects":
		$query  = "SELECT t.id, s.name{$slang} as structure, t.object_name, o.name{$slang} as object_type, c.name{$slang} as cooperate,
		t.address, t.area, t.admin_phone, t.object_head, t.head_phone, t.police_name, t.police_phone,
		t.photo, t.lat, t.long
		FROM hr.jts_objects t 
		left join hr.structure s on s.id  = t.structure_id
		left join hr.involved_objects o on o.id = t.object_type
		LEFT JOIN hr.cooperate c on c.id = t.cooperate_id
		ORDER BY t.id desc LIMIT 10";
		$sql->query($query);
		$JtsObjects = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where id > 1 and id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.involved_objects t ORDER BY t.id ASC";
		$sql->query($query);
		$ObjectTypes = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.cooperate t ORDER BY t.id ASC";
		$sql->query($query);
		$CooperateTypes = $sql->fetchAll();

		// echo '<pre>';
		// print_r($JtsObjects);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'JtsObjects' => $JtsObjects,
			'Regions' => $Regions,
			'ObjectTypes' => $ObjectTypes,
			'CooperateTypes' => $CooperateTypes,
		));
		break;

	case "hr_jts_objects_sos":
		$object_id = ($_GET['id']);
		$query  = "SELECT t.id, t.name, t.lat, t.long
		FROM hr.jts_objects_sos t 
		WHERE t.object_id = {$object_id}
		ORDER BY t.id desc ";
		$sql->query($query);
		$Sos = $sql->fetchAll();


		$smarty->assign(array(
			'Sos' => $Sos,
		));
		break;

	case "hr_jts_objects_camera":
		$object_id = ($_GET['id']);
		$query  = "SELECT t.id, t.name, t.cam_code,  t.lat, t.long,
		case when t.is_ptz then 'PTZ' else 'No PTZ' end as is_ptz 
		FROM hr.jts_objects_camera t 
		WHERE t.object_id = {$object_id}
		ORDER BY t.id desc ";
		$sql->query($query);
		$Camera = $sql->fetchAll();


		$smarty->assign(array(
			'Camera' => $Camera,
		));
		break;

	case "hr_jts_objects_door":
		$object_id = ($_GET['id']);
		$query  = "SELECT t.id, t.name, t.lat, t.long
		FROM hr.jts_objects_door t 
		WHERE t.object_id = {$object_id}
		ORDER BY t.id desc ";
		$sql->query($query);
		$Door = $sql->fetchAll();


		$smarty->assign(array(
			'Door' => $Door,
		));
		break;

	case "hr_dailiy_routine_date":
		$object_id = isset($_GET['obyekt']) ? ($_GET['obyekt']) : 1;


		$query = "SELECT t.id, t.direction, t.smena, 
         p.name{$slang} AS patrul_type,
         CONCAT(s.lastname,' ',s.firstname,' ', s.surname) AS staff, 
         c.plate_number AS car,
		 st.name2 AS structure_name,
         (
            SELECT 
                STRING_AGG(e.name{$slang}, ', ') 
            FROM 
                unnest(t.epikirofka_id) AS single_epic_id
            JOIN 
                ref.epic e ON e.id = single_epic_id
         ) AS epic
         FROM hr.dailiy_routine_date t 
         LEFT JOIN ref.patrul_types p ON p.id = t.patrul_type
         LEFT JOIN hr.staff s ON s.id = t.staff_id
         LEFT JOIN hr.tech_guard_cars c ON c.id = t.car_id
		 LEFT JOIN hr.daily_routine dr ON dr.id = t.routine_id
		 LEFT JOIN hr.structure st ON st.id = dr.structure_id
         
         WHERE t.routine_id = {$object_id}
         ORDER BY t.id DESC";

		$sql->query($query);
		$RoutineDate = $sql->fetchAll();

		// 	echo '<pre>';
		// print_r($RoutineDate);
		// echo '</pre>';
		// die();

		$query  = "SELECT t.id, t.name{$slang} as name
		FROM ref.patrul_types t 
		ORDER BY t.id desc ";
		$sql->query($query);
		$PatrulTypes = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name
		FROM ref.epic t 
		ORDER BY t.id desc ";
		$sql->query($query);
		$Epikirovka = $sql->fetchAll();

		$query  = "SELECT t.id, t.comment as name
		FROM hr.body_cameras t 
		ORDER BY t.id desc ";
		$sql->query($query);
		$BodyCams = $sql->fetchAll();

		$query  = "SELECT t.id, CONCAT(r.name{$slang}, ' ', t.lastname, ' ', t.firstname, ' ', t.surname) AS name
		FROM hr.staff t 
		LEFT JOIN ref.ranks r ON r.id = t.rank_id
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$Staffs = $sql->fetchAll();


		$query  = "SELECT t.id, t.plate_number AS name
		FROM hr.tech_guard_cars t 
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$Cars = $sql->fetchAll();

		// echo '<pre>';
		// print_r($RoutineDate);
		// echo '</pre>';
		// die();



		$smarty->assign(array(
			'RoutineDate' => $RoutineDate,
			'PatrulTypes' => $PatrulTypes,
			'Epikirovka' => $Epikirovka,
			'Staffs' => $Staffs,
			'Cars' => $Cars,
			'BodyCams' => $BodyCams,
		));
		break;

	case "hr_body_cameras":

		$query  = "SELECT t.*, s.name{$slang} as structure
		FROM hr.body_cameras t 
		LEFT JOIN hr.structure s on s.id = t.structure_id
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id desc ";
		$sql->query($query);
		$BodyCams = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where id > 1 and id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		// echo '<pre>';
		// print_r($BodyCams);
		// echo '</pre>';
		// die();



		$smarty->assign(array(
			'BodyCams' => $BodyCams,
			'Regions' => $Regions,
		));
		// echo '<pre>';
		// print_r($BodyCams);
		// echo '</pre>';
		// die();



		$smarty->assign(array(
			'BodyCams' => $BodyCams,
		));
		break;
	/// jts_objects
	case "hr_regions_map":
		$query  = "SELECT t.id, t.object_name as name
		FROM hr.jts_objects t 
		ORDER BY t.id desc";
		$sql->query($query);
		$Objects = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 1 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.involved_objects t ORDER BY t.id ASC";
		$sql->query($query);
		$ObjectTypes = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Objects);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Objects' => $Objects,
			'Regions' => $Regions,
			'ObjectTypes' => $ObjectTypes,
		));
		break;


		/// event_map
	case "hr_public_event_map":
		$query  = "SELECT t.id, t.name{$slang} as name
		FROM hr.public_event1 t 
		ORDER BY t.id desc";
		$sql->query($query);
		$Objects = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 1 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM tur.public_event_types t ORDER BY t.id ASC";
		$sql->query($query);
		$ObjectTypes = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Objects);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Objects' => $Objects,
			'Regions' => $Regions,
			'ObjectTypes' => $ObjectTypes,
		));
		break;

	case "hr_daily_routine":
		$query  = "SELECT t.id, t.object_name as name 
		FROM hr.jts_objects t 
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id desc";
		$sql->query($query);
		$Objects = $sql->fetchAll();

		$query  = "SELECT t.id, t.date, s.name{$slang} as structure,
		CONCAT(r.name{$slang},' ',st.lastname,' ',st.firstname,' ', st.surname) as responsible, o.object_name as object
		FROM hr.daily_routine t 
		LEFT JOIN hr.structure s on s.id = t.structure_id
		LEFT JOIN hr.staff st on st.id = t.responsible_id
		LEFT JOIN hr.jts_objects o on o.id = t.object_id
		left JOIN ref.ranks r on r.id = st.rank_id
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id desc";
		$sql->query($query);
		$Rountines = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 1 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.structure t 
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		$query  = "SELECT t.id, CONCAT(t.lastname,' ',t.firstname,' ', t.surname) as name
		FROM hr.staff t ";
		if ($UserStructure > 1) {
			$query .= " WHERE t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$Responsible = $sql->fetchAll();



		// echo '<pre>';
		// print_r($Rountines);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Objects' => $Objects,
			'Regions' => $Regions,
			'Structures' => $Structures,
			'Responsible' => $Responsible,
			'Rountines' => $Rountines,
		));
		break;
	/// Structures
	case "hr_structure":
		$query  = "SELECT t.id, s.name{$slang} as parent, t.name{$slang} as name, t.shortname{$slang} as shortname FROM hr.structure t 
		left join hr.structure s on s.id  = t.id
		ORDER BY t.id ASC";
		$sql->query($query);
		$Tables = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		ORDER BY t.id ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();


		// echo '<pre>';
		// print_r($Tables);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Regions' => $Regions,
			'Tables' => $Tables,
		));
		break;

	case "hr_car_models":
		$query  = "SELECT t.id
			,t.name
			,t.car_width
			,t.car_height
			,t.photo
		from ref.car_models t
		order by t.id";
		$sql->query($query);
		$RefCarModels = $sql->fetchAll();

		// echo '<pre>';
		// print_r($RefCarModels);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'RefCarModels' => $RefCarModels,
		));
		break;
	/// hr_car_models

	case "hr_impact_area":
		$query  = "SELECT t.id, s.name{$slang} as structure, t.name
		--ST_AsGeoJSON(ST_FlipCoordinates(t.geom)) AS geom
		FROM hr.impact_area t 
		left join hr.structure s on s.id  = t.structure_id
		ORDER BY t.id desc LIMIT 10";
		$sql->query($query);
		$ImpactAreas = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 1 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.structure t 
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		// echo '<pre>';
		// print_r($ImpactAreas);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'ImpactAreas' => $ImpactAreas,
			'Structures' => $Structures,
			'Regions' => $Regions,
		));
		break;
}

$smarty->display("hr/{$Act}.tpl");
