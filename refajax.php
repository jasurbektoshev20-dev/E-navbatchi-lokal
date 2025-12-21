<?php
define('ARM_IN', true);
require_once("includes/error_reporting.php");
require_once("includes/constants.php");
require_once("includes/dbphpbb.php");
require_once("includes/functions.php");
require_once("includes/sessions.php");
require_once("includes/check.php");

if ($user_data == 0) {
    print "<script> if (window.parent.parent) win=window.parent.parent; else win=window.parent; win.location.href='login.php'; </script>";
    exit;
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

foreach ($_POST as $ind => $val) {
    $_POST[$ind] = MyEscapeSymbols($val);
}

require_once("includes/set_language.php");
$Access = $_SESSION['objects'];
$Action = $_GET['act'];

$sql->query('SELECT name' . $slang . ' AS name, keyword from bcms.s_dictionary');
$Dictionary = $sql->fetchAll();
foreach ($Dictionary as $id => $value) {
    $Dict[$value['keyword']] = $value['name'];
}

$SessUserId = $_SESSION['userid'];
switch ($Action) {
        /// ref_car_models ---<<Автомобил моделлари>>---=========================================================
    case "get_ref_car_models":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* 
						

	from ref.car_models t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_ref_car_models":

        //$RowId	= (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $name    = $_POST['name'];
        $photo    = $_POST['photo'];
        $car_width    = $_POST['car_width'];
        $car_height    = $_POST['car_height'];
        if ($RowId != "0") {
            $updquery = "UPDATE ref.car_models set 

name = '{$name}'

,photo = '{$photo}'

,car_width = '{$car_width}'

,car_height = '{$car_height}'

			WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount
		FROM 	ref.car_models t 
		WHERE 	0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into ref.car_models (
										name
								,photo
								,car_width
								,car_height
						) values (
										'{$name}'
								,'{$photo}'
								,'{$car_width}'
								,'{$car_height}'
						)";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('ref.car_models_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];
                    if (!empty($_FILES)) {
                        $targetPath = $_SERVER['DOCUMENT_ROOT'] . "/_files/_ref_car_models";

                        if (!file_exists($targetPath . '/' . $DocId)) {
                            mkdir($targetPath . '/' . $DocId, 0777, true);
                        }

                        $tempFile = $_FILES['photo']['tmp_name'];
                        $targetFile =  str_replace('//', '/', $targetPath . "/" . $LastId);

                        $FileName = get_in_translate_to_en($_FILES['photo']['name']);

                        $FileArr = explode(".", $FileName);
                        $FileType = $FileArr[1];

                        $targetFile .= "/" . $FileName;

                        if (move_uploaded_file($_FILES['photo']['tmp_name'], $targetFile)) {
                            $query = "update ref.car_models set photo = '{$FileName}' where id = {$LastId}";
                            $sql->query($query);
                            $res = 0;
                        }
                    }

                    $res = "0<&sep&>" . MyPiCrypt($LastId);
                } else {
                    $res = $sql->error();
                }
            } else {
                $res = 1;
            }
        }
        break;

    case "del_ref_car_models":
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
        /// ref_car_models ---<<Автомобил моделлари>>---=========================================================



        /// ref_gps_model_type ---<>---=========================================================
    case "get_ref_gps_model_type":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* 
				

from ref.gps_model_type t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_ref_gps_model_type":

        //$RowId	= (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $name1    = $_POST['name1'];
        $name2    = $_POST['name2'];
        $name3    = $_POST['name3'];
        if ($RowId != "0") {
            $updquery = "UPDATE ref.gps_model_type set 

name1 = '{$name1}'

,name2 = '{$name2}'

,name3 = '{$name3}'

		WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount
	FROM 	ref.gps_model_type t 
	WHERE 	0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into ref.gps_model_type (
									name1
							,name2
							,name3
					) values (
									'{$name1}'
							,'{$name2}'
							,'{$name3}'
					)";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('ref.gps_model_type_id_seq') AS last_id;");
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

    case "del_ref_gps_model_type":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM ref.gps_model_type WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// ref_gps_model_type ---<>---=========================================================


        /// ref_marker_icons ---<<Белгилаш нуқталари белгилари>>---=========================================================
    case "get_ref_marker_icons":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* 
					

