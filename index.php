<?php
define('ARM_IN', true);
require_once("includes/all_includes.php");
if ($user_data == null) {
	print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='login.php'; </script>";
	exit;
}
$TheAct = isset($_GET['act']) ? (($_GET['act'] != "") ? $_GET['act'] : "index") : "index";
$SubAct = isset($_GET['sub']) ? (($_GET['sub'] != "") ? $_GET['sub'] : "") : "";

if ($TheAct == "uzl" || $TheAct == "rus" || $TheAct == "uzb") {
	$_GET['slang'] = $TheAct;
	$TheAct = "index";
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

$query = "SELECT t.*, t.name{$slang} as name, menu_icon, has_children FROM bcms.dashboard_menu t where t.status_id = 1 and  t.id IN (".$usermenu['menu'].") order by t.turn asc";
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

$sql->query("SELECT name{$slang} as name, keyword from bcms.s_dictionary");
$Dictionary = $sql->fetchAll();
foreach ($Dictionary as $id => $value) {
	$Dict[$value['keyword']] = $value['name'];
}

$ThisMenuId = isset($_GET['mid']) ? $_GET['mid'] : 'DQtttt';
$ThisMenuId = MyPiDeCrypt($ThisMenuId);
$query = "SELECT name{$slang} as name, menu_icon, url from bcms.dashboard_menu where id = {$ThisMenuId}";
$sql->query($query);
$ThisMenu = $sql->fetchAssoc();

// echo '<pre>';
// print_r($Menu);
// echo '</pre>';
// die();

$smarty->assign(array(
	'Langs' 			=> $Langs,
	'CurrLang' 			=> $Langs[($slang == 1) ? 0 : (($slang == 2) ? 1 : 2)],
	'Dict' 				=> $Dict,
	'Menu' 				=> $Menu,
    'ThisMenu' => $ThisMenu,
));

switch ($TheAct) {
	case "index":
		$query = "SELECT id, name{$slang} as name FROM hr.structure where id != 1 and id < 100 order by turn";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Regions);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Regions'            =>    $Regions,
		));
		break;
	case "mpg":
		$query = "SELECT id, name{$slang} as name FROM hr.structure where id != 1 and id < 100 order by turn";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Regions);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Regions'            =>    $Regions,
		));
		break;

	case "statistic":
		$query = "SELECT id, name{$slang} as name FROM hr.structure where id != 1 and id < 100 order by turn";
		$sql->query($query);
		$Regions = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Regions);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Regions'            =>    $Regions,
		));
		break;

	case "chat":
		$query = "SELECT m.id, TO_CHAR(m.time, 'HH24:MI:SS DD.MM.YYYY') AS time, st.lastname as sender, 
		m.sender as sender_id, st.photo as sender_pic, m.text, LEFT(st.lastname, 1) AS shortname, m.status 
		FROM tur.messages m
		left join hr.staff st on st.id = m.staff_id 
		order by m.id asc";
		$sql->query($query);
		$Messages = $sql->fetchAll();

		$query = "SELECT id, name{$slang} as name FROM hr.structure where id < 100 ";
		if ($UserStructure > 1) {
			$query .= " and id = {$UserStructure}";
		}
		$query .= " order by turn";
		$sql->query($query);
		$Regions = $sql->fetchAll();



		$query = "SELECT id, name{$slang} as name, phone, comment as phone2, logo FROM hr.cooperate order by turn";
		$sql->query($query);
		$Cooperates = $sql->fetchAll();
		
		$query = "SELECT 
				t.lastname,
				t.photo,
				t.phone,
				p.name{$slang} as position,
				ra.shortname{$slang} as role
			FROM hr.duty_staff d 
			LEFT JOIN hr.staff t ON (t.id = d.staff1 OR t.id = d.staff2 OR t.id = d.staff3)
			LEFT JOIN hr.positions p ON p.id = t.position_id
			left join ref.ranks ra on ra.id  = t.rank_id
			WHERE d.date = CURRENT_DATE and d.structure_id = {$UserStructure}
			ORDER BY p.turn";

		$sql->query($query);
		$Duty = $sql->fetchAll();
		
		// echo '<pre>';
		// print_r($Regions);
		// echo '</pre>';
		// die();

		$smarty->assign(array(
			'Messages'            =>    $Messages,
			'Regions'            =>    $Regions,
			'Duty'            =>    $Duty,
			'Cooperates'            =>    $Cooperates,
		));
		break;
}

$smarty->display($TheAct . ".tpl");
