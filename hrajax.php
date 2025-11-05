<?php
define('ARM_IN', true);
require_once("includes/error_reporting.php");
require_once("includes/constants.php");
require_once("includes/dbphpbb.php");
require_once("includes/functions.php");
require_once("includes/sessions.php");
require_once("includes/check.php");
require_once("includes/set_language.php");

if ($user_data == 0) {
    print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='login.php'; </script>";
    exit;
}

foreach ($_POST as $ind => $val) {
    $_POST[$ind] = MyEscapeSymbols($val);
}

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

$Access = $_SESSION['objects'];
$SessUserId = $_SESSION['userid'];
$Action = $_GET['act'];

$sql->query('SELECT name' . $slang . ' AS name, keyword from bcms.s_dictionary');
$Dictionary = $sql->fetchAll();
foreach ($Dictionary as $id => $value) {
    $Dict[$value['keyword']] = $value['name'];
}

switch ($Action) {
    // edu_menus ---<<>>---==============================================
    case "get_menus":
        $RowId = MyPiDeCrypt($_GET['rowid']);
        $query = "SELECT t.*, t.has_children as children FROM bcms.dashboard_menu t
		WHERE t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_menus":
        $JsonArr = array();
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $parent = $_POST['parent'];
        $name1 = $_POST['name1'];
        $name2 = $_POST['name2'];
        $name3 = $_POST['name3'];
        $page_url = $_POST['page_url'];
        $turn = $_POST['turn'];
        $menu_icon = $_POST['menu_icon'];
        $status = (!empty($_POST['status'])) ? $_POST['status'] : 1;
        $has_children = (!empty($_POST['has_children'])) ? $_POST['has_children'] : 0;

        if ($RowId != "0") {

            $updquery = "UPDATE bcms.dashboard_menu set 
             parent = '{$parent}'
            ,name1 = '{$name1}'
            ,name2 = '{$name2}'
            ,name3 = '{$name3}'
            ,url = '{$page_url}'
            ,turn = '{$turn}'
            ,menu_icon = '{$menu_icon}'
            ,status_id = '{$status}'
            ,has_children = '{$has_children}'
			WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = 0;
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM bcms.dashboard_menu t WHERE id	= '{$RowId}'");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {

                $insquery = "INSERT into bcms.dashboard_menu (
								 parent
								,name1
								,name2
								,name3
								,url
								,turn
								,menu_icon
								,status_id
								,has_children
						) values (
								' {$parent}'
								,'{$name1}'
								,'{$name2}'
								,'{$name3}'
								,'{$page_url}'
								,'{$turn}'
								,'{$menu_icon}'
								,'{$status}'
								,'{$has_children}'
						)";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('bcms.dashboard_menu_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $selquery  = "SELECT * from bcms.dashboard_menu t where t.id = {$LastId}";
                    $sql->query($selquery);
                    $SelResult = $sql->fetchAssoc();

                    $SelResult['idcrypt'] = MyPiCrypt($LastId);
                    $res = "0<&sep&>" . json_encode($SelResult);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_menus":
        $RowId = MyPiDeCrypt($_GET['rowid']);
        $query = "DELETE FROM bcms.dashboard_menu WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    // edu_menus ---<<>>---==============================================

    /// roles ---========================================================
    case "get_roles":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.id, t.role_name as name, t.dashboard_menu as menu from bcms.roles t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_roles":
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $role_name    = $_POST['name'];
        $dashboard_menu    = $_POST['menus'];
        if ($RowId != "0") {
            $updquery = "UPDATE bcms.roles set role_name = '{$role_name}', dashboard_menu = '{$dashboard_menu}' WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM bcms.roles t WHERE 0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into bcms.roles (
                            role_name
                            ,dashboard_menu
                        ) values (
                            '{$role_name}'
                            ,'{$dashboard_menu}'
                        )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('bcms.roles_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_roles":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM bcms.roles WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// roles ---========================================================

    /// roles ---========================================================
    case "get_staffs":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* FROM hr.staff t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_staffs":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;

        if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
            $file = $_FILES['photo'];
            // Set the upload directory
            $uploadDir = 'pictures/staffs/';

            // Generate a unique filename
            $newFileName = uniqid('staff_', true) . '.' . pathinfo($file['name'], PATHINFO_EXTENSION);
            $uploadFile = $uploadDir . $newFileName;

            // Upload the file
            if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
                $photo = $newFileName;
            } else {
                echo "Possible file upload attack!\n";
            }
        }

        $photo = isset($photo) ? $photo : $_POST['photo'];

        $region    = $_POST['region'];
        $role    = $_POST['role'];
        $position_id    = $_POST['position_id'];
        $rank_id    = $_POST['rank_id'];
        $lastname    = $_POST['lastname'];
        $firstname    = $_POST['firstname'];
        $surname    = $_POST['surname'];
        $phone    = $_POST['phone'];
        $username    = $_POST['username'];
        $password    = md5($_POST['password']);

        if ($RowId != "0") {
            $updquery = "UPDATE hr.staff set 
                structure_id = '{$region}',
                role_id = '{$role}',
                position_id = '{$position_id}',
                rank_id = '{$rank_id}',
                lastname = '{$lastname}',
                firstname = '{$firstname}',
                surname = '{$surname}',
                phone = '{$phone}',
                username = '{$username}',
                password = '{$password}',
                photo = '{$photo}'
            WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM hr.staff t WHERE username='{$username}'");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into hr.staff (
                            structure_id,
                            role_id,
                            position_id,
                            rank_id,
                            lastname,
                            firstname,
                            surname,
                            phone,
                            username,
                            password,
                            photo
                        ) values (
                            '{$region}',
                            '{$role}',
                            '{$position_id}',
                            '{$rank_id}',
                            '{$lastname}',
                            '{$firstname}',
                            '{$surname}',
                            '{$phone}',
                            '{$username}',
                            '{$password}',
                            '{$photo}'
                        )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('hr.staff_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = "Ушбу username аввал олинган бошқа ном билан уриниб кўринг!";
            }
        }
        break;

    case "del_staffs":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.staff WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// roles ---========================================================

    /// events ==========================================================
    case "get_events":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from tur.events t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_events":
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $region_id     = $_POST['region_id'];
        $distcity_id     = $_POST['distcity_id'];
        $type     = $_POST['type'];
        $date     = $_POST['date'];
        $staff_count     = $_POST['staff_count'];
        $stand     = $_POST['stand'];
        $transport     = $_POST['transport'];
        $responsible     = $_POST['responsible'];
        $text     = $_POST['text'];
        $event_participants     = $_POST['event_participants'];
        $auto_number     = $_POST['auto_number'];
        $guard_staffs     = $_POST['guard_staffs'];

        if ($RowId != "0") {
            $updquery = "UPDATE tur.events set
            region_id = '{$region_id}',
            distcity_id = '{$distcity_id}',
            type = '{$type}',
            date = '{$date}',
            staff_count = '{$staff_count}',
            stand = '{$stand}',
            transport = '{$transport}',
            responsible = '{$responsible}',
            event_participants = '{$event_participants}',
            auto_number = '{$auto_number}',
            guard_staffs = '{$guard_staffs}',
            text = '{$text}'
            WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM tur.events t WHERE 0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into tur.events (
                         region_id
                        ,distcity_id
                        ,type
                        ,date
                        ,staff_count
                        ,stand
                        ,transport
                        ,responsible
                        ,event_participants
                        ,auto_number
                        ,guard_staffs
                        ,text
                    ) values (
                         '{$region_id}'
                        ,'{$distcity_id}'
                        ,'{$type}'
                        ,'{$date}'
                        ,'{$staff_count}'
                        ,'{$stand}'
                        ,'{$transport}'
                        ,'{$responsible}'
                        ,'{$event_participants}'
                        ,'{$auto_number}'
                        ,'{$guard_staffs}'
                        ,'{$text}'
                    )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('tur.events_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_events":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM tur.events WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// events ==========================================================

    /// reyd_events =====================================================
    case "get_reyd_events":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from tur.reyd_events t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_reyd_events":
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $region_id     = $_POST['region_id'];
        $distcity_id     = $_POST['distcity_id'];
        $date     = $_POST['date'];
        $staff_count     = $_POST['staff_count'];
        $stand     = $_POST['stand'];
        $responsible     = $_POST['responsible'];
        $text     = $_POST['text'];
        $auto_number     = $_POST['auto_number'];
        $guard_staffs     = $_POST['guard_staffs'];

        if ($RowId != "0") {
            $updquery = "UPDATE tur.reyd_events set
            region_id = '{$region_id}',
            date = '{$date}',
            staff_count = '{$staff_count}',
            stand = '{$stand}',
            responsible = '{$responsible}',
            auto_number = '{$auto_number}',
            guard_staffs = '{$guard_staffs}',
            text = '{$text}'
            WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM tur.reyd_events t WHERE 0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into tur.reyd_events (
                         region_id
                        ,date
                        ,staff_count
                        ,stand
                        ,responsible
                        ,auto_number
                        ,guard_staffs
                        ,text
                    ) values (
                         '{$region_id}'
                        ,'{$distcity_id}'
                        ,'{$date}'
                        ,'{$staff_count}'
                        ,'{$stand}'
                        ,'{$responsible}'
                        ,'{$auto_number}'
                        ,'{$guard_staffs}'
                        ,'{$text}'
                    )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('tur.reyd_events_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_reyd_events":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM tur.reyd_events WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// reyd_events =====================================================

    /// violations ======================================================
    case "get_violations":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from tur.violations t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_violations":
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $region_id     = $_POST['region_id'];
        $violation_type     = $_POST['violation_type'];
        $type     = $_POST['type'];
        $date     = $_POST['date'];
        $incident_place     = $_POST['incident_place'];
        $citizen     = $_POST['citizen'];
        $birthdate     = $_POST['birthdate'];
        $live_adress     = $_POST['live_adress'];
        $work_place     = $_POST['work_place'];
        $text     = $_POST['text'];
        $lat     = $_POST['lat'];
        $lon     = $_POST['lon'];

        if ($RowId != "0") {
            $updquery = "UPDATE tur.violations set
            region_id = '{$region_id}',
            violation_type = '{$violation_type}',
            type = '{$type}',
            date = '{$date}',
            incident_place = '{$incident_place}',
            citizen = '{$citizen}',
            birthdate = '{$birthdate}',
            live_adress = '{$live_adress}',
            work_place = '{$work_place}',
            lat = '{$lat}',
            lon = '{$lon}',
            text = '{$text}'
            WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM tur.violations t WHERE 0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into tur.violations (
                         region_id
                        ,violation_type
                        ,type
                        ,date
                        ,incident_place
                        ,citizen
                        ,birthdate
                        ,live_adress
                        ,work_place
                        ,text
                        ,lat
                        ,lon
                    ) values (
                         '{$region_id}'
                        ,'{$violation_type}'
                        ,'{$type}'
                        ,'{$date}'
                        ,'{$incident_place}'
                        ,'{$citizen}'
                        ,'{$birthdate}'
                        ,'{$live_adress}'
                        ,'{$work_place}'
                        ,'{$text}'
                        ,'{$lat}'
                        ,'{$lon}'
                    )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('tur.violations_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_violations":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM tur.violations WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// violations ======================================================

    /// duty_staff ======================================================
    case "get_duty_staff":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.duty_staff t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_duty_staff":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure_id = $_POST['structure_id'];
        $date = $_POST['date'];
        $staff1 = $_POST['staff1'];
        $staff2 = $_POST['staff2'];
        $staff3 = $_POST['staff3'];

        // Check if today's data already exists
        $sql->query("SELECT COUNT(*) AS ccount FROM hr.duty_staff WHERE date = '{$date}' and structure_id = '{$structure_id}'");
        $row = $sql->fetchAssoc();

        if ($row['ccount'] > 0) {
            $res = 500;
        } else {
            if ($RowId != "0") {
                // Update existing record
                $updquery = "UPDATE hr.duty_staff SET
                    date = '{$date}',
                    structure_id = '{$structure_id}',
                    staff1 = '{$staff1}',
                    staff2 = '{$staff2}',
                    staff3 = '{$staff3}'
                    WHERE id = {$RowId}";
                $sql->query($updquery);
                if ($sql->error() == "") {
                    $res = "0<&sep&>" . MyPiCrypt($RowId);
                } else {
                    $res = $sql->error();
                }
            } else {
                // Insert new record
                $insquery = "INSERT INTO hr.duty_staff (
                        date,
                        structure_id,
                        staff1,
                        staff2,
                        staff3
                    ) VALUES (
                        '{$date}',
                        '{$structure_id}',
                        '{$staff1}',
                        '{$staff2}',
                        '{$staff3}'
                    )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('hr.duty_staff_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];
                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            }
        }
        break;

    case "del_duty_staff":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.duty_staff WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// duty_staff ======================================================

    /// cooperate =======================================================
    case "get_cooperate":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.cooperate t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_cooperate":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        if (isset($_FILES['logo']) && $_FILES['logo']['error'] === UPLOAD_ERR_OK) {
            $file = $_FILES['logo'];
            // Set the upload directory
            $uploadDir = 'pictures/cooperates/';

            // Generate a unique filename
            $newFileName = uniqid('logo_', true) . '.' . pathinfo($file['name'], PATHINFO_EXTENSION);
            $uploadFile = $uploadDir . $newFileName;

            // Upload the file
            if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
                $logo = $newFileName;
            } else {
                echo "Possible file upload attack!\n";
            }
        }
        $logo = isset($logo) ? $logo : $_POST['logo'];

        $name1 = $_POST['name1'];
        $name2 = $_POST['name2'];
        $name3 = $_POST['name3'];
        $phone = $_POST['phone'];
        $comment = $_POST['comment'];

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.cooperate SET
                name1 = '{$name1}',
                name2 = '{$name2}',
                name3 = '{$name3}',
                phone = '{$phone}',
                logo = '{$logo}',
                comment = '{$comment}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.cooperate (
                    name1,
                    name2,
                    name3,
                    phone,
                    logo,
                    comment
                ) VALUES (
                    '{$name1}',
                    '{$name2}',
                    '{$name3}',
                    '{$phone}',
                    '{$logo}',
                    '{$comment}'
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.cooperate_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_cooperate":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.cooperate WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// cooperate =======================================================

    /// coop_staff ======================================================
    case "get_coop_staff":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.coop_staff t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_coop_staff":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure = $_POST['structure'];
        $name = $_POST['name'];
        $phone = $_POST['phone'];

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.coop_staff SET
                structure = '{$structure}',
                name = '{$name}',
                phone = '{$phone}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.coop_staff (
                    structure,
                    name,
                    phone
                ) VALUES (
                    '{$structure}',
                    '{$name}',
                    '{$phone}'
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.coop_staff_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_coop_staff":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.coop_staff WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// coop_staff ======================================================

    /// cooperate_duty ==================================================
    case "get_cooperate_duty":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.cooperate_duty t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_cooperate_duty":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure = $_POST['structure'];
        $date = $_POST['date'];
        $staffs = $_POST['staffs'];

        // Check if today's data already exists
        $sql->query("SELECT COUNT(*) AS ccount FROM hr.cooperate_duty WHERE date = '{$date}' and structure = '{$structure}'");
        $row = $sql->fetchAssoc();

        if ($row['ccount'] > 0) {
            $res = 500;
        } else {
            if ($RowId != "0") {
                // Update existing record
                $updquery = "UPDATE hr.cooperate_duty SET
                    structure = '{$structure}',
                    date = '{$date}',
                    staffs = '{$staffs}'
                    WHERE id = {$RowId}";
                $sql->query($updquery);
                if ($sql->error() == "") {
                    $res = "0<&sep&>" . MyPiCrypt($RowId);
                } else {
                    $res = $sql->error();
                }
            } else {
                // Insert new record
                $insquery = "INSERT INTO hr.cooperate_duty (
                        structure,
                        date,
                        staffs
                    ) VALUES (
                        '{$structure}',
                        '{$date}',
                        '{$staffs}'
                    )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('hr.cooperate_duty_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];
                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            }
        }
        break;

    case "del_cooperate_duty":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.cooperate_duty WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// cooperate_duty ==================================================


    /// jts_objects =====================================================
    case "get_jts_objects":
        $RowId = $_GET['rowid'];

        $query = "SELECT t.*, ST_AsGeoJSON(ST_FlipCoordinates(t.geom)) AS geom from hr.jts_objects t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_jts_objects":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure_id = $_POST['structure_id'];
        $object_type = $_POST['object_type'];
        $object_name = $_POST['object_name'];
        $address = $_POST['address'];
        $area = $_POST['area'];
        $admin_phone = $_POST['admin_phone'];
        $object_head = $_POST['object_head'];
        $head_phone = $_POST['head_phone'];
        $police_name = $_POST['police_name'];
        $police_phone = $_POST['police_phone'];
        $lat = $_POST['lat'];
        $lon = $_POST['long'];
        $cooperate_id = $_POST['cooperate_id'];


        $upload_dir = __DIR__ . "/../pictures/jts_objects/";
        if (!is_dir($upload_dir)) mkdir($upload_dir, 0777, true);

        $photo_name = null;
        if (!empty($_FILES['photo']['name'])) {
            $ext = pathinfo($_FILES['photo']['name'], PATHINFO_EXTENSION);
            $photo_name = time() . "_" . rand(1000, 9999) . "." . $ext;
            $photo_path = $upload_dir . $photo_name;

            if (move_uploaded_file($_FILES['photo']['tmp_name'], $photo_path)) {
                // optional: rasmni siqish yoki resize qilish (agar kerak bo‘lsa)
            } else {
                $res = "Fayl yuklashda xatolik";
                break;
            }
        }

        $geom_raw = isset($_POST['geom']) ? trim($_POST['geom']) : null;
        if (!$geom_raw) {
            die(json_encode(['error' => 'geom not provided']));
        }

        // decode JSON
        $coords = json_decode($geom_raw, true);
        if (!is_array($coords) || count($coords) === 0) {
            die(json_encode(['error' => 'Invalid geom JSON']));
        }

        // Detect order and build WKT pairs (lng lat)
        $pairs = [];
        // Peeking first pair to decide likely order
        $first = $coords[0];

        // Heuristika:
        // - Agar birinchi koordinata > 90 yoki < -90 — yuqori ehtimol bilan u LONGitude (lng) bo'lib, tartib = [lng, lat]
        // - Aks holda (ko‘pincha) frontendlar [lat, lng] yuboradi — shunda biz swap qilamiz.
        $likely_order_lng_first = (abs($first[0]) > 90 || abs($first[0]) > abs($first[1]) && abs($first[0]) <= 180);

        // Agar aniq bo‘lmasa, bu heuristika hammasini qoplay olmaydi; lekin ko‘pchilik holatlarda to‘g‘ri ishlaydi.

        foreach ($coords as $c) {
            if (!is_array($c) || count($c) < 2) {
                continue; // noqulay juftlikni o‘tkazib yubor
            }
            $a = (float)$c[0];
            $b = (float)$c[1];

            if ($likely_order_lng_first) {
                // [lng, lat]
                $lng = $a;
                $lat = $b;
            } else {
                // assume [lat, lng] -> swap
                $lng = $b;
                $lat = $a;
            }

            // basic validation (lat in -90..90, lng in -180..180)
            if ($lat < -90 || $lat > 90 || $lng < -180 || $lng > 180) {
                // agar noaniq koordinata bo'lsa, o'tkazib yubor yoki xato qaytar
                continue;
            }

            $pairs[] = $lng . ' ' . $lat;
        }

        // Poligon uchun kamida 4 nuqta (closing bilan) kerak: A,B,C,A -> coords length >= 3
        if (count($pairs) < 3) {
            die(json_encode(['error' => 'Not enough points for polygon']));
        }

        // Yopish: birinchi juftlikni oxiriga qo‘shamiz, agar kerak bo‘lsa
        if ($pairs[0] !== $pairs[count($pairs) - 1]) {
            $pairs[] = $pairs[0];
        }

        $wkt = 'POLYGON((' . implode(',', $pairs) . '))';

        if ($RowId != "0") {

            $photo_sql = $photo_name ? ", photo = '{$photo_name}'" : "";
            // Update existing record
            $updquery = "UPDATE hr.jts_objects SET
                structure_id = '{$structure_id}',
                object_type = '{$object_type}',
                object_name = '{$object_name}',
                address = '{$address}',
                area = '{$area}',
                admin_phone = '{$admin_phone}',
                object_head = '{$object_head}',
                head_phone = '{$head_phone}',
                police_name = '{$police_name}',
                police_phone = '{$police_phone}',
                lat = '{$lat}',
                long = '{$lon}',
                cooperate_id = '{$cooperate_id}',
                geom = ST_GeomFromText('{$wkt}', 4326)
                {$photo_sql}
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.jts_objects (
                    structure_id,
                    object_type,
                    object_name,
                    address,
                    area,
                    admin_phone,
                    object_head,
                    head_phone,
                    police_name,
                    police_phone,
                    photo,
                    lat,
                    long,
                    cooperate_id,
                    geom
                ) VALUES (
                    '{$structure_id}',
                    '{$object_type}',
                    '{$object_name}',
                    '{$address}',
                    '{$area}',
                    '{$admin_phone}',
                    '{$object_head}',
                    '{$head_phone}',
                    '{$police_name}',
                    '{$police_phone}',
                    '{$photo_name}',
                    '{$lat}',
                    '{$lon}',
                    '{$cooperate_id}',
                    ST_GeomFromText('{$wkt}', 4326)
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.jts_objects_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_jts_objects":
        $RowId = $_GET['rowid'];

        $query = "DELETE FROM hr.jts_objects WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// jts_objects =====================================================

    /// jts_objects_camera ==============================================
    case "get_jts_objects_camera":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.jts_objects_camera t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_jts_objects_camera":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $object_id = $_POST['object_id'];
        $name = $_POST['name'];
        $cam_code = $_POST['cam_code'];
        $is_ptz = $_POST['is_ptz'];

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.jts_objects_camera SET
                object_id = '{$object_id}',
                name = '{$name}',
                cam_code = '{$cam_code}',
                is_ptz = '{$is_ptz}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.jts_objects_camera (
                    object_id,
                    name,
                    cam_code,
                    is_ptz
                ) VALUES (
                    '{$object_id}',
                    '{$name}',
                    '{$cam_code}',
                    '{$is_ptz}'
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.jts_objects_camera_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_jts_objects_camera":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.jts_objects_camera WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// jts_objects_camera ==============================================

    /// jts_objects_sos ==============================================
    case "get_jts_objects_sos":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.jts_objects_sos t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_jts_objects_sos":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $object_id = $_POST['object_id'];
        $name = $_POST['name'];
        $lat = $_POST['lat'];
        $long = $_POST['long'];


        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.jts_objects_sos SET
                object_id = '{$object_id}',
                name = '{$name}',
                lat = '{$lat}',
                long = '{$long}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.jts_objects_sos (
                    object_id,
                    name,
                    lat,
                    long
                ) VALUES (
                    '{$object_id}',
                    '{$name}',
                    '{$lat}',
                    '{$long}'
                )";
            $sql->query($insquery);

            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.jts_objects_sos_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_jts_objects_sos":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.jts_objects_sos WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// jts_objects_sos ==============================================

    /// jts_objects_sos ==============================================
    case "get_daily_routine":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.daily_routine t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_daily_routine":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $object_id = $_POST['object_id'];
        $structure_id = isset($_POST['structure_id']) ? $_POST['structure_id'] : $UserStructure;
        $date = isset($_POST['date']) ? strtotime($_POST['date']) : null;
        $responsible_id = $_POST['responsible_id'];
        $division_id = $_POST['division_id'];


        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.daily_routine SET
                object_id = '{$object_id}',
                structure_id = '{$structure_id}',
                date = to_timestamp('{$date}'),
                responsible_id = '{$responsible_id}',
                division_id = '{$division_id}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.daily_routine (
                    object_id,
                    structure_id,
                    date,
                    responsible_id,
                    division_id
                ) VALUES (
                    '{$object_id}',
                    '{$structure_id}',
                    to_timestamp('{$date}'),
                    '{$responsible_id}',
                    '{$division_id}'
                )";
            $sql->query($insquery);

            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.daily_routine_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_daily_routine":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.daily_routine WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// jts_objects_sos ============

    case "get_dailiy_routine_date":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.dailiy_routine_date t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_dailiy_routine_date":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $routine_id = $_POST['routine_id'];
        $patrul_type = $_POST['patrul_type'];
        $direction = $_POST['direction'];
        $smena = $_POST['smena'];
        $division_id = $_POST['division_id'];
        $car_id = $_POST['car_id'];
        $epikirofka_id = $_POST['epikirofka_id'];

        // staff_ids massiv ekanligini ta'minlash
        $staff_id = is_array($_POST['staff_id']) ? $_POST['staff_id'] : explode(',', $_POST['staff_id']);

        // PostgreSQL Array formatiga o'tkazish
        // Array format: '{12, 34, 56}'
        if (is_array($_POST['epikirofka_id'])) {
            // Arraydagi integer qiymatlarni vergul bilan ajratib, qavs ichiga joylashtirish
            $epikirofka_array_string = '{' . implode(',', $_POST['epikirofka_id']) . '}';
        } else {
            // Agar bitta qiymat bo'lsa yoki bo'lmasa
            $epikirofka_array_string = 'NULL';
        }

        $LastId = null; // So'nggi qo'shilgan ID ni saqlash uchun
        $success = true;

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.dailiy_routine_date SET
                routine_id = '{$routine_id}',
                patrul_type = '{$patrul_type}',
                direction = '{$direction}',
                smena = '{$smena}',
                division_id = '{$division_id}',
                staff_id = '{$staff_id}',
                car_id = '{$car_id}',
                epikirofka_id = '{$epikirofka_id}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
                $success = false;
            }
        } else {
            foreach ($staff_ids as $staff_id) {
                // Har bir aylanmada alohida staff_id o'zgaradi
                $current_staff_id = (int) $staff_id;

                $insquery = "INSERT INTO hr.dailiy_routine_date (
                    routine_id,
                    patrul_type,
                    direction,
                    smena,
                    division_id,
                    staff_id,
                    car_id,
                    epikirofka_id
                ) VALUES (
                    '{$routine_id}',
                    '{$patrul_type}',
                    '{$direction}',
                    '{$smena}',
                    '{$division_id}',
                    '{$current_staff_id}', -- Siklning joriy IDsi ishlatiladi
                    '{$car_id}',
                    '{$epikirofka_array_string}' -- PostgreSQL array stringi ishlatiladi
                )";

                $sql->query($insquery);

                // Har bir INSERT dan keyin xatoni tekshirish
                if ($sql->error() != "") {
                    $res = $sql->error();
                    $success = false;
                    // Xato yuz bersa siklni to'xtatish
                    break;
                }
            }
            if ($success) {
                // Oxirgi qo'shilgan IDni olish. Agar bitta sikl bo'lsa to'g'ri ishlaydi,
                // ko'p sikl bo'lsa, oxirgi kiritilgan IDni qaytaradi.
                $sql->query("SELECT CURRVAL('hr.dailiy_routine_date_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            }
        }
        break;

    case "del_dailiy_routine_date":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.dailiy_routine_date WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// jts_objects_sos ============

    /// jts_objects_door ==============================================
    case "get_jts_objects_door":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.jts_objects_door t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_jts_objects_door":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $object_id = $_POST['object_id'];
        $name = $_POST['name'];
        $lat = $_POST['lat'];
        $long = $_POST['long'];

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.jts_objects_door SET
                object_id = '{$object_id}',
                name = '{$name}',
                lat = '{$lat}',
                long = '{$long}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.jts_objects_door (
                    object_id,
                    name,
                    lat,
                    long
                ) VALUES (
                    '{$object_id}',
                    '{$name}',
                    '{$lat}',
                    '{$long}'
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.jts_objects_door_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_jts_objects_door":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.jts_objects_door WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// jts_objects_sos ==============================================

    /// personal_staff ==================================================
    case "get_personal_staff":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.*, ot.id as object_type from hr.personal_staff t
		left join hr.jts_objects o on o.id = t.object
		left join hr.involved_objects ot on ot.id = o.type
        where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_personal_staff":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure = $_POST['structure'];
        $date = $_POST['date'];
        $object = $_POST['object'];
        $pp_mg = (!empty($_POST['pp_mg'])) ? $_POST['pp_mg'] : 0;
        $pp_qb = (!empty($_POST['pp_qb'])) ? $_POST['pp_qb'] : 0;
        $pp_direction = (!empty($_POST['pp_direction'])) ? $_POST['pp_direction'] : 0;
        $ap_mg = (!empty($_POST['ap_mg'])) ? $_POST['ap_mg'] : 0;
        $ap_qb = (!empty($_POST['ap_qb'])) ? $_POST['ap_qb'] : 0;
        $ap_direction = (!empty($_POST['ap_direction'])) ? $_POST['ap_direction'] : 0;
        $ap_vehicle = (!empty($_POST['ap_vehicle'])) ? $_POST['ap_vehicle'] : 0;
        $mp_mg = (!empty($_POST['mp_mg'])) ? $_POST['mp_mg'] : 0;
        $mp_qb = (!empty($_POST['mp_qb'])) ? $_POST['mp_qb'] : 0;
        $mp_direction = (!empty($_POST['mp_direction'])) ? $_POST['mp_direction'] : 0;
        $mp_vehicle = (!empty($_POST['mp_vehicle'])) ? $_POST['mp_vehicle'] : 0;
        $op_mg = (!empty($_POST['op_mg'])) ? $_POST['op_mg'] : 0;
        $op_qb = (!empty($_POST['op_qb'])) ? $_POST['op_qb'] : 0;
        $op_direction = (!empty($_POST['op_direction'])) ? $_POST['op_direction'] : 0;
        $op_vehicle = (!empty($_POST['op_vehicle'])) ? $_POST['op_vehicle'] : 0;

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.personal_staff SET
                structure = '{$structure}',
                date = '{$date}',
                object = '{$object}',
                pp_mg = '{$pp_mg}',
                pp_qb = '{$pp_qb}',
                pp_direction = '{$pp_direction}',
                ap_mg = '{$ap_mg}',
                ap_qb = '{$ap_qb}',
                ap_direction = '{$ap_direction}',
                ap_vehicle = '{$ap_vehicle}',
                mp_mg = '{$mp_mg}',
                mp_qb = '{$mp_qb}',
                mp_direction = '{$mp_direction}',
                mp_vehicle = '{$mp_vehicle}',
                op_mg = '{$op_mg}',
                op_qb = '{$op_qb}',
                op_direction = '{$op_direction}',
                op_vehicle = '{$op_vehicle}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.personal_staff (
                    structure,
                    date,
                    object,
                    pp_mg,
                    pp_qb,
                    pp_direction,
                    ap_mg,
                    ap_qb,
                    ap_direction,
                    ap_vehicle,
                    mp_mg,
                    mp_qb,
                    mp_direction,
                    mp_vehicle,
                    op_mg,
                    op_qb,
                    op_direction,
                    op_vehicle
                ) VALUES (
                    '{$structure}',
                    '{$date}',
                    '{$object}',
                    '{$pp_mg}',
                    '{$pp_qb}',
                    '{$pp_direction}',
                    '{$ap_mg}',
                    '{$ap_qb}',
                    '{$ap_direction}',
                    '{$ap_vehicle}',
                    '{$mp_mg}',
                    '{$mp_qb}',
                    '{$mp_direction}',
                    '{$mp_vehicle}',
                    '{$op_mg}',
                    '{$op_qb}',
                    '{$op_direction}',
                    '{$op_vehicle}'
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.personal_staff_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_personal_staff":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.personal_staff WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// personal_staff ==================================================

    /// structure =======================================================
    case "get_structure":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.structure t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_structure":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $parent = $_POST['parent'];
        $name1 = $_POST['name1'];
        $name2 = $_POST['name2'];
        $name3 = $_POST['name3'];
        $shortname1 = $_POST['shortname1'];
        $shortname2 = $_POST['shortname2'];
        $shortname3 = $_POST['shortname3'];

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.structure SET
                parent = '{$parent}',
                name1 = '{$name1}',
                name2 = '{$name2}',
                name3 = '{$name3}',
                shortname1 = '{$shortname1}',
                shortname2 = '{$shortname2}',
                shortname3 = '{$shortname3}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.structure (
                    id,
                    parent,
                    name1,
                    name2,
                    name3,
                    shortname1,
                    shortname2,
                    shortname3
                ) VALUES (
                    '{$RowId}',
                    '{$parent}',
                    '{$name1}',
                    '{$name2}',
                    '{$name3}',
                    '{$shortname1}',
                    '{$shortname2}',
                    '{$shortname3}'
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.structure_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_structure":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.structure WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// structure =======================================================

    /// car_models =======================================================
    case "get_car_models":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from ref.car_models t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_car_models":
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $name    = $_POST['name'];
        $car_width    = $_POST['car_width'];
        $car_height    = $_POST['car_height'];

        if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
            $file = $_FILES['photo'];
            // Set the upload directory
            $uploadDir = 'pictures/cars/';

            // Generate a unique filename
            $newFileName = uniqid('car_', true) . '.' . pathinfo($file['name'], PATHINFO_EXTENSION);
            $uploadFile = $uploadDir . $newFileName;

            // Upload the file
            if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
                $photo = $newFileName;
            } else {
                echo "Possible file upload attack!\n";
            }
        }

        $photo = isset($photo) ? $photo : $_POST['photo'];
        $name    = $_POST['name'];
        $car_width    = $_POST['car_width'];
        $car_height    = $_POST['car_height'];

        if ($RowId != "0") {
            $updquery = "UPDATE ref.car_models set 
                name = '{$name}',
                photo = '{$photo}',
                car_width = '{$car_width}',
                car_height = '{$car_height}'
            WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM ref.car_models t WHERE 0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into ref.car_models (
                            name,
                            photo,
                            car_width,
                            car_height
                        ) values (
                            '{$name}',
                            '{$photo}',
                            '{$car_width}',
                            '{$car_height}'
                        )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('ref.car_models_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_car_models":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM ref.car_models WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// car_models =======================================================

    /// tech_guard_cars =======================================================
    case "get_tech_guard_cars":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.tech_guard_cars t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_tech_guard_cars":
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure_id    = $_POST['structure_id'];
        $car_model_id    = $_POST['car_model_id'];
        $plate_number    = $_POST['plate_number'];
        $uzgps_id    = $_POST['uzgps_id'];

        if ($RowId != "0") {
            $updquery = "UPDATE hr.tech_guard_cars set 
                structure_id = '{$structure_id}',
                car_model_id = '{$car_model_id}',
                plate_number = '{$plate_number}',
                uzgps_id = '{$uzgps_id}'
            WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM hr.tech_guard_cars t WHERE 0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into hr.tech_guard_cars (
                            structure_id,
                            car_model_id,
                            plate_number,
                            uzgps_id
                        ) values (
                            '{$structure_id}',
                            '{$car_model_id}',
                            '{$plate_number}',
                            '{$uzgps_id}'
                        )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('hr.tech_guard_cars_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_tech_guard_cars":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.tech_guard_cars WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// tech_guard_cars =======================================================

    /// current_operative_group =======================================================
    case "get_current_operative_group":
        $RowId = MyPiDeCrypt($_GET['rowid']);
        $query = "SELECT t.* ,to_char(t.date, 'DD.MM.YYYY') date from hr.current_operative_group t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_current_operative_group":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure_id = $_POST['structure_id'];
        $smena = $_POST['smena'];
        $date = (isset($_POST['date']) && $_POST['date'] != "") ? date('Y-m-d H:i:s', strtotime($_POST['date'])) : "NULL";
        $car_id = $_POST['car_id'];

        if ($RowId != "0") {
            $updquery = "UPDATE hr.current_operative_group set 
                structure_id = '{$structure_id}'
                ,date = '{$date}'
                ,smena = '{$smena}'
                ,car_id = '{$car_id}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM hr.current_operative_group t 
            WHERE structure_id = '{$structure_id}' AND car_id = '{$car_id}' and date = '{$date}' and smena = '{$smena}'");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into hr.current_operative_group (
                                structure_id
                                ,date
                                ,car_id
                                ,smena
                            ) values (
                                '{$structure_id}'
                                ,'{$date}'
                                ,'{$car_id}'
                                ,'{$smena}'
                            )";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('hr.current_operative_group_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_current_operative_group":
        $RowId = MyPiDeCrypt($_GET['rowid']);
        $query = "DELETE FROM hr.current_operative_group WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// current_operative_group =======================================================

}
echo $res;
