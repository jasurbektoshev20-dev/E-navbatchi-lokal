<?php
/****************************************************************
*                           set_language.php		 			*
*                          -------------------			  		*
*     begin                : 01.03.2015 y						*
*     copyright            : Sayqal Solutions 2015				*
*     email                : info@sayqal.uz						*
*	    Written by		   		 : Botirjon G Olimov			*
****************************************************************/

if (isset($_GET['slang']))
{
  
  $sLangArr['uzc'] = 1;
  $sLangArr['rus'] = 2;
  $sLangArr['uzl'] = 3;
  $slang = $sLangArr[$_GET['slang']];
  setcookie('lang', $slang);
}
else
{
  if (isset($_COOKIE['lang']))
  {
    $slang = $_COOKIE['lang'];
  }
  else
  {
    setcookie('lang',1);
    $slang = 1;
  }
}
?>
