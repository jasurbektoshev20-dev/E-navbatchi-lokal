<?php

use BcMath\Number;

define('ARM_IN', true);
require_once("includes/all_includes.php");
require_once("includes/DB.php");
require_once("includes/set_language.php");

if (count($_REQUEST) > 0) {
	$SQLCommands = array('select', 'drop', 'concat', 'union', ' and', ' or', 'database', 'null', 'benchmark', 'load_file');

	foreach ($SQLCommands as $sInd => $sVal) {
		foreach ($_REQUEST as $ind => $val) {
			if (strpos(strtolower($val), $sVal) > 0) {
				$_REQUEST[$ind] = 0;
			}
		}
	}
}

$Action = $_GET['act'];

foreach ($_POST as $ind => $val) {
	$_POST[$ind] = MyEscapeSymbols($val);
}
$NowHour = date('H:i');
$Hour09 = '08:00';
$Hour20 = '20:00';
$Hour23 = '23:59';
$Hour00 = '00:00';
switch ($Action) {
	case "get_cars":
		$region = isset($_GET['region']) ? $_GET['region'] : 0;
		$tcid = isset($_GET['tcid']) ? $_GET['tcid'] : 0;

		$query = "SELECT 
			cr.id AS car_id,
			uzg.tp_timestamp_fmt AS date,
			uzg.angle,
			uzg.lat,
			uzg.lon,
			uzg.speed,
			cm.name AS car_name,
			cm.photo AS car_photo,
			cm.car_width,
			cm.car_height
		FROM reports.uzgps uzg
		INNER JOIN hr.tech_guard_cars cr ON cr.uzgps_id = uzg.mobject_id
		LEFT JOIN hr.structure s ON s.id = cr.structure_id
		LEFT JOIN ref.car_models cm ON cm.id = cr.car_model_id
		WHERE 1=1 ";

		if ($UserStructure != 1 &&  $UserStructure < 20) {
			$query .= " AND s.parent = {$UserStructure}";
		}
		if ($UserStructure > 999) {
			$query .= " AND s.id = {$UserStructure}";
		}

		if ($region > 0) {
			$query .= " AND s.parent = {$region}";
		}

		$query .= "order by uzg.speed asc";

		$sql->query($query);
		$Tracks = $sql->fetchAll();

		// echo '<pre>';
		// print_r($Moto2);
		// echo '</pre>';
		// die();
		$res = json_encode($Tracks);
		break;

	case "get_distcity_by_id";
		$id = isset($_GET['id']) ? $_GET['id'] : 0;

		if ($id == 0) {
			$query = "SELECT id, name{$slang} as name FROM hr.structure where id > 999 order by id";
			$sql->query($query);
			$Distcity = $sql->fetchAll();
		} else {
			$query = "SELECT id, name{$slang} as name FROM hr.structure where parent = {$id} order by id";
			$sql->query($query);
			$Distcity = $sql->fetchAll();
		}

		$res = json_encode($Distcity);

		// echo '<pre>';
		// print_r($result);
		// echo '</pre>';
		// die();
		break;
	case "get_object_by_id";
		$id = isset($_GET['id']) ? $_GET['id'] : 1;

		if ($id == 0) {
			$query = "SELECT t.id, t.name{$slang} as name FROM hr.jts_objects t
			left join hr.structure s on s.id = t.structure where 1=1 ";
			if ($UserStructure != 1 &&  $UserStructure < 20) {
				$query .= " AND s.parent = {$UserStructure} order by t.id";
			}
			$sql->query($query);
			$data = $sql->fetchAll();
		} else {
			$query = "SELECT id, name{$slang} as name FROM hr.jts_objects where type = {$id} order by id";
			$query = "SELECT t.id, t.name{$slang} as name FROM hr.jts_objects t
			left join hr.structure s on s.id = t.structure where 1=1";
			if ($UserStructure != 1 &&  $UserStructure < 20) {
				$query .= " AND s.parent = {$UserStructure} order by t.id";
			}
			$sql->query($query);
			$data = $sql->fetchAll();
		}

		// echo '<pre>';
		// print_r($data);
		// echo '</pre>';
		// die();

		$res = json_encode($data);
		break;

	case "get_crime_by_type":
		$id = isset($_GET['region']) ? $_GET['region'] : 0;
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		if ($id == 0) {
			$query = "SELECT ty.shortname{$slang} as name, count(t.id) as value FROM tur.violations  t 
			LEFT JOIN tur.violation_types ty on ty.id = t.violation_type where 1=1";
			if ($date == 1) {
				$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
			} else if ($date == 2) {
				$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
			} else if ($date == 3) {
				$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
			}

			$query .= " group by ty.shortname{$slang} order by count(t.id) desc";
			$sql->query($query);
			$violations = $sql->fetchAll();
		} else {
			$query = "SELECT ty.shortname{$slang} as name, count(t.id) as value FROM tur.violations  t 
			LEFT JOIN tur.violation_types ty on ty.id = t.violation_type
			LEFT JOIN hr.v_head_structure hs on hs.id = t.region_id
			WHERE hs.id = {$id}";
			if ($date == 1) {
				$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
			} else if ($date == 2) {
				$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
			} else if ($date == 3) {
				$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
			}

			$query .= " group by ty.shortname{$slang} order by count(t.id) desc";
			$sql->query($query);
			$violations = $sql->fetchAll();
		}

		$res = json_encode($violations);
		break;
	case "get_crime_by_region":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query = "SELECT s.shortname{$slang} as name, count(t.id) as gcount FROM tur.violations t
		RIGHT JOIN hr.structure s on s.id = t.region_id
		where s.id < 16 and s.id > 1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}
		$query .= " group by s.shortname{$slang}, s.turn order by s.turn desc";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;
	case "get_object_types":
		$query = "SELECT s.shortname{$slang} as name, count(t.id) FROM hr.objects t
		LEFT JOIN hr.structure s on s.id = t.structure_id
		group by s.shortname{$slang}, s.turn order by s.turn desc";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;

	case "get_events_by_type":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query = "SELECT ty.name{$slang} as name, count(t.id) as value FROM tur.events t 
		LEFT JOIN tur.event_types ty on ty.id = t.type where 1=1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}

		$query .= " group by ty.name{$slang} order by count(t.id) desc";

		$sql->query($query);
		$events = $sql->fetchAll();

		$res = json_encode($events);
		break;
	// O'zim qoshimcha kiritgan joyim
	case "get_events_by_type1":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query = "SELECT ty.name{$slang} as name, count(t.id) as value FROM tur.events t 
		LEFT JOIN tur.event_types ty on ty.id = t.type where 1=1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}

		$query .= " group by ty.name{$slang} order by count(t.id) desc";

		$sql->query($query);
		$events = $sql->fetchAll();

		$res = json_encode($events);
		break;
	// O'zim qoshimcha kiritgan joyim tugashi
	case "all_events_by_type":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query  = "SELECT count(t.id) as events FROM tur.events t where 1=1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}
		$sql->query($query);
		$events = $sql->fetchAll();

		$query  = "SELECT count(t.id) as reyd_events FROM tur.reyd_events t where 1=1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}
		$sql->query($query);
		$reyd_events = $sql->fetchAll();

		$result['legend'] = [$Dict['mass_events'], $Dict['reyd_events']];
		$result['data'] = [$events[0]['events'], $reyd_events[0]['reyd_events']];

		$res = json_encode($result);
		break;
	case "get_events_by_region":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query = "SELECT s.shortname{$slang} as name, count(t.id) as gcount FROM tur.events  t
		RIGHT JOIN hr.structure s on s.id = t.region_id where s.id < 16 and s.id > 1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}
		$query .= " group by s.shortname{$slang}, s.turn order by s.turn asc";
		$sql->query($query);
		$events = $sql->fetchAll();

		$res = json_encode($events);
		break;


	// O'zgartirish kiritgan joyim boshi

	case "get_events_by_region1":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query = "SELECT s.shortname{$slang} as name, count(t.id) as gcount FROM tur.events  t
		RIGHT JOIN hr.structure s on s.id = t.region_id where s.id < 16 and s.id > 1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}
		$query .= " group by s.shortname{$slang}, s.turn order by s.turn asc";
		$sql->query($query);
		$events = $sql->fetchAll();

		$res = json_encode($events);
		break;



	case "get_events_by_region2":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query = "SELECT s.shortname{$slang} as name, count(t.id) as gcount FROM tur.events  t
		RIGHT JOIN hr.structure s on s.id = t.region_id where s.id < 16 and s.id > 1";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}
		$query .= " group by s.shortname{$slang}, s.turn order by s.turn asc";
		$sql->query($query);
		$events = $sql->fetchAll();

		$res = json_encode($events);
		break;

	case "get_duty":

    $RegId = isset($_GET['id']) ? intval($_GET['id']) : 1;
	$query = "SELECT 
			t.lastname,
			t.photo,
			t.phone,
			p.name{$slang} AS position,
			ra.shortname{$slang} AS role,
			1 AS staff_order
		FROM hr.duty_staff d
		JOIN hr.staff t ON t.id = d.staff1
		LEFT JOIN hr.positions p ON p.id = t.position_id
		LEFT JOIN ref.ranks ra ON ra.id = t.rank_id
		WHERE d.date = CURRENT_DATE AND d.structure_id = {$RegId}

		UNION ALL

		SELECT 
			t.lastname,
			t.photo,
			t.phone,
			p.name{$slang} AS position,
			ra.shortname{$slang} AS role,
			2 AS staff_order
		FROM hr.duty_staff d
		JOIN hr.staff t ON t.id = d.staff2
		LEFT JOIN hr.positions p ON p.id = t.position_id
		LEFT JOIN ref.ranks ra ON ra.id = t.rank_id
		WHERE d.date = CURRENT_DATE AND d.structure_id = {$RegId}

		UNION ALL

		SELECT 
			t.lastname,
			t.photo,
			t.phone,
			p.name{$slang} AS position,
			ra.shortname{$slang} AS role,
			3 AS staff_order
		FROM hr.duty_staff d
		JOIN hr.staff t ON t.id = d.staff3
		LEFT JOIN hr.positions p ON p.id = t.position_id
		LEFT JOIN ref.ranks ra ON ra.id = t.rank_id
		WHERE d.date = CURRENT_DATE AND d.structure_id = {$RegId}

		ORDER BY staff_order
		";


		

    $sql->query($query);
    $Duty = $sql->fetchAll();

    // ===== CAMERAS =====
    $query = "SELECT
            c.id AS camera_id,
            c.name AS camera_name,
            c.cam_code,
            s.id AS structure_id,
            s.name{$slang} AS structure_name,
            c.is_ptz
        FROM hr.structure s
        JOIN hr.duty_part_cameras c
            ON c.structure_id = s.id
        WHERE s.parent = {$RegId} OR s.id = {$RegId}
        ORDER BY s.id, c.id DESC";

    $sql->query($query);
    $CamerasRaw = $sql->fetchAll();

    // ===== CAMERA URL QO‘SHISH =====
    $Cameras = [];

    foreach ($CamerasRaw as $cam) {

        $dataCam = GetCamUrl($cam['cam_code']);

        if (isset($dataCam['data']['url'])) {
            $cam['url'] = $dataCam['data']['url'];
            $cam['status'] = 1;
        } else {
            $cam['url'] = '';
            $cam['status'] = 0;
        }

        $cam['isptz'] = $cam['is_ptz'] ? 1 : 0;

        $Cameras[] = $cam;
    }

    // ===== STAFF ROLE BIRIKTIRISH =====
    // $staffs = [$Dict['staff_1'], $Dict['staff_2'], $Dict['staff_3']];
    // foreach ($Duty as $key => &$item) {
    //     $item['staff'] = $staffs[$key] ?? null;
    // }
	$staffs = [
    1 => $Dict['staff_1'], // Масъул
    2 => $Dict['staff_2'], // Навбатчи
    3 => $Dict['staff_3']  // Навбатчи ёрдамчиси
];

