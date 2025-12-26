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

$(document).ready(function () {
  loadAdministrativeCharts();
  loadCriminalCharts();
});


    {/literal}
</script>

{include file="footer.tpl"}