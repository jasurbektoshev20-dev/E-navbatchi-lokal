<?php
if (!defined('ARM_IN'))
{
	die("Hacking attempt");
}

require_once dirname(__FILE__) . '/error_reporting.php';
require_once dirname(__FILE__) . '/constants.php';
require_once dirname(__FILE__) . '/dbphpbb.php';

require_once("sessions.php");
require_once("check.php");
require_once("set_cookie_params.php");


if ($user_data == 0)
{
	print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='login.php'; </script>";
	exit;
}

if (!isset($_COOKIE['AddPath']) and $_COOKIE['AddPath'] == "")
{
	$phpSelf = explode("/",$_SERVER['PHP_SELF']);

	$addPath = "/".$phpSelf[1]."/";
	$PicAddPath = "/".$phpSelf[1]."/";

	$_SESSION['AddPath'] = $addPath;
	setcookie('AddPath',$addPath);

	$_SESSION['PicAddPath'] = $PicAddPath;
	setcookie('PicAddPath',$PicAddPath);
}
else
{
	$addPath = $_COOKIE['AddPath'];
	$PicAddPath = $_COOKIE['PicAddPath'];
}

define("SMARTY_DIR",$_SERVER["DOCUMENT_ROOT"]."/Smarty/");
require(SMARTY_DIR."Smarty.class.php");
$smarty = new Smarty;

require_once("set_language.php");
// require_once("set_theme.php");
//require_once("set_design.php");
//require_once("language/lang_".$slang.".php");
require_once("functions.php");

/* if (isset($_GET['mid']))
{
	$MenuId = MyPiDeCrypt($_GET['mid']);
	if (!isset($_SESSION['roles'][$MenuId]))
	{
		print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='main.php'; </script>";
		exit;
	}
} */

if (count($_GET) > 0) {
	$SQLCommands = array('select', 'drop', 'concat', 'union', ' and', ' or', 'database', 'null', 'benchmark', 'load_file');

	foreach ($SQLCommands as $sInd => $sVal) {
		foreach ($_GET as $ind => $val) {
			if (strpos(strtolower($val), $sVal) > 0) {
				$_GET[$ind] = 0;
			}
		}
	}
}

/* $query = "SELECT r.role_menu as menu FROM v_users a INNER JOIN bcms.roles r ON a.menu = r.id
WHERE a.id = ".$_SESSION['userid'];
$sql->query($query);
$usermenu = $sql->fetchAssoc(); */

/* $query = "SELECT r.role_menu as menu FROM bcms.admins a INNER JOIN bcms.roles r ON a.menu = r.id
WHERE a.id = ".$_SESSION['userid'];
$sql->query($query);
$usermenu = $sql->fetchAssoc();
 */
$UserStructure = $_SESSION['structure_id'];
$UserId = $_SESSION['userid'];

$query = "SELECT r.dashboard_menu as menu FROM v_users a INNER JOIN bcms.roles r ON a.menu = r.id
WHERE a.id = {$UserId}";
$sql->query($query);
$usermenu = $sql->fetchAssoc();

$query = "SELECT t.*, t.name".$slang." as name, menu_icon
FROM bcms.dashboard_menu t 
where t.id IN (".$usermenu['menu'].")
and t.status_id = 1";
if ($UserStructure > 1) {
	$query .= " and t.id != 9";	
}
$query .= " ORDER BY t.parent, t.turn, t.name".$slang;

$sql->query($query);
$menu = $sql->fetchAll();

// echo '<pre>';
// print_r($menu);
// echo '</pre>';
// die();


function has_children($rows,$id) {
  foreach ($rows as $row) {
    if ($row['parent'] == $id)
      return true;
  }
  return false;
}

function build_menu($rows,$parent=0,$Title)
{
	global $CurrLang;

	$result = ($parent == 0) ? "" : "<ul class='nav nav-group-sub' data-submenu-title='{$Title}'>";
	//$result = "<ul>";
	//print_r($rows);
	foreach ($rows as $key =>  $row)
	{
		if ($row['parent'] == $parent){

			$qa = strpos($row['url'], "?") ? "&" : "?";
			$Script = ($row['url'] == "") ? "#" : $row['url'].$qa."mid=".MyPiCrypt($row['id']);
			$Icon = ($row['menu_icon'] == "") ? "" : "<i class='{$row['menu_icon']}'></i>";

			if (has_children($rows,$row['id']))
			{
				$Class = (isset($_GET['mid']) && MyPiCrypt($row['id']) == $_GET['mid']) ? " class='active nav-item  nav-item-submenu'" : " class='nav-item  nav-item-submenu'";
			}
			else {
				$Class = (isset($_GET['mid']) && MyPiCrypt($row['id']) == $_GET['mid']) ? " class=' nav-item-expanded nav-item-open'" : " class='nav-item'";
			}
			$result.= "<li{$Class}><a href='{$Script}' class='nav-link'>{$Icon}<span>".$row['name']."</span>";
			$result.="</a>";
			if (has_children($rows,$row['id']))
			  $result.= build_menu($rows,$row['id'],$row['name']);
			$result.= "</li>";
		}
	}
	$result .= ($parent==0) ? "" : "</ul>";
	//$result .= "</ul>";
	return $result;
}
$NewMenu =  build_menu($menu,0,"");

$sql->query('select id, name'.$slang.' as name, keyword, flag from bcms.languages');
$Languages = $sql->fetchAll();

$sql->query('SELECT name'.$slang.' as name, keyword from bcms.s_dictionary');
$Dictionary = $sql->fetchAll();

foreach ($Dictionary as $id => $value)
{
	$Dict[$value['keyword']] = $value['name'];
}
//print_r($_SESSION['objects']);
$Access = $_SESSION['objects'];

$pos = strpos($_SERVER['REQUEST_URI'], "?");
if ($_SERVER['REQUEST_URI'] == "/") {
	$_SERVER['REQUEST_URI'] = "/index.php?nocap";
} else if ($pos === false) {
	$_SERVER['REQUEST_URI'] .= "?nocap";
}

$RoleId = $_SESSION['role_id'];

$smarty->assign(array(
'Languages'		=>	$Languages, 
'DepTCounts'	=>	isset($DepTCounts) ? $DepTCounts : array(), 
'NewMenu'		=>	$NewMenu,
'Dict'			=>	$Dict,
'slang'			=>	$slang,
// 'stheme'		=>	$stheme,
// 'dmode'			=>	$dmode,
'Access'		=> 	$Access,
'RequestURI'	=> 	$_SERVER['REQUEST_URI'],
'AddURL'		=> 	($_SESSION['structure_id'] > 999) ? "_distcity" : (($_SESSION['structure_id'] > 1) ? "_region" : ""),
'UserStructure'		=> 	$UserStructure,
'RoleId'		=> 	$RoleId,
'Role_Name'		=> 	$_SESSION['role_name'],

));
?>