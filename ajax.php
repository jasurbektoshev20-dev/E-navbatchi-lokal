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
			$item['staff'] = $staffs[$key] ?? null;
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
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
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
		// // die();Xiyobonni shua
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
					$query  = "SELECT t.id, t.cam_code, t.comment, t.lat, t.long
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
			foreach ($Bodys as $bkey => $body_c) {
				$bodycamindex = $body_c['cam_code'];
				$bodyCamId = $body_c['id'];
				$comment = $body_c['comment'];

				$dataBodyCam = GetCamUrlBody($bodycamindex);
				if (isset($dataBodyCam['data']['url'])) {
					$BodyCamUrl[] = [
						'id' => $bodyCamId,
						'url' => $dataBodyCam['data']['url'],
						'status' => 1,
						'cam_index' => $bodycamindex,
						'comment' => $comment,
						'lat' => $body_c['lat'],
						'long' => $body_c['long'],
						'staff_name' => $body_c['staff_name'],
						'staff_photo' => $body_c['staff_photo'],
						'staff_phone' => $body_c['staff_phone'],
						'staff_sname' => $body_c['staff_sname']
					];
				} else {
					$BodyCamUrl[] = [
						'id' => $bodyCamId,
						'url' => '',
						'status' => 0,
						'cam_index' => $bodycamindex,
						'comment' => $comment,
						'lat' => $body_c['lat'],
						'long' => $body_c['long'],
						'staff_name' => isset($body_c['staff_name']) ? $body_c['staff_name'] : '',
						'staff_photo' => isset($body_c['staff_photo']) ? $body_c['staff_photo'] : '',
						'staff_phone' => isset($body_c['staff_phone']) ? $body_c['staff_phone'] : '',
						'staff_sname' => isset($body_c['staff_sname']) ? $body_c['staff_sname'] : '',
					];
				}
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

	case "get_public_events_by_id":
		header('Content-Type: application/json; charset=utf-8');

		$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
		$car_ids = [];

		// Get event row
		$query = "SELECT t.*, t.object_id AS pe_object_id
              FROM hr.public_event1 t
              WHERE t.id = {$id} LIMIT 1";
		$sql->query($query);
		$PE = $sql->fetchAssoc();

		if (!$PE) {
			http_response_code(404);
			echo json_encode(['error' => "Event with id {$id} not found"], JSON_UNESCAPED_UNICODE);
			exit;
		}

		// Try to join jts_objects info
		$query  = "SELECT 
        t.id AS event_id,
        t.object_id AS object_id,
        j.id AS jts_object_id,
        s.name{$slang} AS structure,
        j.object_name,
        o.name{$slang} AS object_type,
        j.address, j.area, j.admin_phone, j.object_head, j.head_phone,
        n.head_iiv, n.head_iiv_phone, j.markets_count, j.eating_place_count,
        n.head, n.assistant_governor, n.youth_leader, n.womens_activist,
        n.tax_inspector, n.social_employe, j.sales_places_count,
        n.head_phone, n.assistant_governor_phone, n.youth_leader_phone,
        n.womens_activist_phone, n.tax_inspector_phone, n.social_employe_phone,
        j.lat, j.long, ST_AsGeoJSON(j.geom) AS geom_geojson
    FROM hr.public_event1 t
    LEFT JOIN hr.jts_objects j ON j.id = t.object_id
    LEFT JOIN hr.structure s ON s.id = t.region_id
    LEFT JOIN hr.involved_objects o ON o.id = j.object_type
    LEFT JOIN hr.neighborhoods n ON n.id = j.neighborhood_id
    WHERE t.id = {$id}
    GROUP BY 
        t.id, t.object_id, j.id, s.name{$slang}, j.object_name, o.name{$slang},
        j.address, j.area, j.admin_phone, j.object_head, j.head_phone,
        n.head_iiv, n.head_iiv_phone, j.markets_count, j.eating_place_count,
        n.head, n.assistant_governor, n.youth_leader, n.womens_activist,
        n.tax_inspector, n.social_employe, j.sales_places_count,
        n.head_phone, n.assistant_governor_phone, n.youth_leader_phone,
        n.womens_activist_phone, n.tax_inspector_phone, n.social_employe_phone,
        j.lat, j.long, ST_AsGeoJSON(j.geom)";

		$sql->query($query);
		$JtsObject = $sql->fetchAssoc();
		if (!$JtsObject) $JtsObject = [];

		// Determine object id for related lookups
		$objId = 0;
		if (!empty($PE['pe_object_id'])) {
			$possibleObj = intval($PE['pe_object_id']);
			$sql->query("SELECT id FROM hr.jts_objects WHERE id = {$possibleObj} LIMIT 1");
			$chk = $sql->fetchAssoc();
			if ($chk && isset($chk['id'])) $objId = intval($chk['id']);
		}
		if ($objId === 0 && !empty($JtsObject['jts_object_id'])) {
			$objId = intval($JtsObject['jts_object_id']);
		}
		if ($objId === 0 && !empty($PE['lat']) && !empty($PE['long'])) {
			$lat = floatval($PE['lat']);
			$lon = floatval($PE['long']);
			$sql->query("SELECT id FROM hr.jts_objects WHERE lat IS NOT NULL AND long IS NOT NULL ORDER BY ((lat - {$lat})*(lat - {$lat}) + (long - {$lon})*(long - {$lon})) ASC LIMIT 1");
			$f = $sql->fetchAssoc();
			if ($f && isset($f['id'])) $objId = intval($f['id']);
		}

		// Attach raw event
		$JtsObject['event_raw'] = $PE;

		// SOS and Doors
		$Sos = [];
		$Door = [];
		if ($objId > 0) {
			$sql->query("SELECT t.id, t.name, t.lat, t.long FROM hr.jts_objects_sos t WHERE t.object_id = {$objId} ORDER BY t.id DESC");
			$Sos = $sql->fetchAll();

			$sql->query("SELECT t.id, t.name, t.lat, t.long FROM hr.jts_objects_door t WHERE t.object_id = {$objId} ORDER BY t.id DESC");
			$Door = $sql->fetchAll();
		}
		$JtsObject['sos'] = $Sos;
		$JtsObject['door'] = $Door;

		// Cameras — build same structure as get_jts_object_by_id returns, AND also set data.cameras for compatibility
		$CamUrl = [];
		if ($objId > 0) {
			$sql->query("SELECT t.id, t.cam_code, t.name, t.lat, t.long, CASE WHEN t.is_ptz THEN 1 ELSE 0 END AS is_ptz FROM hr.jts_objects_camera t WHERE t.object_id = {$objId}");
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

		// Routine (stats) specific to event
		$query = "SELECT pe.id AS event_id,
        COUNT(DISTINCT t.staff_id) AS all_staff, 
        COUNT(t.car_id) AS car_count,
        COALESCE(SUM(cardinality(t.epikirofka_id)), 0) AS epikirofka_count,
        (
            SELECT STRING_AGG(e.name{$slang}, ', ')
            FROM (
                SELECT DISTINCT unnest(ped.epikirofka_id) AS epic_id
                FROM hr.public_event_duty ped
                WHERE ped.public_event1_id = pe.id
            ) x
            JOIN ref.epic e ON e.id = x.epic_id
        ) AS epic,
        (SELECT COUNT(*) FROM hr.jts_objects_camera WHERE object_id = pe.object_id) AS count_cameras,
        (SELECT COUNT(*) FROM hr.jts_objects_sos WHERE object_id = pe.object_id) AS count_sos
    FROM hr.public_event1 pe 
    LEFT JOIN hr.public_event_duty t ON t.public_event1_id = pe.id 
    WHERE pe.id = {$id}
    GROUP BY pe.id, pe.object_id;";
		$sql->query($query);
		$Routine = $sql->fetchAll();

		// Body cams & Tracks placeholders
		$BodyCamUrl = [];
		$Tracks = [];

		// Final assembly with BOTH places for cameras to match your frontend expectations
		$JtsObject['cameras'] = $CamUrl;        // inside data
		$JtsObject['routine'] = $Routine;
		$JtsObject['body_cameras'] = $BodyCamUrl;
		$JtsObject['tracks'] = $Tracks;

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





















































	case "jts_objects":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;

		// 1) Statistika (COUNT)
		$query = "SELECT COUNT(t.id) as value, b.id, b.name{$slang} as name
		FROM hr.jts_objects t
		LEFT JOIN hr.involved_objects b ON b.id = t.object_type
		WHERE 1=1 ";

		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		$query .= " GROUP BY b.id ORDER BY b.id ASC";

		$sql->query($query);
		$stats = $sql->fetchAll();

		// 2) Statistika hududlar kesimida
		$regionQuery = "SELECT 
				s.id,
				s.name{$slang} as name,
				COUNT(t.id) as value
			FROM hr.jts_objects t
			LEFT JOIN hr.structure s ON s.id = t.structure_id
			WHERE 1=1
		";

		if ($UserStructure > 1) {
			$regionQuery .= " AND t.structure_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$regionQuery .= " AND t.structure_id = {$structure_id} ";
		}

		$regionQuery .= " GROUP BY s.id ORDER BY s.id ASC";

		$sql->query($regionQuery);
		$stat_region = $sql->fetchAll();


		// 3) Ob'ektlar ro'yxati
		$listQuery = "SELECT 
				t.id,
				t.object_name,
				b.id as type_id,
				b.name{$slang} AS type_name
			FROM hr.jts_objects t
			LEFT JOIN hr.involved_objects b ON b.id = t.object_type
			WHERE 1=1
		";

		if ($UserStructure > 1) {
			$listQuery .= " AND t.structure_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$listQuery .= " AND t.structure_id = {$structure_id} ";
		}

		$listQuery .= " ORDER BY b.name{$slang} ASC, t.object_name ASC";

		$sql->query($listQuery);
		$list = $sql->fetchAll();


		// 3) Guruhlash (type → object list)
		$grouped = [];
		foreach ($list as $row) {
			$typeId = $row['type_id'];

			if (!isset($grouped[$typeId])) {
				$grouped[$typeId] = [
					"id" => $typeId,
					"name" => $row['type_name'],
					"objects" => []
				];
			}

			$grouped[$typeId]["objects"][] = [
				"id" => $row['id'],
				"object_name" => $row['object_name']
			];
		}

		// Convert to numeric array
		$grouped = array_values($grouped);

		// Final response
		$res = json_encode([
			"stats" => $stats,
			"list" => $grouped,
			"stat_region" => $stat_region
		]);
		break;









	case "public_events":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;

		// 1) Statistika (COUNT)
		$query = "SELECT COUNT(t.id) as value, b.id, b.name{$slang} as name
				FROM hr.public_event1 t
				LEFT JOIN tur.public_event_types b ON b.id = t.event_type
				WHERE 1=1 ";

		if ($UserStructure > 1) {
			$query .= " AND t.region_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$query .= " AND t.region_id = {$structure_id} ";
		}
		$query .= " GROUP BY b.id ORDER BY b.id ASC";

		$sql->query($query);
		$stats = $sql->fetchAll();

		// 2) Statistika hududlar kesimida
		$regionQuery = "SELECT 
						s.id,
						s.name{$slang} as name,
						COUNT(t.id) as value
					FROM hr.public_event1 t
					LEFT JOIN hr.structure s ON s.id = t.region_id
					WHERE 1=1
				";

		if ($UserStructure > 1) {
			$regionQuery .= " AND t.region_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$regionQuery .= " AND t.region_id = {$structure_id} ";
		}

		$regionQuery .= " GROUP BY s.id ORDER BY s.id ASC";

		$sql->query($regionQuery);
		$stat_region = $sql->fetchAll();


		// 3) Ob'ektlar ro'yxati
		$listQuery = "SELECT 
						t.id,
						j.object_name,
						b.id as type_id,
						b.name{$slang} AS type_name
					FROM hr.public_event1 t
					LEFT JOIN tur.public_event_types b ON b.id = t.event_type
					LEFT JOIN hr.jts_objects j ON j.id = t.object_id
					WHERE 1=1
				";

		if ($UserStructure > 1) {
			$listQuery .= " AND t.region_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$listQuery .= " AND t.region_id = {$structure_id} ";
		}

		$listQuery .= " ORDER BY b.name{$slang} ASC, j.object_name ASC";

		$sql->query($listQuery);
		$list = $sql->fetchAll();


		// 3) Guruhlash (type → object list)
		$grouped = [];
		foreach ($list as $row) {
			$typeId = $row['type_id'];

			if (!isset($grouped[$typeId])) {
				$grouped[$typeId] = [
					"id" => $typeId,
					"name" => $row['type_name'],
					"objects" => []
				];
			}

			$grouped[$typeId]["objects"][] = [
				"id" => $row['id'],
				"object_name" => $row['object_name']
			];
		}

		// Convert to numeric array
		$grouped = array_values($grouped);
		// Final response
		$res = json_encode([
			"stats" => $stats,
			"list" => $grouped,
			"stat_region" => $stat_region
		]);

		break;





	case "reyd_events":
		$structure_id = isset($_GET['structure_id']) ? $_GET['structure_id'] : 0;

		// 1) Statistika (COUNT)
		$query = "SELECT SUM(t.staff_count) as value, b.id, b.name{$slang} as name
				FROM tur.reyd_events t
				LEFT JOIN ref.reyd_event_types b ON b.id = t.type
				WHERE 1=1 ";

		if ($UserStructure > 1) {
			$query .= " AND t.structure_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$query .= " AND t.structure_id = {$structure_id} ";
		}
		$query .= " GROUP BY b.id ORDER BY b.id ASC";

		$sql->query($query);
		$stats = $sql->fetchAll();

		// 2) Statistika hududlar kesimida
		$regionQuery = "SELECT 
						s.id,
						s.name{$slang} as name,
						SUM(t.staff_count) as value
					FROM tur.reyd_events t
					LEFT JOIN hr.structure s ON s.id = t.structure_id
					WHERE 1=1
				";

		if ($UserStructure > 1) {
			$regionQuery .= " AND t.structure_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$regionQuery .= " AND t.structure_id = {$structure_id} ";
		}

		$regionQuery .= " GROUP BY s.id ORDER BY s.id ASC";

		$sql->query($regionQuery);
		$stat_region = $sql->fetchAll();


		// 3) Ob'ektlar ro'yxati
		$listQuery = "SELECT 
						t.id,
						b.id as type_id,

						b.name{$slang} AS type_name
					FROM tur.reyd_events t
					LEFT JOIN ref.reyd_event_types b ON b.id = t.type
					-- LEFT JOIN hr.jts_objects j ON j.id = t.object_id
					WHERE 1=1
				";

		if ($UserStructure > 1) {
			$listQuery .= " AND t.structure_id = {$UserStructure} ";
		}
		if ($structure_id > 0) {
			$listQuery .= " AND t.structure_id = {$structure_id} ";
		}

		$listQuery .= " ORDER BY b.name{$slang} ASC";

		$sql->query($listQuery);
		$list = $sql->fetchAll();


		// 3) Guruhlash (type → object list)
		$grouped = [];
		foreach ($list as $row) {
			$typeId = $row['type_id'];

			if (!isset($grouped[$typeId])) {
				$grouped[$typeId] = [
					"id" => $typeId,
					"name" => $row['type_name'],
					"objects" => []
				];
			}

			$grouped[$typeId]["objects"][] = [
				"id" => $row['id'],
				// "object_name" => $row['object_name']
			];
		}

		// Convert to numeric array
		$grouped = array_values($grouped);
		// Final response
		$res = json_encode([
			"stats" => $stats,
			"list" => $grouped,
			"stat_region" => $stat_region
		]);

		break;




	case "get_embassy_map":
		$structure_id = isset($_GET['region_id']) ? $_GET['region_id'] : 0;
		$object_type = isset($_GET['object_type']) ? $_GET['object_type'] : 0;
		$object_id = isset($_GET['object_id']) ? $_GET['object_id'] : 0;

		$query  = "SELECT t.id, t.name as object_name, t.lat, t.long,ot.name{$slang} as type_name,t.photo
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
		e.military_unit,e.military_unit_phone,e.iiv_inspector,e.iiv_inspector_phone,e.iiv_unit,iiv_unit_phone,CONCAT(r.name{$slang},st.lastname,' ',st.firstname,' ',st.surname) as responsible_name,
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

}

// echo iconv("cp1251", "UTF-8", $res);
echo $res;
