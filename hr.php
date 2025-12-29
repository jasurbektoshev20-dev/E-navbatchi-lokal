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
		left join ref.ranks ra on ra.id  = t.rank_id where t.username IS NOT NULL and t.username <> ''
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

		// $start_date  = !empty($_POST['start_date']) ? $_POST['start_date'] : null;
		// $finish_date = !empty($_POST['finish_date']) ? $_POST['finish_date'] : null;


		/* ================= REGIONS ================= */
		$query = "SELECT id, name{$slang} AS name FROM hr.structure ";

		if ($UserStructure > 1) {
			$query .= "
				WHERE id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
				ORDER BY turn
			";
		} else {
			$query .= "
				WHERE id != 1 
				AND id < 16
				ORDER BY turn
			";
		}

		$sql->query($query);
		$Regions = $sql->fetchAll();


		/* ================= EVENT TYPES ================= */
		$query = "SELECT id, name{$slang} AS event_type FROM tur.public_event_types";
		$sql->query($query);
		$EventTypes = $sql->fetchAll();


		/* ================= EVENT CATEGORY ================= */
		$query = "SELECT id, name{$slang} AS event_category FROM tur.event_category";
		$sql->query($query);
		$EventCategory = $sql->fetchAll();


		/* ================= JTS OBJECTS ================= */
		$query = "SELECT id, object_name AS name FROM hr.jts_objects";
		$sql->query($query);
		$jts_objects = $sql->fetchAll();


		/* ================= STRUCTURES ================= */
		$query = "SELECT t.id, t.name{$slang} AS name FROM hr.structure t ORDER BY t.turn ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();


		/* ================= RESPONSIBLE STAFF ================= */
		$query = "
			SELECT t.id, CONCAT(t.lastname,' ',t.firstname,' ',t.surname) AS name
			FROM hr.staff t
		";

		if ($UserStructure > 1) {
			$query .= " WHERE t.structure_id = {$UserStructure} ";
		}

		$query .= " ORDER BY t.id ASC";
		$sql->query($query);

		$Responsible = $sql->fetchAll();


		/* ================= EVENTS ================= */
		$query = "
			SELECT 
				m.id,
				jo.object_name as object_name,
				t.name{$slang} AS event_type,
				m.event_direction,
				m.iiv_count,
				m.responsible_mg_name,
				m.sapyor_count AS sapyor,
				m.fvv_count,
				m.mg_counts,
				m.event_view,
				m.start_event,
				m.finish_event,
				m.reserve_count,
				m.event_name,
				m.responsible_spring_name,
				m.event_responsible_organization,
				ec.name{$slang} AS event_category,
				m.organizer,
				m.responsible_name,
				m.responsible_phone,
				m.responsible_iiv_name,
				m.reserve_name,
				m.responsible_msgr_name,
				m.responsible_fvv_name,
				m.people_count,
				m.spring_count,
				s.name{$slang} AS region_name,
				m.lat,
				m.long,
				m.comment
			FROM hr.public_event1 m
			LEFT JOIN tur.public_event_types t ON t.id = m.event_type
			LEFT JOIN hr.structure s ON s.id = m.region_id
			LEFT JOIN tur.event_category ec ON ec.id = m.event_category_id
			left join hr.jts_objects jo on jo.id = m.object_id
			
			WHERE 1=1
		";

		/* ======== DATE FILTER ======== */
		if ($start_date && $finish_date) {
			$query .= " AND DATE(m.start_event) BETWEEN '{$start_date}' AND '{$finish_date}' ";
		} else {
			$query .= " AND DATE(m.start_event) = CURRENT_DATE ";
		}

		/* ======== USER STRUCTURE FILTER ======== */
		if ($UserStructure > 1) {
			$query .= "
				AND m.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
			";
		}

		$query .= " ORDER BY m.id ASC";

		$sql->query($query);
		$Events = $sql->fetchAll();
		
		// echo '<pre>';
		// print_r($Events);
		// echo '</pre>';
		// die();

		/* =============== SMARTY ================= */

		$smarty->assign(array(
			'Regions'        => $Regions,
			'EventTypes'     => $EventTypes,
			'Events'         => $Events,
			'jts_objects'    => $jts_objects,
			'structures'     => $Structures,
			'responsible'    => $Responsible,
			'EventCategory'  => $EventCategory
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

		$query  = "SELECT e.id, e.name{$slang} as name FROM tur.dog_types e";
		$sql->query($query);
		$dog_types = $sql->fetchAll();

		$query  = "SELECT e.id, e.name{$slang} as name FROM ref.patrul_types e";
		$sql->query($query);
		$patrul_types = $sql->fetchAll();

		$query  = "SELECT e.id, e.plate_number as name FROM hr.tech_guard_cars e";
		$sql->query($query);
		$cars = $sql->fetchAll();


		$query = "SELECT 
			m.id, 
			public_event1_id,
			s.name{$slang} as structure_name,
			m.horse_count,d.name{$slang} as dog_id,
			CONCAT(t.lastname,' ',t.firstname,' ', t.surname) AS staff, 
			bodycam_id,
			pt.name{$slang} as patrul_type,
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
		left join tur.dog_types d on d.id = m.dog_id
		left join ref.patrul_types pt on pt.id = m.patrul_type_id";
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
			'dog_types' => $dog_types,
			'patrul_types' =>$patrul_types
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



		$query = "SELECT s.id, s.firstname,s.lastname,r.name{$slang} FROM hr.staff s
		left join ref.ranks r on r.id = s.rank_id  
		-- where structure_id = {$UserStructure}
		";
		$sql->query($query);
		$staffs = $sql->fetchAll();


		$query = "SELECT id, name{$slang} FROM ref.reyd_event_types";
		$sql->query($query);
		$types = $sql->fetchAll();


		$query = "SELECT id, name{$slang} as name FROM hr.structure";
		if ($UserStructure > 1) {
			$query .= " where parent = {$UserStructure}";
		} else {
			$query .= " where id > 999 order by id";
		}
		$sql->query($query);
		// $Distcity = $sql->fetchAll();

		$query = "SELECT m.id, s.name{$slang} as structure_name, m.start_date, m.end_date,m.staff_count,CONCAT(r.name{$slang},' ',d.lastname,' ',d.firstname) AS responsible_name,et.name{$slang} as r_type,
		m.type, m.responsible_id, m.exercises_type,m.vehicles_count,m.description FROM tur.reyd_events m
		left join hr.structure s on s.id = m.structure_id
		left join hr.staff d on d.id = m.responsible_id 
		LEFT JOIN ref.reyd_event_types et ON et.id = m.type

		LEFT JOIN ref.ranks r on r.id = d.rank_id
		where 1=1 ";
		if ($UserStructure > 1) {
			$query .= "AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$UserStructure}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$UserStructure}
            )";
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
			// 'Distcity'       =>    $Distcity,
			'Events'       =>    $Events,
			'staffs' => $staffs,
			'types' => $types
		));
		break;




	// case "hr_violations":
	// 	$query = "SELECT id, name{$slang} as name FROM hr.structure where id != 1 and id < 16 order by turn";
	// 	$sql->query($query);
	// 	$Regions = $sql->fetchAll();

	// 	// $query = "SELECT id, name{$slang} as name FROM hr.structure where id > 999 order by id";
	// 	// $sql->query($query);
	// 	// $Distcity = $sql->fetchAll();

	// 	$query = "SELECT id, name{$slang} as name FROM tur.administrativ_types";
	// 	$sql->query($query);
	// 	$AdministrativTypes = $sql->fetchAll();

	// 	$query = "SELECT id, name{$slang} as name FROM tur.criminals_types";
	// 	$sql->query($query);
	// 	$CriminalsTypes = $sql->fetchAll();


	// 	$query = "SELECT 
	// 		c.id,
	// 		c.region_id,
	// 		s.name{$slang} as structure_name,
	// 		c.violation_id,
	// 		ct.name{$slang} as substance,
	// 		c.count,
	// 		c.date
	// 	FROM tur.administrativ c
	// 	left join tur.criminals_types ct on ct.id = c.violation_id
	// 	left join hr.structure s on s.id = c.region_id";
	// 	$sql->query($query);
	// 	$Administrativ = $sql->fetchAll();

	// 	$query = "SELECT 
	// 		c.id,
	// 		c.region_id,
	// 		s.name{$slang} as structure_name,
	// 		c.violation_id,
	// 		ct.name{$slang} as substance,
	// 		c.count,
	// 		c.date
		
	// 	FROM tur.criminals c
	// 	left join tur.criminals_types ct on ct.id = c.violation_id
	// 	left join hr.structure s on s.id = c.region_id
	// 	";
	// 	$sql->query($query);
	// 	$Criminals = $sql->fetchAll();

	// 	// $query = "SELECT m.id, r.shortname{$slang} as region_id, t.name{$slang} as violation_type, m.lat, m.lon,
	// 	// m.type, m.date, m.incident_place, m.citizen, m.birthdate, m.live_adress, m.work_place, m.text 
	// 	// FROM tur.violations m
	// 	// left join hr.v_head_structure r on r.id = m.region_id
	// 	// left join tur.violation_types t on t.id = m.violation_type where 1=1";
	// 	// if ($UserStructure > 1) {
	// 	// 	$query .= " and m.region_id = {$UserStructure}";
	// 	// }
	// 	// $query .= " order by m.id";
	// 	// $sql->query($query); 
	// 	// $Violations = $sql->fetchAll();

	// 	// echo '<pre>';
	// 	// print_r($Administrativ);
	// 	// echo '</pre>';
	// 	// die();

	// 	$smarty->assign(array(
	// 		'Regions'        =>    $Regions,
	// 		'Distcity'       =>    $Distcity,
	// 		'ViolationTypes'       =>    $ViolationTypes,
	// 		'Violations'       =>    $Violations,
	// 	));
	// 	break;
	case "hr_violations":

			// Regions
			$query = "SELECT id, name{$slang} as name 
					FROM hr.structure 
					WHERE id != 1 AND id < 16 
					ORDER BY turn";
			$sql->query($query);
			$Regions = $sql->fetchAll();

			$query = "SELECT *
					FROM tur.administrativ 
					ORDER BY id";
			$sql->query($query);
			$administrativ = $sql->fetchAll();

			$query = "SELECT *
					FROM tur.criminals 
					ORDER BY id";
			$sql->query($query);
			$criminals = $sql->fetchAll();

			
		
			// Administrativ types
			$query = "SELECT id,name{$slang}
					FROM tur.administrativ_types";
			$sql->query($query);
			$AdministrativTypes = $sql->fetchAll();
			

			// Criminal types
			$query = "SELECT id, name{$slang} as name 
					FROM tur.criminals_types";
			$sql->query($query);
			$CriminalsTypes = $sql->fetchAll();
			

			// Administrativ violations
			
			
			// Smarty assign
			$res = json_encode([
				'Regions'            => $Regions,
				'Administrativ'      => $administrativ,
				'Criminals'          => $criminals,
				'AdministrativTypes' => $AdministrativTypes,
				'CriminalsTypes'     => $CriminalsTypes,
			]);
			// echo '<pre>';
			// print_r($res);
			// echo '</pre>';
			// die();
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
		ORDER BY t.id desc LIMIT 200";
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

		$query  = "SELECT t.id, t.name FROM hr.neighborhoods t ORDER BY t.id ASC";
		$sql->query($query);
		$neighborhoods = $sql->fetchAll();

		// echo '<pre>';
		// print_r($JtsObjects);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'JtsObjects' => $JtsObjects,
			'Regions' => $Regions,
			'ObjectTypes' => $ObjectTypes,
			'neighborhoods' => $neighborhoods,
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

		// $smarty->assign(array(
		// 	'Door' => $Door,
		// ));
		// break;
		$smarty->assign(array(
			'Door' => $Door,
		));
		break;


	case "hr_dailiy_routine_date":
		$object_id = isset($_GET['obyekt']) ? ($_GET['obyekt']) : 1;


		$query = "SELECT t.id, t.direction, t.smena, 
         p.name{$slang} AS patrul_type,
         CONCAT(s.lastname,' ',s.firstname,' ', s.surname) AS staff, 
		 d.name{$slang} as dog_type,t.horse_count,
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
		 LEFT JOIN tur.dog_types d on d.id = t.dog_id
         
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
		FROM tur.dog_types t 
		ORDER BY t.id desc ";
		$sql->query($query);
		$Dogtypes = $sql->fetchAll();

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
			'Dogtypes' => $Dogtypes
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
		FROM hr.jts_objects t where t.id != 20
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
		$query  = "SELECT t.id, t.event_name as name
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


	case "hr_neighborhood":
		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 1 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.*,s.name{$slang} as structure_id FROM hr.neighborhoods t 
		left join hr.structure s on s.id  = t.structure_id";
		$sql->query($query);
		$neighborhoods = $sql->fetchAll();

		// echo '<pre>';
		// print_r($neighborhoods);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'neighborhoods' => $neighborhoods,
			'Regions' => $Regions,
		));
		break;


		case "hr_general_report":
			// 1) Regions (siz ilgari olgandek)
			$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
					where t.id > 1 and t.id < 16
					ORDER BY t.turn ASC";
			$sql->query($query);
			$Regions = $sql->fetchAll(); // each: ['id'=>..., 'name'=>...]

			// 2) Object types (hr.involved_objects) — bizga 4 ta type kerak
			$qt = "SELECT id, name1 as name FROM hr.involved_objects ORDER BY id";
			$sql->query($qt);
			$objectTypesFromDB = $sql->fetchAll(); // [ ['id'=>1,'name'=>'Bozorlar'], ... ]

			// Build objectTypes map: id => name
			$objectTypes = [];
			foreach ($objectTypesFromDB as $t) {
				$objectTypes[$t['id']] = $t['name'];
			}
			
			// 3) Your main query that returns structure + json array of object_types
			$query  = "SELECT
							s.id AS structure_id,
							s.name1 AS structure_name,
							json_agg(
								json_build_object(
									'object_type', io.id,
									'object_type_name', io.name1,
									'total_objects', COALESCE(cnt.total_objects, 0)
								) ORDER BY io.id
							) AS object_types
						FROM hr.structure s
						CROSS JOIN hr.involved_objects io
						LEFT JOIN (
							SELECT 
								o.structure_id,
								o.object_type,
								COUNT(*) AS total_objects
							FROM hr.jts_objects o
							GROUP BY o.structure_id, o.object_type
						) cnt
							ON cnt.structure_id = s.id AND cnt.object_type = io.id
						WHERE s.parent = 1
						GROUP BY s.id, s.name1
						ORDER BY s.id;
			";
			$sql->query($query);
			$objects = $sql->fetchAll();

			// Map $objects by structure_id for faster lookup
			$objectsByStructure = [];
			foreach ($objects as $o) {
				$objectsByStructure[$o['structure_id']] = $o;
			}

			$regions = [];
			foreach ($Regions as $r) {
				$sid = $r['id'];
				if (isset($objectsByStructure[$sid])) {
					$obj = $objectsByStructure[$sid];
					$objTypes = $obj['object_types'];

					// if DB driver returned JSON string -> decode
					if (is_string($objTypes)) {
						$objTypesArr = json_decode($objTypes, true);
						if (!is_array($objTypesArr)) $objTypesArr = [];
					} elseif (is_array($objTypes)) {
						$objTypesArr = $objTypes;
					} else {
						$objTypesArr = [];
					}
				} else {
					$objTypesArr = []; 
				}

				$regions[] = [
					'id' => $r['id'],
					'structure_name' => $r['name'],
					'object_types' => $objTypesArr
				];
			}

		
			$tableData = [];    // rows: each row => ['object_type'=>id, 'object_type_name'=>name, 'regions'=>[region_id=>val,...], 'total'=>N]
			$footer_sum = [];   // region_id => sum
			$footer_total = 0;

			foreach ($objectTypes as $type_id => $type_name) {
				$row = [
					'object_type' => $type_id,
					'object_type_name' => $type_name,
					'regions' => [],
					'total' => 0
				];

				$row_total = 0;

				foreach ($regions as $r) {
					$val = 0;
					if (!empty($r['object_types'])) {
						foreach ($r['object_types'] as $ot) {
							// ot may be associative array with keys 'object_type' and 'total_objects'
							if (isset($ot['object_type']) && (int)$ot['object_type'] === (int)$type_id) {
								$val = (int)($ot['total_objects'] ?? 0);
								break;
							}
						}
					}

					$row['regions'][$r['id']] = $val;
					$row_total += $val;

					if (!isset($footer_sum[$r['id']])) $footer_sum[$r['id']] = 0;
					$footer_sum[$r['id']] += $val;
				}

				$row['total'] = $row_total;
				$footer_total += $row_total;

				$tableData[] = $row;
			}

			// 6) Assign to Smarty
			$smarty->assign(array(
				'Regions' => $Regions,           // for header order & names
				'regions' => $regions,           // regions with object_types arrays
				'tableData' => $tableData,       // rows to render
				'footer_sum' => $footer_sum,
				'footer_total' => $footer_total,
				'objectTypesList' => $objectTypes // optional
			));
			break;


	case "hr_users":
		$query = "SELECT t.id, t.lastname, t.firstname, t.surname, t.username, t.phone, t.photo, 
		s.name{$slang} as structure, r.role_name, p.name{$slang} as position, ra.name{$slang} as rank
		FROM hr.staff t 
		left join hr.structure s on s.id  = t.structure_id
		left join bcms.roles r on r.id  = t.role_id
		left join hr.positions p on p.id  = t.position_id
		left join ref.ranks ra on ra.id  = t.rank_id
		 where t.username = ''
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
		// echo '<pre>';
		// print_r($Staffs);
		// echo '</pre>';
		// die();
		$smarty->assign(array(
			'Staffs' => $Staffs,
			'Regions' => $Regions,
			'Structures' => $Structures,
			'Roles' => $Roles,
			'HrPositions' => $HrPositions,
			'RefRanks' => $RefRanks,
		));
  
    break;
	 
	case "hr_categorized_object":
		$query = "SELECT t.id,district,name,type_id,lat,long,post_phone,address,ot.name{$slang} as type_name,s.name{$slang} as structure_name
		FROM hr.embassy_objects t
		left join ref.embassy_object_types ot on ot.id  = t.type_id
		left join hr.structure s on s.id  = t.structure_id";
		
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$embassy_objects = $sql->fetchAll();

		$query = "SELECT id ,name{$slang} as structure_name
		FROM hr.structure
		WHERE id = 32";
		$sql->query($query);
		$units = $sql->fetchAll();

		$query = "SELECT id ,name{$slang} as type_name
		FROM ref.embassy_object_types";
		$sql->query($query);
		$types = $sql->fetchAll();


		$query = "SELECT s.id ,CONCAT(r.name{$slang},' ',s.lastname,' ',s.firstname,' ',s.surname) as troop_name
		FROM hr.staff s
		LEFT JOIN ref.ranks r ON r.id = s.rank_id
		WHERE structure_id = 32";
		$sql->query($query);
		$troops = $sql->fetchAll();

		// echo '<pre>';
		// print_r($troops);
		// echo '</pre>'; 
		// die();

		$smarty->assign(array(
			'embassy_objects' => $embassy_objects,
			'units' => $units,
			'types' => $types,
			'troops' => $troops,
		));
		break;

	case "hr_categorized_object_detail":
		$object_id = ($_GET['mid']);
		$query  = "SELECT t.id,t.district,t.name,t.lat,t.long,t.post_phone,t.address,ot.name{$slang} as type_name,s.name{$slang} as structure_name,t.photo,t.address,
		t.military_unit,CONCAT(r.name{$slang},' ',st.lastname,' ',st.firstname,' ',st.surname) as responsible,t.military_unit_phone,t.iiv_inspector,t.iiv_inspector_phone,t.iiv_unit,t.iiv_unit_phone
		FROM hr.embassy_objects t
		left join ref.embassy_object_types ot on ot.id  = t.type_id
		left join hr.structure s on s.id  = t.structure_id 
		left join hr.staff st on st.id  = t.responsible_id 
		LEFT JOIN ref.ranks r ON r.id = st.rank_id
		WHERE t.id = {$object_id}";
		$sql->query($query);
		$embassy_object = $sql->fetchAll();

		// echo '<pre>';
		// print_r($embassy_object);
		// echo '</pre>'; 
		// die();

		$smarty->assign(array(
			'embassy_object' => $embassy_object,
		));
		break;	



	case "hr_categorized_object_camera":
		$object_id = ($_GET['mid']);
		$query  = "SELECT c.id,c.name,c.is_ptz,c.cam_code, e.name as embassy_object_name
		FROM hr.embassy_objects_camera c
		left join hr.embassy_objects e on e.id  = c.object_id 
		WHERE c.object_id = {$object_id}";
		$sql->query($query);
		$embassy_cameras = $sql->fetchAll();

		// echo '<pre>';
		// print_r($embassy_cameras);
		// echo '</pre>'; 
		// die();

		$smarty->assign(array(
			'embassy_object' => $embassy_object,
			'embassy_cameras' => $embassy_cameras,
		));
		break;		


	
	case "hr_categorized_object_responsible":
		$object_id = ($_GET['mid']);
		$query  = "SELECT d.id,d.date, CONCAT(r.name{$slang},' ',e.lastname,' ',e.firstname,' ', e.surname) as staff_name, s.name{$slang} as structure_name
		FROM hr.duty_embassy d
		left join hr.staff e on e.id  = d.staff_id 
		LEFT JOIN ref.ranks r ON r.id = e.rank_id
		left  join hr.structure s on s.id  = d.structure_id
		WHERE d.object_id = {$object_id}";
		$sql->query($query);
		$duty_embassy = $sql->fetchAll();



		$query = "SELECT s.id ,CONCAT(r.name{$slang},' ',s.lastname,' ',s.firstname,' ',s.surname) as troop_name
		FROM hr.staff s
		LEFT JOIN ref.ranks r ON r.id = s.rank_id
		WHERE structure_id = 32";
		$sql->query($query);
		$troops = $sql->fetchAll();

		$query = "SELECT id ,name{$slang} as structure_name
		FROM hr.structure
		WHERE id = 32";
		$sql->query($query);
		$units = $sql->fetchAll();

		// echo '<pre>';
		// print_r($duty_embassy);
		// echo '</pre>'; 
		// die();

		$smarty->assign(array(
			'duty_embassy' => $duty_embassy,
			'troops' => $troops,
			'units' => $units,
		));
		break;		


	case "hr_consulates_map":
		$query  = "SELECT t.id, t.name as name
		FROM hr.embassy_objects t
		ORDER BY t.id desc";
		$sql->query($query);
		$Objects = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 1 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM ref.embassy_object_types t ORDER BY t.id ASC";
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
	
	case "hr_consulates":
		$query  = "SELECT t.id, s.name{$slang} as structure, t.name, t.lat, t.long, t.post_phone, t.address, ot.name{$slang} as type_name
		FROM hr.embassy_objects t
		left join ref.embassy_object_types ot on ot.id  = t.type_id
		left join hr.structure s on s.id  = t.structure_id
		ORDER BY t.id ASC";
		$sql->query($query);
		$embassy_objects = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		where t.id > 1 and t.id < 16
		ORDER BY t.turn ASC";
		$sql->query($query);
		
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM ref.embassy_object_types t ORDER BY t.id ASC";
		$sql->query($query);
		$ObjectTypes = $sql->fetchAll();

		// echo '<pre>';
		// print_r($embassy_objects);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Objects' => $embassy_objects,
			'Regions' => $Regions,
			'ObjectTypes' => $ObjectTypes,
		));
		break;	


     case "hr_administrative_offenses":

		// 📌 Жиноятлар рўйхати (region + type номи билан)
		$query = "
			SELECT 
				c.id,
				c.region_id,
				s.name{$slang}        AS region_name,
				c.violation_id,
				ct.name{$slang}       AS violation_name,
				c.date,
				c.fio,
				c.comment
			FROM tur.administrativ c
			LEFT JOIN tur.administrativ_types ct 
				ON ct.id = c.violation_id
			LEFT JOIN hr.structure s 
				ON s.id = c.region_id
			ORDER BY c.id ASC
		";
		$sql->query($query);
		$Administrativ = $sql->fetchAll();


		// 📌 Ҳудудлар (Region select учун)
		$query = "
			SELECT 
				t.id, 
				t.name{$slang} AS name
			FROM hr.v_head_structure t
			WHERE t.id > 1 AND t.id < 16
			ORDER BY t.turn ASC
		";
		$sql->query($query);
		$Regions = $sql->fetchAll();


		// 📌 Жиноят турлари (Type select учун)
		$query = "
			SELECT 
				t.id, 
				t.name{$slang} AS name
			FROM tur.administrativ_types t
			ORDER BY t.id ASC
		";
		$sql->query($query);
		$Types = $sql->fetchAll();


		// 📌 Smarty’га юбориш
		$smarty->assign([
			'Administrativ'  => $Administrativ,
			'Regions' => $Regions,
			'Types'   => $Types,
		]);

		break;
		
		

	case "hr_crimes":

		// 📌 Жиноятлар рўйхати (region + type номи билан)
		$query = "
			SELECT 
				c.id,
				c.region_id,
				s.name{$slang}        AS region_name,
				c.violation_id,
				ct.name{$slang}       AS violation_name,
				c.date,
				c.fio,
				c.comment
			FROM tur.criminals c
			LEFT JOIN tur.criminals_types ct 
				ON ct.id = c.violation_id
			LEFT JOIN hr.structure s 
				ON s.id = c.region_id
			ORDER BY c.id ASC
		";
		$sql->query($query);
		$Crimes = $sql->fetchAll();


		// 📌 Ҳудудлар (Region select учун)
		$query = "
			SELECT 
				t.id, 
				t.name{$slang} AS name
			FROM hr.v_head_structure t
			WHERE t.id > 1 AND t.id < 16
			ORDER BY t.turn ASC
		";
		$sql->query($query);
		$Regions = $sql->fetchAll();


		// 📌 Жиноят турлари (Type select учун)
		$query = "
			SELECT 
				t.id, 
				t.name{$slang} AS name
			FROM tur.criminals_types t
			ORDER BY t.id ASC
		";
		$sql->query($query);
		$Types = $sql->fetchAll();


		// 📌 Smarty’га юбориш
		$smarty->assign([
			'Crimes'  => $Crimes,
			'Regions' => $Regions,
			'Types'   => $Types,
		]);

		break;







	case "hr_market_by_region":
		// $object_id = ($_GET['object_id']) ? $_GET['object_id'] : 0;
		// $region_id = ($_GET['region_id']) ? $_GET['region_id'] : 0;
		// $routine_id = ($_GET['routine_id']) ? $_GET['routine_id'] : 0;
		$object_id = 16; // For testing purpose
		$region_id = 31; // For testing purpose
		$routine_id = 22; // For testing purpose
		// $query = "// --- daily_routinelarni BUGUNGI KUN bo'yicha chiqarish (Tashkent timezone) ---
		$query = "SELECT
		dr.id AS routine_id,
		dr.structure_id,
		s.name{$slang} AS structure_name,
		o.id AS object_id,
		o.object_name AS market_name,
		o.area,
		o.sektors_count::int AS sektors_count,
		o.markets_count::int AS markets_count,
		dr.date::text AS date,
		CONCAT(r.name{$slang},' ',st.lastname,' ',st.firstname,' ', st.surname) AS responsible_name,
		dr.date,
		dr.responsible_sname,
		dr.responsible_phone,
		COUNT(DISTINCT od.id) AS doors_count,
		COUNT(DISTINCT drd.smena) AS total_smena_count,
		COUNT(DISTINCT drd.direction) AS total_directions_count,
		COUNT(DISTINCT oc.id) AS camera_count,
		COUNT(DISTINCT drd.patrul_type) AS total_patrul_type_count,
		COUNT(DISTINCT CASE WHEN drd.patrul_type = 1 THEN drd.id END) AS piyoda_patrul_count,
		COUNT(DISTINCT CASE WHEN drd.patrul_type = 2 THEN drd.id END) AS avto_patrul_count,
		COUNT(DISTINCT CASE WHEN drd.patrul_type = 3 THEN drd.id END) AS moto_patrul_count,
		COUNT(DISTINCT CASE WHEN drd.patrul_type = 4 THEN drd.id END) AS otliq_patrul_count,
		array_agg(distinct drd.smena) FILTER (WHERE drd.smena IS NOT NULL) AS smena_list,
		COUNT(DISTINCT CASE WHEN drd.bodycam_id IS NOT NULL THEN 1 ELSE 0 END ) AS bodycam_count,
		SUM(DISTINCT drd.horse_count) AS horse_total,
		(COUNT(DISTINCT CASE WHEN drd.dog_id IS NOT NULL THEN drd.id END) + SUM(DISTINCT drd.horse_count)) AS animals_count,
		COUNT(DISTINCT drd.staff_id) AS staff_count________________________________________________1,
		COUNT(DISTINCT CASE WHEN staff.is_man = true THEN drd.id END) AS man_count,
		COUNT(DISTINCT CASE WHEN staff.is_ofitser = true THEN drd.id END) AS ofitser_count,
		COUNT(DISTINCT CASE WHEN staff.is_woman = true THEN drd.id END) AS woman_count,
		COUNT(DISTINCT CASE WHEN staff.is_sergeant = true THEN drd.id END) AS sergeant_count,
		COUNT(DISTINCT CASE WHEN staff.is_soldier = true THEN drd.id END) AS soldier_count________________________________________________1,
		
		COUNT(DISTINCT CASE WHEN drd.dog_id IS NOT NULL THEN drd.id END) AS dog_count,
		COUNT(DISTINCT CASE WHEN dt.id = 1 THEN drd.id END) AS guard_dogs_count,
		COUNT(DISTINCT CASE WHEN dt.id = 2 THEN drd.id END) AS search_dogs_count,
		COUNT(DISTINCT CASE WHEN dt.id = 3 THEN drd.id END) AS addict_dogs_count,
		COUNT(DISTINCT CASE WHEN dt.id = 4 THEN drd.id END) AS anti_terror_dogs_count________________________________________________1,
		COUNT(DISTINCT drd.car_id) AS cars_count,
		COUNT(DISTINCT CASE WHEN cm.id = 1 THEN drd.id END) AS nexia3_count,
		COUNT(DISTINCT CASE WHEN cm.id = 4 THEN drd.id END) AS tigr_count,
		COUNT(DISTINCT CASE WHEN cm.id = 5 THEN drd.id END) AS spark_count,
		COUNT(DISTINCT CASE WHEN cm.id = 7 THEN drd.id END) AS gazelle_count,
		COUNT(DISTINCT CASE WHEN cm.id = 8 THEN drd.id END) AS uaz_patriot_count,
		COUNT(DISTINCT CASE WHEN cm.id = 9 THEN drd.id END) AS captiva_count,
		COUNT(DISTINCT CASE WHEN cm.id = 11 THEN drd.id END) AS damas_count,
		COUNT(DISTINCT CASE WHEN cm.id = 12 THEN drd.id END) AS gentra_count,
		COUNT(DISTINCT CASE WHEN cm.id = 13 THEN drd.id END) AS isuzu_count,
		COUNT(DISTINCT CASE WHEN cm.id = 14 THEN drd.id END) AS caddy_count,
		COUNT(DISTINCT CASE WHEN cm.id = 16 THEN drd.id END) AS zil_count________________________________________________1,

		SUM(DISTINCT COALESCE(array_length(drd.epikirofka_id,1),0) ) AS epikirofka_total,
		COUNT(DISTINCT CASE WHEN 16 = ANY(drd.epikirofka_id) THEN drd.id END) AS light_count,
		COUNT(DISTINCT CASE WHEN 12 = ANY(drd.epikirofka_id) THEN drd.id END) AS connection_count,
		COUNT(DISTINCT CASE WHEN 13 = ANY(drd.epikirofka_id) THEN drd.id END) AS detector_count,
		COUNT(DISTINCT CASE WHEN 15 = ANY(drd.epikirofka_id) THEN drd.id END) AS kishan_count,
		COUNT(DISTINCT CASE WHEN 17 = ANY(drd.epikirofka_id) THEN drd.id END) AS whistle_count,
		COUNT(DISTINCT CASE WHEN 20 = ANY(drd.epikirofka_id) THEN drd.id END) AS planshet_count	


		


		FROM hr.daily_routine dr
		JOIN hr.jts_objects o ON o.id = dr.object_id
		LEFT JOIN hr.dailiy_routine_date drd ON drd.routine_id = dr.id
		LEFT JOIN hr.staff st ON st.id = dr.responsible_id
		LEFT JOIN ref.ranks r ON r.id = st.rank_id
		LEFT JOIN hr.structure s ON s.id = dr.structure_id
		LEFT JOIN hr.jts_objects_door od ON od.object_id = o.id
		LEFT JOIN hr.jts_objects_camera oc ON oc.object_id = o.id
		LEFT JOIN ref.patrul_types pt ON pt.id = drd.patrul_type
		left join hr.staff staff ON staff.id = drd.staff_id
		left join tur.dog_types dt ON dt.id = drd.dog_id
		left join hr.tech_guard_cars tc ON tc.id = drd.car_id
		left join ref.car_models cm ON cm.id = tc.car_model_id

		left join ref.epic epic ON epic.id = ANY(drd.epikirofka_id)

		WHERE dr.date = (now() AT TIME ZONE 'Asia/Tashkent')::date
		AND dr.object_id = {$object_id}
		AND dr.structure_id = {$region_id}
		AND dr.id = {$routine_id}
		GROUP BY
		o.id, o.object_name, o.area, o.sektors_count, o.markets_count,st.is_man,st.is_ofitser,
		dr.structure_id, s.name{$slang}, r.name{$slang}, dr.id,st.is_woman,st.is_sergeant,st.is_soldier,
		dr.date, dr.responsible_id, dr.responsible_sname, dr.responsible_phone,
		st.lastname, st.firstname, st.surname
		ORDER BY o.object_name;
		";

    $sql->query($query);
    $markets = $sql->fetchAll();
	
	
		// echo '<pre>';
		// print_r($markets);
		// echo '</pre>';
		// die();


    // Agar hududlar ro'yxati kerak bo'lsa (misol tariqasida)
    $query = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t WHERE t.id > 1 AND t.id < 16 ORDER BY t.turn ASC";
    $sql->query($query);
    $Regions = $sql->fetchAll();

    // Agar tur/kanal ro'yxati kerak bo'lsa (misol tariqasida)
    $query = "SELECT t.id, t.name{$slang} as name FROM tur.criminals_types t ORDER BY t.id ASC";
    $sql->query($query);
    $Types = $sql->fetchAll();

    $smarty->assign(array(
        'markets' => $markets,
        'Regions' => $Regions,
        'Types' => $Types,
    ));
    break;










	case "hr_market_according_duty":
			// $object_id = ($_GET['object_id']) ? $_GET['object_id'] : 0;
			// $region_id = ($_GET['region_id']) ? $_GET['region_id'] : 0;
			// $routine_id = ($_GET['routine_id']) ? $_GET['routine_id'] : 0;
			$object_id = 16; // For testing purpose
			$region_id = 31; // For testing purpose
			$routine_id = 22; // For testing purpose
			//date needed
			// $query = "// --- daily_routinelarni BUGUNGI KUN bo'yicha chiqarish (Tashkent timezone) ---
			$query = "SELECT
			dr.id AS routine_id,
			dr.structure_id,
			s.name{$slang} AS structure_name,
			o.id AS object_id,
			o.object_name AS market_name,
			dr.date::text AS date,
			CONCAT(r.name{$slang},' ',staff.lastname,' ',staff.firstname,' ', staff.surname) AS troop_name,
			dr.date,
			drd.direction,
			drd.smena,
			cm.name as car_name,
			tc.plate_number,
			pt.name{$slang} as patrul_type,
			bc.comment,
			drd.staff_phone,
			dt.name{$slang} as dog_name,
			drd.horse_count,


			SUM(DISTINCT COALESCE(array_length(drd.epikirofka_id,1),0) ) AS epikirofka_total,
			COUNT(DISTINCT CASE WHEN 16 = ANY(drd.epikirofka_id) THEN drd.id END) AS light_count,
			COUNT(DISTINCT CASE WHEN 12 = ANY(drd.epikirofka_id) THEN drd.id END) AS connection_count,
			COUNT(DISTINCT CASE WHEN 13 = ANY(drd.epikirofka_id) THEN drd.id END) AS detector_count,
			COUNT(DISTINCT CASE WHEN 15 = ANY(drd.epikirofka_id) THEN drd.id END) AS kishan_count,
			COUNT(DISTINCT CASE WHEN 17 = ANY(drd.epikirofka_id) THEN drd.id END) AS whistle_count,
			COUNT(DISTINCT CASE WHEN 20 = ANY(drd.epikirofka_id) THEN drd.id END) AS planshet_count	





			FROM hr.dailiy_routine_date drd
		
			left join hr.daily_routine dr on dr.id = drd.routine_id
			JOIN hr.jts_objects o ON o.id = dr.object_id
			LEFT JOIN hr.structure s ON s.id = dr.structure_id
			LEFT JOIN hr.jts_objects_door od ON od.object_id = o.id
			LEFT JOIN hr.jts_objects_camera oc ON oc.object_id = o.id
			LEFT JOIN ref.patrul_types pt ON pt.id = drd.patrul_type
			left join hr.staff staff ON staff.id = drd.staff_id
			LEFT JOIN ref.ranks r ON r.id = staff.rank_id
			left join tur.dog_types dt ON dt.id = drd.dog_id
			left join hr.tech_guard_cars tc ON tc.id = drd.car_id
			left join ref.car_models cm ON cm.id = tc.car_model_id
			left join hr.body_cameras bc on bc.id = drd.bodycam_id

			left join ref.epic epic ON epic.id = ANY(drd.epikirofka_id)

			WHERE dr.date = (now() AT TIME ZONE 'Asia/Tashkent')::date
			AND dr.object_id = {$object_id}
			AND dr.structure_id = {$region_id}
			AND drd.routine_id = {$routine_id}
			GROUP BY
			o.id, o.object_name, o.markets_count,drd.direction,dt.name{$slang},drd.horse_count,tc.plate_number,
			dr.structure_id, s.name{$slang}, r.name{$slang}, dr.id,drd.bodycam_id,drd.staff_phone,bc.comment,
			dr.date, dr.responsible_id, dr.responsible_sname, dr.responsible_phone,	drd.smena,pt.name{$slang},
			staff.lastname, staff.firstname, staff.surname,cm.name
			ORDER BY o.object_name;
			";

		$sql->query($query);
		$markets_duty = $sql->fetchAll();
		
		// Agar hududlar ro'yxati kerak bo'lsa (misol tariqasida)
		$query = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t WHERE t.id > 1 AND t.id < 16 ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		// Agar tur/kanal ro'yxati kerak bo'lsa (misol tariqasida)
		$query = "SELECT t.id, t.name{$slang} as name FROM tur.criminals_types t ORDER BY t.id ASC";
		$sql->query($query);
		$Types = $sql->fetchAll();

			$smarty->assign(array(
			'markets' => $markets_duty,
			'Regions' => $Regions,
			'Types' => $Types,
		));
		break;

	case "hr_general_report_events":
		// 1) Regions (siz ilgari olgandek)
		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
				where t.id > 1 and t.id < 16
				ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll(); // each: ['id'=>..., 'name'=>...]

		// 2) Object types (hr.involved_objects) — bizga 4 ta type kerak
		$qt = "SELECT id, name1 as name FROM tur.public_event_types ORDER BY id";
		$sql->query($qt);
		$EventTypesFromDB = $sql->fetchAll(); // [ ['id'=>1,'name'=>'Bozorlar'], ... ]

		// Build objectTypes map: id => name
		$objectTypes = [];
		foreach ($EventTypesFromDB as $t) {
			$objectTypes[$t['id']] = $t['name'];
		}
			
			// 3) Your main query that returns structure + json array of object_types
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
					ORDER BY s.id;
			";
		$sql->query($query);
		$events = $sql->fetchAll();
			
		// echo '<pre>';
		// print_r($events);
		// echo '</pre>';
		// die();
	
		$eventTypes = [];
		foreach ($EventTypesFromDB as $t) {
			$eventTypes[$t['id']] = $t['name'];
		}

		// 2. Regionlar (id => name)
		$regions = [];
		foreach ($events as $r) {
			$regions[$r['structure_id']] = $r['structure_name'];
		}

		// 3. Jadval ma’lumotlari
		$table = [];

		foreach ($events as $row) {
			$regionId = $row['structure_id'];
			$types = json_decode($row['event_types'], true);

			foreach ($types as $t) {
				$table[$t['event_type']][$regionId] = $t['total_events'];
			}
		}
		$regionTotals = [];

		// boshlang‘ich 0
		foreach ($regions as $regionId => $name) {
			$regionTotals[$regionId] = 0;
		}

		// yig‘amiz
		foreach ($table as $typeId => $rows) {
			foreach ($rows as $regionId => $val) {
				$regionTotals[$regionId] += $val;
			}
		}

		// umumiy jami
		$grandTotal = array_sum($regionTotals);

		$smarty->assign('regionTotals', $regionTotals);

		// Smarty’ga beramiz
		$smarty->assign('eventTypes', $eventTypes);
		$smarty->assign('regions', $regions);
		$smarty->assign('table', $table);


			// 6) Assign to Smarty
			// $smarty->assign(array(
			// 	// 'Regions' => $Regions,           // for header order & names
			// 	// 'regions' => $regions,           // regions with object_types arrays
			// 	// 'tableData' => $tableData,       // rows to render
			// 	// 'footer_sum' => $footer_sum,
			// 	// 'footer_total' => $footer_total,
			// 	// 'objectTypesList' => $objectTypes // optional
			// ));
		break;

	
	case "hr_about_region_events":
		$regionId = (int)($_GET['region_id'] ?? 0);
		if ($regionId <= 0) {
			die('Region topilmadi');
		}

		$q = "SELECT name1
			FROM hr.structure
			WHERE id = {$regionId}
		";
		$sql->query($q);
		$regionName = $sql->fetchAll();

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
				ec.name{$slang} as event_category,
				
				SUM(
					COALESCE(pe.mg_counts, 0) +
					COALESCE(pe.fvv_count, 0) +
					COALESCE(pe.iiv_count, 0) +
					COALESCE(pe.sapyor_count, 0) +
					COALESCE(pe.spring_count, 0)
				) AS all_troops




			FROM hr.public_event1 pe
			LEFT JOIN tur.public_event_types et ON et.id = pe.event_type
			LEFT JOIN tur.event_category ec on ec.id = pe.event_category_id

			WHERE pe.region_id = {$regionId}
			GROUP BY pe.id,ec.name{$slang},et.name1
		";
		$sql->query($q);
		$events = $sql->fetchAll();
		// echo '<pre>';
		// print_r($events);
		// echo '</pre>';
		// die();

		$smarty->assign('regionName', $regionName);
		$smarty->assign('events', $events);
		break;

	
	case "hr_type_region_events":
		$typeId = (int)($_GET['type_id'] ?? 0);
		if ($typeId <= 0) {
			die('Region topilmadi');
		}

		$q = "SELECT name1
			FROM tur.public_event_types
			WHERE id = {$typeId}
		";
		$sql->query($q);
		$typeName = $sql->fetchAll();

		$q = "
			SELECT 
				pe.id,
				s.name1 AS region_name,
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
				ec.name{$slang} as event_category,
				
				SUM(
					COALESCE(pe.mg_counts, 0) +
					COALESCE(pe.fvv_count, 0) +
					COALESCE(pe.iiv_count, 0) +
					COALESCE(pe.sapyor_count, 0) +
					COALESCE(pe.spring_count, 0)
				) AS all_troops




			FROM hr.public_event1 pe
			LEFT JOIN tur.public_event_types et ON et.id = pe.event_type
			LEFT JOIN tur.event_category ec on ec.id = pe.event_category_id
			left join hr.structure s on s.id = pe.region_id

			WHERE pe.event_type = {$typeId}
			GROUP BY pe.id,ec.name{$slang},et.name1,s.name1
		";
		$sql->query($q);
		$events = $sql->fetchAll();
		// echo '<pre>';
		// print_r($events);
		// echo '</pre>';
		// die();

		$smarty->assign('typeName', $typeName);
		$smarty->assign('events', $events);
		break;






	case "hr_reyd_events_report":
		// 1) Regions (siz ilgari olgandek)
		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
				where t.id > 0
				ORDER BY t.turn ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll(); // each: ['id'=>..., 'name'=>...]

		// 2) Object types (hr.involved_objects) — bizga 4 ta type kerak
		$qt = "SELECT id, name1 as name FROM ref.reyd_event_types ORDER BY id";
		$sql->query($qt);
		$EventTypesFromDB = $sql->fetchAll(); // [ ['id'=>1,'name'=>'Bozorlar'], ... ]

		// Build objectTypes map: id => name
		$objectTypes = [];
		foreach ($EventTypesFromDB as $t) {
			$objectTypes[$t['id']] = $t['name'];
		}
			
			// 3) Your main query that returns structure + json array of object_types
		$query  = "SELECT
						s.id AS structure_id,
						s.name1 AS structure_name,
						json_agg(
							json_build_object(
								'type', et.id,
									'event_type_name', et.name1,
								'total_events', COALESCE(cnt.total_events, 0)
							) ORDER BY et.id
						) AS event_types
					FROM hr.structure s
					CROSS JOIN ref.reyd_event_types et
					LEFT JOIN (
						SELECT 
							pe.structure_id,
							pe.type,
							COUNT(*) AS total_events
						FROM tur.reyd_events pe
						GROUP BY pe.structure_id, pe.type
					) cnt
						ON cnt.structure_id = s.id AND cnt.type = et.id
					WHERE s.parent = 1
					GROUP BY s.id, s.name1
					ORDER BY s.id;
			";
		$sql->query($query);
		$events = $sql->fetchAll();
			
		// echo '<pre>';
		// print_r($events);
		// echo '</pre>';
		// die();
	
		$eventTypes = [];
		foreach ($EventTypesFromDB as $t) {
			$eventTypes[$t['id']] = $t['name'];
		}

		// 2. Regionlar (id => name)
		$regions = [];
		foreach ($events as $r) {
			$regions[$r['structure_id']] = $r['structure_name'];
		}

		// 3. Jadval ma’lumotlari
		$table = [];

		foreach ($events as $row) {
			$regionId = $row['structure_id'];
			$types = json_decode($row['event_types'], true);

			foreach ($types as $t) {
				$table[$t['type']][$regionId] = $t['total_events'];
			}
		}
		$regionTotals = [];

		// boshlang‘ich 0
		foreach ($regions as $regionId => $name) {
			$regionTotals[$regionId] = 0;
		}

		// yig‘amiz
		foreach ($table as $typeId => $rows) {
			foreach ($rows as $regionId => $val) {
				$regionTotals[$regionId] += $val;
			}
		}

		// umumiy jami
		$grandTotal = array_sum($regionTotals);

		$smarty->assign('regionTotals', $regionTotals);

		// Smarty’ga beramiz
		$smarty->assign('eventTypes', $eventTypes);
		$smarty->assign('regions', $regions);
		$smarty->assign('table', $table);

			// 6) Assign to Smarty
			// $smarty->assign(array(
			// 	// 'Regions' => $Regions,           // for header order & names
			// 	// 'regions' => $regions,           // regions with object_types arrays
			// 	// 'tableData' => $tableData,       // rows to render
			// 	// 'footer_sum' => $footer_sum,
		break;	




		

		case "hr_about_reyd_events":
			$regionId = (int)($_GET['region_id'] ?? 0);
			if ($regionId <= 0) {
				die('Region topilmadi');
			}

			$q = "
				SELECT name1
				FROM hr.structure
				WHERE id = {$regionId}
			";
			$sql->query($q);
			$regionName = $sql->fetchAll(); 

			$q = "
				SELECT 
					pe.id,
					s.name{$slang} as structure_name,
					et.name{$slang} AS event_type,
					CONCAT(r.name{$slang},' ',st.lastname,' ',st.firstname) as responsible_name,
					pe.exercises_type,
					pe.start_date,
					pe.end_date,
					pe.staff_count,
					pe.vehicles_count,
					et.name{$slang} as type,
					pe.description,
					COUNT(pe.id) as event_count




				FROM tur.reyd_events pe
				LEFT JOIN ref.reyd_event_types et ON et.id = pe.type
				LEFT JOIN hr.structure s on s.id = pe.structure_id
				LEFT JOIN hr.staff st on st.id = pe.responsible_id
				LEFT JOIN ref.ranks r on r.id = st.rank_id

				WHERE pe.structure_id = {$regionId}
				GROUP BY pe.id,s.name{$slang},et.name{$slang},r.name{$slang},st.lastname,st.firstname
			";
			$sql->query($q);
			$events = $sql->fetchAll();


			// echo '<pre>';
			// print_r($events);
			// echo '</pre>';
			// die();

			$smarty->assign('regionName', $regionName);
			$smarty->assign('events', $events);
			break;



		case "hr_type_reyd_events_report":
			$typeId = (int)($_GET['type_id'] ?? 0);
			if ($typeId <= 0) {
				die('turi topilmadi');
			}

			$q = "SELECT name1 as name
				FROM ref.reyd_event_types
				WHERE id = {$typeId}
			";
			$sql->query($q);
			$typeName = $sql->fetchAll(); 

			$q = "
				SELECT 
					pe.id,
					s.name{$slang} as structure_name,
					str.name{$slang} as region_name,
					et.name{$slang} AS event_type,
					CONCAT(r.name{$slang},' ',st.lastname,' ',st.firstname) as responsible_name,
					pe.exercises_type,
					pe.start_date,
					pe.end_date,
					pe.staff_count,
					pe.vehicles_count,
					et.name{$slang} as type,
					pe.description,
					COUNT(pe.id) as event_count




				FROM tur.reyd_events pe
				LEFT JOIN ref.reyd_event_types et ON et.id = pe.type
				LEFT JOIN hr.structure s on s.id = pe.structure_id
				left join hr.structure str on str.id = pe.region_id
				LEFT JOIN hr.staff st on st.id = pe.responsible_id
				LEFT JOIN ref.ranks r on r.id = st.rank_id

				WHERE pe.type = {$typeId}
				GROUP BY pe.id,s.name{$slang},et.name{$slang},r.name{$slang},st.lastname,st.firstname,str.name1
			";
			$sql->query($q);
			$events = $sql->fetchAll();


			// echo '<pre>';
			// print_r($events);
			// echo '</pre>';
			// die();

			$smarty->assign('typeName', $typeName);
			$smarty->assign('events', $events);
			break;

		// case "hr_add_injuries":

		// 	$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		// 	where t.id > 1 and t.id < 16
		// 	ORDER BY t.turn ASC";
		// 	$sql->query($query);
		// 	$Regions = $sql->fetchAll();


		// 	$smarty->assign(array(
				
		// 		'Regions' => $Regions,
				
		// 	));
		// 	break;

		case "hr_add_injuries":

           // 📌 Hududlar (regions)
			$query = "SELECT t.id, t.name{$slang} AS name
					FROM hr.v_head_structure t
					WHERE t.id > 1 AND t.id < 16
					ORDER BY t.turn ASC";
			$sql->query($query);
			$Regions = $sql->fetchAll();

			// 📌 Injury types (select uchun)
			$query = "SELECT 
						it.id,
						it.name{$slang} AS name
					FROM tur.injuries_types it
					ORDER BY it.id ASC";
			$sql->query($query);
			$InjuryTypes = $sql->fetchAll();

			$query  = "SELECT t.id, CONCAT(t.lastname,' ',t.firstname,' ', t.surname) as name
			FROM hr.staff t ";
			if ($UserStructure > 1) {
				$query .= " WHERE t.structure_id = {$UserStructure} ";
			}
			$query .= " ORDER BY t.id ASC";
			$sql->query($query);
			$Staffs = $sql->fetchAll();

			// 📌 Injuries ro‘yxati (TYPE NOMI BILAN)
			$query = "SELECT 
						i.id,
						sr.name{$slang} AS region_name,
						it.name{$slang} AS injury_type_name,
						i.comment,
						i.date,
						str.name{$slang} AS structure_name,
						CONCAT(r.name{$slang},' ',s.lastname,' ',s.firstname,' ', s.surname) as troop_name
					FROM hr.injuries i
					LEFT JOIN tur.injuries_types it  ON it.id = i.injury_type_id::bigint
					left JOIN hr.staff s ON s.id = i.troops_id 
					LEFT JOIN ref.ranks r ON r.id = s.rank_id
					left JOIN hr.structure sr ON sr.id = i.region_id
					left JOIN hr.structure str ON str.id = i.structure_id
					-- WHERE i.structure_id = {$UserStructure}
                    
					ORDER BY i.id ASC";
			$sql->query($query);
			$Injuries = $sql->fetchAll();
			
			// echo '<pre>';
			// print_r($Injuries);
			// echo '</pre>';
			// die();
			$smarty->assign([
				'Regions'      => $Regions,
				'InjuryTypes' => $InjuryTypes,
				'Injuries'    => $Injuries,
				'Staffs'    => $Staffs
			]);

			break;
		
	case "hr_events_cam":
		$event_id = ($_GET['mid']);
		$query  = "SELECT t.id, t.name, t.cam_code,  t.lat, t.long,
		case when t.is_ptz then 'PTZ' else 'No PTZ' end as is_ptz 
		FROM hr.public_event_cameras t 
		WHERE t.event_id = {$event_id}
		ORDER BY t.id desc ";
		$sql->query($query);
		$Camera = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Camera);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Camera' => $Camera,
		));
	break;



	case "hr_duty_cameras":
		$structure_id = MyPiDeCrypt($_GET['mid']);

		$query = "
			SELECT 
				t.id,
				t.name,
				t.cam_code,
				CASE 
					WHEN t.is_ptz THEN 'PTZ' 
					ELSE 'No PTZ' 
				END AS is_ptz
			FROM hr.duty_part_cameras t
			WHERE t.structure_id = {$structure_id}
			ORDER BY t.id DESC
		";

		$sql->query($query);
		$Camera = $sql->fetchAll();

		// echo '<pre>';
		// print_r($structure_id);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Camera' => $Camera,
		));
	break;


	case "hr_injuries":

		// 📌 Жиноятлар рўйхати (region + type номи билан)


		break;


     case "hr_regions_cameras":
		$query  = "SELECT t.id, t.object_name as name
		FROM hr.jts_objects t where t.id != 20
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
	
		
}

$smarty->display("hr/{$Act}.tpl");