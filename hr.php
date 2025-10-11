<?php
define('ARM_IN', true);
require_once("includes/all_includes.php");
if ($user_data == null) {
	print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='login.php'; </script>";
	exit;
}
$TheAct = isset($_GET['act']) ? (($_GET['act'] != "") ? $_GET['act'] : "index") : "index";
$SubAct = isset($_GET['sub']) ? (($_GET['sub'] != "") ? $_GET['sub'] : "") : "";

$ThisMenuId = MyPiDeCrypt($_GET['mid']);
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

$query = "SELECT t.*, t.name{$slang} as name, t.menu_icon, t.has_children FROM bcms.dashboard_menu t where t.status_id = 1 and t.id IN (".$usermenu['menu'].") order by t.turn asc";
$sql->query($query);
$Menu = $sql->fetchAll();

foreach ($Menu as $key => $menu_item) {
	if ($Menu[$key]['url']) {
		if ($Menu[$key]['has_children'] == 5) {
			$Menu[$key]['url'] = $menu_item['url'];
		} else {
			$Menu[$key]['url'] = $menu_item['url'] . "&mid=" .MyPiCrypt($menu_item['id']);
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
	'CurrLang' 			=> $Langs[$slang],
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
		$StructureId = MyPiDeCrypt($_GET['str']);

		$query  = "SELECT id, name from ref.car_models";
		$sql->query($query);
		$RefCarModels = $sql->fetchAll();

		$query  = "SELECT id, shortname{$slang} as name from hr.structure where parent = {$StructureId}";
		$sql->query($query);
		$Structures = $sql->fetchAll();

		$query = "SELECT t.id
			,(SELECT name{$slang} FROM hr.structure s WHERE s.id = t.structure_id LIMIT 1) as structure_id
			,(SELECT count(*) FROM hr.tech_guard_car_cameras s WHERE s.car_id = t.id and camera_types = 1 LIMIT 1) as camera
			,(SELECT name FROM ref.car_models s WHERE s.id = t.car_model_id LIMIT 1) as car_model_id
			,t.plate_number
			,t.uzgps_id
			,'Бугунги' as current
			from hr.tech_guard_cars t
			left join hr.structure st on st.id = t.structure_id
			where st.id = {$StructureId}
			order by t.id";
		$sql->query($query);
		$HrTechGuardCars = $sql->fetchAll();

		// echo '<pre>';
		// print_r($HrTechGuardCars);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'StructureId'        => $StructureId,
			'RefCarModels'        => $RefCarModels,
			'Structures'         => $Structures,
			'HrTechGuardCars'         => $HrTechGuardCars,
		));
		break;
	// hr_thg_cars

    // hr_current_thg
	case "hr_current_thg":
		$StructureId = MyPiDeCrypt($_GET['str']);
		$GuardCarsId = MyPiDeCrypt($_GET['cur']);

		$query  = "SELECT id,name{$slang} as name1 from ref.smena";
		$sql->query($query);
		$HrSmena = $sql->fetchAll();

		$query = "SELECT c.id, c.plate_number as name from hr.tech_guard_cars c where c.id = {$GuardCarsId}";
		$sql->query($query);
		$HrTechGuardCars = $sql->fetchAll();

		$query = "SELECT t.id, sm.name{$slang} as smena, to_char(t.date, 'DD.MM.YYYY') as date
			from hr.current_operative_group t
			left join ref.smena sm on sm.id = t.smena
			where t.car_id = {$GuardCarsId}
			order by t.id desc";
		$sql->query($query);
		$HrCurrentOperativeGroup = $sql->fetchAll();


		// echo '<pre>';
		// print_r($HrCurrentOperativeGroup);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'HrCurrentOperativeGroup' => $HrCurrentOperativeGroup,
			'HrTechGuardCars' => $HrTechGuardCars,
			'StructureId' => $StructureId,
			'HrSmena' => $HrSmena,
		));
		break;
	// hr_current_thg

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


		// echo '<pre>';
		// print_r($BcmsStatus);
		// echo '</pre>';
		// die();

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
		s.name{$slang} as structure, r.role_name, p.name{$slang} as position, ra.name{$slang} as rank FROM hr.staff t 
		left join hr.structure s on s.id  = t.structure_id
		left join bcms.roles r on r.id  = t.role_id
		left join hr.positions p on p.id  = t.position_id
		left join ref.ranks ra on ra.id  = t.rank_id
		ORDER BY t.id ASC";
        $sql->query($query);
        $Staffs = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.structure t where parent < 2
		ORDER BY t.id ASC";
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
		// print_r($Roles);
		// echo '</pre>';
		// die();

        $smarty->assign(array(
            'Staffs' => $Staffs,
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

		$query = "SELECT id, name{$slang} as name FROM hr.structure";
		if ($UserStructure > 1) {
			$query .= " where parent = {$UserStructure}";
		} else {
			$query .= " where id > 999 order by id";
		}
		$sql->query($query);
		$Distcity = $sql->fetchAll();

		$query = "SELECT id, name{$slang} as name FROM tur.event_types order by turn";
		$sql->query($query);
		$EventTypes = $sql->fetchAll();

		$query = "SELECT m.id, r.shortname{$slang} as region_id, d.name{$slang} as distcity_id, t.name{$slang} as type, m.date, m.staff_count, 
		m.stand, m.transport, m.responsible, m.text FROM tur.events m
		left join hr.v_head_structure r on r.id = m.region_id
		left join hr.v_structure d on d.id = m.distcity_id
		left join tur.event_types t on t.id = m.type where 1=1";
		if ($UserStructure > 1) {
			$query .= " and m.region_id = {$UserStructure}";
		}
		$query .= " order by m.id";
		$sql->query($query);
		$Events = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Events);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Regions'        =>    $Regions,
			'Distcity'       =>    $Distcity,
			'EventTypes'       =>    $EventTypes,
			'Events'       =>    $Events,
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
		$Distcity = $sql->fetchAll();

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

		// echo '<pre>';
		// print_r($Events);
		// echo '</pre>';
		// die();

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

		$query = "SELECT m.id, r.shortname{$slang} as region_id, d.name{$slang} as distcity_id, t.name{$slang} as violation_type, m.lat, m.lon,
		m.type, m.date, m.incident_place, m.citizen, m.birthdate, m.live_adress, m.work_place, m.text FROM tur.violations m
		left join hr.v_head_structure r on r.id = m.region_id
		left join hr.v_structure d on d.id = m.distcity_id
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
		where t.id != 1 and t.structure_id = {$RegDyn} ORDER BY id";
		$sql->query($query);
		$Staffs = $sql->fetchAll();

		// echo '<pre>';
		// print_r($query);
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
		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.jts_objects t
		left join hr.structure s on s.id = t.structure
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
		$query  = "SELECT t.id, t.name{$slang} as name, s.name{$slang} as structure, o.name{$slang} as type FROM hr.jts_objects t 
		left join hr.structure s on s.id  = t.structure
		left join hr.involved_objects o on o.id = t.type ORDER BY t.id ASC";
		$sql->query($query);
		$Tables = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.v_head_structure t 
		ORDER BY t.id ASC";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.structure t where id > 999
		ORDER BY t.id ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();
		
		$query  = "SELECT t.id, t.name{$slang} as name FROM hr.involved_objects t ORDER BY t.id ASC";
		$sql->query($query);
		$ObjectTypes = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Parks);
		// echo '</pre>';
		// die();

        $smarty->assign(array(
            'ObjectTypes' => $ObjectTypes,
            'Regions' => $Regions,
            'Structures' => $Structures,
            'Tables' => $Tables,
        ));
        break;    
	/// jts_objects
	
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
	/// Structures
	
	/// hr_car_models 
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
	
}

$smarty->display("hr/{$Act}.tpl");