FROM ref.marker_icons t WHERE t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_ref_marker_icons":
        $JsonArr = array();
        //$RowId	= (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $name1    = $_POST['name1'];
        $name2    = $_POST['name2'];
        $name3    = $_POST['name3'];
        $photo    = $_POST['photo'];

        if ($RowId != "0") {
            $req_uri = $_SERVER['REQUEST_URI'];
            $startIndex = strpos($req_uri, "_") + 5;
            $endIndex = strpos($req_uri, "&") !== false ? strpos($req_uri, "&") : strlen($req_uri);
            $substring = 'ref.' . substr($req_uri, $startIndex, $endIndex - $startIndex);

            $query  = "SELECT id FROM bcms.forms
			where tablename = '{$substring}'";
            $sql->query($query);
            $FormId = $sql->fetchAssoc();
            $FormId = $FormId['id'];
            ActionLog($RowId, $FormId, 3);
            $updquery = "UPDATE ref.marker_icons set 
name1 = '{$name1}'
,name2 = '{$name2}'
,name3 = '{$name3}'
,photo = '{$photo}'
		WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = 0;
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount
	FROM 	ref.marker_icons t 
	WHERE 	0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $req_uri = $_SERVER['REQUEST_URI'];
                $startIndex = strpos($req_uri, "_") + 5;
                $endIndex = strpos($req_uri, "&") !== false ? strpos($req_uri, "&") : strlen($req_uri);
                $substring = 'ref.' . substr($req_uri, $startIndex, $endIndex - $startIndex);

                $query  = "SELECT id FROM bcms.forms
			where tablename = '{$substring}'";
                $sql->query($query);
                $FormId = $sql->fetchAssoc();
                $FormId = $FormId['id'];
                ActionLog($RowId, $FormId, 2);
                $insquery = "INSERT into ref.marker_icons (
							name1
							,name2
							,name3
							,photo
					) values (
									'{$name1}'
							,'{$name2}'
							,'{$name3}'
							,'{$photo}'
					)";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('ref.marker_icons_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $selquery  = "SELECT 
																				name1
																									,name2
																									,name3
																									,photo
													

		from ref.marker_icons t where t.id = {$LastId}";
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

    case "del_ref_marker_icons":
        $RowId = MyPiDeCrypt($_GET['rowid']);
        $req_uri = $_SERVER['REQUEST_URI'];
        $startIndex = strpos($req_uri, "_") + 5;
        $endIndex = strpos($req_uri, "&") !== false ? strpos($req_uri, "&") : strlen($req_uri);
        $substring = 'ref.' . substr($req_uri, $startIndex, $endIndex - $startIndex);

        $query  = "SELECT id FROM bcms.forms
			where tablename = '{$substring}'";
        $sql->query($query);
        $FormId = $sql->fetchAssoc();
        $FormId = $FormId['id'];
        ActionLog($RowId, $FormId, 4);

        $query = "DELETE FROM ref.marker_icons WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// ref_marker_icons ---<<Белгилаш нуқталари белгилари>>---=========================================================


        /// ref_substances ---<<МЖТК моддалари>>---=========================================================
    case "get_ref_substances":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* 
					

	FROM ref.substances t WHERE t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_ref_substances":
        $JsonArr = array();
        //$RowId	= (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $name1    = $_POST['name1'];
        $name2    = $_POST['name2'];
        $name3    = $_POST['name3'];

        if ($RowId != "0") {
            $updquery = "UPDATE ref.substances set 
name1 = '{$name1}'
,name2 = '{$name2}'
,name3 = '{$name3}'
			WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = 0;
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount
		FROM 	ref.substances t 
		WHERE 	0=1");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into ref.substances (
								name1
								,name2
								,name3
						) values (
								'{$name1}'
								,'{$name2}'
								,'{$name3}'
						)";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('ref.substances_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $selquery  = "SELECT 
									name1
									,name2
									,name3
														

			from ref.substances t where t.id = {$LastId}";
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

    case "del_ref_substances":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM ref.substances WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// ref_substances ---<<МЖТК моддалари>>---=========================================================

        /// ref_regions ---<<Ҳудудлар>>---=========================================================
    case "get_ref_regions":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from ref.regions t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_ref_regions":

        //$RowId	= (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $name1    = $_POST['name1'];
        $name2    = $_POST['name2'];
        $name3    = $_POST['name3'];
        $shortname1    = $_POST['shortname1'];
        $shortname2    = $_POST['shortname2'];
        $shortname3    = $_POST['shortname3'];
        $code    = $_POST['code'];
        $region_code    = $_POST['region_code'];
        $longtitude    = $_POST['longtitude'];
        $latitude    = $_POST['latitude'];
        $zoom    = $_POST['zoom'];
        if ($RowId != "0") {
            $updquery = "UPDATE ref.regions set 
							name1 = '{$name1}'
							,name2 = '{$name2}'
							,name3 = '{$name3}'
							,shortname1 = '{$shortname1}'
							,shortname2 = '{$shortname2}'
							,shortname3 = '{$shortname3}'
							,code = '{$code}'
							,region_code = '{$region_code}'
							,longtitude = '{$longtitude}'
							,latitude = '{$latitude}'
							,zoom = '{$zoom}'
							WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = "0<&sep&>" . MyPiCrypt($RowId);
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount
		FROM 	ref.regions t 
		WHERE 			region_code	= '{$region_code}'");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into ref.regions (
								 name1
								,name2
								,name3
								,shortname1
								,shortname2
								,shortname3
								,code
								,region_code
								,longtitude
								,latitude
								,zoom
						) values (
										'{$name1}'
								,'{$name2}'
								,'{$name3}'
								,'{$shortname1}'
								,'{$shortname2}'
								,'{$shortname3}'
								,'{$code}'
								,'{$region_code}'
								,'{$longtitude}'
								,'{$latitude}'
								,'{$zoom}'
						)";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('ref.regions_id_seq') AS last_id;");
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

    case "del_ref_regions":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM ref.regions WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// ref_regions ---<<Ҳудудлар>>---=========================================================

        /// ref_distcity ---<<Туман ва шаҳарлар>>---=========================================================
    case "get_ref_distcity":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT t.* from ref.distcity t where t.id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_ref_distcity":
        $JsonArr = array();
        //$RowId	= (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;
        $region_id    = $_POST['region_id'];
        $name1    = $_POST['name1'];
        $name2    = $_POST['name2'];
        $name3    = $_POST['name3'];
        $code    = $_POST['code'];
        $correction    = $_POST['correction'];

        if ($RowId != "0") {
            $updquery = "UPDATE ref.distcity set 
region_id = '{$region_id}'
,name1 = '{$name1}'
,name2 = '{$name2}'
,name3 = '{$name3}'
,code = '{$code}'
,correction = '{$correction}'
			WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                if (count($JsonArr) > 0) {
                    subJSONTable($RowId, $FormId, $JsonArr, $AppNum);
                }
                $res = 0;
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount
		FROM 	ref.distcity t 
		WHERE 			name1	= '{$name1}'");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into ref.distcity (
										region_id
								,name1
								,name2
								,name3
								,code
								,correction
						) values (
										'{$region_id}'
								,'{$name1}'
								,'{$name2}'
								,'{$name3}'
								,'{$code}'
								,'{$correction}'
						)";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('ref.distcity_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $selquery  = "SELECT 
																					(select name1 from ref.regions s where s.id = t.region_id limit 1) as region_id
																										,name1
																										,name2
																										,name3
																										,code
																										,correction
														

			from ref.distcity t where t.id = {$LastId}";
                    $sql->query($selquery);
                    $SelResult = $sql->fetchAssoc();
                    if (count($JsonArr) > 0) {
                        subJSONTable($LastId, $FormId, $JsonArr, $AppNum);
                    }

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

    case "del_ref_distcity":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM ref.distcity WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// ref_distcity ---<<Туман ва шаҳарлар>>---=========================================================

        /// bcms_s_dictionary ---<<Луғат>>---=========================================================
    case "get_bcms_s_dictionary":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "SELECT * from bcms.s_dictionary where id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();
        $result['rowid'] = MyPiCrypt($result['id']);

        $res = json_encode($result);
        break;

    case "act_bcms_s_dictionary":
        //$RowId	= (!empty($_POST['id'])) ? MyPiDeCrypt($_POST['id']) : 0;
        $RowId    = (!empty($_POST['id'])) ? $_POST['id'] : 0;

        $name1    = $_POST['name1'];
        $name2    = $_POST['name2'];
        $name3    = $_POST['name3'];
        $keyword    = $_POST['keyword'];

        if ($RowId != "0") {
            $updquery = "UPDATE bcms.s_dictionary set 
						 name1 = '{$name1}'
						,name2 = '{$name2}'
						,name3 = '{$name3}'
						,keyword = '{$keyword}'
			WHERE id = {$RowId}";
            $sql->query($updquery);
            if ($sql->error() == "") {
                $res = 0;
            } else {
                $res = $sql->error();
            }
        } else {
            $sql->query("SELECT count(*) ccount
						FROM 	bcms.s_dictionary t 
						WHERE name1	= '{$name1}'
						AND keyword	= '{$keyword}'");
            $isNotNew = $sql->fetchAssoc();
            if ($isNotNew['ccount'] == 0) {
                $insquery = "INSERT into bcms.s_dictionary (
 								name1
								,name2
								,name3
								,keyword
						) values (
								'{$name1}'
								,'{$name2}'
								,'{$name3}'
								,'{$keyword}')";

                $sql->query($insquery);
                if ($sql->error() == "") {
                    $sql->query("SELECT CURRVAL('bcms.s_dictionary_id_seq') AS last_id;");
                    $result = $sql->fetchAssoc();
                    $LastId = $result['last_id'];

                    $selquery = "SELECT 
								 name1
								,name2
								,name3
								,keyword
								from bcms.s_dictionary t where t.id = {$LastId}";
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

    case "del_bcms_s_dictionary":
        $RowId = MyPiDeCrypt($_GET['rowid']);

        $query = "DELETE FROM bcms.s_dictionary WHERE id = {$RowId}";
        $sql->query($query);
        $result = $sql->fetchAssoc();

        if ($sql->error() == "") {
            $res = 0;
        } else {
            $res = 2;
        }
        break;
        /// bcms_s_dictionary ---<<Луғат>>---=========================================================


}
echo $res;
