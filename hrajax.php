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

    // case "act_staffs":
    //     $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;

    //     if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
    //         $file = $_FILES['photo'];
    //         // Set the upload directory
    //         $uploadDir = 'pictures/staffs/';

    //         // Generate a unique filename
    //         $newFileName = uniqid('staff_', true) . '.' . pathinfo($file['name'], PATHINFO_EXTENSION);
    //         $uploadFile = $uploadDir . $newFileName;

    //         // Upload the file
    //         if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
    //             $photo = $newFileName;
    //         } else {
    //             echo "Possible file upload attack!\n";
    //         }
    //     }

    //     $photo = isset($photo) ? $photo : $_POST['photo'];

    //     $structure_id    = $_POST['structure_id'];
    //     $rank_id    = $_POST['rank_id'];
    //     $position_id    = isset($_POST['position_id']) ? $_POST['position_id'] : 'null';
    //     $role    = isset($_POST['role']) ? $_POST['role'] : 'null';
    //     $lastname    = $_POST['lastname'];
    //     $firstname    = $_POST['firstname'];   
    //     $surname    = $_POST['surname'];
    //     $phone    = $_POST['phone'];
    //     $username    = isset($_POST['username']) ? $_POST['username']: '';
    //     // $password    =isset(md5($_POST['password'])) ? md5($_POST['password']) : '';
    //     $password = isset($_POST['password']) ? md5($_POST['password']) : '';



    //     if ($RowId != "0") {
    //         $updquery = "UPDATE hr.staff set 
    //             structure_id = {$structure_id},
    //             role_id = {$role},
    //             position_id = {$position_id},
    //             rank_id = {$rank_id},
    //             lastname = '{$lastname}',
    //             firstname = '{$firstname}',
    //             surname = '{$surname}',
    //             phone = '{$phone}',
    //             username = '{$username}',
    //             password = '{$password}',
    //             photo = '{$photo}'
    //         WHERE id = {$RowId}";
    //         $sql->query($updquery);

    //         if ($sql->error() == "") {
    //             $res = "0<&sep&>" . MyPiCrypt($RowId);
    //         } else {
    //             $res = $sql->error();
    //         }
    //     } else {
    //         $sql->query("SELECT count(*) ccount FROM hr.staff t WHERE username='{$username}'");
    //         $isNotNew = $sql->fetchAssoc();
    //         if ($isNotNew['ccount'] == 0) {
    //             $insquery = "INSERT into hr.staff (
    //                         structure_id,
    //                         role_id,
    //                         position_id,
    //                         rank_id,
    //                         lastname,
    //                         firstname,
    //                         surname,
    //                         phone,
    //                         username,
    //                         password,
    //                         photo
    //                     ) values (
    //                         '{$structure_id}',
    //                         {$role},
    //                         {$position_id},
    //                         {$rank_id},
    //                         '{$lastname}',
    //                         '{$firstname}',
    //                         '{$surname}',
    //                         '{$phone}',
    //                         '{$username}',
    //                         '{$password}',
    //                         '{$photo}'
    //                     )";
    //             $sql->query($insquery);
    //             if ($sql->error() == "") {
    //                 $sql->query("SELECT CURRVAL('hr.staff_id_seq') AS last_id;");
    //                 $result = $sql->fetchAssoc();
    //                 $LastId = $result['last_id'];

    //                 $res = "0<&sep&>" . MyPiCrypt($LastId);
    //             } else {
    //                 $res = $sql->error();
    //             }
    //         } else {
    //             $res = "Ушбу username аввал олинган бошқа ном билан уриниб кўринг!";
    //         }
    //     }
    //     break;

    case "act_staffs":
    $RowId = !empty($_POST['id']) ? $_POST['id'] : 0;

    // ─────────────────────────────
    // 📌 Rasm yuklash
    // ─────────────────────────────
    if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
        $file = $_FILES['photo'];
        $uploadDir = 'pictures/staffs/';

        $newFileName = uniqid('staff_', true) . '.' . pathinfo($file['name'], PATHINFO_EXTENSION);
        $uploadFile = $uploadDir . $newFileName;

        if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
            $photo = $newFileName;
        }
    }

    // Agar yangi rasm yuklanmagan bo'lsa — eski rasmni olamiz
    $photo = isset($photo) ? $photo : $_POST['photo'];

    // ─────────────────────────────
    // 📌 POST ma’lumotlar
    // ─────────────────────────────
    $structure_id = $_POST['structure_id'];
    $rank_id      = $_POST['rank_id'];
    $position_id  = !empty($_POST['position_id']) ? $_POST['position_id'] : "null";
    $role         = !empty($_POST['role']) ? $_POST['role'] : "null";

    $lastname  = $_POST['lastname'];
    $firstname = $_POST['firstname'];
    $surname   = $_POST['surname'];
    $phone     = $_POST['phone'];

    $man      = isset($_POST['man']) ? 'true' : 'false';
    $woman    = isset($_POST['woman']) ? 'true' : 'false';
    $soldier  = isset($_POST['soldier']) ? 'true' : 'false';
    $sergeant = isset($_POST['sergeant']) ? 'true' : 'false';
    $officer  = isset($_POST['officer']) ? 'true' : 'false';



    $username  = !empty($_POST['username']) ? $_POST['username'] : "";
    $password  = !empty($_POST['password']) ? md5($_POST['password']) : "";



        // echo '<pre>';
		// print_r($markets);
		// echo '</pre>';
		// die();
    // ─────────────────────────────
    // 📌 UPDATE (agar mavjud bo'lsa)
    // ─────────────────────────────
    if ($RowId != "0") {

        $updquery = "
            UPDATE hr.staff SET 
                structure_id = {$structure_id},
                role_id = {$role},
                position_id = {$position_id},
                rank_id = {$rank_id},
                lastname = '{$lastname}',
                firstname = '{$firstname}',
                surname = '{$surname}',
                phone = '{$phone}',
                username = '{$username}',
                password = '{$password}',
                photo = '{$photo}',
                is_man = '{$man}',
                is_woman = '{$woman}',
                is_soldier = '{$soldier}',
                is_sergeant = '{$sergeant}',
                is_ofitser = '{$officer}'
            WHERE id = {$RowId}
        ";

        $sql->query($updquery);

        if ($sql->error() == "") {
            $res = "0<&sep&>" . MyPiCrypt($RowId);
        } else {
            $res = $sql->error();
        }

    } else {

        // ─────────────────────────────
        // 📌 INSERT (yangi xodim)
        // ─────────────────────────────

        $insquery = "
            INSERT INTO hr.staff (
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
                photo,
                is_man,
                is_woman,
                is_soldier,
                is_sergeant,
                is_ofitser
            ) VALUES (
                '{$structure_id}',
                {$role},
                {$position_id},
                {$rank_id},
                '{$lastname}',
                '{$firstname}',
                '{$surname}',
                '{$phone}',
                '{$username}',
                '{$password}',
                '{$photo}',
                '{$man}',
                '{$woman}',
                '{$soldier}',
                '{$sergeant}',
                '{$officer}'
            )
        ";

        $sql->query($insquery);

        if ($sql->error() == "") {
            $sql->query("SELECT CURRVAL('hr.staff_id_seq') AS last_id;");
            $result = $sql->fetchAssoc();
            $LastId = $result['last_id'];

            $res = "0<&sep&>" . MyPiCrypt($LastId);
        } else {
            $res = $sql->error();
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
    // case "get_events":
    //     $RowId = MyPiDeCrypt($_GET['rowid']);

    //     $query = "SELECT 
    //         t.*
    //      from hr.public_event1 t where t.id = {$RowId}";
    //     $sql->query($query);
    //     $result = $sql->fetchAssoc();


    //     $result['rowid'] = MyPiCrypt($result['id']);

    //     $res = json_encode($result);
    //     break;

    case "get_events":

        $id = isset($_GET['rowid']) ? $_GET['rowid'] : 0;

        if ($id <= 0) {
            echo json_encode([]);
            exit;
        }

        $query = "
            SELECT *
            FROM hr.public_event1
            WHERE id = {$id}
            LIMIT 1
        ";

        $sql->query($query);
        $event = $sql->fetchAll();

        $res = json_encode($event);
        break;


    case "act_events":
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $region_id = isset($_POST['region_id']) ? (int)$_POST['region_id'] : null;
        $object_name = isset($_POST['object_id']) ? (int)$_POST['object_id'] : null;
        $event_type = isset($_POST['event_type']) ? (int)$_POST['event_type'] : null;
        $event_category = isset($_POST['event_category']) ? (int)$_POST['event_category'] : null;
        $event_direction = isset($_POST['event_direction']) ? $_POST['event_direction'] : null;
        $event_view = isset($_POST['event_view']) ? $_POST['event_view'] : null;
        $event_respnsible_organization = isset($_POST['event_responsible_organization']) ? (int)$_POST['event_responsible_organization'] : null;
        $start_event = $_POST['start_event'];
        $finish_event = $_POST['finish_event'];
        $organizer = isset($_POST['organizer']) ? $_POST['organizer'] : null;
        $event_name =  isset($_POST['event_name']) ? $_POST['event_name'] : null;
        $responsible_name = isset($_POST['responsible_name']) ? $_POST['responsible_name'] : null;
        $responsible_phone = isset($_POST['responsible_phone']) ? $_POST['responsible_phone'] : null;
        $responsible_iiv_name =  isset($_POST['responsible_iiv_name']) ? $_POST['responsible_iiv_name'] : null;
        $responsible_mg_name = isset($_POST['responsible_mg_name']) ? $_POST['responsible_mg_name'] : null;

        $mg_count = isset($_POST['mg_count']) ? (int)$_POST['mg_count'] : 0;
        $responsible_msgr_name = isset($_POST['responsible_msgr_name']) ? $_POST['responsible_msgr_name'] : null;
        $reserve_count = isset($_POST['reserve_count']) ? (int)$_POST['reserve_count'] : 0;
        $reserve_name = isset($_POST['reserve_name']) ? $_POST['reserve_name'] : null;
        $responsible_spring_name = isset($_POST['responsible_spring_name']) ? $_POST['responsible_spring_name'] : null;
        $responsible_fvv_name = isset($_POST['responsible_fvv_name']) ? $_POST['responsible_fvv_name'] : null;
        $people_count = isset($_POST['people_count']) ? (int)$_POST['people_count'] : 0;
        $sapyor =  isset($_POST['sapyor']) ? $_POST['sapyor'] : null;
        $sapyor_count =  isset($_POST['sapyor_count']) ? $_POST['sapyor_count'] : 0;
        $spring_count = isset($_POST['spring_count']) ? (int)$_POST['spring_count'] : 0;
        $iiv_count = isset($_POST['iiv_count']) ? (int)$_POST['iiv_count'] : 0;
        $fvv_count = isset($_POST['fvv_count']) ? (int)$_POST['fvv_count'] : 0;
        $comment = isset($_POST['situation_text']) ? $_POST['situation_text'] : null;
        $lat = isset($_POST['lat']) ? $_POST['lat'] : null;
        $long = isset($_POST['long']) ? $_POST['long'] : null;


        if ($RowId != "0") {
            $updquery = "UPDATE hr.public_event1 set
            region_id = '{$region_id}',
            object_name = '{$object_name}',
            event_type = '{$event_type}',
            event_name = '{$event_name}',
            event_direction = '{$event_direction}',
            event_view = '{$event_view}',
            event_responsible_organization = '{$event_respnsible_organization}',
            start_event           = '{$start_event}',
            finish_event          ='{$finish_event}',
            organizer             = '{$organizer}',
            responsible_name      = '{$responsible_name}',
            responsible_phone     = '{$responsible_phone}',
            responsible_iiv_name  = '{$responsible_iiv_name}',
            responsible_msgr_name = '{$responsible_msgr_name}',
            responsible_mg_name = '{$responsible_mg_name}',
            reserve_count = '{$reserve_count}',
            responsible_spring_name = '{$responsible_spring_name}',
            responsible_fvv_name = '{$responsible_fvv_name}',
            people_count = '{$people_count}',
            mg_counts = '{$mg_count}',
            spring_count = '{$spring_count}',
            reserve_name = '{$reserve_name}',
            iiv_count = '{$iiv_count}',
            fvv_count = '{$fvv_count}',
            sapyor_count =  '{$sapyor_count}',
            sapyor =  '{$sapyor}',
            event_category_id = '{$event_category}',
            comment = '{$comment}',
            lat = '{$lat}',
            long ='{$long}'

            WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount FROM hr.public_event1 t WHERE 0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into hr.public_event1 (
                         region_id
                        ,object_name
                        ,event_type
                        ,event_name
                        ,event_direction
                        ,event_view
                        ,event_responsible_organization
                        ,start_event
                        ,finish_event
                        ,organizer
                        ,responsible_name
                        ,responsible_phone
                        ,responsible_iiv_name
                        ,responsible_msgr_name
                        ,reserve_count
                        ,responsible_spring_name
                        ,responsible_fvv_name
                        ,people_count
                        ,mg_counts
                        ,spring_count
                        ,reserve_name
                        ,iiv_count
                        ,fvv_count
                        ,responsible_mg_name
                        ,sapyor_count
                        ,sapyor
                        ,event_category_id
                        ,comment
                        ,lat
                        ,long
                
                    ) values (
                         '{$region_id}'
                        ,'{$object_name}'
                        ,'{$event_type}'
                        ,'{$event_name}'
                        ,'{$event_direction}'
                        ,'{$event_view}'
                        ,'{$event_respnsible_organization}'
                        ,'{$start_event}'
                        ,'{$finish_event}'
                        ,'{$organizer}'
                        ,'{$responsible_name}'
                        ,'{$responsible_phone}'
                        ,'{$responsible_iiv_name}'
                        ,'{$responsible_msgr_name}'
                        ,'{$reserve_count}'
                        ,'{$responsible_spring_name}'
                        ,'{$responsible_fvv_name}'
                        ,'{$people_count}'
                        ,'{$mg_count}'
                        ,'{$spring_count}'
                        ,'{$reserve_name}'
                        ,'{$iiv_count}'
                        ,'{$fvv_count}'
                        ,'{$responsible_mg_name}'
                        ,'{$sapyor_count}'
                        ,'{$sapyor}'
                        ,'{$event_category}'
                        ,'{$comment}'
                        ,'{$lat}'
                        ,'{$long}'

                    )";
                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('hr.public_event1_id_seq') AS last_id;");
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

    // case "del_events":
    //     $RowId = MyPiDeCrypt($_GET['rowid']);
    //     $RowId = mb_convert_encoding($RowId, 'UTF-8', 'UTF-8');;

    //     $query = "DELETE FROM hr.public_event1 WHERE id = {$RowId}";
    //     $sql->query($query);
    //     $result = $sql->fetchAssoc();

    //     if ($sql->error() == "") {
    //         $res = 0;
    //     } else {
    //         $res = 2;
    //     }
    //     break;
   case "del_events":
    $RowId = $_GET['rowid']; 
    $res = 2; // Dastlab xato holatini (default) o'rnatamiz

    if ($RowId > 0) {
        $query = "DELETE FROM hr.public_event1 WHERE id = {$RowId}";
        $sql->query($query);

        if ($sql->error() == "") {
            $res = 0; // Muvaffaqiyatli o'chirildi
        } else {
            $res = 2; // Baza xatosi
        }
    } else {
        $res = 1; // ID noto'g'ri dekodlandi xatosi
    }

    echo $res; // Mana bu yerda $res endi har doim aniqlangan bo'ladi
    break;
    /// events ==========================================================







    /// events duty ==========================================================
case "get_event_duty":
    // decrypt va int ga o'tkazish (xavfsizlik uchun)
    $RowId = (int) MyPiDeCrypt($_GET['rowid']);

    // 1) event duty ma'lumotini olish
    $query = "SELECT t.* FROM hr.public_event_duty t WHERE t.id = {$RowId}";
    $sql->query($query);
    $event = $sql->fetchAssoc();

    if (!$event) {
        // topilmadi
        $res = json_encode(['error' => 'Not found']);
        break;
    }

    // rowid qayta shifrlangan shaklda kerak bo'lsa
    $event['rowid'] = MyPiCrypt($event['id']);

    // Agar siz frontendga 'date' maydon sifatida yubormoqchi bo'lsangiz (agar mavjud bo'lsa)
    if (isset($event['date_formatted'])) {
        $event['date'] = $event['date_formatted'];
        unset($event['date_formatted']);
    }

    // 2) structure_id ni aniqlash (jadvalingizda maydon nomi qaysi bo'lishidan qat'i nazar qo'llab-quvvatlaymiz)
    $structureId = 0;
    if (!empty($event['structure_id'])) {
        $structureId = (int)$event['structure_id'];
    } elseif (!empty($event['structure'])) {
        $structureId = (int)$event['structure'];
    }

    $structure_chain = [];
    if ($structureId > 0) {
        // 3) Rekursiv CTE: tanlangan structure dan boshlab uning parentlarini tepaga qarab o'qiymiz.
        // ORDER BY lvl DESC bilan natija ROOT -> ... -> tanlangan bo'ladi.
        $ancQuery = "
            WITH RECURSIVE chain AS (
                SELECT id, parent, name1, 1 AS lvl
                  FROM hr.structure
                 WHERE id = {$structureId}
                UNION ALL
                SELECT s.id, s.parent, s.name1, chain.lvl + 1
                  FROM hr.structure s
                  JOIN chain ON s.id = chain.parent
            )
            SELECT id, parent, name1, lvl
              FROM chain
             ORDER BY lvl DESC
        ";
        $sql->query($ancQuery);
        $structure_chain = $sql->fetchAll(); // array of rows: root -> ... -> selected
    }
    //  echo '<pre>';
    // 	print_r($structure_chain);
    // 	echo '</pre>';
    // 	die();
    // 4) Natijani JSON qilib qaytarish
    $output = [
        'event_duty' => $event,
        'structure_chain' => $structure_chain
    ];

    $res = json_encode($output);
    break;


    // case "act_event_duty":

    //     $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
    //     $public_event1_id =MyPiDeCrypt($_POST['public_event1_id']);
    //     $structure_id =  $_POST['structure_id'];
    //     $troops_id = $_POST['staff_id'];
    //     $epikirofka_id = $_POST['epikirofka_id'];
    //     $avto_id = $_POST['car_id'];


        // echo '<pre>';
    	// print_r($type_id);
    	// echo '</pre>';
    	// die();

    //     if ($RowId != "0") {
    //         $updquery = "UPDATE hr.public_event_duty set
    //         public_event1_id = '{$public_event1_id}',
    //         structure_id = '{$structure_id}',
    //         troops_id = '{$troops_id}',
    //         epikirofka_id = '{$epikirofka_id}',
    //         avto_id = '{$avto_id}',

    //         WHERE id = {$RowId}";
    //         $sql->query($updquery);
    //         if ($sql->error() == "") {
    //             $res = "0<&sep&>" . MyPiCrypt($RowId);
    //         } else {
    //             $res = $sql->error();
    //         }
    //     } else {
    //         $sql->query("SELECT count(*) ccount FROM hr.public_event_duty t WHERE 0=1");
    //         $isNotNew = $sql->fetchAssoc();
    //         if ($isNotNew['ccount'] == 0) {
    //             $insquery = "INSERT into hr.public_event_duty (
    //                      public_event1_id
    //                     ,structure_id
    //                     ,troops_id
    //                     ,epikirofka_id
    //                     ,avto_id
    //                 ) values (
    //                      '{$public_event1_id}'
    //                     ,'{$structure_id}'
    //                     ,'{$troops_id}'
    //                     ,'{$epikirofka_id}'
    //                     ,'{$avto_id}'
    //                 )";
    //             $sql->query($insquery);
    //             if ($sql->error() == "") {
    //                 $sql->query("SELECT CURRVAL('hr.public_event_duty_id_seq') AS last_id;");
    //                 $result = $sql->fetchAssoc();
    //                 $LastId = $result['last_id'];

    //                 $res = "0<&sep&>" . MyPiCrypt($LastId);
    //             } else {
    //                 $res = $sql->error();
    //             }
    //         } else {
    //             $res = 1;
    //         }
    //     }
    //     break;


    case "act_event_duty":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $public_event1_id = MyPiDeCrypt($_POST['public_event1_id']);
        $structure_id =  $_POST['structure_id'];
        $car_id = !empty($_POST['car_id']) ? $_POST['car_id'] : 0;
        $horse_count = !empty($_POST['horse_count']) ? $_POST['horse_count'] : 0;
        $dog_id = !empty($_POST['dog_id']) ? $_POST['dog_id'] : 0;
        $patrul_type = $_POST['patrul_type'];

        // echo '<pre>';
        // print_r($car_id);
        // echo '</pre>';
        // die();

        // Epikirofka IDs ni olish va tozalash
        $epikirofka_ids_input = isset($_POST['epikirofka_id']) ? $_POST['epikirofka_id'] : '';
        // staff_ids massiv ekanligini ta'minlash
        $staff_id = is_array($_POST['staff_id']) ? $_POST['staff_id'] : explode(',', $_POST['staff_id']);



        // PostgreSQL Array formatiga o'tkazish
        // Array format: '{12, 34, 56}'
        //epikirofka_id = 2,1

        $ids_array = array_filter(
            preg_split('/,\s*/', $epikirofka_ids_input, -1, PREG_SPLIT_NO_EMPTY)
        );

        // 3. PostgreSQL Array String formatiga konvertatsiya qilish: "{2,3,1}"

        if (!empty($ids_array)) {
            // Array elementlarini vergul bilan birlashtirish
            $epikirofka_pg_array_string = '{' . implode(',', $ids_array) . '}';
        } else {
            // Agar massiv bo'sh bo'lsa yoki 'NULL' qabul qilinsa, 'NULL' stringini ishlatish
            $epikirofka_pg_array_string = 'NULL';
        }



        $LastId = null; // So'nggi qo'shilgan ID ni saqlash uchun
        $success = true;

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.public_event_duty SET
                public_event1_id = '{$public_event1_id}',
                structure_id = '{$structure_id}',
                staff_id = '{$staff_id[0]}',
                car_id = '{$car_id}',
                epikirofka_id = '{$epikirofka_pg_array_string}',
                patrul_type_id = '{$patrul_type}',
                horse_count = '{$horse_count}',
                dog_id = '{$dog_id}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $status = "ok";
                $res = json_encode(['status' => $status, 'rowid' => MyPiCrypt($RowId)]);
            } else {
                $res = $sql->error();
                $success = false;
            }
        } else {
            foreach ($staff_id as $staff) {
                // Har bir aylanmada alohida staff_id o'zgaradi
                $current_staff_id = (int) $staff;

                $insquery = "INSERT INTO hr.public_event_duty (
                    public_event1_id,
                    structure_id,
                    staff_id,
                    car_id,
                    epikirofka_id,
                    patrul_type_id,
                    horse_count,
                    dog_id
                ) VALUES (
                    '{$public_event1_id}',
                    '{$structure_id}',
                    '{$current_staff_id}', -- Siklning joriy IDsi ishlatiladi
                    '{$car_id}',
                    '{$epikirofka_pg_array_string}', -- PostgreSQL array stringi ishlatiladi
                    '{$patrul_type}',
                    '{$horse_count}',
                    '{$dog_id}'
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
                $sql->query("SELECT CURRVAL('hr.public_event_duty_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = 0;
            }
        }
        break;

    case "del_event_duty":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.public_event_duty WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// events duty ==========================================================






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
        $structure_id     = $_POST['structure_id'];
        $responsible_id     = $_POST['responsible_id'];
        $type     = $_POST['type'];
        $exercises_type     = $_POST['exercises_type'];
        $start_date     = $_POST['start_date'];
        $end_date     = $_POST['end_date'];
        $staff_count     = $_POST['staff_count'];
        $vehicles_count     = $_POST['vehicles_count'];
        $description     = $_POST['description'];

        if ($RowId != "0") {
            $updquery = "UPDATE tur.reyd_events set
            structure_id = '{$structure_id}',
            responsible_id = '{$responsible_id}',
            type = '{$type}',
            exercises_type = '{$exercises_type}',
            start_date = '{$start_date}',
            end_date = '{$end_date}',
            staff_count = '{$staff_count}',
            vehicles_count = '{$vehicles_count}',
            description = '{$description}'
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
                         structure_id
                        ,responsible_id
                        ,type
                        ,exercises_type
                        ,start_date
                        ,end_date
                        ,staff_count
                        ,vehicles_count
                        ,description
                    ) values (
                         '{$structure_id}'
                        ,'{$responsible_id}'
                        ,'{$type}'
                        ,'{$exercises_type}'
                        ,'{$start_date}'
                        ,'{$end_date}'
                        ,'{$staff_count}'
                        ,'{$vehicles_count}'
                        ,'{$description}'
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



    // /// reyd_events =====================================================
    // case "get_reyd_events":
    //     $RowId = MyPiDeCrypt($_GET['rowid']);

    //     $query = "SELECT t.* from tur.reyd_events t where t.id = {$RowId}";
    //     $sql->query($query);
    //     $result = $sql->fetchAssoc();
    //     $result['rowid'] = MyPiCrypt($result['id']);

    //     $res = json_encode($result);
    //     break;

    // case "act_reyd_events":
    //     $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
    //     $structure_id     = $_POST['structure_id'];
    //     $responsible_id     = $_POST['responsible_id'];
    //     $type     = $_POST['type'];
    //     $exercises_type     = $_POST['exercises_type'];
    //     $start_date     = $_POST['start_date'];
    //     $end_date     = $_POST['end_date'];
    //     $staff_count     = $_POST['staff_count'];
    //     $vehicles_count     = $_POST['vehicles_count'];
    //     $description     = $_POST['description'];

    //     if ($RowId != "0") {
    //         $updquery = "UPDATE tur.reyd_events set
    //         structure_id = '{$structure_id}',
    //         responsible_id = '{$responsible_id}',
    //         type = '{$type}',
    //         exercises_type = '{$exercises_type}',
    //         start_date = '{$start_date}',
    //         end_date = '{$end_date}',
    //         staff_count = '{$staff_count}',
    //         vehicles_count = '{$vehicles_count}',
    //         description = '{$description}'
    //         WHERE id = {$RowId}";
    //         $sql->query($updquery);
    //         if ($sql->error() == "") {
    //             $res = "0<&sep&>" . MyPiCrypt($RowId);
    //         } else {
    //             $res = $sql->error();
    //         }
    //     } else {
    //         $sql->query("SELECT count(*) ccount FROM tur.reyd_events t WHERE 0=1");
    //         $isNotNew = $sql->fetchAssoc();
    //         if ($isNotNew['ccount'] == 0) {
    //             $insquery = "INSERT into tur.reyd_events (
    //                      structure_id
    //                     ,responsible_id
    //                     ,type
    //                     ,exercises_type
    //                     ,start_date
    //                     ,end_date
    //                     ,staff_count
    //                     ,vehicles_count
    //                     ,description
    //                 ) values (
    //                      '{$structure_id}'
    //                     ,'{$responsible_id}'
    //                     ,'{$type}'
    //                     ,'{$exercises_type}'
    //                     ,'{$start_date}'
    //                     ,'{$end_date}'
    //                     ,'{$staff_count}'
    //                     ,'{$vehicles_count}'
    //                     ,'{$description}'
    //                 )";
    //             $sql->query($insquery);
    //             if ($sql->error() == "") {
    //                 $sql->query("SELECT CURRVAL('tur.reyd_events_id_seq') AS last_id;");
    //                 $result = $sql->fetchAssoc();
    //                 $LastId = $result['last_id'];

    //                 $res = "0<&sep&>" . MyPiCrypt($LastId);
    //             } else {
    //                 $res = $sql->error();
    //             }
    //         } else {
    //             $res = 1;
    //         }
    //     }
    //     break;

    // case "del_reyd_events":
    //     $RowId = MyPiDeCrypt($_GET['rowid']);
        
    //     echo '<pre>';
    //     print_r($RowId);
    //     echo '</pre>';
    //     die();
    //     $query = "DELETE FROM tur.reyd_events WHERE id = {$RowId}";
    //     $sql->query($query);
    //     $result = $sql->fetchAssoc();

    //     if ($sql->error() == "") {
    //         $res = 0;
    //     } else {
    //         $res = 2;
    //     }
    //     break;
    // /// reyd_events =====================================================

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
            // Check if today's data already exists
            $sql->query("SELECT COUNT(*) AS ccount FROM hr.duty_staff WHERE date = '{$date}' and structure_id = '{$structure_id}'");
            $row = $sql->fetchAssoc();

            if ($row['ccount'] > 0) {
                $res = 500;
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
        $neighborhood_id = $_POST['neighborhood_id'];
        $object_name = $_POST['object_name'];
        $address = $_POST['address'];
        $lamps_count = $_POST['lamps_count'];
        $markets_count = $_POST['markets_count'];
        $eating_place_count = $_POST['eating_place_count'];
        $sales_places_count = $_POST['sales_places_count'];
        $start_work = $_POST['start_work'];
        $capacity = $_POST['capacity'];
        $sektors_count = $_POST['sektors_count'];
        $area = $_POST['area'];
        $admin_phone = $_POST['admin_phone'];
        $object_head = $_POST['object_head'];
        $head_phone = $_POST['head_phone'];
        $lat = $_POST['lat'];
        $long = $_POST['long'];
        $observation_lat = $_POST['observation_lat'];
        $observation_long = $_POST['observation_long'];
        $geom = $_POST['geom'];



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
                neighborhood_id = '{$neighborhood_id}',
                address = '{$address}',
                area = '{$area}',
                admin_phone = '{$admin_phone}',
                object_head = '{$object_head}',
                head_phone = '{$head_phone}',
                lat = '{$lat}',
                long = '{$long}',
                markets_count = '{$markets_count}',
                eating_place_count = '{$eating_place_count}',
                sales_places_count = '{$sales_places_count}',
                start_work = '{$start_work}',
                capacity = '{$capacity}',
                sektors_count = '{$sektors_count}',
                lamps_count = '{$lamps_count}',
                observation_lat = '{$observation_lat}',
                observation_long = '{$observation_long}',
                geom = ST_GeomFromText('{$wkt}', 4326)
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
                    neighborhood_id,
                    address,
                    area,
                    admin_phone,
                    object_head,
                    head_phone,
                    lat,
                    long,
                    markets_count,
                    eating_place_count,
                    sales_places_count,
                    start_work,
                    capacity,
                    sektors_count,
                    lamps_count,
                    observation_lat,
                    observation_long,
                    geom
                
                ) VALUES (
                    '{$structure_id}',
                    '{$object_type}',
                    '{$object_name}',
                    '{$neighborhood_id}',
                    '{$address}',
                    '{$area}',
                    '{$admin_phone}',
                    '{$object_head}',
                    '{$head_phone}',
                    '{$lat}',
                    '{$long}',
                    '{$markets_count}',
                    '{$eating_place_count}',
                    '{$sales_places_count}',
                    '{$start_work}',
                    '{$capacity}',
                    '{$sektors_count}',
                    '{$lamps_count}',
                    '{$observation_lat}',
                    '{$observation_long}',
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
        $lat = isset($_POST['lat']) ? $_POST['lat'] : null;
        $long = isset($_POST['long']) ? $_POST['long'] : null;

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.jts_objects_camera SET
                object_id = '{$object_id}',
                name = '{$name}',
                cam_code = '{$cam_code}',
                is_ptz = '{$is_ptz}',
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
            $insquery = "INSERT INTO hr.jts_objects_camera (
                    object_id,
                    name,
                    cam_code,
                    is_ptz,
                    lat,
                    long
                ) VALUES (
                    '{$object_id}',
                    '{$name}',
                    '{$cam_code}',
                    '{$is_ptz}',
                    '{$lat}',
                    '{$long}'
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

    case "get_body_cameras":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.body_cameras t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;


    case "act_body_cameras":

        header('Content-Type: text/html; charset=UTF-8');

        // ================= ID =================
        $RowId = (!empty($_POST['id'])) ? (int) $_POST['id'] : 0;

        // ================= structure_id =================
        $structure_id = (isset($_POST['structure_id']) && $_POST['structure_id'] !== '')
            ? (int) $_POST['structure_id']
            : null;

        // ================= comment =================
        $comment_raw = $_POST['comment'] ?? '';
        $comment = iconv('UTF-8', 'UTF-8//IGNORE', $comment_raw);

        // ================= cam_code =================
        $cam_code_raw = trim($_POST['cam_code'] ?? '');
        $cam_code = ($cam_code_raw === '' || $cam_code_raw === '0')
            ? null
            : iconv('UTF-8', 'UTF-8//IGNORE', $cam_code_raw);

        // ================= lat / long =================
        $lat  = ($_POST['lat']  ?? '') !== '' ? (float) $_POST['lat']  : null;
        $long = ($_POST['long'] ?? '') !== '' ? (float) $_POST['long'] : null;

        // ================= UPDATE =================
        if ($RowId > 0) {

            // ❗ cam_code boshqa row’da bormi (himoya)
            if ($cam_code !== null) {
                $chk = $sql->query("
                    SELECT id FROM hr.body_cameras
                    WHERE cam_code = '".pg_escape_string($cam_code)."'
                    AND id <> {$RowId}
                ");
                if ($sql->numRows($chk) > 0) {
                    echo "ERROR: cam_code already exists";
                    exit;
                }
            }

            $updquery = "
                UPDATE hr.body_cameras SET
                    structure_id = " . ($structure_id === null ? "NULL" : $structure_id) . ",
                    comment      = '" . pg_escape_string($comment) . "',
                    cam_code     = " . ($cam_code === null ? "NULL" : "'" . pg_escape_string($cam_code) . "'") . ",
                    lat          = " . ($lat === null ? "NULL" : $lat) . ",
                    long         = " . ($long === null ? "NULL" : $long) . "
                WHERE id = {$RowId}
            ";

            $sql->query($updquery);

            $res = ($sql->error() === "")
                ? "0<&sep&>" . $RowId
                : $sql->error();

        // ================= INSERT =================
        } else {

            echo "ERROR: Invalid ID";
            exit;
        }

        echo $res;
        break;

        case "del_body_cameras":
            $RowId = MyPiDeCrypt($_GET['rowid']);

            $query = "DELETE FROM hr.body_cameras WHERE id = {$RowId}";
            $sql->query($query);
            $result = $sql->fetchAssoc();

            if ($sql->error() == "") {
                $res = 0;
            } else {
                $res = 2;
            }
            break;
        /// jts_objects_sos ==============================================


    case "get_daily_routine":
        $RowId = MyPiDeCrypt($_GET['rowid']);
        $query = "SELECT t.*, to_char(t.date, 'YYYY-MM-DD') as date_formatted 
              FROM hr.daily_routine t 
              WHERE t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        // JS tarafida ishlatish uchun date_formatted ni date deb yuboramiz
        $result['date'] = $result['date_formatted'];
        unset($result['date_formatted']);

        $res = json_encode($result);
        break;


    case "act_daily_routine":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $object_id = $_POST['object_id'];
        $structure_id = isset($_POST['structure_id']) ? $_POST['structure_id'] : $UserStructure;
        $date = isset($_POST['day']) ? $_POST['day'] : null;
        $responsible_id = $_POST['responsible_id'];

        // echo '<pre>';
        // print_r($date);
        // echo '</pre>';
        // die();

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.daily_routine SET
                object_id = '{$object_id}',
                structure_id = '{$structure_id}',
                date = '{$date}',
                responsible_id = '{$responsible_id}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = 0;
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.daily_routine (
                    object_id,
                    structure_id,
                    date,
                    responsible_id
                ) VALUES (
                    '{$object_id}',
                    '{$structure_id}',
                    '{$date}',
                    '{$responsible_id}'
                )";
            $sql->query($insquery);


            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.daily_routine_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = 0;
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

   

    case "update_dailiy_routine_bodycam":
        $RowId = $_POST['rowid'];
        $bodycam_id = isset($_POST['bodycam_id']) ? $_POST['bodycam_id'] : 0;

        $query = "UPDATE hr.dailiy_routine_date SET 
            bodycam_id = '{$bodycam_id}'
        where id = {$RowId}";
        $sql->query($query);
        if ($sql->error() == "") {
            $status = "ok";
            $res = json_encode(['status' => $status, 'rowid' => MyPiCrypt($RowId)]);
        } else {
            $res = $sql->error();
            $success = false;
        }
        break;
 ////  dailiy_routine_date


    case "get_dailiy_routine_date":
            $RowId = MyPiDeCrypt($_GET['rowid']);

            $query = "SELECT t.* from hr.dailiy_routine_date t where t.id = {$RowId}";
            $sql->query($query);
            $result = $sql->fetchAssoc();
            $result['rowid'] = MyPiCrypt($result['id']);

            $res = json_encode($result);
            break;


    case "act_dailiy_routine_date":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $routine_id = $_POST['routine_id'];
        $patrul_type = $_POST['patrul_type'];
        $direction = $_POST['direction'];
        $dog_id = $_POST['dog_id'];
        $horse_count = !empty($_POST['horse_count']) ? $_POST['horse_count'] : null;
        $smena = $_POST['smena'];
        $car_id = !empty($_POST['car_id']) ? $_POST['car_id'] : null;
        $bodycam_id = isset($_POST['bodycam_id']) ? $_POST['bodycam_id'] : null;

        // echo '<pre>';
        // print_r($car_id);
        // echo '</pre>';
        // die();

        // Epikirofka IDs ni olish va tozalash
        $epikirofka_ids_input = isset($_POST['epikirofka_id']) ? $_POST['epikirofka_id'] : '';
        // staff_ids massiv ekanligini ta'minlash
        $staff_id = is_array($_POST['staff_id']) ? $_POST['staff_id'] : explode(',', $_POST['staff_id']);



        // PostgreSQL Array formatiga o'tkazish
        // Array format: '{12, 34, 56}'
        //epikirofka_id = 2,1

        $ids_array = array_filter(
            preg_split('/,\s*/', $epikirofka_ids_input, -1, PREG_SPLIT_NO_EMPTY)
        );

        // 3. PostgreSQL Array String formatiga konvertatsiya qilish: "{2,3,1}"

        if (!empty($ids_array)) {
            // Array elementlarini vergul bilan birlashtirish
            $epikirofka_pg_array_string = '{' . implode(',', $ids_array) . '}';
        } else {
            // Agar massiv bo'sh bo'lsa yoki 'NULL' qabul qilinsa, 'NULL' stringini ishlatish
            $epikirofka_pg_array_string = 'NULL';
        }



        $LastId = null; // So'nggi qo'shilgan ID ni saqlash uchun
        $success = true;

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.dailiy_routine_date SET
                routine_id = '{$routine_id}',
                patrul_type = '{$patrul_type}',
                direction = '{$direction}',
                dog_id = '{$dog_id}',
                horse_count = '{$horse_count}',
                smena = '{$smena}',
                staff_id = '{$staff_id[0]}',
                car_id = '{$car_id}',
                epikirofka_id = '{$epikirofka_pg_array_string}',
                bodycam_id = '{$bodycam_id}'
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $status = "ok";
                $res = json_encode(['status' => $status, 'rowid' => MyPiCrypt($RowId)]);
            } else {
                $res = $sql->error();
                $success = false;
            }
        } else {
            foreach ($staff_id as $staff) {
                // Har bir aylanmada alohida staff_id o'zgaradi
                $current_staff_id = (int) $staff;

                $insquery = "INSERT INTO hr.dailiy_routine_date (
                    routine_id,
                    patrul_type,
                    direction,
                    smena,
                    dog_id,
                    horse_count,
                    staff_id,
                    car_id,
                    epikirofka_id
                ) VALUES (
                    '{$routine_id}',
                    '{$patrul_type}',
                    '{$direction}',
                    '{$smena}',
                     {$dog_id},
                     {$horse_count},
                    '{$current_staff_id}', -- Siklning joriy IDsi ishlatiladi
                    '{$car_id}',
                    '{$epikirofka_pg_array_string}' -- PostgreSQL array stringi ishlatiladi
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
                $res = 0;
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
    /// dailiy_routine_date ============

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
        $internal_cam = !empty($_POST['internal_cam']) ? (int)$_POST['internal_cam'] : "NULL";
        $external_cam = !empty($_POST['external_cam']) ? (int)$_POST['external_cam'] : "NULL";

        // echo '<pre>';
        // print_r($internal_cam);
        // echo '</pre>';
        // die();

        if ($RowId != "0") {
            $updquery = "UPDATE hr.tech_guard_cars set 
                structure_id = '{$structure_id}',
                car_model_id = '{$car_model_id}',
                plate_number = '{$plate_number}',
                uzgps_id = '{$uzgps_id}',
                internal_cam = {$internal_cam},
                external_cam = {$external_cam}
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
                            uzgps_id,
                            internal_cam,
                            external_cam
                        ) values (
                            '{$structure_id}',
                            '{$car_model_id}',
                            '{$plate_number}',
                            '{$uzgps_id}',
                            {$internal_cam},
                            {$external_cam}
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

    /// impact_area =====================================================
    case "get_impact_area":
        $RowId = $_GET['rowid'];

        $query = "SELECT t.*, ST_AsGeoJSON(ST_FlipCoordinates(t.geom)) AS geom from hr.impact_area t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_impact_area":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $structure_id = $_POST['structure_id'];
        $name = $_POST['name'];


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
            // Update existing record
            $updquery = "UPDATE hr.impact_area SET
                structure_id = '{$structure_id}',
                name = '{$name}',
                geom = ST_GeomFromText('{$wkt}', 4326)
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.impact_area (
                    structure_id,
                    name,
                    geom
                ) VALUES (
                    '{$structure_id}',
                    '{$name}',
                    ST_GeomFromText('{$wkt}', 4326)
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.impact_area_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_impact_area":
        $RowId = $_GET['rowid'];

        $query = "DELETE FROM hr.impact_area WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// impact_area ========

    case "act_chat":
          
            $json = json_decode(file_get_contents('php://input'), true);

            $sender_id = $json['sender_id']?? null;
            $staff_id  = $json['staff_id'] ?? null;
            $time      = $json['time'] ?? null;
            $text      = $json['text'] ?? null;
            $status    = $json['status'] ?? null;

            // if ($RowId != "0") {
            //     $updquery = "UPDATE tur.messages set 
            //         sender = '{$sender_id}'
            //         ,time = '{$time}'
            //         ,staff_id = '{$staff_id}'
            //         ,text = '{$text}'
            //         ,status = '{$status}'
            //         WHERE id = {$RowId}";
            //     $sql->query($updquery);
            //     if ($sql->error() == "") {
            //         $res = "0<&sep&>" . MyPiCrypt($RowId);
            //     } else {
            //         $res = $sql->error();
            //     }
            // } else {
            //     $sql->query("SELECT count(*) ccount FROM tur.messages t 
            //     WHERE sender = '{$structure_id}' AND car_id = '{$car_id}' and date = '{$date}' and smena = '{$smena}'");
            //     $isNotNew = $sql->fetchAssoc();
            //     if ($isNotNew['ccount'] == 0) {

            $insquery = "INSERT into tur.messages (
                        sender
                        ,time
                        ,staff_id
                        ,text
                        ,status
                            ) values (
                                '{$sender_id}'
                                ,'{$time}'
                                ,'{$staff_id}'
                                ,'{$text}'
                                ,'{$status}'
                            )";

                    $sql->query($insquery);
                    if ($sql->error() == "") {
                        $sql->query("SELECT CURRVAL('tur.messages_id_seq') AS last_id;");
                        $result = $sql->fetchAssoc();
                        $LastId = $result['last_id'];

                        $res = "0<&sep&>" . MyPiCrypt($LastId);
                    } else {
                        $res = $sql->error();
                    }
            break;



 /// neighborhood crud ============        
    case "get_neighborhood":
            $RowId = MyPiDeCrypt($_GET['rowid']);

            $query = "SELECT t.* from hr.neighborhoods t where t.id = {$RowId}";
            $sql->query($query);
            $result = $sql->fetchAssoc();
            $result['rowid'] = MyPiCrypt($result['id']);

            $res = json_encode($result);
            break;


    case "act_neighborhood":
    $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;
  
    $structure_id = $_POST['structure_id'];
    $district = $_POST['district'];
    $name = $_POST['neighborhood_name'];
    $head = $_POST['neighborhood_head'];
    $head_phone = $_POST['neighborhood_head_phone'];
    $assistant_governor = $_POST['assistant_governor'];
    $assistant_governor_phone = $_POST['assistant_governor_phone'];
    $youth_leader = $_POST['youth_leader'];
    $youth_leader_phone = $_POST['youth_leader_phone'];
    $womens_activist = $_POST['womens_activist'];
    $womens_activist_phone = $_POST['womens_activist_phone'];
    $tax_inspector = $_POST['tax_inspector'];
    $tax_inspector_phone = $_POST['tax_inspector_phone'];
    $social_employe = $_POST['social_employe'];
    $social_employe_phone = $_POST['social_employe_phone'];
    $head_iiv = $_POST['head_iiv'];
    $head_iiv_phone = $_POST['head_iiv_phone'];
    $head_fvv = $_POST['head_fvv'];
    $head_fvv_phone = $_POST['head_fvv_phone'];

    $LastId = null;
    $success = true;

    if ($RowId != "0") {
        // UPDATE (kept as before but consider prepared statements)
        $updquery = "UPDATE hr.neighborhoods SET
            structure_id = '{$structure_id}',
            district = '{$district}',
            name = '{$name}',
            head = '{$head}',
            head_phone = '{$head_phone}',
            assistant_governor = '{$assistant_governor}',
            assistant_governor_phone = '{$assistant_governor_phone}',
            youth_leader = '{$youth_leader}',
            youth_leader_phone = '{$youth_leader_phone}',
            womens_activist = '{$womens_activist}',
            womens_activist_phone = '{$womens_activist_phone}',
            tax_inspector = '{$tax_inspector}',
            tax_inspector_phone = '{$tax_inspector_phone}',
            social_employe = '{$social_employe}',
            social_employe_phone = '{$social_employe_phone}',
            head_iiv = '{$head_iiv}',
            head_iiv_phone = '{$head_iiv_phone}',
            head_fvv = '{$head_fvv}',
            head_fvv_phone = '{$head_fvv_phone}'
            WHERE id = {$RowId}";
        $sql->query($updquery);
        if ($sql->error() == "") {
            $status = "ok";
            $res = json_encode(['status' => $status, 'rowid' => MyPiCrypt($RowId)]);
        } else {
            $res = $sql->error();
            $success = false;
        }
    } else {
        // FIXED INSERT: removed trailing comma after column list and added missing commas/quotes in VALUES
        $insquery = "INSERT INTO hr.neighborhoods (
                structure_id,
                district,
                name,
                head,
                head_phone,
                assistant_governor,
                assistant_governor_phone,
                youth_leader,
                youth_leader_phone,
                womens_activist,
                womens_activist_phone,
                tax_inspector,
                tax_inspector_phone,
                social_employe,
                social_employe_phone,
                head_iiv,
                head_iiv_phone,
                head_fvv,
                head_fvv_phone
            ) VALUES (
                '{$structure_id}',
                '{$district}',
                '{$name}',
                '{$head}',
                '{$head_phone}',
                '{$assistant_governor}',
                '{$assistant_governor_phone}',
                '{$youth_leader}',
                '{$youth_leader_phone}',
                '{$womens_activist}',
                '{$womens_activist_phone}',
                '{$tax_inspector}',
                '{$tax_inspector_phone}',
                '{$social_employe}',
                '{$social_employe_phone}',
                '{$head_iiv}',
                '{$head_iiv_phone}',
                '{$head_fvv}',
                '{$head_fvv_phone}'
            )";
        $sql->query($insquery);

          if ($sql->error() == "") {
            $status = "ok";
            $res = json_encode(['status' => $status]);
        } else {
            $res = $sql->error();
            $success = false;
        }
    }
    break;


    case "del_neighborhood":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.neighborhoods WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// dneighborhood crud ============        










    
 /// embassy_objects crud ============        
    case "get_embassy_objects":
            $RowId = MyPiDeCrypt($_GET['rowid']);

            $query = "SELECT t.* from hr.embassy_objects t where t.id = {$RowId}";
            $sql->query($query);
            $result = $sql->fetchAssoc();
            $result['rowid'] = MyPiCrypt($result['id']);

            $res = json_encode($result);
            break;


    case "act_embassy_objects":
        $RowId = (!empty($_POST['id'])) ? $_POST['id'] : 0;

            // ─────────────────────────────
          $photo = null;

            if (!empty($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
                $file = $_FILES['photo'];
                $uploadDir = 'pictures/embassy/';

                $newFileName = uniqid('embassy_', true) . '.' . pathinfo($file['name'], PATHINFO_EXTENSION);
                $uploadFile = $uploadDir . $newFileName;

                if (move_uploaded_file($file['tmp_name'], $uploadFile)) {
                    $photo = $newFileName;
                }
            }
                

        $structure_id = $_POST['structure_id'];
        $district = $_POST['district'];
        $type_id = $_POST['obj_type'];
        $lat = $_POST['obj_lat'];
        $long = $_POST['obj_long'];
        $name = $_POST['obj_name'];
        $responsible_id = $_POST['responsible_id'];
        $post_phone = $_POST['post_phone'];
        $structure_phone = $_POST['structure_phone'];
        $prevention_inspector = $_POST['prevention_inspector'];
        $inspector_phone = $_POST['inspector_phone'];
        $territorial_iib = $_POST['territorial_iib'];
        $iib_phone = $_POST['iib_phone'];
        $address = $_POST['obj_address'];
     
        $LastId = null;
        $success = true;

        if ($RowId != "0") {
              // agar yangi rasm bo‘lmasa — eskisini olib qolamiz
            if ($photo === null) {
                $sql->query("SELECT photo FROM hr.embassy_objects WHERE id = {$RowId}");
                $old = $sql->fetchAssoc();
                $photo = $old['photo'] ?? null;
            }
            $updquery = "UPDATE hr.embassy_objects SET
                structure_id = '{$structure_id}',
                district = '{$district}',
                name = '{$name}',
                type_id = '{$type_id}',
                lat = '{$lat}',
                long = '{$long}',
                post_phone = '{$post_phone}',
                photo = " . ($photo ? "'{$photo}'" : "NULL") . ",
                address = '{$address}',
                responsible_id = '{$responsible_id}',
                military_unit_phone = '{$structure_phone}',
                iiv_inspector = '{$prevention_inspector}',
                iiv_inspector_phone = '{$inspector_phone}',
                iiv_unit = '{$territorial_iib}',
                iiv_unit_phone = '{$iib_phone}'
              
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $status = 0;
                $res = json_encode(['status' => $status, 'rowid' => MyPiCrypt($RowId)]);
            } else {
                $res = $sql->error();
                $success = false;
            }
        } else {
            // FIXED INSERT: removed trailing comma after column list and added missing commas/quotes in VALUES
            $insquery = "INSERT INTO hr.embassy_objects (
                    structure_id,
                    district,
                    name,
                    type_id,
                    lat,
                    long,
                    post_phone,
                    photo,
                    address,
                    responsible_id,
                    military_unit_phone,
                    iiv_inspector,
                    iiv_inspector_phone,
                    iiv_unit,
                    iiv_unit_phone
                  
                ) VALUES (
                    '{$structure_id}',
                    '{$district}',
                    '{$name}',
                    '{$type_id}',
                    '{$lat}',
                    '{$long}',
                    '{$post_phone}',
                    '{$photo}',
                    '{$address}',
                    '{$responsible_id}',
                    '{$structure_phone}',
                    '{$prevention_inspector}',
                    '{$inspector_phone}',
                    '{$territorial_iib}',
                    '{$iib_phone}'
                    
                )";
            $sql->query($insquery);

            if ($sql->error() == "") {
                $status = 0;
                $res = json_encode(['status' => $status]);
            } else {
                $res = $sql->error();
                $success = false;
            }
        }
        break;


        case "del_embassy_objects":
            $RowId = MyPiDeCrypt($_GET['rowid']);

            $query = "DELETE FROM hr.embassy_objects WHERE id = {$RowId}";
            $sql->query($query);
            $result = $sql->fetchAssoc();

            if ($sql->error() == "") {
                $res = 0;
            } else {
                $res = 2;
            }
            break;
    /// embassy_objects crud ============        



    /// embassy_objects_camera crud ============        
        case "get_embassy_objects_camera":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.embassy_objects_camera t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);
        $res = json_encode($result);
        break;

    case "act_embassy_objects_camera":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $object_id = $_POST['object_id'];
        $name = $_POST['name'];
        $cam_code = $_POST['cam_code'];
        $is_ptz = $_POST['is_ptz'];
        $lat = isset($_POST['lat']) ? $_POST['lat'] : null;
        $long = isset($_POST['long']) ? $_POST['long'] : null;

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.embassy_objects_camera SET
                object_id = '{$object_id}',
                name = '{$name}',
                cam_code = '{$cam_code}',
                is_ptz = '{$is_ptz}',
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
            $insquery = "INSERT INTO hr.embassy_objects_camera (
                    object_id,
                    name,
                    cam_code,
                    is_ptz,
                    lat,
                    long
                ) VALUES (
                    '{$object_id}',
                    '{$name}',
                    '{$cam_code}',
                    '{$is_ptz}',
                    '{$lat}',
                    '{$long}'
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.embassy_objects_camera_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_embassy_objects_camera":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.embassy_objects_camera WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// embassy_objects_camera crud ============        




    
    /// embassy_objects_responsible crud ============        
    case "get_embassy_objects_responsible":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.duty_embassy t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);
        $res = json_encode($result);
        break;

    case "act_embassy_objects_responsible":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $object_id = $_POST['object_id'];
        $structure_id = $_POST['structure_id'];
        $staff_id = $_POST['staff_id'];
        $date = $_POST['date'];

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.duty_embassy SET
                structure_id = '{$structure_id}',
                date = '{$date}',
                staff_id = '{$staff_id}',
                object_id = '{$object_id}'
              
                WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert new record
            $insquery = "INSERT INTO hr.duty_embassy (
                    structure_id,
                    date,
                    staff_id,
                    object_id
                  
                ) VALUES (
                    '{$structure_id}',
                    '{$date}',
                    '{$staff_id}',
                    '{$object_id}'
                    
                )";
            $sql->query($insquery);
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.duty_embassy_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_embassy_objects_responsible":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.duty_embassy WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// embassy_objects_responsible crud ============      






     /// criminals crud ============        
      case "get_criminals":

    $RowId = MyPiDeCrypt($_GET['rowid']);

    $query = "
        SELECT 
            c.* 
        FROM tur.criminals c
        WHERE c.id = {$RowId}
    ";
    $sql->query($query);
    $result = $sql->fetchAssoc();

    if ($result) {
        $result['rowid'] = MyPiCrypt($result['id']);
    }

    $res = json_encode($result);

    break;


   case "act_criminals":

    $RowId        = !empty($_POST['id']) ? $_POST['id'] : 0;
    $region_id    = $_POST['region_id'];
    $violation_id = $_POST['violation_id'];
    $date         = $_POST['date'];
   
    $fio          = $_POST['fio'];
    $comment      = $_POST['comment'];

    // 🔥 NULL handling (agar bo‘sh kelsa)
    $fio     = ($fio === '' || $fio === 'null') ? null : $fio;
    $comment = ($comment === '' || $comment === 'null') ? null : $comment;

    $fioSql     = $fio === null ? "NULL" : "'{$fio}'";
    $commentSql = $comment === null ? "NULL" : "'{$comment}'";

    if ($RowId != "0") {

        // 🔄 UPDATE
        $updquery = "
            UPDATE tur.criminals SET
                region_id    = '{$region_id}',
                violation_id = '{$violation_id}',
                date         = '{$date}',
           
                fio          = {$fioSql},
                comment      = {$commentSql}
            WHERE id = {$RowId}
        ";
        $sql->query($updquery);

        if ($sql->error() == "") {
            $res = "0<&sep&>" . MyPiCrypt($RowId);
        } else {
            $res = $sql->error();
        }

    } else {

        // ➕ INSERT
        $insquery = "
            INSERT INTO tur.criminals (
                region_id,
                violation_id,
                date,
              
                fio,
                comment
            ) VALUES (
                '{$region_id}',
                '{$violation_id}',
                '{$date}',
              
                {$fioSql},
                {$commentSql}
            )
        ";
        $sql->query($insquery);

        if ($sql->error() == "") {
            $sql->query("SELECT CURRVAL('tur.criminals_id_seq') AS last_id");
            $result = $sql->fetchAssoc();
            $LastId = $result['last_id'];

            $res = "0<&sep&>" . MyPiCrypt($LastId);
        } else {
            $res = $sql->error();
        }
    }

    break;


   case "del_criminals":

    $RowId = MyPiDeCrypt($_GET['rowid']);

    $query = "DELETE FROM tur.criminals WHERE id = {$RowId}";
    $sql->query($query);

    if ($sql->error() == "") {
        $res = 0;
    } else {
        $res = 2;
    }

    break;

    /// criminals crud ============    







    /// administrative_offenses crud ============        
    case "get_administrative_offences":

    $RowId = MyPiDeCrypt($_GET['rowid']);

    $query = "
        SELECT 
            c.* 
        FROM tur.administrativ c
        WHERE c.id = {$RowId}
    ";
    $sql->query($query);
    $result = $sql->fetchAssoc();

    if ($result) {
        $result['rowid'] = MyPiCrypt($result['id']);
    }

    $res = json_encode($result);

    break;


   case "act_administrative_offences":

    $RowId        = !empty($_POST['id']) ? $_POST['id'] : 0;
    $region_id    = $_POST['region_id'];
    $violation_id = $_POST['violation_id'];
    $date         = $_POST['date'];
   
    $fio          = $_POST['fio'];
    $comment      = $_POST['comment'];

    // 🔥 NULL handling (agar bo‘sh kelsa)
    $fio     = ($fio === '' || $fio === 'null') ? null : $fio;
    $comment = ($comment === '' || $comment === 'null') ? null : $comment;

    $fioSql     = $fio === null ? "NULL" : "'{$fio}'";
    $commentSql = $comment === null ? "NULL" : "'{$comment}'";

    if ($RowId != "0") {

        // 🔄 UPDATE
        $updquery = "
            UPDATE tur.administrativ SET
                region_id    = '{$region_id}',
                violation_id = '{$violation_id}',
                date         = '{$date}',
           
                fio          = {$fioSql},
                comment      = {$commentSql}
            WHERE id = {$RowId}
        ";
        $sql->query($updquery);

        if ($sql->error() == "") {
            $res = "0<&sep&>" . MyPiCrypt($RowId);
        } else {
            $res = $sql->error();
        }

    } else {

        // ➕ INSERT
        $insquery = "
            INSERT INTO tur.administrativ (
                region_id,
                violation_id,
                date,
              
                fio,
                comment
            ) VALUES (
                '{$region_id}',
                '{$violation_id}',
                '{$date}',
              
                {$fioSql},
                {$commentSql}
            )
        ";
        $sql->query($insquery);

        if ($sql->error() == "") {
            $sql->query("SELECT CURRVAL('tur.administrativ_id_seq') AS last_id");
            $result = $sql->fetchAssoc();
            $LastId = $result['last_id'];

            $res = "0<&sep&>" . MyPiCrypt($LastId);
        } else {
            $res = $sql->error();
        }
    }

    break;


   case "del_administrative_offences":

    $RowId = MyPiDeCrypt($_GET['rowid']);

    $query = "DELETE FROM tur.administrativ WHERE id = {$RowId}";
    $sql->query($query);

    if ($sql->error() == "") {
        $res = 0;
    } else {
        $res = 2;
    }

    break;
    /// administrative_offenses crud ============    



/// injuries crud ============
    case "get_injury":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT i.* 
                FROM hr.injuries i 
                WHERE i.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($result) {
            $result['rowid'] = MyPiCrypt($result['id']);
        }

        $res = json_encode($result);
        break;


    case "act_injury":
        $RowId          = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $injury_type_id = $_POST['injury_type_id'];
        $comment        = $_POST['comment'];
        $date           = $_POST['date'];
        $structure_id   = (!empty($_POST['structure_id'])) ? $_POST['structure_id'] : 0;
        $troops_id      = $_POST['troops_id'];
        $region_id = $_POST['region_id'];
        if ($RowId != "0") {
            // 🔄 UPDATE
            $updquery = "UPDATE hr.injuries SET
                injury_type_id = '{$injury_type_id}',
                comment        = '{$comment}',
                date           = '{$date}',
                structure_id   = '{$structure_id}',
                region_id = '{$region_id}',
                troops_id      = '{$troops_id}'
            WHERE id = {$RowId}";

            $sql->query($updquery);

            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }

        } else {
            // ➕ INSERT
            $insquery = "INSERT INTO hr.injuries (   
               region_id, 
                injury_type_id,
                comment,
                date,
                structure_id,
                troops_id
            ) VALUES (
                '{$region_id}',
                '{$injury_type_id}',
                '{$comment}',
                '{$date}',
                '{$structure_id}',
                '{$troops_id}'
            )";

            $sql->query($insquery);

            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.injuries_id_seq') AS last_id");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];

                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;


    case "del_injury":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.injuries WHERE id = {$RowId}";
        $sql->query($query);

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// injuries crud ============










    /// duty_part_camera crud ============        
    case "get_duty_part_camera":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from hr.duty_part_cameras t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);
        $res = json_encode($result);
        break;

    case "act_duty_part_camera":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $object_id = MyPiDeCrypt($_POST['object_id']);
        $name = $_POST['name'];
        $cam_code = $_POST['cam_code'];
        $is_ptz = $_POST['is_ptz'];
       
        // echo '<pre>';
		// print_r($object_id);
		// echo '</pre>';
		// die();

        if ($RowId != "0") {
            // Update existing record
            $updquery = "UPDATE hr.duty_part_cameras SET
                structure_id = '{$object_id}',
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
            $insquery = "INSERT INTO hr.duty_part_cameras (
                    structure_id,
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
                $sql->query("SELECT CURRVAL('hr.duty_part_cameras_id_seq') AS last_id;");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        break;

    case "del_duty_part_camera":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM hr.duty_part_cameras WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;

  
    /// duty_part_camera crud ============        


  
    // /// public_event_camera crud ============        

        /// public_event_camera crud ============        
      case "get_public_event_cameras":
        $RowId = MyPiDeCrypt($_GET['rowid']);
        $query = "SELECT t.* from hr.public_event_cameras t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "public_event_cameras":
        $RowId = (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        
        // object_id kriptlanmagan, oddiy raqam
        $event_id = (int)$_POST['object_id'];
        
        // Oddiy himoya
        $name = str_replace("'", "''", $_POST['name'] ?? '');
        $cam_code = str_replace("'", "''", $_POST['cam_code'] ?? '');
        
        // 🔥 Muhim o'zgartirish: 1/0 ni boolean ga aylantirish
        $is_ptz_bool = ($_POST['is_ptz'] ?? 0) == 1 ? 'true' : 'false';

        if ($RowId > 0) {
            // Update
            $updquery = "UPDATE hr.public_event_cameras SET
                event_id = {$event_id},
                name = '{$name}',
                cam_code = '{$cam_code}',
                is_ptz = {$is_ptz_bool}
                WHERE id = {$RowId}";
            $sql->query($updquery);
            
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            // Insert
            $insquery = "INSERT INTO hr.public_event_cameras (
                event_id, name, cam_code, is_ptz
            ) VALUES (
                {$event_id}, '{$name}', '{$cam_code}', {$is_ptz_bool}
            )";
            $sql->query($insquery);
            
            if ($sql->error() == "") {
                $sql->query("SELECT CURRVAL('hr.public_event_cameras_id_seq') AS last_id");
                $result = $sql->fetchAssoc();
                $LastId = $result['last_id'];
                $res = "0<&sep&>" . MyPiCrypt($LastId);
            } else {
                $res = $sql->error();
            }
        }
        echo $res;
        break;

    // case "del_public_event_cameras":
    //     $RowId = MyPiDeCrypt($_GET['rowid']);
    //     $query = "DELETE FROM hr.public_event_cameras WHERE id = {$RowId}";
    //     $sql->query($query);
    //     echo ($sql->error() == "") ? 0 : 2;
    //     break;
        case "del_public_event_cameras":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        // Xavfsizlik uchun int ga o'tkazamiz
        $RowId = (int)$RowId;

        if ($RowId <= 0) {
            echo 2;
            exit;
        }

        $query = "DELETE FROM hr.public_event_cameras WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
    /// public_event_camera crud ============  










    }

echo $res;