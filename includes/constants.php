<?php

/****************************************************************
 *                            	 constants.php			 		*
 *                          -------------------			  		*
 *     begin                : 01.03.2015 y						*
 *     copyright            : Sayqal Solutions 2015				*
 *     email                : info@sayqal.uz						*
 *	    Written by		   		 : Botirjon G Olimov			*
 ****************************************************************/

if (!defined('ARM_IN')) {
	die("Hacking attempt");
}

define("HOST", '127.0.0.1');
define("SYSTEM_BASE", 'gvardiya');
define("USERNAME", 'postgres');
define("PASSWORD", '2002');
define("PESIST", 0);
define("PGPORT", 5432);


define("SERVER_NAME", $_SERVER['SERVER_NAME']);
define("PROGRAM_ID", 15);
define("PROGRAM_VERSION", 1);
define("PROGRAM_NAME", "");
define("PROGRAM_FOLDER", "");

define("SESSION_EXPIRE_TIME", 1 * 24 * 60 * 60 * 1000);
define("COOKIE_EXPIRE_TIME", 1 * 24 * 60 * 60 * 1000);
define("COOKIE_PATH", "/");
define("COOKIE_DOMAIN", $_SERVER['SERVER_NAME']);
define("COOKIE_SECURE", null);

define("UPLOAD_LIMIT", 0);

define("AUTHUSERS_TABLE", "v_users");
define('SESSIONS_TABLE', 'sessions');
define('BANLIST_TABLE', 'banlist');

define('SESSION_METHOD_COOKIE', 100);
define('SESSION_METHOD_GET', 101);
define('ANONYMOUS', 22);
define("CRITICAL_ERROR", "");
define("SIGN_DIRECTORY", "/var/www/html/pictures/signs/");

const DOC_PASSPORT = 11;
const DOC_INT_PASS = 12;
const DOC_METRIC = 13;

const ACTIVE = '1';
const INACTIVE = '0';
