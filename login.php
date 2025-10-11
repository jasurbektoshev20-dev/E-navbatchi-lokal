<?php
define('ARM_IN', true);
include("includes/error_reporting.php");
include("includes/constants.php");
include("includes/dbphpbb.php");



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

$phpSelf = explode("/",$_SERVER['PHP_SELF']);

$addPath = "/".$phpSelf[1]."/"	;
$PicAddPath = "/".$phpSelf[1]."/";

$_SESSION['AddPath'] = $addPath;
setcookie('AddPath',$addPath);

$_SESSION['PicAddPath'] = $PicAddPath;
setcookie('PicAddPath',$PicAddPath);

define("SMARTY_DIR",$_SERVER["DOCUMENT_ROOT"]."/Smarty/");

require(SMARTY_DIR."Smarty.class.php");
require_once("includes/set_language.php");
$sql->query('SELECT name1 AS name, keyword from bcms.s_dictionary');
$Dictionary = $sql->fetchAll();


foreach ($Dictionary as $id => $value)
{
	$Dict[$value['keyword']] = $value['name'];
}
$smarty = new Smarty;
$smarty->assign(array(
'MESSAGE'	=>	(isset($_GET['sysmess'])) ? base64_decode($_GET['sysmess']) : "",
'MESSAGE_TYPE'	=>	3,
'Dict'				=> $Dict
));
$smarty->display("login.tpl");
?>