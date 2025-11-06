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

	// O'zgartirish kiritgan joyim tugashi
	case "get_duty":
		$RegId = isset($_GET['id']) ? $_GET['id'] : 1;

		$query = "SELECT 
				t.lastname,
				t.photo,
				t.phone,
				p.name{$slang} as position,
				ra.shortname{$slang} as role
			FROM hr.duty_staff d 
			LEFT JOIN hr.staff t ON (t.id = d.staff1 OR t.id = d.staff2 OR t.id = d.staff3)
			LEFT JOIN hr.positions p ON p.id = t.position_id
			left join ref.ranks ra on ra.id  = t.rank_id
			WHERE d.date = CURRENT_DATE and d.structure_id = {$RegId}
			ORDER BY p.turn";

		$sql->query($query);
		$Duty = $sql->fetchAll();

		$staffs = [$Dict['masul'], $Dict['staff_2'], $Dict['staff_3']];
		foreach ($Duty as $key => &$item) {
			$item['staff'] = $staffs[$key];
		}

		// echo '<pre>';
		// print_r($Duty);
		// echo '</pre>';
		// die();


		$res = json_encode($Duty);
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
		$page = isset($_GET['page']) ? $_GET['page'] : 1;
		$limit = isset($_GET['limit']) ? $_GET['limit'] : 10;
		$start = ($page - 1) * $limit;
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;

		$JtsObjects = [];
		$query  = "SELECT t.id::int, s.name{$slang} as structure, t.object_name, o.name{$slang} as object_type, c.name{$slang} as cooperate,
		t.address, t.area, t.admin_phone, t.object_head, t.head_phone, t.police_name, t.police_phone,
		COALESCE(COUNT(jc.id), 0) AS count_cameras,
		COALESCE(COUNT(js.id), 0) AS count_sos,
		COALESCE(COUNT(jd.id), 0) AS count_doors,
		t.photo, t.lat, t.long
		FROM hr.jts_objects t 
		left join hr.structure s on s.id  = t.structure_id
		left join hr.involved_objects o on o.id = t.object_type
		LEFT JOIN hr.cooperate c on c.id = t.cooperate_id
		LEFT JOIN hr.jts_objects_camera jc on jc.object_id = t.id
		LEFT JOIN hr.jts_objects_sos js on js.object_id = t.id
		LEFT JOIN hr.jts_objects_door jd on jd.object_id = t.id
		WHERE 1=1 ";
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		$query .= " 
		GROUP BY t.id, s.name{$slang}, o.name{$slang}, c.name{$slang}
		ORDER BY t.id desc LIMIT {$limit} OFFSET {$start}";
		$sql->query($query);
		while ($row = $sql->fetchAssoc()) {
			$row['id'] = (int)$row['id'];
			$JtsObjects[] = $row;
		}

		//total count
		$count_query = "SELECT COALESCE(COUNT(*) , 0) as total FROM hr.jts_objects t WHERE 1=1 ";
		if ($structure_id > 0) {
			$count_query .= " AND t.structure_id = {$structure_id} ";
		}
		$sql->query($count_query);
		$total_count = $sql->fetchAssoc();



		$JtsObjects = [
			'page' => $page,
			'limit' => $limit,
			'total' => (int)$total_count['total'],
			'data' => $JtsObjects
		];
		$res = json_encode($JtsObjects);
		break;

	case "get_jts_object_by_id":
		$id = isset($_GET['id']) ? $_GET['id'] : 0;
		$car_ids = [];

		$query  = "SELECT t.id, s.name{$slang} as structure, t.object_name, o.name{$slang} as object_type, CONCAT(c.name{$slang}, ' ',c.phone) as cooperate,
		t.address, t.area, t.admin_phone, t.object_head, t.head_phone, t.police_name, t.police_phone,
		COALESCE(COUNT(jd.id), 0) AS count_doors,
		t.photo, t.lat, t.long, ST_AsGeoJSON(geom) AS geom_geojson
		FROM hr.jts_objects t 
		left join hr.structure s on s.id  = t.structure_id
		left join hr.jts_objects_door jd on jd.object_id = t.id
		left join hr.involved_objects o on o.id = t.object_type
		left join hr.cooperate c on c.id = t.cooperate_id
		WHERE t.id = {$id}
		GROUP BY t.id, s.name{$slang}, o.name{$slang}, c.name{$slang}, c.phone ";
		$sql->query($query);
		$JtsObject = $sql->fetchAssoc();

		$query  = "SELECT t.id, t.name, t.lat, t.long
		FROM hr.jts_objects_sos t 
		WHERE t.object_id = {$JtsObject['id']}
		ORDER BY t.id desc ";
		$sql->query($query);
		$Sos = $sql->fetchAll();

		$object_id = ($_GET['id']);
		$query  = "SELECT t.id, t.name, t.lat, t.long
		FROM hr.jts_objects_door t 
		WHERE t.object_id = {$JtsObject['id']}
		ORDER BY t.id desc ";
		$sql->query($query);
		$Door = $sql->fetchAll();

		$JtsObject['sos'] = $Sos;
		$JtsObject['door'] = $Door;

		$query  = "SELECT t.id, CONCAT(r.name{$slang}, ' ', s.lastname, ' ', s.firstname, ' ', s.surname) AS responsible_name,
		COALESCE(COUNT(td.id), 0) AS all_staff,
		SUM(CASE WHEN td.patrul_type = 1 THEN 1 ELSE 0 END) AS walker_patrul,
		SUM(CASE WHEN td.patrul_type = 2 THEN 1 ELSE 0 END) AS avto_patrul,
		SUM(CASE WHEN td.patrul_type = 4 THEN 1 ELSE 0 END) AS horse_patrul,
		COUNT(DISTINCT td.car_id) AS car_count,
		COALESCE(SUM(cardinality(td.epikirofka_id)), 0) AS epikirofka_count,
		COALESCE(COUNT(js.id), 0) AS count_sos,
		COALESCE(COUNT(jc.id), 0) AS count_cameras,
		COALESCE(COUNT(DISTINCT td.patrul_type), 0) AS patrul_types_count
		FROM hr.daily_routine t 
		LEFT JOIN hr.dailiy_routine_date td ON td.routine_id = t.id
		LEFT JOIN hr.staff s ON s.id = t.responsible_id
		LEFT JOIN ref.ranks r ON r.id = s.rank_id
		left join hr.jts_objects_camera jc on jc.object_id = {$JtsObject['id']}
		left join hr.jts_objects_sos js on js.object_id = {$JtsObject['id']}
		WHERE t.object_id = {$JtsObject['id']}
		GROUP BY t.id, r.name{$slang}, s.lastname, s.firstname, s.surname
		ORDER BY t.id desc LIMIT 1";
		$sql->query($query);
		$Routine = $sql->fetchAssoc();

		$JtsObject['routine'] = $Routine;
		if ($Routine) {
			$query  = "SELECT t.id, t.car_id
			FROM hr.dailiy_routine_date t 
			WHERE t.routine_id = {$Routine['id']}
			ORDER BY t.id desc";
			$sql->query($query);
			$RoutineDate = $sql->fetchAll();

			foreach ($RoutineDate as $key => $value) {
				$car_ids[] = $value['car_id'];
			}
		}

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


		$query  = "SELECT t.id, t.cam_code, t.name,
		case when t.is_ptz then 'false' else 'true' end as is_ptz
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

				$dataCam = GetCamUrl($camindex);
				if (isset($dataCam['data']['url'])) {
					$CamUrl[] = [
						'id' => $camId,
						'url' => $dataCam['data']['url'],
						'isptz' => $IsPtz,
						'status' => 1,
						'name' => $comment
					];
				}else{
					$CamUrl[] = [
						'id' => $camId,
						'url' => '',
						'status' => 0,
						'isptz' => $IsPtz,
						'name' => $comment
					];
				}


			}
		}

		// $CamUrl[] = [
		// 	'id' => 1,
		// 	'url' => 'ws://10.119.0.2:559/sms/HCPEurl/commonvideobiz_4nsIc77VPXOC36yh9SjSyUxgjeWzpyeuCBt8Th6q61Vntl%2FQTFt7PLeKsVjj0sxKWXA4DEhqkG55HTwpvSNqkDjP2gupD9v6AoVvB2cISLErzV%2F90csAGgWt7WmaPCN4wPZsHjt0xX%2FDimRToiFS9Qs9QsTOLG2qLZau8J4cmAgepIapuc9YS8wy5%2FEvPEAB3I5H9XVW%2FC7nlyvIZaXLRaEcBTlIuU66zhigLiiaC1c%3D',
		// 	'isptz' => false,
		// 	'name' => 'Test Camera'
		// ];

		$result['data'] = $JtsObject;
		$result['cameras'] = $CamUrl;
		$res = json_encode($result);
		break;

	case "get_jts_map":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;
		$object_type = isset($_GET['object_type']) ? $_GET['object_type'] : 0;
		$object_id = isset($_GET['object_id']) ? $_GET['object_id'] : 0;

		$query  = "SELECT t.id, t.object_name, t.object_type, t.lat, t.long
		FROM hr.jts_objects t 
		WHERE 1=1 ";
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

	case "get_divisions":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;
		$query  = "SELECT t.id, t.name{$slang} as name
		FROM ref.divisions t 
		WHERE 1=1 ";
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
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

		$query  = "SELECT t.id, t.object_name as name 
		FROM hr.jts_objects t 
		WHERE 1=1 ";
		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		$query .= " ORDER BY t.id desc";
		$sql->query($query);
		$Objects = $sql->fetchAll();

		$res = json_encode($Objects);
		break;
}

// echo iconv("cp1251", "UTF-8", $res);
echo $res;
