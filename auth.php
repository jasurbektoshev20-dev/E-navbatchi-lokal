<?php

/****************************************************************
 *                           		auth.php		 			*
 *                          -----------------					*
 *     begin                : 01.03.2015 y						*
 *     copyright            : SmartBase Co Ltd					*
 *     email                : info@smart-base.uz					*
 *	  Written by		   : Botirjon G Olimov					*
 ****************************************************************/

include_once("includes/error_reporting.php");
define('ARM_IN', true);

require_once("includes/constants.php");
require_once("includes/dbphpbb.php");
require_once("includes/set_language.php");
require_once("includes/functions.php");
require_once("includes/sessions.php");

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
if (count($_POST) > 0) {
    $SQLCommands = array('select', 'drop', 'concat', 'union', ' and', ' or', 'database', 'null', 'benchmark', 'load_file');

    foreach ($SQLCommands as $sInd => $sVal) {
        foreach ($_POST as $ind => $val) {
            if (strpos(strtolower($val), $sVal) > 0) {
                $_POST[$ind] = 0;
            }
        }
    }
}
if (isset($_POST['login']) and isset($_POST['password'])) {
    $error = Logon($_POST['login'], $_POST['password']);



    if (count($error) > 1) {
        session_start();
        setcookie('login', $_POST['login'], time() + 30 * 24 * 60 * 60, COOKIE_PATH, COOKIE_DOMAIN, COOKIE_SECURE);
        $_SESSION['programid'] = PROGRAM_ID;
        $_SESSION['userid'] = $error['id'];
        $_SESSION['role_id'] = $error['role_id'];
        $_SESSION['name'] = $error['name'];
        $_SESSION['region_id'] = $error['region_id'];
        $_SESSION['role_name'] = $error['role_name'];
        $_SESSION['structure_id']     = $error['department_id'];
        $_SESSION['staff_id']         = $error['id'];
        $_SESSION['staffphoto'] = $error['photo'];
        $user_data = session_begin($_POST['login'], md5($_POST['password']));

        $Roles = explode(",", $error['role_menu']);
        $Objects = explode(",", $error['role_object']);
        $Dashboard_menu = explode(",", $error['dashboard_menu']);
        $RoleArr = array();
        foreach ($Roles as $rid => $rval) {
            $RoleArr[$rval] = 1;
        }
        $DashboardArr = array();
        foreach ($Dashboard_menu as $rid => $rval) {
            $DashboardArr[$rval] = 1;
        }

        $sql->query("SELECT id,keyword FROM bcms.s_accessobj");
        $Obj = $sql->fetchAll();
        foreach ($Obj as $id => $val) {
            $ObKeyArr[$val['id']] = $val['keyword'];
        }
        $ObjArr = array();
        foreach ($Objects as $oid => $oval) {
            $ObjArr[$ObKeyArr[$oval]] = 1;
        }

        ksort($RoleArr);
        ksort($ObjArr);
        ksort($Dashboard_menu);

        $_SESSION['roles'] = $RoleArr;
        $_SESSION['objects'] = $ObjArr;
        $_SESSION['dashboard_menu'] = $error['dashboard_menu'];

        // echo '<pre>';
        // print_r($error);
        // echo '</pre>';
        // die();


        session_write_close();
        
        header("Location: index.php?act=index&mid=DQtttt");
    } else {
        header('Location: login.php');
    }
} else exit;
