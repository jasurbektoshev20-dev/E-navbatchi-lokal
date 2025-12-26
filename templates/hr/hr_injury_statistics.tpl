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
                        <h4 class="card-title">Diagramma</h4>
                    </div>
                </div>
                <div class="row">
                      <div id="injury_heatmap" style="height:800px;"></div>
                </div>
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

     let injuryData = null;

     function aggregateByRegion(matrix) {
  const map = {};

  matrix.forEach(row => {
    const id = row.region_id;

    if (!map[id]) {
      map[id] = {
        id: id,
        name: row.region_name,
        value: 0
      };
    }

    map[id].value += Number(row.value || 0);
  });

  return Object.values(map);
}


function loadInjuryStats() {
  $.ajax({
    url: 'ajax.php',
    type: 'GET',
    dataType: 'json',
    data: {
      act: 'get_injuries_stats'
    },
 success: function (res) {
    renderInjuryHeatmap(res);
    renderInjuryStackedBar(res);
},

    error: function (err) {
      console.error('AJAX ERROR:', err);
    }
  });
}

$(document).ready(function () {
  loadInjuryStats();
});



function renderInjuryHeatmap(res) {
  const dom = document.getElementById('injury_heatmap');
  if (!dom) return;

  const chart = echarts.init(dom);

  const regions = res.regions.map(r => r.name);
  const types   = res.types.map(t => t.name);

  const regionIndex = {};
  res.regions.forEach((r, i) => regionIndex[r.id] = i);

  const typeIndex = {};
  res.types.forEach((t, i) => typeIndex[t.id] = i);

  const data = res.matrix.map(i => [
    regionIndex[i.region_id],
    typeIndex[i.type_id],
    Number(i.value)
  ]);

  const option = {
    tooltip: {
      formatter: p =>
        `${regions[p.value[0]]}<br>${types[p.value[1]]}: <b>${p.value[2]}</b>`
    },
    grid: { top: 60, left: 120, right: 40 },
   xAxis: {
  type: 'category',
  data: regions,
  axisLabel: {
    color: '#ffffff',
    fontSize: 14,
    fontWeight: 'bold',
    rotate: 45
  },
  axisLine: {
    lineStyle: { color: '#3b82f6' }
  },
  axisTick: { show: false }
},
yAxis: {
  type: 'category',
  data: types,
  axisLabel: {
    color: '#ffffff',
    fontSize: 14,
    fontWeight: 'bold'
  },
  axisLine: {
    lineStyle: { color: '#3b82f6' }
  },
  axisTick: { show: false }
},

    visualMap: {
      min: 0,
      max: Math.max(...data.map(d => d[2])),
      calculable: true,
      orient: 'horizontal',
      left: 'center',
      bottom: 10,
      inRange: {
        color: ['#1e3c72', '#2a5298', '#fbc531', '#e84118']
      }
    },
    series: [{
      type: 'heatmap',
      data,
     label: {
        show: true,
        position: 'top',
        color: '#ffffff',
        fontSize: 14,
        fontWeight: 'bold'
      },
      emphasis: {
        itemStyle: { shadowBlur: 10, shadowColor: 'rgba(0,0,0,0.5)' }
      }
    }]
  };

  chart.setOption(option);
}

function renderInjuryStackedBar(res) {
  const dom = document.getElementById('injury_stacked_bar');
  if (!dom) return;

  const chart = echarts.init(dom);

  const regions = res.regions.map(r => r.name);

  // region -> type -> value
  const map = {};
  res.matrix.forEach(i => {
    if (!map[i.region_id]) map[i.region_id] = {};
    map[i.region_id][i.type_id] = Number(i.value);
  });

  const series = res.types.map(t => ({
    name: t.name,
    type: 'bar',
    stack: 'total',
    emphasis: { focus: 'series' },
    data: res.regions.map(r =>
      map[r.id]?.[t.id] || 0
    )
  }));

  const option = {
    tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
    legend: {
  top: 10,
  textStyle: {
    color: '#ffffff',     // oq rang
    fontSize: 15,         // kattaroq
    fontWeight: 'bold'    // qalin
  },
  itemWidth: 22,          // rangli kvadrat kengligi
  itemHeight: 14,
  itemGap: 20             // legendlar orasidagi masofa
},

    grid: { left: 60, right: 30, bottom: 120 },
xAxis: {
  type: 'category',
  data: regions,
  axisLabel: {
    color: '#ffffff',
    fontSize: 14,
    fontWeight: 'bold',
    rotate: 45
  },
  axisLine: {
    lineStyle: { color: '#3b82f6' }
  }
},
yAxis: {
  type: 'value',

  minInterval: 1,          // ❗ faqat butun son
  interval: 1,             // ❗ majburiy 1 qadam

  axisLabel: {
    color: '#ffffff',
    fontSize: 14,
    fontWeight: 'bold',
    formatter: value => Math.round(value) // xavfsizlik uchun
  },

  axisLine: {
    lineStyle: {
      color: 'rgba(255,255,255,0.4)'
    }
  },

  splitLine: {
    lineStyle: {
      color: 'rgba(255,255,255,0.08)'
    }
  }
},


    series
  };

  chart.setOption(option);
}



    {/literal}
</script>

{include file="footer.tpl"}