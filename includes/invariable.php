<?php
/****************************************************************
*                            	 invariable.php			 							*
*                          -------------------			  					*
*     begin                : 01.03.2015 y												*
*     copyright            : Sayqal Solutions 2015							*
*     email                : info@sayqal.uz											*
*	    Written by		   		 : Botirjon G Olimov									*
****************************************************************/

if ( !defined('ARM_IN') )
die("Hacking attempt");

$smarty->assign(array(
"TITLE"					=>	$smarty->assign('title', GetEmpName()),
));

?>
