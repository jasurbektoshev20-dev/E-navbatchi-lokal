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
                        <option value="1">JTV</option>
                        <option value="2" selected>YTX</option>
                    </select>
                    </div>
                </div>
                <div id="injury_trend_line" style="height:800px;"></div>

            </div>
         </div>
        <div class="col-6 ">
            <div class="card">
                <div class="mx-1 my-2 row injury-card">
                    <div class="col-6">
                        <h4 class="card-title">Diagramma</h4>
                    </div>
                </div>
                <div class="row">
                    <div id="injury_stacked_bar" style="height:800px;"></div>
                </div>
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
let ACTIVE_INJURY_TYPE_ID = 2; // masalan: 1 = YTX, 2 = JTV

function loadInjuryTrendChart() {
  $.ajax({
    url: 'ajax.php',
    type: 'GET',
    dataType: 'json',
    data: {
      act: 'get_injuries_stats'
    },
    success: function (res) {
      renderInjuryTrendLine(res, ACTIVE_INJURY_TYPE_ID);
    },
    error: function (err) {
      console.error('AJAX ERROR:', err);
    }
  });
}

function aggregateByRegionAndType(res, typeId) {
  const map = {};

  res.matrix.forEach(row => {
    if (row.type_id !== typeId) return;

    if (!map[row.region_id]) {
      map[row.region_id] = {
        name: row.region_name,
        value: 0
      };
    }

    map[row.region_id].value += Number(row.value || 0);
  });

  // 🔥 O‘suvchi–kamayuvchi
  return Object.values(map).sort((a, b) => a.value - b.value);
}
function renderInjuryTrendLine(res, typeId) {
  const dom = document.getElementById('injury_trend_line');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  const chart = echarts.init(dom);

  const typeName =
    res.types.find(t => t.id == typeId)?.name || 'Номаълум';

  document.getElementById('injury_trend_title').innerText =
    `Jarohatlar dinamikasi — ${typeName}`;

  const data = aggregateByRegionAndType(res, typeId);

  const option = {
    backgroundColor: 'transparent',

    tooltip: {
      trigger: 'axis',
      formatter: p =>
        `${p[0].axisValue}<br>${typeName}: <b>${p[0].data}</b>`
    },

    grid: {
      left: 70,
      right: 40,
      bottom: 120,
      top: 60
    },

    xAxis: {
      type: 'category',
      data: data.map(i => i.name),
      axisLabel: {
        rotate: 45,
        color: '#ffffff',
        fontSize: 14,
        fontWeight: 'bold'
      },
      axisLine: { lineStyle: { color: '#3b82f6' } }
    },

    yAxis: {
      type: 'value',
      minInterval: 1,
      axisLabel: {
        color: '#ffffff',
        fontSize: 14,
        fontWeight: 'bold'
      },
      splitLine: {
        lineStyle: { color: 'rgba(255,255,255,0.08)' }
      }
    },

    series: [{
      name: typeName,
      type: 'line',
      smooth: true,
      data: data.map(i => i.value),

      symbol: 'circle',
      symbolSize: 10,

      lineStyle: {
        width: 4,
        color: '#22c55e'
      },

      itemStyle: {
        color: '#22c55e',
        borderColor: '#ffffff',
        borderWidth: 2
      },

      label: {
        show: true,
        position: 'top',
        color: '#ffffff',
        fontSize: 14,
        fontWeight: 'bold'
      },

      areaStyle: {
        color: 'rgba(34,197,94,0.25)'
      }
    }]
  };

  chart.setOption(option);
  window.addEventListener('resize', () => chart.resize());
}


$(document).ready(function () {
  loadInjuryTrendChart();
});


$(document).ready(function () {
  loadInjuryTrendChart();
});



    {/literal}
</script>

{include file="footer.tpl"}