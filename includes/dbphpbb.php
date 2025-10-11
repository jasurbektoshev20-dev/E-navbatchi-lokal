<?php
/****************************************************************
*                            	 dbphpbb.php  			 							*
*                          -------------------			  					*
*     begin                : 01.03.2015 y												*
*     copyright            : Sayqal Solutions 2015							*
*     email                : info@sayqal.uz											*
*	    Written by		   		 : Botirjon G Olimov									*
****************************************************************/
 
include("includes/DB.php");

$sql = new DB(HOST, SYSTEM_BASE,USERNAME, PASSWORD,PESIST,PGPORT);
$sql->open();

?>