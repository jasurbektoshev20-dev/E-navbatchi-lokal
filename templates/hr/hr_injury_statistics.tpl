{include file="header.tpl"}

<style>
    {literal}
        .table thead th,
        .table tbody td {
            text-transform: none !important;
        }

        .dt-buttons {
            gap: 10px;
            margin-left: 20px;
        }

        .chart-container {
            position: relative;
            height: 72vh;
            overflow: visible;
        }

        .chart-container2 {
            position: relative;
            height: 32.2vh;
            overflow: visible;
        }

        .flatpickr-wrapper {
            display: block !important;
        }

        .legend-text {
            white-space: pre-wrap;
            /* Allow wrapping */
            word-break: break-word;
            /* Break words if necessary */
        }
        .form-select{
            font-size: 18px;
        }

        .nav-item button{
            font-size: 20px;
        }

        .chart-btn-box button{
            margin-right: 5px;
            font-size: 18px;
        }
        .administrative-card input{
            font-size: 17px;
        }

        .tab-content{
            padding: 0;
        }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
     <div class="row">
         <div class="col-6">
              <div class="card">
                <div class="mx-1 my-2 row injury-card">
                    <div class="col-6">
                        <h4 id="injury_trend_title" class="text-white fw-bold">
                        Jarohatlar dinamikasi
                      </h4>
                     <select id="injuryTypeSelect" class="form-control">
                       <option value="2" selected>Жанговар тайёргарликда</option>
                        <option value="3" >Жисмоний тайёргарликда</option>
                        <option value="8" >Қоровул ва ички хизмат ўташда</option>
                        <option value="7" >Хизмат олиб боришда (ҳ/қ ҳудудидан ташқарида)</option>
                        <option value="6" >Ҳўжалик ишларида</option>
                        <option value="5" >Маиший</option>
                        <option value="4" >ЙТХ</option>
                        <option value="1" >Фуқаролар билан можарода</option>
                    </select>
                    </div>
                </div>
                <div id="injury_trend_line" style="height:800px;"></div>

            </div>
         </div>
        <div class="col-6 ">
            <div class="card">
              <div class="mx-1 my-2">
                <h4 class="text-white fw-bold">
                  Hududlar kesimida jarohatlar (kam → ko‘p)
                </h4>
              </div>

              <div id="injury_region_sorted_bar" style="height: 800px;"></div>
            </div>
        </div>
     </div>
</div>


{* charts *}
<script src="/assets/js/echarts.min.js"></script>
{* charts *}

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"

    var Var_comment1	= "{$Dict.comment1}";
    var Var_comment2	= "{$Dict.comment2}";
    var Var_comment3	= "{$Dict.comment3}";
    var Var_main_photo	= "{$Dict.main_photo}";
    var Var_ObjectId	= "{$Organization.id}";
    var dict_all = "{$Dict.all}";
    var dict_by_day = "{$Dict.one_day}";
    var dict_by_month = "{$Dict.begin_month}";
    var dict_by_year = "{$Dict.one_year}";
    var AJAXPHP = "ajax{$AddURL}.php";

    {literal}


// 1. AJAX orqali ma'lumot olish
// ============================
// let ACTIVE_INJURY_TYPE_ID = 4; // masalan: 1 = YTX, 2 = JTV
let ACTIVE_INJURY_TYPE_ID = 2; // default YTX
let INJURY_DATA_CACHE = null;


function loadInjuryTrendChart() {
  $.ajax({
    url: 'ajax.php',
    type: 'GET',
    dataType: 'json',
    data: {
      act: 'get_injuries_stats'
    },
    success: function (res) {
     INJURY_DATA_CACHE = res;

  // 1️⃣ Chap chart — tanlangan jarohat turi
renderInjuryTrendChart(res, ACTIVE_INJURY_TYPE_ID);



  // 2️⃣ O‘ng chart — hududlar bo‘yicha jami jarohatlar
  renderRegionSortedBar(res);
    },
    error: function (err) {
      console.error('AJAX ERROR:', err);
    }
  });
}

function aggregateByRegionAndTypeFixedOrder(res, typeId) {
  const map = {};

  // MUHIM: res.matrix qanday tartibda kelgan bo‘lsa
  // o‘sha tartibni saqlaymiz
  res.matrix.forEach(row => {
    if (Number(row.type_id) !== Number(typeId)) return;

    if (!map[row.region_id]) {
      map[row.region_id] = {
        name: row.region_name,
        value: 0
      };
    }

    map[row.region_id].value += Number(row.value || 0);
  });

  // ❌ SORT YO‘Q
  return Object.values(map);
}


$(document).on('change', '#injuryTypeSelect', function () {
  ACTIVE_INJURY_TYPE_ID = Number(this.value);
  if (!INJURY_DATA_CACHE) return;

  renderInjuryTrendChart(INJURY_DATA_CACHE, ACTIVE_INJURY_TYPE_ID);
});