foreach ($Duty as &$item) {
    $item['staff'] = $staffs[$item['staff_order']] ?? null;
}

    $res = json_encode([
        'Duty' => $Duty,
        'cameras' => $Cameras
    ], JSON_UNESCAPED_UNICODE);

    break;



	case "get_patrul_types":
		$query  = "SELECT t.id, t.name{$slang} as name FROM ref.patrul_types t ORDER BY t.id ASC";
		$sql->query($query);
		$PatrulTypes = $sql->fetchAll();

		$res = json_encode($PatrulTypes);
		break;

		 
	case "crime_by_week":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query = '';
		if ($date == 1) {
			$query  = "SELECT count(t.id) as value, TO_CHAR(t.date, 'DD.MM.YYYY') AS date
			FROM (SELECT *, row_number() OVER() AS row  FROM tur.violations) t
			WHERE t.date >= CURRENT_DATE - INTERVAL '1 month' and (t.row-1) % 5 = 0
			group by t.date";
		} else if ($date == 2) {
			$query = "SELECT m.name{$slang} AS date,
			COUNT(*) AS value FROM 
			tur.violations t JOIN ref.monthes m ON EXTRACT(MONTH FROM t.date) = m.id
			GROUP BY m.name{$slang} ORDER BY MIN(t.date);";
		}
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;

	case "crime_by_important":
		$query  = "SELECT t.type as name, count(t.id) as value 
           FROM tur.violations t 
           GROUP BY t.type
           ORDER BY t.type ASC";
		$sql->query($query);
		$data = $sql->fetchAll();

		$result = [];
		foreach ($data as $key => $value) {
			if ($value['name'] == 1) {
				$result[$key]['name'] = $Dict['crime'];
				$result[$key]['value'] = $value['value'];
			} else {
				$result[$key]['name'] = $Dict['notable_crime'];
				$result[$key]['value'] = $value['value'];
			}
		}

		$res = json_encode($result);
		break;
	case "crime_by_type":
		$query  = "SELECT s.name{$slang} as name, count(t.id) as value, TO_CHAR(t.date, 'DD.MM.YYYY') AS date FROM tur.violations t 
		right join tur.violation_types s on s.id = t.violation_type 
		group by s.name{$slang}, t.id, s.id 
		ORDER BY s.id ASC";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;
	case "event_by_region":
		$id = isset($_GET['id']) ? $_GET['id'] : 0;

		if ($id == 0) {
			$query  = "SELECT s.shortname{$slang} as name, count(t.id) as value, TO_CHAR(t.date, 'DD.MM.YYYY') AS date FROM tur.events t 
			right join hr.structure s on s.id = t.region_id 
			where s.id > 1 and s.id < 16 
			group by s.shortname{$slang}, t.id, s.id 
			ORDER BY s.id ASC";
			$sql->query($query);
			$data = $sql->fetchAll();
		} else {
			$query  = "SELECT s.name{$slang} as name, count(t.id) as value, TO_CHAR(t.date, 'DD.MM.YYYY') AS date FROM tur.events t 
			right join hr.structure s on s.id = t.distcity_id 
			where s.parent = {$id}
			group by s.name{$slang}, t.id, s.id 
			ORDER BY s.id ASC";
			$sql->query($query);
			$data = $sql->fetchAll();
		}

		$res = json_encode($data);
		break;

	case "event_by_type":
		$query  = "SELECT s.name{$slang} as name, count(t.id) as value, TO_CHAR(t.date, 'DD.MM.YYYY') AS date FROM tur.events t 
		right join tur.event_types s on s.id = t.type 
		group by s.name{$slang}, t.id, s.id 
		ORDER BY s.id ASC";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;

	case "all_events":
		$query  = "SELECT TO_CHAR(t.date, 'DD.MM.YYYY') AS date,
		COUNT(CASE WHEN t.event_type = 'event' THEN t.id END) AS events,
		COUNT(CASE WHEN t.event_type = 'reyd_event' THEN t.id END) AS reyd_events
		FROM (SELECT id, date, 'event' AS event_type FROM tur.events
		UNION ALL SELECT id, date, 'reyd_event' AS event_type FROM tur.reyd_events ) AS t 
		WHERE t.date >= current_date - interval '6 days' AND t.date <= current_date 
		GROUP BY t.date ORDER BY t.date ASC";
		$sql->query($query);
		$events = $sql->fetchAll();

		$result['legend'] = [$Dict['mass_events'], $Dict['reyd_events']];
		$result['data'] = $events;

		$res = json_encode($result);
		break;


	case "power":
		$query  = "SELECT TO_CHAR(t.date, 'DD.MM.YYYY') AS date,
        SUM(t.pp_mg) AS mg_staff,
        SUM(t.pp_qb) AS qb_staff,

        SUM(t.ap_mg) AS mg_auto,
        SUM(t.ap_qb) AS qb_auto,
		
        SUM(t.mp_mg) AS mg_moto,
        SUM(t.mp_qb) AS qb_moto,

        SUM(t.op_mg) AS mg_ot,
        SUM(t.op_qb) AS qb_ot
		FROM hr.personal_staff t 
		WHERE t.date = CURRENT_DATE
		GROUP BY t.date";
		$sql->query($query);
		$data = $sql->fetchAll();

		$query  = "SELECT t.name{$slang} as name from ref.patrul_types t ORDER BY t.id ASC";
		$sql->query($query);
		$patruls = $sql->fetchAll();
		foreach ($patruls as $key => $value) {
			$patrul[] = $value['name'];
		}

		$result['legend'] = [$Dict['qb_staff'], $Dict['mg_staff']];
		$result['patruls'] = $patrul;
		$result['data'] = $data;

		$res = json_encode($result);
		break;
		
	case "power_by_vehicle":
		$query  = "SELECT 
        SUM(t.pp_mg + t.pp_qb) AS staff,
        SUM(t.ap_mg + t.ap_qb) AS auto,
        SUM(t.mp_mg + t.mp_qb) AS moto,
        SUM(t.op_mg + t.op_qb) AS ot
		FROM hr.personal_staff t 
		WHERE t.date = CURRENT_DATE
		GROUP BY t.date";
		$sql->query($query);
		$data = $sql->fetchAll();

		$query  = "SELECT t.name{$slang} as name from ref.patrul_types t ORDER BY t.id ASC";
		$sql->query($query);
		$patruls = $sql->fetchAll();
		foreach ($patruls as $key => $value) {
			$patrul[$key]['name'] = $value['name'];
		}

		$patrul[0]['value'] = $data[0]['staff'];
		$patrul[1]['value'] = $data[0]['auto'];
		$patrul[2]['value'] = $data[0]['moto'];
		$patrul[3]['value'] = $data[0]['ot'];

		$res = json_encode($patrul);
		break;
	case "crimes":
		$date = isset($_GET['date']) ? $_GET['date'] : 0;

		$query  = "SELECT s.name{$slang} as name, COUNT(t.id) AS value FROM tur.v_main_types s 
		LEFT JOIN tur.violations t ON s.id = t.type ";
		if ($date == 1) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 day'";
		} else if ($date == 2) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 month'";
		} else if ($date == 3) {
			$query .= " and t.date >= CURRENT_DATE - INTERVAL '1 year'";
		}
		$query .= " GROUP BY s.name{$slang}";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;

	case "get_jts_objects":

		header('Content-Type: application/json; charset=utf-8');


		$page = isset($_GET['page']) ? $_GET['page'] : 1;
		$limit = isset($_GET['limit']) ? $_GET['limit'] : 100000000;
		$start = ($page - 1) * $limit;
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;

		$JtsObjects = [];
		$query  = "SELECT t.id::int, s.name{$slang} as structure, t.object_name, o.name{$slang} as object_type,
		t.address, t.area, t.admin_phone, t.object_head, t.head_phone, 
		COALESCE(COUNT(jc.id), 0) AS count_cameras,
		COALESCE(COUNT(js.id), 0) AS count_sos,
		COALESCE(COUNT(jd.id), 0) AS count_doors,
		t.photo, t.lat, t.long
		FROM hr.jts_objects t 
		left join hr.structure s on s.id  = t.structure_id
		left join hr.involved_objects o on o.id = t.object_type
		LEFT JOIN hr.jts_objects_camera jc on jc.object_id = t.id
		LEFT JOIN hr.jts_objects_sos js on js.object_id = t.id
		LEFT JOIN hr.jts_objects_door jd on jd.object_id = t.id
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " and t.structure_id = {$UserStructure}";
		}
		$query .= " 
		GROUP BY t.id, s.name{$slang}, o.name{$slang}
		ORDER BY t.id desc LIMIT {$limit} OFFSET {$start}";
		$sql->query($query);
		while ($row = $sql->fetchAssoc()) {
			$row['id'] = (int)$row['id'];
			$JtsObjects[] = $row;
		}

		//total count
		$count_query = "SELECT COALESCE(COUNT(*) , 0) as total FROM hr.jts_objects t WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " where id = {$UserStructure}";
		}
		$sql->query($count_query);
		$total_count = $sql->fetchAssoc();



		$JtsObjects = [
			'page' => $page,
			'limit' => $limit,
			'total' => (int)$total_count['total'],
			'data' => $JtsObjects
		];
		echo json_encode($JtsObjects);
		exit;

	case "get_jts_object_by_id":
		$id = isset($_GET['id']) ? $_GET['id'] : 0;
		$car_ids = [];

		$query  = "SELECT t.id, s.name{$slang} as structure, t.object_name, o.name{$slang} as object_type,
		t.address, t.area, t.admin_phone, t.object_head, t.head_phone as object_head_phone, n.head_iiv, n.head_iiv_phone,t.markets_count,t.eating_place_count,n.head,n.assistant_governor,n.youth_leader,n.womens_activist
		,n.tax_inspector,n.social_employe,t.sales_places_count,n.head_phone,n.assistant_governor_phone,n.youth_leader_phone,n.womens_activist_phone,n.tax_inspector_phone,n.social_employe_phone,
		COALESCE(COUNT(jd.id), 0) AS count_doors,n.name as neighborhood_name,
		t.photo, t.lat, t.long, ST_AsGeoJSON(geom) AS geom_geojson
		FROM hr.jts_objects t 
		left join hr.structure s on s.id  = t.structure_id
		left join hr.jts_objects_door jd on jd.object_id = t.id
		left join hr.involved_objects o on o.id = t.object_type
		left join hr.neighborhoods n on n.id = t.neighborhood_id
		WHERE t.id = {$id}
		GROUP BY 
		t.id, s.name{$slang}, t.object_name, o.name{$slang},n.name,
		t.address, t.area, t.admin_phone, t.object_head, t.head_phone, n.head_iiv, n.head_iiv_phone,t.markets_count,t.eating_place_count,n.head,n.assistant_governor,n.youth_leader,n.womens_activist
		,n.tax_inspector,n.social_employe,t.sales_places_count,n.head_phone,n.assistant_governor_phone,n.youth_leader_phone,n.womens_activist_phone,n.tax_inspector_phone,n.social_employe_phone,
		t.photo, t.lat, t.long, ST_AsGeoJSON(geom)
		";
		$sql->query($query);
		$JtsObject = $sql->fetchAssoc();

		// echo '<pre>';
		// print_r($JtsObject);
		// echo '</pre>';
		// // die();
		$query  = "SELECT t.id, t.name, t.lat, t.long
		FROM hr.jts_objects_sos t 
		WHERE t.object_id = {$JtsObject['id']}
		ORDER BY t.id desc";
		$sql->query($query);
		$Sos = $sql->fetchAll();

		$object_id = ($_GET['id']);
		$query  = "SELECT t.id, t.name, t.lat, t.long
		FROM hr.jts_objects_door t 
		WHERE t.object_id = {$JtsObject['id']}
		ORDER BY t.id desc";
		$sql->query($query);
		$Door = $sql->fetchAll();

		$JtsObject['sos'] = $Sos;
		$JtsObject['door'] = $Door;

		// $query  = "SELECT t.id, CONCAT(r.name{$slang}, ' ', s.lastname, ' ', s.firstname, ' ', s.surname) AS responsible_name,
		// COALESCE(COUNT(td.id), 0) AS all_staff,
		// SUM(CASE WHEN td.patrul_type = 1 THEN 1 ELSE 0 END) AS walker_patrul,
		// SUM(CASE WHEN td.patrul_type = 2 THEN 1 ELSE 0 END) AS avto_patrul,
		// SUM(CASE WHEN td.patrul_type = 4 THEN 1 ELSE 0 END) AS horse_patrul,
		// COUNT(DISTINCT td.car_id) AS car_count,
		// COALESCE(SUM(cardinality(td.epikirofka_id)), 0) AS epikirofka_count,
		// COALESCE(COUNT(DISTINCT js.id), 0) AS count_sos,
		// COALESCE(COUNT(DISTINCT jc.id), 0) AS count_cameras,
		// COALESCE(COUNT(DISTINCT td.patrul_type), 0) AS patrul_types_count
		// FROM hr.daily_routine t 
		// LEFT JOIN hr.dailiy_routine_date td ON td.routine_id = t.id
		// LEFT JOIN hr.staff s ON s.id = t.responsible_id
		// LEFT JOIN ref.ranks r ON r.id = s.rank_id
		// left join hr.jts_objects_camera jc on jc.object_id = {$JtsObject['id']}
		// left join hr.jts_objects_sos js on js.object_id = {$JtsObject['id']}
		// WHERE t.object_id = {$JtsObject['id']} AND t.date = CURRENT_DATE
		// GROUP BY t.id, r.name{$slang}, s.lastname, s.firstname, s.surname
		// ORDER BY t.id desc LIMIT 1";
		$query = "SELECT  
				t.id,
				CONCAT(r.name{$slang}, ' ', s.lastname, ' ', s.firstname, ' ', s.surname) AS responsible_name,
				t.responsible_sname,
				t.responsible_phone,

				COUNT(DISTINCT td.id) AS all_staff,

				COUNT(DISTINCT td.id) FILTER (WHERE td.patrul_type = 1) AS walker_patrul,
				COUNT(DISTINCT td.id) FILTER (WHERE td.patrul_type = 2) AS avto_patrul,
				COUNT(DISTINCT td.id) FILTER (WHERE td.patrul_type = 4) AS horse_patrul,

				COUNT(DISTINCT td.car_id) AS car_count,

				COALESCE(SUM(cardinality(td.epikirofka_id)), 0) AS epikirofka_count,

				-- Kameralar va SOS larni subquery orqali olish
				(SELECT COUNT(*) FROM hr.jts_objects_camera WHERE object_id = t.object_id) AS count_cameras,
				(SELECT COUNT(*) FROM hr.jts_objects_sos WHERE object_id = t.object_id) AS count_sos,

				COUNT(DISTINCT td.patrul_type) AS patrul_types_count

			FROM hr.daily_routine t
			LEFT JOIN hr.dailiy_routine_date td ON td.routine_id = t.id
			LEFT JOIN hr.staff s ON s.id = t.responsible_id
			LEFT JOIN ref.ranks r ON r.id = s.rank_id

			WHERE t.object_id = {$JtsObject['id']}
			AND t.date = CURRENT_DATE

			GROUP BY 
				t.id, 
				r.name{$slang}, 
				s.lastname, 
				s.firstname, 
				s.surname

			ORDER BY t.id DESC
			LIMIT 1;

		";
		$sql->query($query);
		$Routine = $sql->fetchAssoc();

		// echo '<pre>';
		// print_r($Routine);
		// echo '</pre>';
		// die();

		$JtsObject['routine'] = $Routine;
		$BodyCamUrl = [];
		$Bodys = [];
		$Staffs = [];
		if ($Routine) {
			$query  = "SELECT t.id, t.car_id, t.bodycam_id, t.patrul_type,
			CONCAT(r.name{$slang}, ' ', s.lastname, ' ', s.firstname, ' ', s.surname) AS staff_name,
			s.photo AS staff_photo, s.phone AS staff_phone,s.sname AS staff_sname
			FROM hr.dailiy_routine_date t 
			LEFT JOIN hr.staff s ON s.id = t.staff_id
			LEFT JOIN ref.ranks r ON r.id = s.rank_id
			WHERE t.routine_id = {$Routine['id']}
			ORDER BY t.id desc";
			$sql->query($query);
			$RoutineDate = $sql->fetchAll();

			foreach ($RoutineDate as $key => $value) {
				$car_ids[] = $value['car_id'];
				if (isset($value['bodycam_id']) && $value['patrul_type'] == 1) {
					$query  = "SELECT t.id, t.cam_code, t.comment, t.lat, t.long, t.status
					FROM hr.body_cameras t 
					WHERE t.id = {$value['bodycam_id']}";						
					$sql->query($query);
					$Bodys[] = $sql->fetchAssoc();

					$Bodys[count($Bodys) - 1]['staff_name'] = $value['staff_name'];
					$Bodys[count($Bodys) - 1]['staff_photo'] = $value['staff_photo'];
					$Bodys[count($Bodys) - 1]['staff_phone'] = $value['staff_phone'];
					$Bodys[count($Bodys) - 1]['staff_sname'] = $value['staff_sname'];
				}
			}
		}

		// echo '<pre>';
		// print_r($Bodys);
		// echo '</pre>';
		// die();



	if ($Bodys) {
    foreach ($Bodys as $body_c) {

        $bodycamindex = $body_c['cam_code'];
        $bodyCamId    = $body_c['id'];
        $comment      = $body_c['comment'];

        // 🔥 DB STATUS (universal)
        $status = (
            $body_c['status'] === true ||
            $body_c['status'] === 't' ||
            $body_c['status'] === 1 ||
            $body_c['status'] === '1'
        );

        // 🔹 URL faqat stream uchun
        $dataBodyCam = GetCamUrlBody($bodycamindex);
        $playUrl = $dataBodyCam['data']['url'] ?? '';

        $BodyCamUrl[] = [
            'id'           => $bodyCamId,
            'url'          => $playUrl,
            'status'       => $status ? 1 : 0, // 🔥 FAQAT DB
            'cam_index'    => $bodycamindex,
            'comment'      => $comment,
            'lat'          => $body_c['lat'],
            'long'         => $body_c['long'],
            'staff_name'   => $body_c['staff_name'] ?? '',
            'staff_photo'  => $body_c['staff_photo'] ?? '',
            'staff_phone'  => $body_c['staff_phone'] ?? '',
            'staff_sname'  => $body_c['staff_sname'] ?? '',
        ];
    }
}


		$JtsObject['body_cameras'] = $BodyCamUrl;
		$JtsObject['tracks'] = [];
		if ($car_ids) {
			$query = "SELECT 
			cr.id AS car_id,
			uzg.tp_timestamp_fmt AS date,
			uzg.angle,
			uzg.lat,
			uzg.lon,
			uzg.speed,
			cm.name AS car_name,
			cm.photo AS car_photo,
			cm.car_width,
			cm.car_height
			FROM reports.uzgps uzg
			INNER JOIN hr.tech_guard_cars cr ON cr.uzgps_id = uzg.mobject_id
			LEFT JOIN hr.structure s ON s.id = cr.structure_id
			LEFT JOIN ref.car_models cm ON cm.id = cr.car_model_id
			WHERE cr.id IN (" . implode(',', $car_ids) . ")
			order by uzg.speed asc";
			$sql->query($query);
			$Tracks = $sql->fetchAll();

			$JtsObject['tracks'] = $Tracks;
		}


		$query  = "SELECT t.id, t.cam_code, t.name, t.lat, t.long,
		case when t.is_ptz then 1 else 0 end as is_ptz
		FROM hr.jts_objects_camera t 
		WHERE t.object_id = {$JtsObject['id']}";
		$sql->query($query);
		$Cams = $sql->fetchAll();

		$CamUrl = [];
		if ($Cams) {
			foreach ($Cams as $mkey => $cam_c) {
				$camindex = $cam_c['cam_code'];
				$camId = $cam_c['id'];
				$IsPtz = $cam_c['is_ptz'];
				$comment = $cam_c['name'];
				$lat = $cam_c['lat'];
				$long = $cam_c['long'];

				$dataCam = GetCamUrl($camindex);
				if (isset($dataCam['data']['url'])) {
					$CamUrl[] = [
						'id' => $camId,
						'url' => $dataCam['data']['url'],
						'isptz' => $IsPtz,
						'status' => 1,
						'cam_index' => $camindex,
						'comment' => $comment,
						'lat' => $lat,
						'long' => $long
					];
				} else {
					$CamUrl[] = [
						'id' => $camId,
						'url' => '',
						'status' => 0,
						'isptz' => $IsPtz,
						'cam_index' => $camindex,
						'comment' => $comment,
						'lat' => $lat,
						'long' => $long
					];
				}
			}
		}

		$result['data'] = $JtsObject;
		$result['cameras'] = $CamUrl;
		$result['body_cameras'] = $BodyCamUrl;
		$res = json_encode($result);
		break;


	case "get_jts_map":

    // GET paramlar
    $structure_id = isset($_GET['region_id']) ? (int)$_GET['region_id'] : 0;
    $object_type  = isset($_GET['object_type']) ? (int)$_GET['object_type'] : 0;
    $object_id    = isset($_GET['object_id']) ? (int)$_GET['object_id'] : 0;

    $query = "
        SELECT 
            t.id,
            t.object_name,
            t.object_type,
            t.lat,
            t.long
        FROM hr.jts_objects t
        WHERE 1=1
    ";

    /**
     * 1️⃣ FOYDALANUVCHI STRUKTURASI CHEGARASI
     * (admin bo‘lmasa)
     */
    if ($UserStructure > 1) {
        $query .= "
            AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$UserStructure}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$UserStructure}
            )
        ";
    }

    /**
     * 2️⃣ SELECTDAN KELGAN REGION (VILOYAT)
     */
    if ($structure_id > 0) {
        $query .= " AND t.structure_id = {$structure_id} ";
    }

    /**
     * 3️⃣ OBYEKT TURI
     */
    if ($object_type > 0) {
        $query .= " AND t.object_type = {$object_type} ";
    }

    /**
     * 4️⃣ ANIQ OBYEKT (MARKER BOSILGANDA)
     */
    if ($object_id > 0) {
        $query .= " AND t.id = {$object_id} ";
    }

    // So‘rovni bajarish
    $sql->query($query);
    $JtsObjects = $sql->fetchAll();

    // JSON qaytarish
    $res = json_encode($JtsObjects);

