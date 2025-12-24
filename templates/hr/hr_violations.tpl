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
  
            <div class="tab-content p-0">

                    <div class="tab-pane fade show active" id="charts" role="tabpanel">

                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="pills-home-tab"
                                            data-bs-toggle="pill"
                                            data-bs-target="#pills-home"
                                            type="button">
                                            Хуқуқий статистика
                                        </button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pills-profile-tab"
                                            data-bs-toggle="pill"
                                            data-bs-target="#pills-profile"
                                            type="button">
                                            Ҳудудлар кесимида
                                        </button>
                                    </li>
                                </ul>

                          
                                <div class="tab-content" id="pills-tabContent">

                                    <!-- TAB 1 -->
                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                        <div class="row">
                                               <div class="col-6">

                            <div class="card">

                                <div class="mx-1 my-2 row administrative-card">
                                    <div class="col-6">
                                        <h4 class="card-title">Мамурий ҳуқуқбузарликлар</h4>
                                    </div>
                                       <div class="col-3">
                                        <input type="date" id="start_date" class="form-control">
                                    </div>

                                    <div class="col-3">
                                        <input type="date" id="end_date" class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 d-flex align-items-center justify-content-end chart-btn-box">
                                          <button id="total_button" class="btn btn-primary mb-2">Жами жиноятлар</button>
                                          <button id="compare_button" class="btn btn-warning mb-2">Солиштириш</button>
                                    </div>
                                     <div class="chart-container2" id="administrative_offenses"  style="height: 600px;"></div>
                                </div>
                            </div>

                        </div>

                       <div class="col-6 ">

                            <div class="card">

                                <div class="mx-1 my-2 row administrative-card">
                                    <div class="col-6">
                                        <h4 class="card-title">Жиноятлар</h4>
                                    </div>
                                       <div class="col-3">
                                        <input type="date" id="criminal_start_date" class="form-control">
                                    </div>

                                    <div class="col-3">
                                        <input type="date" id="criminal_end_date" class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 d-flex align-items-center justify-content-end chart-btn-box">
                                          <button id="criminal_total_button" class="btn btn-primary mb-2">Жами жиноятлар</button>
                                          <button id="criminal_compare_button" class="btn btn-warning mb-2">Солиштириш</button>
                                    </div>
                                     <div class="chart-container2" id="criminal_offenses"  style="height: 600px;"></div>
                                </div>
                            </div>

                        </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-profile" role="tabpanel">
                                        <div class="row">

                                            <div class="col-md-6 col-lg-6">
                                                <div class="card p-3">
                                                    <div class="row">
                                                    <div class="col-8">
                                                        <h4 class="card-title">
                                                        Маъмурий ҳуқуқбузарликлар ҳудудлар кесимида
                                                        <span id="mamuriy_huquq_chart_total"></span>
                                                        </h4>
                                                    </div>
                                                
                                                    </div>
                                                    <div class="chart-container" id="mamuriy_huquq_chart" style="height: 600px;"></div>
                                                </div>
                                            </div>


                       <div class="col-md-6 col-lg-6">
                            <div class="card p-3">
                                <div class="row mb-3">
                                <div class="col-8">
                                    <h4 class="card-title">
                                    Жиноятлар ҳудудлар кесимида
                                    <span id="jinoiy_huquq_chart_total"></span>
                                    </h4>
                                </div>
                            
                                </div>
                                <div class="chart-container" id="jinoiy_huquq_chart" style="height: 600px;"></div>
                            </div>
                        </div>

                                         </div>
                                    </div>

                                </div>

                    </div>
       </div>
</div>


<!-- Edit Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label>{$Dict.region}</label>
                            <select required class="select form-control" name="region_id" id="region_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    
                        <div class="col-sm-6">
                            <label>{$Dict.crime_type}</label>
                            <select required class="select form-control" name="violation_type" id="violation_type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$ViolationTypes item=Item3 key=ikey3}
                                    <option value="{$Item3.id}">{$Item3.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.comitted_crime}</label>
                            <select required class="select form-control" name="type" id="type">
                                <option value="">{$Dict.choose}</option>
                                <option value="1">{$Dict.crime}</option>
                                <option value="2">{$Dict.notable_crime}</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="flatpickr-date" class="form-label">{$Dict.comitted_date}</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="date" />
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.incident_place}</label>
                            <input required type="text" class="form-control" name="incident_place" id="incident_place"
                                value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.latitude}</label>
                            <input required type="text" class="form-control" name="lat" id="lat" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.longtitude}</label>
                            <input required type="text" class="form-control" name="lon" id="lon" value="">
                        </div>
                        <hr class="text-primary">
                        <div class="col-sm-6">
                            <label>{$Dict.citizen}</label>
                            <input required type="text" class="form-control" name="citizen" id="citizen" value="">
                        </div>
                        <div class="col-sm-6">
                            <label for="flatpickr-date" class="form-label">{$Dict.birthdate}</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="birthdate" />
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.live_adress}</label>
                            <input required type="text" class="form-control" name="live_adress" id="live_adress"
                                value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.work_place}</label>
                            <input required type="text" class="form-control" name="work_place" id="work_place" value="">
                        </div>
                        <div class="col-sm-12">
                            <label>{$Dict.case_summary}</label>
                            <textarea required class="form-control" rows=4 name="text" id="text"></textarea>
                        </div>
                        <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"
                                aria-label="Close">
                                {$Dict.cancel}
                            </button>
                            <button id="SubButtonHrSetMarker" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--/ Edit Modal -->


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