function aggregateByRegionAndType(res, typeId) {
  const map = {};

  res.matrix.forEach(row => {
    if (Number(row.type_id) !== Number(typeId)) return;

    if (!map[row.region_id]) {
      map[row.region_id] = {
        name: row.region_name,
        value: 0
      };
    }

    map[row.region_id].value += Number(row.value || 0);
  });

  // o‘suvchi → kamayuvchi
  return Object.values(map).sort((a, b) => a.value - b.value);
}

function renderInjuryTrendChart(res, typeId) {
  const dom = document.getElementById('injury_trend_line');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  const chart = echarts.init(dom);

  const typeName =
    res.types.find(t => Number(t.id) === Number(typeId))?.name || 'Номаълум';

  document.getElementById('injury_trend_title').innerText =
    `Jarohatlar — ${typeName}`;

  // ❗ SORTSIZ — viloyatlar joyi o‘zgarmaydi
  const data = aggregateByRegionAndTypeFixedOrder(res, typeId);

  const option = {
    backgroundColor: 'transparent',

    grid: {
      left: 70,
      right: 40,
      bottom: 120,
      top: 60
    },

    tooltip: {
      formatter: p =>
        `${p.name}<br>${typeName}: <b>${p.value}</b>`
    },

    xAxis: {
      type: 'category',
      data: data.map(i => i.name),
      axisLabel: {
        rotate: 45,
        color: '#fff',
        fontWeight: 'bold'
      },
      axisLine: {
        lineStyle: { color: '#60a5fa' }
      }
    },

    yAxis: {
      type: 'value',
      minInterval: 1,
      axisLabel: {
        color: '#fff',
        fontWeight: 'bold'
      },
      splitLine: {
        lineStyle: { color: 'rgba(255,255,255,0.08)' }
      }
    },

    series: [{
      type: 'bar',
      data: data.map(i => i.value),
      barWidth: 28,

      itemStyle: {
        borderRadius: [8, 8, 0, 0],
        color: '#38bdf8',
        shadowBlur: 10,
        shadowColor: 'rgba(0,0,0,0.4)'
      },

      label: {
        show: true,
        position: 'top',
        color: '#fff',
        fontWeight: 'bold',
        fontSize: 14
      }
    }]
  };

  chart.setOption(option);
  window.addEventListener('resize', () => chart.resize());
}




$(document).ready(function () {
  loadInjuryTrendChart();
});

function aggregateAllByRegion(res) {
  const map = {};

  res.matrix.forEach(row => {
    if (!map[row.region_id]) {
      map[row.region_id] = {
        name: row.region_name,
        value: 0
      };
    }

    map[row.region_id].value += Number(row.value || 0);
  });

  // kam → ko‘p
  return Object.values(map).sort((a, b) => a.value - b.value);
}

function renderRegionSortedBar(res) {
  const dom = document.getElementById('injury_region_sorted_bar');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  const chart = echarts.init(dom);

  const data = aggregateAllByRegion(res); // 🔥 MUHIM

  const option = {
    backgroundColor: 'transparent',

    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'shadow' },
      formatter: p =>
        `${p[0].axisValue}<br>Жами: <b>${p[0].data}</b>`
    },

    grid: {
      left: 220,
      right: 40,
      top: 40,
      bottom: 40
    },

    xAxis: {
      type: 'value',
      minInterval: 1,
      axisLabel: { color: '#fff', fontWeight: 'bold' },
      splitLine: {
        lineStyle: { color: 'rgba(255,255,255,0.08)' }
      }
    },

    yAxis: {
      type: 'category',
      data: data.map(i => i.name),
      axisLabel: { color: '#fff', fontWeight: 'bold' },
      axisLine: { show: false },
      axisTick: { show: false }
    },

    series: [{
      type: 'bar',
      data: data.map(i => i.value),
      barWidth: 26,

   itemStyle: {
  borderRadius: [0, 8, 8, 0],
  color: params => {
    const isTop = params.dataIndex === data.length - 1;

    return isTop
      ? new echarts.graphic.LinearGradient(0, 0, 1, 0, [
          { offset: 0, color: '#fecaca' }, // och qizil
          { offset: 1, color: '#dc2626' }  // to‘q qizil
        ])
      : new echarts.graphic.LinearGradient(0, 0, 1, 0, [
          { offset: 0, color: '#bfdbfe' }, // och ko‘k
          { offset: 1, color: '#1d4ed8' }  // to‘q ko‘k
        ]);
  }
},


 label: {
  show: true,
  position: 'right',
  color: '#fff',
  fontWeight: 'bold',
  fontSize: 14,
  formatter: '{c}'
},
emphasis: {
  itemStyle: {
    shadowBlur: 10,
    shadowColor: 'rgba(0,0,0,0.4)'
  }
}

    }]
  };

  chart.setOption(option);
  window.addEventListener('resize', () => chart.resize());
}


    {/literal}
</script>

{include file="footer.tpl"}