break;





	case "get_public_events":

			$UserStructure = isset($_SESSION['structure_id']) 
				? (int)$_SESSION['structure_id'] 
				: 0;

			$structure_id = isset($_GET['region_id']) 
				? (int)$_GET['region_id'] 
				: 0;

			$object_type = isset($_GET['object_type']) 
				? (int)$_GET['object_type'] 
				: 0;

			/*
			|--------------------------------------------------------------------------
			| Tadbirlar ro‘yxati (xarita uchun)
			|--------------------------------------------------------------------------
			*/
			$query = "
				SELECT 
					t.id,
					t.event_name AS name,
					t.lat,
					t.long,
					t.event_type
				FROM hr.public_event1 t
				LEFT JOIN tur.public_event_types et ON et.id = t.event_type
				WHERE 1=1
			";

			// SESSION dagi structure (UserStructure)
			if ($UserStructure > 1) {
				$query .= "
					AND t.region_id IN (
						SELECT id FROM hr.structure WHERE id = {$UserStructure}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$UserStructure}
					)
				";
			}

			// Mapdan kelayotgan object_type (kategoriya)
			if ($object_type > 0) {
				$query .= " AND t.event_category_id = {$object_type} ";
			}

			// Agar region_id GET orqali berilsa (ixtiyoriy)
			if ($structure_id > 0) {
				$query .= "
					AND t.region_id IN (
						SELECT id FROM hr.structure WHERE id = {$structure_id}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$structure_id}
					)
				";
			}

			$sql->query($query);
			$JtsObjects = $sql->fetchAll();

			$res = json_encode($JtsObjects);

		break;


	case "get_public_events_by_id":
		header('Content-Type: application/json; charset=utf-8');

		$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
		$car_ids = [];

		// Try to join jts_objects info
		$query  = "SELECT 
				t.*
			FROM hr.public_event1 t
			WHERE t.id = {$id}";
   
		$sql->query($query);
		$JtsObject = $sql->fetchAssoc();
		
		// Attach raw event
		// $JtsObject['event_raw'] = $PE;
		$objectId = intval($JtsObject['object_id']);
		// Cameras — build same structure as get_jts_object_by_id returns, AND also set data.cameras for compatibility
		$query  = "SELECT t.id, t.cam_code, t.name, t.lat, t.long,
		case when t.is_ptz then 1 else 0 end as is_ptz
		FROM hr.jts_objects_camera t 
		WHERE t.object_id = {$objectId}";
		$sql->query($query);
		$Cams = $sql->fetchAll();

		$CamUrl = [];
		if ($Cams) {
			foreach ($Cams as $mkey => $cam_c) {
				$camindex = $cam_c['cam_code'];
				$camId = $cam_c['id'];
				$IsPtz = $cam_c['is_ptz'];
				$comment = $cam_c['name'];
				$lat = $cam_c['lat'];
				$long = $cam_c['long'];

				$dataCam = GetCamUrl($camindex);
				if (isset($dataCam['data']['url'])) {
					$CamUrl[] = [
						'id' => $camId,
						'url' => $dataCam['data']['url'],
						'isptz' => $IsPtz,
						'status' => 1,
						'cam_index' => $camindex,
						'comment' => $comment,
						'lat' => $lat,
						'long' => $long
					];
				} else {
					$CamUrl[] = [
						'id' => $camId,
						'url' => '',
						'status' => 0,
						'isptz' => $IsPtz,
						'cam_index' => $camindex,
						'comment' => $comment,
						'lat' => $lat,
						'long' => $long
					];
				}
			}
		}


		$result = [
			'data' => $JtsObject,
			'cameras' => $CamUrl   // also as top-level key like get_jts_object_by_id
		];

		echo json_encode($result, JSON_UNESCAPED_UNICODE);
		exit;
		break;






	case "get_divisions":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;
		$query  = "SELECT t.id, t.name{$slang} as name
		FROM hr.structure t 
		WHERE 1=1 ";
		if ($structure_id > 0) {
			$query .= " AND t.parent = {$structure_id} ";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;
		
	case "get_staff":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;
		$division_id = isset($_GET['division_id']) ? $_GET['division_id'] : 0;

		$query  = "SELECT t.id, CONCAT(r.name{$slang}, ' ', t.lastname, ' ', t.firstname, ' ', t.surname) AS name
		FROM hr.staff t 
		LEFT JOIN ref.ranks r ON r.id = t.rank_id
		WHERE 1=1 ";
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		if ($division_id > 0) {
			$query .= " AND t.division_id = {$division_id} ";
		}
		$query .= " ORDER BY t.id ASC";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;

	case "get_jst_objects":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;
		$object_type = isset($_GET['object_type']) ? $_GET['object_type'] : 0;

		$query  = "SELECT t.id, t.object_name as name 
		FROM hr.jts_objects t 
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		if ($object_type > 0) {
			$query .= " AND t.object_type = {$object_type} ";
		}
		$query .= " ORDER BY t.id desc";
		$sql->query($query);
		$Objects = $sql->fetchAll();

		$res = json_encode($Objects);
		break;

	case "get_impact_area":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;
		$division_id = isset($_GET['division_id']) ? $_GET['division_id'] : 0;
		$page = isset($_GET['page']) ? $_GET['page'] : 1;
		$limit = isset($_GET['limit']) ? $_GET['limit'] : 10;
		$start = ($page - 1) * $limit;

		$ImpactAreas = [];
		$query  = "SELECT t.id, s.name{$slang} as structure, t.name,
		ST_AsGeoJSON(ST_FlipCoordinates(t.geom)) AS geom
		FROM hr.impact_area t 
		left join hr.structure s on s.id  = t.structure_id
		WHERE 1=1 ";
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		$query .= " ORDER BY t.id desc LIMIT {$limit} OFFSET {$start}";
		$sql->query($query);
		while ($row = $sql->fetchAssoc()) {
			$row['id'] = (int)$row['id'];
			$ImpactAreas[] = $row;
		}

		//total count
		$count_query = "SELECT COALESCE(COUNT(*) , 0) as total FROM hr.impact_area t WHERE 1=1 ";
		if ($structure_id > 0) {
			$count_query .= " AND t.structure_id = {$structure_id} ";
		}
		$sql->query($count_query);
		$total_count = $sql->fetchAssoc();

		$ImpactAreas = [
			'page' => $page,
			'limit' => $limit,
			'total' => (int)$total_count['total'],
			'data' => $ImpactAreas
		];

		$res = json_encode($ImpactAreas);
		break;

	case "get_mpg_by_id":
		$car_id = isset($_GET['car_id']) ? $_GET['car_id'] : 6;

		$Data = [];
		$car_ids = [];
		$query = "SELECT 
            uzg.id,
            s.shortname{$slang} AS region,
            cr.plate_number AS plate_number,
            uzg.angle,
            uzg.lat,
            uzg.lon,
            uzg.speed,
            TO_CHAR(uzg.tp_timestamp_fmt, 'DD.MM.YYYY HH24:MI') AS time,
            cm.name AS car_name,
            cm.photo AS car_photo,
            cm.car_width,
            cm.car_height,
			cr.external_cam,
			cr.internal_cam
        FROM reports.uzgps uzg
        INNER JOIN hr.tech_guard_cars cr ON cr.uzgps_id = uzg.mobject_id
        LEFT JOIN hr.structure s ON s.id = cr.structure_id
        LEFT JOIN ref.car_models cm ON cm.id = cr.car_model_id
        WHERE cr.id = {$car_id} ";
		$sql->query($query);
		$Track = $sql->fetchAssoc();
		$Data['car'] = $Track;


		$query  = "SELECT t.id, CONCAT(r.name{$slang}, ' ', s.lastname, ' ', s.firstname, ' ', s.surname) AS staff_name,
		s.phone, s.photo, t.bodycam_id
		FROM hr.dailiy_routine_date t 
		LEFT JOIN hr.daily_routine d ON d.id = t.routine_id
		LEFT JOIN hr.staff s ON s.id = t.staff_id
		LEFT JOIN ref.ranks r ON r.id = s.rank_id
		WHERE d.date = CURRENT_DATE AND t.car_id = {$car_id}
		ORDER BY t.id desc ";
		$sql->query($query);
		$Staffs = $sql->fetchAll();
		$Data['staffs'] = $Staffs;

		$Cameras = [];
		if ($Track) {
			$external_cam = $Track['external_cam'];
			$internal_cam = $Track['internal_cam'];

			$data = GetCamUrlBody($external_cam);
			$url = $data['data']['url'] ?? null;
			$msg = $data['msg'] ?? '';

			$Cameras[] = (object)[
				'url' => $url,
				'status' => !empty($url) ? 1 : 0,
				'msg' => $msg,
			];

			$data = GetCamUrlBody($internal_cam);
			$url = $data['data']['url'] ?? null;
			$msg = $data['msg'] ?? '';

			$Cameras[] = (object)[
				'url' => $url,
				'status' => !empty($url) ? 1 : 0,
				'msg' => $msg,
			];
		}
		$Data['cams'] = $Cameras;

		$res = json_encode($Data);
		break;

	case "get_bodycam_location":
		$id = isset($_GET['id']) ? $_GET['id'] : 0;

		$query = "SELECT DISTINCT ON (b.id) b.* 
			FROM hr.daily_routine dr
		LEFT JOIN hr.dailiy_routine_date drt ON drt.routine_id = dr.id
		LEFT JOIN hr.body_cameras b ON b.id = drt.bodycam_id
		WHERE dr.date = CURRENT_DATE AND dr.object_id = {$id}
		ORDER BY b.id ASC";
		$sql->query($query);
		$data = $sql->fetchAll();

		$res = json_encode($data);
		break;





	// case "jts_objects":
	// 	// header('Content-Type: application/json; charset=utf-8');
	// 	$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;

	// 	// 1) Statistika (COUNT)
	// 	$query = "SELECT COUNT(t.id) as value, b.id, b.name{$slang} as name
	// 	FROM hr.jts_objects t
	// 	LEFT JOIN hr.involved_objects b ON b.id = t.object_type
	// 	WHERE 1=1 ";

	// 	if ($UserStructure > 1) {
	// 		$query .= " AND t.structure_id = {$UserStructure} ";
	// 	}
	// 	if ($structure_id > 0) {
	// 		$query .= " AND t.structure_id = {$structure_id} ";
	// 	}

	// 	$query .= " GROUP BY b.id ORDER BY b.id ASC";

	// 	$sql->query($query);
	// 	$stats = $sql->fetchAll();

	// 	// 2) Statistika hududlar kesimida
	// 	$regionQuery = "SELECT 
	// 			s.id,
	// 			s.name{$slang} as name,
	// 			COUNT(t.id) as value
	// 		FROM hr.jts_objects t
	// 		LEFT JOIN hr.structure s ON s.id = t.structure_id
	// 		WHERE 1=1
	// 	";

	// 	if ($UserStructure > 1) {
	// 		$regionQuery .= " AND t.structure_id = {$UserStructure} ";
	// 	}
	// 	if ($structure_id > 0) {
	// 		$regionQuery .= " AND t.structure_id = {$structure_id} ";
	// 	}

	// 	$regionQuery .= " GROUP BY s.id ORDER BY s.id ASC";

	// 	$sql->query($regionQuery);
	// 	$stat_region = $sql->fetchAll();


	// 	// 3) Ob'ektlar ro'yxati
	// 	$listQuery = "SELECT 
	// 			t.id,
	// 			t.object_name,
	// 			b.id as type_id,
	// 			b.name{$slang} AS type_name
	// 		FROM hr.jts_objects t
	// 		LEFT JOIN hr.involved_objects b ON b.id = t.object_type
	// 		WHERE 1=1
	// 	";

	// 	if ($UserStructure > 1) {
	// 		$listQuery .= " AND t.structure_id = {$UserStructure} ";
	// 	}
	// 	if ($structure_id > 0) {
	// 		$listQuery .= " AND t.structure_id = {$structure_id} ";
	// 	}


	// 	$listQuery .= " ORDER BY b.name{$slang} ASC, t.object_name ASC";

	// 	$sql->query($listQuery);
	// 	$list = $sql->fetchAll();


	// 	// 3) Guruhlash (type → object list)
	// 	$grouped = [];
	// 	foreach ($list as $row) {
	// 		$typeId = $row['type_id'];

	// 		if (!isset($grouped[$typeId])) {
	// 			$grouped[$typeId] = [
	// 				"id" => $typeId,
	// 				"name" => $row['type_name'],
	// 				"objects" => []
	// 			];
	// 		}

	// 		$grouped[$typeId]["objects"][] = [
	// 			"id" => $row['id'],
	// 			"object_name" => $row['object_name']
	// 		];
	// 	}

	// 	// Convert to numeric array
	// 	$grouped = array_values($grouped);

	// 	// Final response
	// 	$res = json_encode([
	// 		"stats" => $stats,
	// 		"list" => $grouped,
	// 		"stat_region" => $stat_region
	// 	]);
	// 	break;
		case "jts_objects":

			$structure_id = isset($_GET['structure_id']) ? (int)$_GET['structure_id'] : 0;

			/*
			|--------------------------------------------------------------------------
			| 1) Statistikalar (Pie chart)
			|--------------------------------------------------------------------------
			*/
			$query = "
				SELECT 
					COUNT(t.id) AS value,
					b.id,
					b.name{$slang} AS name
				FROM hr.jts_objects t
				LEFT JOIN hr.involved_objects b ON b.id = t.object_type
				WHERE 1=1
			";

			if ($UserStructure > 1) {
				$query .= "
					AND t.structure_id IN (
						SELECT id FROM hr.structure WHERE id = {$UserStructure}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$UserStructure}
					)
				";
			}

			if ($structure_id > 0) {
				$query .= "
					AND t.structure_id IN (
						SELECT id FROM hr.structure WHERE id = {$structure_id}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$structure_id}
					)
				";
			}

			$query .= " GROUP BY b.id ORDER BY b.id ASC";

			$sql->query($query);
			$stats = $sql->fetchAll();


			/*
			|--------------------------------------------------------------------------
			| 2) Hududlar kesimida (Bar chart)
			|--------------------------------------------------------------------------
			*/
			$regionQuery = "
				SELECT 
					s.id,
					s.name{$slang} AS name,
					COUNT(t.id) AS value
				FROM hr.jts_objects t
				LEFT JOIN hr.structure s ON s.id = t.structure_id
				WHERE 1=1
			";

			if ($UserStructure > 1) {
				$regionQuery .= "
					AND t.structure_id IN (
						SELECT id FROM hr.structure WHERE id = {$UserStructure}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$UserStructure}
					)
				";
			}

			if ($structure_id > 0) {
				$regionQuery .= "
					AND t.structure_id IN (
						SELECT id FROM hr.structure WHERE id = {$structure_id}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$structure_id}
					)
				";
			}

			$regionQuery .= " GROUP BY s.id ORDER BY s.id ASC";

			$sql->query($regionQuery);
			$stat_region = $sql->fetchAll();


			/*
			|--------------------------------------------------------------------------
			| 3) Ob'ektlar ro‘yxati
			|--------------------------------------------------------------------------
			*/
			$listQuery = "
				SELECT 
					t.id,
					t.object_name,
					b.id AS type_id,
					b.name{$slang} AS type_name
				FROM hr.jts_objects t
				LEFT JOIN hr.involved_objects b ON b.id = t.object_type
				WHERE 1=1
			";

			if ($UserStructure > 1) {
				$listQuery .= "
					AND t.structure_id IN (
						SELECT id FROM hr.structure WHERE id = {$UserStructure}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$UserStructure}
					)
				";
			}

			if ($structure_id > 0) {
				$listQuery .= "
					AND t.structure_id IN (
						SELECT id FROM hr.structure WHERE id = {$structure_id}
						UNION
						SELECT id FROM hr.structure WHERE parent = {$structure_id}
					)
				";
			}

			$listQuery .= " ORDER BY b.name{$slang} ASC, t.object_name ASC";

			$sql->query($listQuery);
			$list = $sql->fetchAll();


			/*
			|--------------------------------------------------------------------------
			| 4) Guruhlash (type → object list)
			|--------------------------------------------------------------------------
			*/
			$grouped = [];

			foreach ($list as $row) {
				$typeId = $row['type_id'];

				if (!isset($grouped[$typeId])) {
					$grouped[$typeId] = [
						"id"      => $typeId,
						"name"    => $row['type_name'],
						"objects" => []
					];
				}

				$grouped[$typeId]["objects"][] = [
					"id"          => $row['id'],
					"object_name" => $row['object_name']
				];
			}

			$grouped = array_values($grouped);


			/*
			|--------------------------------------------------------------------------
			| 5) Final JSON
			|--------------------------------------------------------------------------
			*/
			$res = json_encode([
				"stats"        => $stats,
				"stat_region" => $stat_region,
				"list"         => $grouped
			]);

		break;









	case "public_events":

		$structure_id = isset($_GET['structure_id']) ? (int)$_GET['structure_id'] : 0;

		/*
		|--------------------------------------------------------------------------
		| 1) Statistikalar (Pie chart)
		|--------------------------------------------------------------------------
		*/
		$query = "
			SELECT 
				COUNT(t.id) AS value,
				b.id,
				b.name{$slang} AS name
			FROM hr.public_event1 t
			LEFT JOIN tur.public_event_types b ON b.id = t.event_type
			WHERE 1=1
		";

		if ($UserStructure > 1) {
			$query .= "
				AND t.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
			";
		}

		if ($structure_id > 0) {
			$query .= "
				AND t.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$structure_id}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$structure_id}
				)
			";
		}

		$query .= " GROUP BY b.id ORDER BY b.id ASC";

		$sql->query($query);
		$stats = $sql->fetchAll();


		/*
		|--------------------------------------------------------------------------
		| 2) Hududlar kesimida (Bar chart)
		|--------------------------------------------------------------------------
		*/
		$regionQuery = "
			SELECT 
				s.id,
				s.name{$slang} AS name,
				COUNT(t.id) AS value
			FROM hr.public_event1 t
			LEFT JOIN hr.structure s ON s.id = t.region_id
			WHERE 1=1
		";

		if ($UserStructure > 1) {
			$regionQuery .= "
				AND t.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
			";
		}

		if ($structure_id > 0) {
			$regionQuery .= "
				AND t.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$structure_id}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$structure_id}
				)
			";
		}

		$regionQuery .= " GROUP BY s.id ORDER BY s.id ASC";

		$sql->query($regionQuery);
		$stat_region = $sql->fetchAll();


		/*
		|--------------------------------------------------------------------------
		| 3) Tadbirlar ro‘yxati
		|--------------------------------------------------------------------------
		*/
		$listQuery = "
			SELECT 
				t.id,
				t.event_name,
				b.id AS type_id,
				b.name{$slang} AS type_name
			FROM hr.public_event1 t
			LEFT JOIN tur.public_event_types b ON b.id = t.event_type
			WHERE 1=1
		";

		if ($UserStructure > 1) {
			$listQuery .= "
				AND t.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
			";
		}

		if ($structure_id > 0) {
			$listQuery .= "
				AND t.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$structure_id}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$structure_id}
				)
			";
		}

		$listQuery .= " ORDER BY b.name{$slang} ASC, t.event_name ASC";

		$sql->query($listQuery);
		$list = $sql->fetchAll();


		/*
		|--------------------------------------------------------------------------
		| 4) Guruhlash (type → object list)
		|--------------------------------------------------------------------------
		*/
		$grouped = [];

		foreach ($list as $row) {
			$typeId = $row['type_id'];

			if (!isset($grouped[$typeId])) {
				$grouped[$typeId] = [
					"id"      => $typeId,
					"name"    => $row['type_name'],
					"objects" => []
				];
			}

			$grouped[$typeId]["objects"][] = [
				"id"          => $row['id'],
				"object_name" => $row['event_name']
			];
		}

		$grouped = array_values($grouped);


		/*
		|--------------------------------------------------------------------------
		| 5) Final JSON
		|--------------------------------------------------------------------------
		*/
		$res = json_encode([
			"stats"        => $stats,
			"stat_region" => $stat_region,
			"list"         => $grouped
		]);

	break;



	case "reyd_events":

    $structure_id = isset($_GET['structure_id']) ? (int)$_GET['structure_id'] : 0;

    /*
    |--------------------------------------------------------------------------
    | 1) Statistikalar (Pie chart)
    |--------------------------------------------------------------------------
    */
    $query = "
        SELECT 
            SUM(t.staff_count) AS value,
            b.id,
            b.name{$slang} AS name
        FROM tur.reyd_events t
        LEFT JOIN ref.reyd_event_types b ON b.id = t.type
        WHERE 1=1
    ";

    // USER structure
    if ($UserStructure > 1) {
        $query .= "
            AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$UserStructure}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$UserStructure}
            )
        ";
    }

    // SELECT orqali kelgan structure
    if ($structure_id > 0) {
        $query .= "
            AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$structure_id}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$structure_id}
            )
        ";
    }

    $query .= " GROUP BY b.id ORDER BY b.id ASC";

    $sql->query($query);
    $stats = $sql->fetchAll();


    /*
    |--------------------------------------------------------------------------
    | 2) Hududlar kesimida (Bar chart)
    |--------------------------------------------------------------------------
    */
    $regionQuery = "
        SELECT 
            s.id,
            s.name{$slang} AS name,
            SUM(t.staff_count) AS value
        FROM tur.reyd_events t
        LEFT JOIN hr.structure s ON s.id = t.structure_id
        WHERE 1=1
    ";

    if ($UserStructure > 1) {
        $regionQuery .= "
            AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$UserStructure}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$UserStructure}
            )
        ";
    }

    if ($structure_id > 0) {
        $regionQuery .= "
            AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$structure_id}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$structure_id}
            )
        ";
    }

    $regionQuery .= " GROUP BY s.id ORDER BY s.id ASC";

    $sql->query($regionQuery);
    $stat_region = $sql->fetchAll();


    /*
    |--------------------------------------------------------------------------
    | 3) Tadbirlar ro‘yxati
    |--------------------------------------------------------------------------
    */
    $listQuery = "
        SELECT 
            t.id,
            b.id AS type_id,
            b.name{$slang} AS type_name
        FROM tur.reyd_events t
        LEFT JOIN ref.reyd_event_types b ON b.id = t.type
        WHERE 1=1
    ";

    if ($UserStructure > 1) {
        $listQuery .= "
            AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$UserStructure}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$UserStructure}
            )
        ";
    }

    if ($structure_id > 0) {
        $listQuery .= "
            AND t.structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$structure_id}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$structure_id}
            )
        ";
    }

    $listQuery .= " ORDER BY b.name{$slang} ASC";

    $sql->query($listQuery);
    $list = $sql->fetchAll();


    /*
    |--------------------------------------------------------------------------
    | 4) Guruhlash (type → objects)
    |--------------------------------------------------------------------------
    */
    $grouped = [];

    foreach ($list as $row) {
        $typeId = $row['type_id'];

        if (!isset($grouped[$typeId])) {
            $grouped[$typeId] = [
                "id"      => $typeId,
                "name"    => $row['type_name'],
                "objects" => []
            ];
        }

        $grouped[$typeId]["objects"][] = [
            "id" => $row['id']
        ];
    }

    $grouped = array_values($grouped);


    /*
    |--------------------------------------------------------------------------
    | 5) Final JSON
    |--------------------------------------------------------------------------
    */
    $res = json_encode([
        "stats"        => $stats,
        "stat_region" => $stat_region,
        "list"         => $grouped
    ]);

	break;





	case "get_embassy_map":
		$structure_id = isset($_GET['region_id']) ? $_GET['region_id'] : 0;
		$object_type = isset($_GET['object_type']) ? $_GET['object_type'] : 0;
		$object_id = isset($_GET['object_id']) ? $_GET['object_id'] : 0;

		$query  = "SELECT t.id, t.name as object_name, t.lat, t.long,ot.name{$slang} as type_name,t.photo,t.type_id
		FROM hr.embassy_objects t 
		left join ref.embassy_object_types ot on ot.id = t.type_id
		WHERE 1=1";
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		if ($object_type > 0) {
			$query .= " AND t.type_id = {$object_type} ";
		}
		if ($object_id > 0) {
			$query .= " AND t.object_id = {$object_id} ";
		}
		$sql->query($query);
		$JtsObjects = $sql->fetchAll();

		// echo '<pre>';
		// print_r($JtsObjects);
		// echo '</pre>';
		// // die();

		$res = json_encode($JtsObjects);
		break;






	case "get_embassy_object_by_id":
		$id = isset($_GET['id']) ? $_GET['id'] : 0;
		$JtsObject = [];
		$query  = "SELECT e.id,s.name{$slang} as structure,ot.name{$slang} as type_name,e.district,e.name,e.address,e.lat,e.long,e.photo,e.post_phone,
		e.military_unit,e.military_unit_phone,e.iiv_inspector,e.iiv_inspector_phone,e.iiv_unit,iiv_unit_phone,CONCAT(r.name{$slang},' ',st.lastname,' ',st.firstname,' ',st.surname) as responsible_name,
		st.phone as responsible_phone, st.photo as responsible_photo
		FROM hr.embassy_objects e
		left join ref.embassy_object_types ot on ot.id = e.type_id
		left join hr.structure s on s.id = e.structure_id
		left join hr.staff st on st.id = e.responsible_id
		left join ref.ranks r on r.id = st.rank_id
		WHERE e.id = {$id}";
		$sql->query($query);

		$embassy_object = $sql->fetchAssoc();
		$JtsObject['objects'] = $embassy_object;

		$CamUrl = [];
		if ($id > 0) {
			$sql->query("SELECT t.id, t.cam_code, t.name, t.lat, t.long, CASE WHEN t.is_ptz THEN 1 ELSE 0 END AS is_ptz FROM hr.embassy_objects_camera t WHERE t.object_id = {$id}");
			$Cams = $sql->fetchAll();

			if ($Cams) {	
				foreach ($Cams as $cam_c) {
					$camindex = $cam_c['cam_code'];
					$camId = $cam_c['id'];
					$IsPtz = $cam_c['is_ptz'];
					$comment = $cam_c['name'];
					$lat = $cam_c['lat'];
					$long = $cam_c['long'];

					$dataCam = GetCamUrl($camindex);
					if (isset($dataCam['data']['url'])) {
						$CamUrl[] = [
							'id' => $camId,
							'url' => $dataCam['data']['url'],
							'isptz' => $IsPtz,
							'status' => 1,
							'cam_index' => $camindex,
							'comment' => $comment,
							'lat' => $lat,
							'long' => $long
						];
					} else {
						$CamUrl[] = [
							'id' => $camId,
							'url' => '',
							'status' => 0,
							'isptz' => $IsPtz,
							'cam_index' => $camindex,
							'comment' => $comment,
							'lat' => $lat,
							'long' => $long
						];
					}
				}
			}
		}


		$JtsObject['cameras'] = $CamUrl; 
		$result['data'] = $JtsObject;
		$res = json_encode($result);
		break;

	case "get_jts_map":
		$structure_id = isset($_GET['region_id']) ? $_GET['region_id'] : 0;
		$object_type = isset($_GET['object_type']) ? $_GET['object_type'] : 0;
		$object_id = isset($_GET['object_id']) ? $_GET['object_id'] : 0;

		$query  = "SELECT t.id, t.object_name, t.object_type, t.lat, t.long
		FROM hr.jts_objects t 
		WHERE 1=1 AND t.id != 20";
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		if ($object_type > 0) {
			$query .= " AND t.object_type = {$object_type} ";
		}
		if ($object_id > 0) {
			$query .= " AND t.id = {$object_id} ";
		}
		$sql->query($query);
		$JtsObjects = $sql->fetchAll();

		$res = json_encode($JtsObjects);
		break;

	case "get_public_events":
		$structure_id = isset($_GET['region_id']) ? $_GET['region_id'] : 0;
		$object_type = isset($_GET['object_type']) ? $_GET['object_type'] : 0;
		$object_id = isset($_GET['object_id']) ? $_GET['object_id'] : 0;

		$query  = "SELECT t.id, t.event_name as name, o.object_type,o.object_name, o.lat, o.long
		FROM hr.public_event1 t 
		LEFT JOIN hr.jts_objects o on o.id = t.object_id
		WHERE 1=1 ";
		if ($structure_id > 0) {
			$query .= " AND t.region_id = {$structure_id} ";
		}
		if ($object_type > 0) {
			$query .= " AND o.object_type = {$object_type} ";
		}
		if ($object_id > 0) {
			$query .= " AND o.id = {$object_id} ";
		}
		$sql->query($query);
		$JtsObjects = $sql->fetchAll();

		$res = json_encode($JtsObjects);
		break;

	// case "get_chats":
	// 	$sid     = (int)$_SESSION['staff_id'];          // yoki POST dan
	// 	$last_id = isset($_POST['last_id']) ? (int)$_POST['last_id'] : 0;

	// 	$query = "SELECT
	// 			m.id,
	// 			m.time,
	// 			m.sender,
	// 			m.receiver,
	// 			m.text,
	// 			m.pic AS sender_pic,
	// 			m.video,
	// 			m.file,
	// 			m.status,
	// 			m.staff_id,
	// 			(s.firstname || ' ' || s.lastname) AS sender,
	// 			SUBSTRING(s.firstname,1,1) || SUBSTRING(s.lastname,1,1) AS shortname
	// 		FROM tur.messages m
	// 		LEFT JOIN hr.staff s ON s.id = m.sender
	// 		WHERE m.sender != $sid
	// 		ORDER BY m.time ASC
	// 		LIMIT 50
	// 	";

	// 	$sql->query($query);
	// 	$Messages = $sql->fetchAll();

	// 	$res = json_encode($Messages);
	// 	break;

	case "get_chats":

    // Hozirgi user (staff) ID
    $sid = (int)($_SESSION['staff_id'] ?? $_GET['staff_id'] ?? 0);

    // Oxirgi ko‘rilgan xabar ID (real-time uchun)
    $last_id = isset($_GET['last_id']) ? (int)$_GET['last_id'] : 0;

    $where_last = $last_id > 0 ? "AND m.id > {$last_id}" : "";

    $query = "SELECT
            m.id,
            TO_CHAR(m.time AT TIME ZONE 'UTC' AT TIME ZONE 'Asia/Tashkent', 'DD-MM-YYYY HH24:MI:SS') AS time,
            m.sender,
            m.receiver,
            m.text,
            m.pic,
            m.video,
            m.file,
            m.status,
            m.staff_id,
            -- staff ma'lumotlari
            (s.firstname || ' ' || s.lastname) AS sender_name,
            SUBSTRING(s.firstname,1,1) || SUBSTRING(s.lastname,1,1) AS shortname,
            s.photo AS sender_pic   -- agar hr.staffs jadvalida 'photo' bo'lsa

        FROM tur.messages m
        LEFT JOIN hr.staff s ON s.id = m.staff_id   -- MUHIM O‘ZGARISH

        -- WHERE (m.sender = {$sid} OR m.receiver = {$sid})
		WHERE m.sender != $sid
        {$where_last}

        ORDER BY m.time ASC
        LIMIT 50
    ";

    $sql->query($query);
    $Messages = $sql->fetchAll();

    header("Content-Type: application/json; charset=utf-8");
    $res = json_encode($Messages);

