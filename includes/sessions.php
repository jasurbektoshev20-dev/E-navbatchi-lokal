<?php
/****************************************************************
*                            	 bcms.sessions.php			 								*
*                          -------------------			  					*
*     begin                : 01.03.2015 y												*
*     copyright            : Sayqal Solutions 2015							*
*     email                : info@sayqal.uz											*
*	    Written by		   		 : Botirjon G Olimov									*
****************************************************************/
if ( !defined('ARM_IN') )
	die("Hacking attempt");

function session_begin($user_login, $user_password, $auth_type=1, $UserId=0)
{
	$ip = getenv('REMOTE_ADDR');

	$_SESSION['login'] = $user_login;
	$_SESSION['password'] = $user_password;
	$_SESSION['ip'] = $ip;
	$_SESSION['start_time'] = time();
	$_SESSION['time'] = time()+300;
	$_SESSION['count'] = 1;

	$user_data['login'] 	= $_SESSION['login'];
	$user_data['password'] 	= $_SESSION['password'];
	$user_data['ip'] 		= $_SESSION['ip'];
	$user_data['count'] 	= $_SESSION['count'];

	$session_id = session_id();
	if ($UserId == 0) {
		$UserId = $_SESSION['userid'];
	}
	ClearSessions();
	CheckSession($session_id, $UserId);
	UpdateUserInfo($session_id, $user_data['ip'], $auth_type, $UserId);
	return $user_data;
}

function UpdateUserInfo($session_id, $session_ip,$auth_type,$UserId) {
	global $sql;
	
	$query = "select * from bcms.user_auth_info where user_id = {$UserId} and auth_type = {$auth_type}";
	$sql->query($query);
	$result  = $sql->fetchAssoc();

	if (!isset($result['user_id'])) {
		$query = "insert into bcms.user_auth_info 
		(user_id, user_lastvisit, logincount, session_id, user_last_ip, auth_type) values 
		({$UserId}, now(), 1, '{$session_id}','{$session_ip}', {$auth_type})";
		$sql->query($query);
	}
	else {
		$LoginCount = $result['logincount']+1;
		$query = "update bcms.user_auth_info set user_lastvisit = now(), logincount = {$LoginCount}, session_id = '{$session_id}', user_last_ip = '{$session_ip}', auth_type = {$auth_type} where user_id ={$UserId}";
		$sql->query($query);
	}
}
function CheckSession($session_id, $UserId) {
	global $sql, $_SESSION;
	$query = "select count(*) scount from bcms.sessions where session_id = '{$session_id}'";
	$sql->query($query);
	$result  = $sql->fetchAssoc();

	if ($result['scount'] == 0) {
		$ip = encode_ip($_SESSION['ip']);
		$query = "INSERT INTO bcms.sessions 
		(session_id, session_user_id, session_start, session_time, session_ip, session_page, session_logged_in) VALUES 
		('{$session_id}', {$UserId}, {$_SESSION['start_time']}, {$_SESSION['time']}, '{$ip}', 0, 1)";
		$sql->query($query);
	}
	//die();
}

function DelSession($session_id) {
	global $sql;
	$query = "DELETE FROM bcms.sessions WHERE session_id = '{$session_id}'";
	$sql->query($query);
}

function UpdateSession($session_id,$current_time) {
	global $sql;
	$query = "UPDATE bcms.sessions SET session_time = {$current_time} WHERE session_id = '{$session_id}'";
	$sql->query($query);
}

function ClearSessions() {
	global $sql;
	$current_time = time();
	$expiry_time = $current_time - SESSION_EXPIRE_TIME;
	$query = "DELETE FROM bcms.sessions WHERE session_time < {$expiry_time}";
	$sql->query($query);
} 

function session_pagestart()
{
	$session_id = session_id();
	$ip = getenv('REMOTE_ADDR');

	if (!empty($session_id))
	{
		$current_time = time();
		$expiry_time = $current_time - SESSION_EXPIRE_TIME;
		$_SESSION['count']++;

		if ($_SESSION['time'] < $expiry_time)	{
			session_end();
			return 0;
		}
		//echo $session_id.", ".$current_time;
		UpdateSession($session_id, $current_time);
		$_SESSION['time'] = $current_time;
	}
	else {
		session_end();
		return 0;
	}

	$user_data['login'] = $_SESSION['login'];
	$user_data['password'] = $_SESSION['password'];
	$user_data['ip'] = $_SESSION['ip'];
	$user_data['count'] = $_SESSION['count'];
	$user_data['start_time'] = $_SESSION['start_time'];
	$user_data['time'] = $_SESSION['time'];
	
	return $user_data;
}

function session_end()
{
	$session_id = session_id();
	DelSession($session_id);		
	session_destroy();
}
?>