let adminRegionChartInstance = null;
let adminRegionChartData = [];
let adminRegionChartRendered = false;

const colors = [
        "#6EB5FF", // ko‘k
        "#5CC97B", // yashil
        "#A472FF", // to‘q binafsha
        "#FFB84D", // och sariq
        "#99CCFF", // och ko‘k
        "#FFD24C", // sariq (eng katta bo‘lak)
        "#4BA3C7", // havorang
        "#7AD67A", // och yashil
        "#FF884C", // to‘q sariq
        "#B266FF", // binafsha
        "#FF6666", // qizil
      ];

       const colors1 = [
        // "#6EB5FF", // ko‘k
        "#5CC97B", // yashil
        "#A472FF", // to‘q binafsha
        "#FFB84D", // och sariq
        "#99CCFF", // och ko‘k
        "#FFD24C", // sariq (eng katta bo‘lak)
        "#4BA3C7", // havorang
        "#7AD67A", // och yashil
        "#FF884C", // to‘q sariq
        "#B266FF", // binafsha
        "#FF6666", // qizil
      ];


// real ajax bo'yicha
let structure_id = null;
function loadAdministrativeCharts() {
  $.ajax({
    url: 'ajax.php',
    type: 'GET',
    dataType: 'json',
    data: { act: 'get_administrative_stats' },
    success: function (res) {
      console.log('ADMIN DATA:', res);

      renderAdministrativePie(res.stats || []);

      // 🔥 MUHIM: faqat data saqlaymiz
      adminRegionChartData = res.stat_region || [];

      // agar tab allaqachon ochiq bo‘lsa — chizamiz
      if ($('#pills-profile').hasClass('show')) {
        renderAdministrativeRegionBar(adminRegionChartData);
        adminRegionChartRendered = true;
      }
    }
  });
}


function renderAdministrativePie(data) {
  const dom = document.getElementById('administrative_offenses');
  if (!dom) return;

  // eski chartni o‘chiramiz
  echarts.dispose(dom);
  const chart = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);

  const option = {
   color: colors1,
      textStyle: { fontFamily: "Arial, sans-serif", fontSize: "18px" },
      title: {
        text: String(total),
        left: 'center',
        top: '37%',
        textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' },
      },
      legend: {
        bottom: 0,
        left: 'center',
        padding: [20, 0, 0, 0],
        textStyle: { color: '#b7b7b7', fontSize: 18 }
      },
      tooltip: {
        backgroundColor: 'white',
        textStyle: { fontSize: 18, color: '#000' }
      },
      series: [{
        type: 'pie',
        radius: ['20%', '60%'],
        center: ['50%', '40%'],
        label: {
          show: true,
          position: 'outside',
          formatter: '{c}',
          textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' }
        },
        itemStyle: {
          borderRadius: 10,
          shadowColor: 'rgba(0,0,0,0.5)',
          shadowBlur: 20
        },
      data: data.map(i => ({
        name: i.name,
        value: Number(i.value)
      }))
    }]
  };

  chart.setOption(option);
  window.addEventListener('resize', () => chart.resize());
}

function renderAdministrativeRegionBar(data) {
  const dom = document.getElementById('mamuriy_huquq_chart');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  adminRegionChartInstance = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);
  $('#mamuriy_huquq_chart_total').text(`(${total})`);

  const option = {
    tooltip: {
      backgroundColor: '#fff',
      textStyle: { color: '#000', fontSize: 16 }
    },
    grid: { left: 60, right: 30, bottom: 120 },
    xAxis: {
      type: 'category',
      data: data.map(i => i.name || '—'),
      axisLabel: { rotate: 45, color: '#b7b7b7', fontSize: 14 }
    },
    yAxis: {
      type: 'value',
      axisLabel: { color: '#b7b7b7' }
    },
    series: [{
      type: 'bar',
      data: data.map(i => Number(i.value) || 0),
      barMaxWidth: 50,
      itemStyle: {
        color: (p) => colors[p.dataIndex % colors.length],
        borderRadius: [6, 6, 0, 0]
      },
      label: {
        show: true,
        position: 'top',
        color: '#b7b7b7',
        fontSize: 14
      }
    }]
  };

  adminRegionChartInstance.setOption(option);
}