break;

// case 'get_body_cameras_map':

//     $query = "
//         SELECT id, cam_code, comment, lat, long, status, structure_id
//         FROM hr.body_cameras
//         WHERE status = true
//     ";

//     $sql->query($query);
//     $cams = $sql->fetchAll();

//     foreach ($cams as &$cam) {
//         $cam['status'] = (
//             $cam['status'] === true ||
//             $cam['status'] === 't' ||
//             $cam['status'] === 1 ||
//             $cam['status'] === '1'
//         ) ? 1 : 0;
//     }

//     echo json_encode([
//         'success' => true,
//         'data' => $cams
//     ]);
//     exit;

case 'get_body_cameras_map':

    // selectdan kelgan region (viloyat)
    $structure_id = isset($_GET['region_id']) ? (int)$_GET['region_id'] : 0;

    $query = "
        SELECT 
            id,
            cam_code,
            comment,
            lat,
            long,
            status,
            structure_id
        FROM hr.body_cameras
        WHERE status = true
    ";

    /**
     * 1️⃣ FOYDALANUVCHI STRUKTURASI CHEGARASI
     */
    if ($UserStructure > 1) {
        $query .= "
            AND structure_id IN (
                SELECT id FROM hr.structure WHERE id = {$UserStructure}
                UNION
                SELECT id FROM hr.structure WHERE parent = {$UserStructure}
            )
        ";
    }

    /**
     * 2️⃣ SELECTDAN KELGAN REGION
     */
    if ($structure_id > 0) {
        $query .= " AND structure_id = {$structure_id} ";
    }

    $sql->query($query);
    $cams = $sql->fetchAll();

    // statusni normalize qilamiz (senga yoqqan logika 😄)
    foreach ($cams as &$cam) {
        $cam['status'] = (
            $cam['status'] === true ||
            $cam['status'] === 't' ||
            $cam['status'] === 1 ||
            $cam['status'] === '1'
        ) ? 1 : 0;
    }

    echo json_encode([
        'success' => true,
        'data' => $cams
    ]);
    exit;


    
	 case "administrative_offences":

    // 1️⃣ Pie chart – moddalar bo‘yicha
    $query = "
        SELECT
            t.id,
            t.name{$slang} AS name,
            SUM(a.count) AS value
        FROM tur.administrativ a
        LEFT JOIN tur.administrativ_types t ON t.id = a.violation_id
        WHERE 1=1
        GROUP BY t.id, t.name{$slang}
        ORDER BY t.id
    ";
    $sql->query($query);
    $stats = $sql->fetchAll();

    // 2️⃣ Bar chart – hududlar bo‘yicha
    $query = "
        SELECT
            s.id,
            s.name{$slang} AS name,
            SUM(a.count) AS value
        FROM tur.administrativ a
        LEFT JOIN hr.structure s ON s.id = a.region_id
        WHERE s.id IS NOT NULL
        GROUP BY s.id, s.name{$slang}
        ORDER BY s.id
    ";
    $sql->query($query);
    $stat_region = $sql->fetchAll();

    // 3️⃣ Final JSON
    $res = json_encode([
        "stats"        => $stats,
        "stat_region" => $stat_region,
        "list"        => [] // hozircha bo‘sh
    ]);

