<?php

include_once("includes/error_reporting.php");
define('ARM_IN', true);

require_once 'includes/constants.php';
require_once("includes/dbphpbb.php");

include_once("includes/sessions.php");

session_start();
//echo session_id();
session_end();

header("Location: login.php");
?>