let criminalRegionChartInstance = null;
let criminalRegionChartData = [];
let criminalRegionChartRendered = false;


function loadCriminalCharts() {
  $.ajax({
    url: 'ajax.php',
    type: 'GET',
    dataType: 'json',
    data: {
      act: 'get_criminal_stats'
    },
    success: function (res) {
      console.log('CRIMINAL DATA:', res);

      renderCriminalPie(res.stats || []);
      criminalRegionChartData = res.stat_region || [];

      // agar tab ochiq bo‘lsa — darrov chizamiz
      if (document.getElementById('pills-profile').classList.contains('show')) {
        renderCriminalRegionBar(criminalRegionChartData);
        criminalRegionChartRendered = true;
      }
    },
    error: function (err) {
      console.error('CRIMINAL AJAX ERROR:', err);
    }
  });
}


function renderCriminalPie(data) {
  const dom = document.getElementById('criminal_offenses');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  const chart = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);

  const option = {
      color: colors,
      textStyle: { fontFamily: "Arial, sans-serif", fontSize: "18px" },
      title: {
        text: String(total),
        left: 'center',
        top: '37%',
        textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' },
      },
      legend: {
        bottom: 0,
        left: 'center',
        padding: [20, 0, 0, 0],
        textStyle: { color: '#b7b7b7', fontSize: 18 }
      },
      tooltip: {
        backgroundColor: 'white',
        textStyle: { fontSize: 18, color: '#000' }
      },
      series: [{
        type: 'pie',
        radius: ['20%', '60%'],
        center: ['50%', '40%'],
        label: {
          show: true,
          position: 'outside',
          formatter: '{c}',
          textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' }
        },
        itemStyle: {
          borderRadius: 10,
          shadowColor: 'rgba(0,0,0,0.5)',
          shadowBlur: 20
        },
      data: data.map(i => ({
        name: i.name,
        value: Number(i.value)
      }))
    }]
  };

  chart.setOption(option);
  window.addEventListener('resize', () => chart.resize());
}

function renderCriminalRegionBar(data) {
  const dom = document.getElementById('jinoiy_huquq_chart');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  criminalRegionChartInstance = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);
  $('#jinoiy_huquq_chart_total').text(`(${total})`);

  const option = {
    tooltip: {
      backgroundColor: '#fff',
      textStyle: { color: '#000', fontSize: 16 }
    },
    xAxis: {
      type: 'category',
      data: data.map(i => i.name),
      axisLabel: {
        rotate: 45,
        color: '#b7b7b7',
        fontSize: 14
      }
    },
    yAxis: {
      type: 'value',
      axisLabel: { color: '#b7b7b7' }
    },
    grid: {
      left: 60,
      right: 30,
      bottom: 120
    },
    series: [{
      type: 'bar',
      data: data.map(i => Number(i.value)),
      barMaxWidth: 50,
      itemStyle: {
        color: p => colors[p.dataIndex % colors.length],
        borderRadius: [6, 6, 0, 0]
      },
      label: {
        show: true,
        position: 'top',
        color: '#b7b7b7',
        fontSize: 14
      }
    }]
  };

  criminalRegionChartInstance.setOption(option);
}


document.addEventListener('shown.bs.tab', function (event) {

  // ADMINISTRATIV
  if (event.target.id === 'pills-profile-tab') {

    if (!adminRegionChartRendered) {
      renderAdministrativeRegionBar(adminRegionChartData);
      adminRegionChartRendered = true;
    } else if (adminRegionChartInstance) {
      adminRegionChartInstance.resize();
    }

    if (!criminalRegionChartRendered) {
      renderCriminalRegionBar(criminalRegionChartData);
      criminalRegionChartRendered = true;
    } else if (criminalRegionChartInstance) {
      criminalRegionChartInstance.resize();
    }
  }
});


$(document).ready(function () {
  loadAdministrativeCharts();
  loadCriminalCharts();
});



// document.addEventListener('shown.bs.tab', function (event) {
//   console.log('TAB CHIQDI:', event.target.id);

//   if (event.target.id === 'pills-profile-tab') {

//     if (!adminRegionChartRendered) {
//       renderAdministrativeRegionBar(adminRegionChartData);
//       adminRegionChartRendered = true;
//     } else if (adminRegionChartInstance) {
//       adminRegionChartInstance.resize();
//     }

//   }
// });

// $(document).ready(function () {
//   loadAdministrativeCharts();
// });




    {/literal}
</script>

{include file="footer.tpl"}