break;



       case "get_administrative_stats":

			$structure_id = isset($_GET['structure_id']) ? (int)$_GET['structure_id'] : 0;

			/*
			|--------------------------------------------------------------------------
			| 1) PIE CHART — Маъмурий ҳуқуқбузарликлар (TURLAR bo‘yicha)
			|--------------------------------------------------------------------------
			| ❗ Eslatma:
			| tur.administrativ.count YO‘Q
			| Har bir yozuv = 1 ta huquqbuzarlik
			| Shuning uchun COUNT(a.id) ishlatamiz
			*/
			$query = "
				SELECT
					at.id,
					at.name{$slang} AS name,
					COUNT(a.id) AS value
				FROM tur.administrativ a
				LEFT JOIN tur.administrativ_types at ON at.id = a.violation_id
				WHERE 1=1
			";

			if ($structure_id > 0) {
				$query .= " AND a.region_id = {$structure_id}";
			}

			$query .= "
				GROUP BY at.id, at.name{$slang}
				ORDER BY at.id ASC
			";

			$sql->query($query);
			$stats = $sql->fetchAll();

					$regionQuery = "
					SELECT
						a.region_id AS id,
						COALESCE(s.name{$slang}, 'Номаълум') AS name,
						COUNT(a.id) AS value
					FROM tur.administrativ a
					LEFT JOIN hr.structure s 
						ON s.id = a.region_id
					WHERE a.region_id IS NOT NULL
				";

				if ($structure_id > 0) {
					$regionQuery .= " AND a.region_id = {$structure_id}";
				}

				$regionQuery .= "
					GROUP BY a.region_id, s.name{$slang}
					ORDER BY a.region_id ASC
				";

			$sql->query($regionQuery);
			$stat_region = $sql->fetchAll();


			/*
			|--------------------------------------------------------------------------
			| 3) LIST (keyingi bosqich uchun)
			|--------------------------------------------------------------------------
			*/
			$list = [];


			/*
			|--------------------------------------------------------------------------
			| 4) FINAL JSON
			|--------------------------------------------------------------------------
			*/
			$res = json_encode([
				'stats'       => $stats,
				'stat_region' => $stat_region,
				'list'        => $list
			]);

      break;

	  case "get_criminal_stats":

			$structure_id = isset($_GET['structure_id']) ? (int)$_GET['structure_id'] : 0;

			/*
			|--------------------------------------------------------------------------
			| 1) PIE CHART — Жиноятлар (TURLAR bo‘yicha)
			|--------------------------------------------------------------------------
			| tur.criminals jadvalida:
			| - violation_id → type
			| - har bir yozuv = 1 ta jinoyat
			| → COUNT(c.id)
			*/
			$query = "
				SELECT
					ct.id,
					ct.name{$slang} AS name,
					COUNT(c.id) AS value
				FROM tur.criminals c
				LEFT JOIN tur.criminals_types ct 
					ON ct.id = c.violation_id
				WHERE 1=1
			";

			if ($structure_id > 0) {
				$query .= " AND c.region_id = {$structure_id}";
			}

			$query .= "
				GROUP BY ct.id, ct.name{$slang}
				ORDER BY ct.id ASC
			";

			$sql->query($query);
			$stats = $sql->fetchAll();


			/*
			|--------------------------------------------------------------------------
			| 2) BAR CHART — Ҳудудлар кесимида
			|--------------------------------------------------------------------------
			*/
			$regionQuery = "
				SELECT
					c.region_id AS id,
					COALESCE(s.name{$slang}, 'Номаълум') AS name,
					COUNT(c.id) AS value
				FROM tur.criminals c
				LEFT JOIN hr.structure s 
					ON s.id = c.region_id
				WHERE c.region_id IS NOT NULL
			";

			if ($structure_id > 0) {
				$regionQuery .= " AND c.region_id = {$structure_id}";
			}

			$regionQuery .= "
				GROUP BY c.region_id, s.name{$slang}
				ORDER BY c.region_id ASC
			";

			$sql->query($regionQuery);
			$stat_region = $sql->fetchAll();


			/*
			|--------------------------------------------------------------------------
			| 3) LIST (keyingi bosqichlar uchun — hozir bo‘sh)
			|--------------------------------------------------------------------------
			*/
			$list = [];


			/*
			|--------------------------------------------------------------------------
			| 4) FINAL JSON
			|--------------------------------------------------------------------------
			*/
			$res = json_encode([
				'stats'       => $stats,
				'stat_region' => $stat_region,
				'list'        => $list
			]);

		break;







	
		
	case "get_events_date":

		// $start_date  = !empty($_POST['start_date']) ? $_POST['start_date'] : null;
		// $finish_date = !empty($_POST['finish_date']) ? $_POST['finish_date'] : null;


		/* ================= REGIONS ================= */
		$query = "SELECT id, name{$slang} AS name FROM hr.structure ";

		if ($UserStructure > 1) {
			$query .= "
				WHERE id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
				ORDER BY turn
			";
		} else {
			$query .= "
				WHERE id != 1 
				AND id < 16
				ORDER BY turn
			";
		}

		$sql->query($query);
		$Regions = $sql->fetchAll();


		/* ================= EVENT TYPES ================= */
		$query = "SELECT id, name{$slang} AS event_type FROM tur.public_event_types";
		$sql->query($query);
		$EventTypes = $sql->fetchAll();


		/* ================= EVENT CATEGORY ================= */
		$query = "SELECT id, name{$slang} AS event_category FROM tur.event_category";
		$sql->query($query);
		$EventCategory = $sql->fetchAll();


		/* ================= JTS OBJECTS ================= */
		$query = "SELECT id, object_name AS name FROM hr.jts_objects";
		$sql->query($query);
		$jts_objects = $sql->fetchAll();


		/* ================= STRUCTURES ================= */
		$query = "SELECT t.id, t.name{$slang} AS name FROM hr.structure t ORDER BY t.turn ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();


		/* ================= RESPONSIBLE STAFF ================= */
		$query = "
			SELECT t.id, CONCAT(t.lastname,' ',t.firstname,' ',t.surname) AS name
			FROM hr.staff t
		";

		if ($UserStructure > 1) {
			$query .= " WHERE t.structure_id = {$UserStructure} ";
		}

		$query .= " ORDER BY t.id ASC";
		$sql->query($query);

		$Responsible = $sql->fetchAll();


		/* ================= EVENTS ================= */
		$query = "
			SELECT 
				m.id,
				t.name{$slang} AS event_type,
				m.event_direction,
				m.iiv_count,
				m.responsible_mg_name,
				m.sapyor_count AS sapyor,
				m.fvv_count,
				m.mg_counts,
				m.event_view,
				m.start_event,
				m.finish_event,
				m.reserve_count,
				m.event_name,
				m.responsible_spring_name,
				m.event_responsible_organization,
				ec.name{$slang} AS event_category,
				m.organizer,
				m.responsible_name,
				m.responsible_phone,
				m.responsible_iiv_name,
				m.reserve_name,
				m.responsible_msgr_name,
				m.responsible_fvv_name,
				m.people_count,
				m.spring_count,
				m.object_name,
				s.name{$slang} AS region_name,
				m.lat,
				m.long,
				m.comment
			FROM hr.public_event1 m
			LEFT JOIN tur.public_event_types t ON t.id = m.event_type
			LEFT JOIN hr.structure s ON s.id = m.region_id
			LEFT JOIN tur.event_category ec ON ec.id = m.event_category_id
			WHERE 1=1
		";

		/* ======== DATE FILTER ======== */
		if ($start_date && $finish_date) {
			// $query .= " AND DATE(m.start_event) BETWEEN '{$start_date}' AND '{$finish_date}' ";
		} else {
			$query .= " AND DATE(m.start_event) = CURRENT_DATE ";
		}

		/* ======== USER STRUCTURE FILTER ======== */
		if ($UserStructure > 1) {
			$query .= "
				AND m.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
			";
		}

		$query .= " ORDER BY m.id ASC";

		$sql->query($query);
		$Events = $sql->fetchAll();
		
		// echo '<pre>';
		// print_r($Events);
		// echo '</pre>';
		// die();

		/* =============== SMARTY ================= */

		$res = json_encode([
				'Events'       => $Events
			]);
	break;








	case "get_reyd_events_date":

		$start_date  = !empty($_POST['start_date']) ? $_POST['start_date'] : null;
		$finish_date = !empty($_POST['finish_date']) ? $_POST['finish_date'] : null;


		/* ================= REGIONS ================= */
		$query = "SELECT id, name{$slang} AS name FROM hr.structure ";

		if ($UserStructure > 1) {
			$query .= "
				WHERE id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
				ORDER BY turn
			";
		} else {
			$query .= "
				WHERE id != 1 
				AND id < 16
				ORDER BY turn
			";
		}

		$sql->query($query);
		$Regions = $sql->fetchAll();


		/* ================= EVENT TYPES ================= */
		$query = "SELECT id, name{$slang} AS type FROM ref.reyd_event_types";
		$sql->query($query);
		$EventTypes = $sql->fetchAll();



		/* ================= STRUCTURES ================= */
		$query = "SELECT t.id, t.name{$slang} AS name FROM hr.structure t ORDER BY t.turn ASC";
		$sql->query($query);
		$Structures = $sql->fetchAll();


		/* ================= RESPONSIBLE STAFF ================= */
		$query = "
			SELECT t.id, CONCAT(t.lastname,' ',t.firstname,' ',t.surname) AS name
			FROM hr.staff t
		";

		if ($UserStructure > 1) {
			$query .= " WHERE t.structure_id = {$UserStructure} ";
		}

		$query .= " ORDER BY t.id ASC";
		$sql->query($query);

		$Responsible = $sql->fetchAll();


		/* ================= EVENTS ================= */
		$query = "
			SELECT 
				m.id,
				s.name{$slang} AS region_name,
				str.name{$slang} AS structure_name,
				CONCAT(r.name1,' ', staff.lastname,' ',staff.firstname,' ',staff.surname) AS responsible_name,
				t.name{$slang} AS type,
				m.start_date,
				m.end_date,
				m.exercises_type,
				m.staff_count,
				m.vehicles_count,
				m.description
			FROM tur.reyd_events m
			LEFT JOIN ref.reyd_event_types t ON t.id = m.type
			LEFT JOIN hr.structure s ON s.id = m.region_id
			LEFT JOIN hr.structure str ON str.id = m.structure_id
			LEFT JOIN hr.staff staff ON staff.id = m.responsible_id
			LEFT JOIN ref.ranks r ON r.id = staff.rank_id
			WHERE 1=1
		";

		/* ======== DATE FILTER ======== */
		if ($start_date && $finish_date) {
			$query .= " AND DATE(m.start_date) BETWEEN '{$start_date}' AND '{$finish_date}' ";
		} else {
			$query .= " AND DATE(m.start_date) = CURRENT_DATE ";
		}

		/* ======== USER STRUCTURE FILTER ======== */
		if ($UserStructure > 1) {
			$query .= "
				AND m.region_id IN (
					SELECT id FROM hr.structure WHERE id = {$UserStructure}
					UNION
					SELECT id FROM hr.structure WHERE parent = {$UserStructure}
				)
			";
		}

		$query .= " ORDER BY m.id ASC";

		$sql->query($query);
		$Events = $sql->fetchAll();
		
		// echo '<pre>';
		// print_r($Events);
		// echo '</pre>';
		// die();

		/* =============== SMARTY ================= */

		$res = json_encode([
				'Events'       => $Events
			]);
	break;











	case "get_injuries":

	$query = "SELECT
			r.id AS region_id,
			r.name1 AS region_name,

			/* ================= INJURY TYPE COUNTS ================= */
			COALESCE(
				(
					SELECT json_agg(
						json_build_object(
							'injury_type_id', it2.id,
							'injury_type_name', it2.name{$slang},
							'count', COALESCE(cnt.cnt, 0)
						)
						ORDER BY it2.id
					)
					FROM tur.injuries_types it2
					LEFT JOIN (
						SELECT
							injury_type_id::bigint,
							COUNT(*) AS cnt
						FROM hr.injuries
						WHERE region_id = r.id
						   AND date BETWEEN '2024-01-01' AND '2025-12-31'
						GROUP BY injury_type_id::bigint
					) cnt
						ON cnt.injury_type_id = it2.id
				),
				'[]'::json
			) AS injury_type_counts,

			/* ================= STAFF / TROOPS INJURIES ================= */
			COALESCE(
				json_agg(
					json_build_object(
						/* REGION */
						'region_id', r.id,
						'region_name', r.name1,

						/* STRUCTURE */
						'structure_id', st.id,
						'structure_name', st.name1,

						/* STAFF */
						'staff_id', s.id,
						'firstname', s.firstname,
						'lastname', s.lastname,
						'surname', s.surname,

						/* RANK */
						'rank_id', s.rank_id,
						'rank_name', rk.name{$slang},

						/* INJURY */
						'injury_id', i.id,
						'injury_type_id', i.injury_type_id,
						'injury_type_name', it.name{$slang},
						'comment', i.comment,
						'date', i.date
					)
					ORDER BY i.date
				) FILTER (WHERE i.id IS NOT NULL),
				'[]'::json
			) AS staff_injuries

		FROM hr.structure r   /* REGION */

		LEFT JOIN hr.injuries i
			ON i.region_id = r.id
		    AND i.date BETWEEN '2024-01-01' AND '2025-12-31'

		LEFT JOIN tur.injuries_types it
			ON it.id = i.injury_type_id::bigint

		LEFT JOIN hr.structure st   /* STRUCTURE */
			ON st.id = i.structure_id

		
		LEFT JOIN LATERAL (
			SELECT *
			FROM hr.staff s
			WHERE s.structure_id = st.id
			ORDER BY s.id
			LIMIT 1
		) s ON TRUE

		LEFT JOIN ref.ranks rk
			ON rk.id = s.rank_id

		WHERE r.id BETWEEN 2 AND 15
		GROUP BY r.id, r.name1
		ORDER BY r.id;
	";

	 $sql->query($query);
    $rows = $sql->fetchAll();

    foreach ($rows as &$row) {
        $row['injury_type_counts'] = json_decode($row['injury_type_counts'], true);
        $row['staff_injuries']     = json_decode($row['staff_injuries'], true);
    }
    unset($row);

    header('Content-Type: application/json');
    $res = json_encode([
        'success' => true,
        'data' => $rows
    ]);
    break;
	





	case "get_injuries_stats":

    $start_date = $_GET['start_date'] ?? '2025-01-01';
    $end_date   = $_GET['end_date']   ?? '2025-12-31';

    // 1️⃣ Hududlar
    $sql->query("
        SELECT id, name{$slang} AS name
        FROM hr.structure
        WHERE id BETWEEN 2 AND 15
        ORDER BY id
    ");
    $regions = $sql->fetchAll();

    // 2️⃣ Jarohat turlari
    $sql->query("
        SELECT id, name{$slang} AS name
        FROM tur.injuries_types
        ORDER BY id
    ");
    $types = $sql->fetchAll();

    // 3️⃣ Pie chart (jami)
    $sql->query("
        SELECT
            it.id,
            it.name{$slang} AS name,
            COUNT(i.id) AS value
        FROM tur.injuries_types it
        LEFT JOIN hr.injuries i
            ON i.injury_type_id::int = it.id
           AND i.date BETWEEN '{$start_date}' AND '{$end_date}'
        GROUP BY it.id, it.name{$slang}
        ORDER BY it.id
    ");
    $total = $sql->fetchAll();

    // 4️⃣ Hudud × Jarohat matrix
    $matrix = [];

    foreach ($regions as $r) {
        foreach ($types as $t) {
            $matrix[] = [
                'region_id'   => (int)$r['id'],
                'region_name' => $r['name'],
                'type_id'     => (int)$t['id'],
                'type_name'   => $t['name'],
                'value'       => 0
            ];
        }
    }

    $sql->query("
        SELECT
            region_id::int,
            injury_type_id::int,
            COUNT(*) AS cnt
        FROM hr.injuries
        WHERE date BETWEEN '{$start_date}' AND '{$end_date}'
          AND region_id BETWEEN 2 AND 15
        GROUP BY region_id::int, injury_type_id::int
    ");
    $rows = $sql->fetchAll();

    foreach ($rows as $row) {
        foreach ($matrix as &$cell) {
            if (
                $cell['region_id'] == (int)$row['region_id'] &&
                $cell['type_id']   == (int)$row['injury_type_id']
            ) {
                $cell['value'] = (int)$row['cnt'];
                break;
            }
        }
    }
    unset($cell);

    header('Content-Type: application/json');
    $res = json_encode([
        'success' => true,
        'regions' => $regions,
        'types'   => $types,
        'total'   => $total,
        'matrix'  => $matrix
    ]);

break;


}

echo $res;