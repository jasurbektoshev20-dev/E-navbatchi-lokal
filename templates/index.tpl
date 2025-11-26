{include file="header.tpl"}
<!-- Content -->

<style>
  {literal}
    body::-webkit-scrollbar {
      width: 10px;
    }

    .chart-container {
      position: relative;
      height: 35vh;
      overflow: visible;
    }

    .card {
      height: 420px;
    }

    .card,
    select {
      /* background: #2f334910 !important;
            backdrop-filter: blur(5px); */
      padding-bottom: 10px;
    }

    /* Modal ichidagi joylar ro‘yxati */
    .modal-xxl {
      max-width: 95%;
      width: 95%;
    }

    .place-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .space-main-modal-box h4 {
      font-size: 24px;
      text-align: center;
    }

    .space-main-body-img {
      width: 100%;
      height: 60vh;
    }

    .space-main-body-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .space-main-body-password ul {
      list-style-type: none;
      padding: 0px;
      height: 75vh;
      overflow-y: auto;
    }

    .space-main-body-password ul li {
      margin: 8px 0px;
      border-radius: 7px;
      padding: 6px;
      background-color: #4d49c3;
    }

    .space-main-body-password ul li h6 {
      font-size: 18px;
      margin: 0;
      padding-bottom: 4px;
    }

    .space-main-body-password ul li h6 span {
      padding-top: 15px;
      margin-right: 7px;
    }

    .space-main-body-password ul li p {
      padding: 0;
      margin: 0;
      font-size: 18px;
      padding-left: 10px;
    }

    .space-main-body-duty ul {
      list-style-type: none;
      padding: 0;
      height: 72vh;
      overflow-y: auto;
    }

    .space-main-body-duty ul li {
      font-size: 18px;
    }

    .modal-title {
      border1px solid red;
    }

    .chart-container {
      display: flex;
      gap: 10px;
      /* padding: 0px 20px; */
    }

    .region-box {
      padding: 10px;
      box-shadow: 3px 1px 29px 0px rgba(34, 60, 80, 0.26);
      /* background-color: #fff; */
      border-radius: 7px;
      height: 35vh;
      overflow-y: auto;
    }

    .scrollable {
      height: fit-content;
      list-style-type: none;
      padding: 0;
    }

    .space-main-body-umumu video {
      height: 100%;
    }

    .form-select{
      font-size: 18px;
    }

  {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
  <div class="row">

    <!-- JTSB html chartining html qismi boshi -->
    <div class="col-md-4 col-lg-4 mb-2">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Жавобгарлик объектлари</h4>
          </div>
          <div class="col-4">
                <select class="form-select" id="event_count">
              <option value="">Ҳудудлар</option>

              {foreach from=$Regions item=Item1 key=ikey1 name=regionLoop}
                  {if $smarty.foreach.regionLoop.iteration <= 14}
                      <option value="{$Item1.id}">{$Item1.name}</option>
                  {/if}
              {/foreach}

          </select>
          </div>
          <div class="chart-container" id="all_events_by_type"></div>
        </div>
      </div>
    </div>

    <!-- JTSB html chartining html qismi tugashi -->


    <div class="col-md-4 col-lg-4 mb-2">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Оммавий тадбирлар</h4> <br>
          </div>
          <div class="col-4">
             <select class="form-select" id="public_events">
              <option value="">Ҳудудлар</option>

              {foreach from=$Regions item=Item1 key=ikey1 name=regionLoop}
                  {if $smarty.foreach.regionLoop.iteration <= 14 }
                      <option value="{$Item1.id}">{$Item1.name}</option>
                  {/if}
              {/foreach}

          </select>
          </div>
          <div class="chart-container" id="get_events_by_type"></div>
        </div>
      </div>
    </div>

   
    <!-- 1-modali: kategoriya → viloyatlar kesimi -->
    <div class="modal fade" id="eventTypeModal" tabindex="-1" aria-labelledby="eventTypeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="eventTypeModalLabel">Категория маълумотлари</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Yopish"></button>
          </div>
          <div class="modal-body" id="eventTypeModalBody">
            <!-- JS orqali tavsiflar va viloyatlar chiqadi -->
          </div>
        </div>
      </div>
    </div>

    <!-- 2-modali: viloyat ichidagi tadbirlar ro'yxati va batafsil -->
    <div class="modal fade" id="eventListModal" tabindex="-1" aria-labelledby="eventListModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable modal-xxl modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="eventListModalLabel">Тадбирлар рўйхати</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Yopish"></button>
          </div>
          <div class="modal-body" id="eventListModalBody">
          </div>
        </div>
      </div>
    </div>







    <div class="col-md-4 col-lg-4 mb-2">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Идоравий тадбирлар</h4> <br>
          </div>
          <div class="col-4">
            <select class="form-select" id="departmental_events"> </select>
          </div>
          <div class="chart-container" id="get_departmental_events"></div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="eventTypeModal1" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 id="eventTypeModalLabel1" class="modal-title"></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div id="eventTypeModalBody1" class="modal-body"></div>
        </div>
      </div>
    </div>



    <div class="col-md-4 col-lg-4 mt-4">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Жамоат тартибини сақлаш ҳудудлар кесимида
            </h4>
          </div>
          <div class="col-4">
            {* <select class="form-select" id="get_events_by_region_filter"> </select> *}
          </div>

          <div class="chart-container" id="get_events_by_region"></div>
        </div>
      </div>
    </div>




    <div class="col-md-4 col-lg-4 mt-4">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Оммавий тадбирлар ҳудудлар кесимида
            </h4>
          </div>
          <div class="col-4">
            <select class="form-select" id="get_events_by_region_filter1"> </select>
          </div>

          <div class="chart-container" id="get_events_by_region1"></div>
        </div>
      </div>
    </div>

    <div class="col-md-4 col-lg-4 mt-4">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Идоравий тадбирлар ҳудудлар кесимида
            </h4>
          </div><br>
          <div class="col-4">
            <select class="form-select" id="get_events_by_region_filter2"> </select>
          </div>

          <div class="chart-container" id="get_events_by_region2"></div>
        </div>
      </div>
    </div>

    {* <div class="col-md-12 col-lg-4 mb-2">
            <div class="card">
                <div class="mx-3 my-2 row">
                    <div class="col-9">
                        <h5 class="card-title">{$Dict.last_week_events}</h5>
                    </div>
                    <div class="chart-container" id="all_events"></div>
                </div>
            </div>
        </div> *}

  </div>
</div>

<script src="/assets/js/echarts.min.js"></script>
<script src="/assets/pathsData.js"></script>

<script>
  var AJAXPHP = "ajax{$AddURL}.php";
  var dict_avaregae = "{$Dict.avaregae}";
  var dict_all = "{$Dict.all}";
  var dict_by_day = "{$Dict.one_day}";
  var dict_by_month = "{$Dict.begin_month}";
  var dict_by_year = "{$Dict.one_year}";
  {literal}



    $(document).ready(function() {
      let structure_id;

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




      function getObjects() {
        let url = `${AJAXPHP}?act=jts_objects`;
        let params = [];
        if (structure_id) params.push(`structure_id=${structure_id}`);

        if (params.length > 0) url += '&' + params.join('&');
        $.ajax({
          url: url,
          type: 'GET',
          dataType: 'json',
          success: function(response) {
            all_events_by_type(response?.stats);
            get_events_by_region(response)
            console.log("Response: ", response)
          },
          error: function(xhr, status, error) {
            console.error('AJAX error:', error);
          }
        })
      }

      getObjects()
      

      function all_events_by_type(data = []) {
        const dom = document.getElementById('all_events_by_type');
        const myChart = echarts.init(dom);
        
        const total = data.reduce((sum, item) => sum + Number(item.value), 0);

        const option = {
          color: colors,
          textStyle: { fontFamily: "Arial, sans-serif" },
          title: {
            text: total,
            left: 'center',
            top: '37%',
            textStyle: { fontSize: 28, fontWeight: 'bold', color: '#b7b7b7' },
          },
          legend: {
          
           bottom: 0,
           left: 'center',
           padding: [20, 0, 0, 0],
            textStyle: { color: '#b7b7b7', fontSize: '1.3rem' }
          },
                tooltip: {
              backgroundColor: 'white',
              textStyle: {
                  fontSize: 20,     // 🔥 shu yerda o'zgartirasan
                  color: '#000'
              }
          },
          series: [{
            type: 'pie',
            radius: ['20%', '60%'],
            center: ['50%', '43%'],
            label: {
              show: true,
              position: 'outside',
              formatter: '{c}',
              textStyle: { fontSize: 22, fontWeight: 'bold', color: '#b7b7b7' }
            },

            itemStyle: {
              borderRadius: 10,

              shadowColor: 'rgba(0,0,0,0.5)',
              shadowBlur: 20
            },

            data: data.map((item) => ({ name: item.name, value: item.value, id: item.id }))
          }]
        };

        myChart.setOption(option);
        window.addEventListener('resize', myChart.resize);

        // ⚡ Avvalgi click eventni olib tashlaymiz
        myChart.off('click');

        myChart.on('click', function(params) {
          if (structure_id) {
            window.location.href = `hr.php?act=regions_map&region_id=${structure_id}&object_type=${params.data.id}`
          }else{
            window.location.href = `hr.php?act=regions_map&object_type=${params.data.id}`
          }

        });
      }


      // 📊 Pastdagi diagramma (faqat "Ҳаммаси" uchun)
      function get_events_by_region(data) {
        const dom = document.getElementById('get_events_by_region');
        if (!dom) return console.error('❌ Diagramma konteyner topilmadi:', containerId);


        if(structure_id){
          let allHtml = `
            <div class="col-12">
              <div class="region-box">
          `;

          data?.list.forEach(cat => {
            // Har bir kategoriya uchun
            const places = cat.objects || [];
            let listHtml = '<ul class="place-list scrollable">';

            places.forEach(p => {
              listHtml += `
                <li class="alert alert-dark" role="alert" data-cat="${cat.name}" data-place="${p.object_name}">
                  ${p.object_name}
                </li>`;
            });

            listHtml += '</ul>';

            allHtml += `
              <div class="category-block mb-2">
                <h5 class="mb-2 text-primary">${cat.name}</h5>
                ${listHtml}
              </div>
            `;
          });

          allHtml += `
              </div>
            </div>
          `;

          dom.innerHTML = allHtml;

        }else{

          const myChart = echarts.init(dom);
          const option = {
            textStyle: { fontFamily: "Arial, sans-serif"},
            xAxis: {
              type: 'category',
              data: data?.stat_region?.map(item => item.name),
              axisLabel: { interval: 0, fontSize: '1rem', rotate: 45, color: '#b7b7b7' },
              axisLine: { show: false },
              splitLine: { show: false }
            },
            grid: { bottom: 110, right: 30, left: 100 },
            yAxis: { 
                type: 'value', 
                axisLabel: { 
                    color: '#b7b7b7',
                    fontSize: 20   // <-- shu yerda shrift kattaligi
                }, 
                axisLine: { show: false },
                splitLine: { show: false }
            },
            tooltip: { backgroundColor: 'white' },
            series: [{
              data: data?.stat_region?.map(item => parseInt(item.value)),
              type: 'bar',
              barMaxWidth: 60,
              itemStyle: { color: (p) => colors[p.dataIndex % colors.length], borderRadius: [8, 8, 0, 0] },
              label: { fontSize: 22, show: true, position: 'top', color: '#b7b7b7' }
            }]
          };
  
          myChart.setOption(option);
          window.addEventListener('resize', myChart.resize);
        }

      }


        $('#event_count').on('change', function() {
          const id = parseInt($(this).val());
          structure_id = id
          getObjects()
        })



        // ommaviy tadbirlar uchun kodlar


        
          function getEvents() {
        let url = `${AJAXPHP}?act=public_events`;
        let params = [];
        if (structure_id) params.push(`structure_id=${structure_id}`);

        if (params.length > 0) url += '&' + params.join('&');
        $.ajax({
          url: url,
          type: 'GET',
          dataType: 'json',
          success: function(response) {
            get_events_by_type(response?.stats);
            get_events_by_region(response)
          },
          error: function(xhr, status, error) {
            console.error('AJAX error:', error);
          }
        })
      }

      getEvents()
      

      function get_events_by_type(data = []) {
        const dom = document.getElementById('get_events_by_type');
        const myChart = echarts.init(dom);
        
        const total = data.reduce((sum, item) => sum + Number(item.value), 0);

        const option = {
          color: colors,
          textStyle: { fontFamily: "Arial, sans-serif" },
          title: {
            text: total,
            left: 'center',
            top: '32%',
            textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' },
          },
          legend: {
            top: 'bottom',
            left: 'center',
            textStyle: { color: '#b7b7b7', fontSize: '1.3rem' }
          },
          tooltip: { backgroundColor: 'white' },
          series: [{
            type: 'pie',
            radius: ['20%', '60%'],
            center: ['50%', '35%'],
            label: {
              show: true,
              position: 'outside',
              formatter: '{c}',
              textStyle: { fontSize: 22, fontWeight: 'bold', color: '#b7b7b7' }
            },

            itemStyle: {
              borderRadius: 10,

              shadowColor: 'rgba(0,0,0,0.5)',
              shadowBlur: 20
            },

            data: data.map((item) => ({ name: item.name, value: item.value, id: item.id }))
          }]
        };

        myChart.setOption(option);
        window.addEventListener('resize', myChart.resize);

        // ⚡ Avvalgi click eventni olib tashlaymiz
        myChart.off('click');

        myChart.on('click', function(params) {
          if (structure_id) {
            window.location.href = `hr.php?act=regions_map&region_id=${structure_id}&object_type=${params.data.id}`
          }else{
            window.location.href = `hr.php?act=regions_map&object_type=${params.data.id}`
          }

        });
      }


      // 📊 Pastdagi diagramma (faqat "Ҳаммаси" uchun)
      function get_events_by_region(data) {
        const dom = document.getElementById('get_events_by_region');
        if (!dom) return console.error('❌ Diagramma konteyner topilmadi:', containerId);


        if(structure_id){
          let allHtml = `
            <div class="col-12">
              <div class="region-box">
          `;

          data?.list.forEach(cat => {
            // Har bir kategoriya uchun
            const places = cat.objects || [];
            let listHtml = '<ul class="place-list scrollable">';

            places.forEach(p => {
              listHtml += `
                <li class="alert alert-dark" role="alert" data-cat="${cat.name}" data-place="${p.object_name}">
                  ${p.object_name}
                </li>`;
            });

            listHtml += '</ul>';

            allHtml += `
              <div class="category-block mb-2">
                <h5 class="mb-2 text-primary">${cat.name}</h5>
                ${listHtml}
              </div>
            `;
          });

          allHtml += `
              </div>
            </div>
          `;

          dom.innerHTML = allHtml;

        }else{

          const myChart = echarts.init(dom);
          const option = {
            textStyle: { fontFamily: "Arial, sans-serif" },
            xAxis: {
              type: 'category',
              data: data?.stat_region?.map(item => item.name),
              axisLabel: { interval: 0, fontSize: '1.3rem', rotate: 45, color: '#b7b7b7' },
              axisLine: { show: false },
              splitLine: { show: false }
            },
            grid: { bottom: 110, right: 30, left: 100 },
            yAxis: { type: 'value', axisLabel: { color: '#b7b7b7' }, axisLine: { show: false },
            splitLine: { show: false } },
            tooltip: { backgroundColor: 'white' },
            series: [{
              data: data?.stat_region?.map(item => parseInt(item.value)),
              type: 'bar',
              barMaxWidth: 60,
              itemStyle: { color: (p) => colors[p.dataIndex % colors.length], borderRadius: [8, 8, 0, 0] },
              label: { fontSize: 22, show: true, position: 'top', color: '#b7b7b7' }
            }]
          };
  
          myChart.setOption(option);
          window.addEventListener('resize', myChart.resize);
        }

      }


        $('#event_count').on('change', function() {
          const id = parseInt($(this).val());
          structure_id = id
          getEvents()
        })


        
    });























    let default_color = localStorage.getItem('templateCustomizer-vertical-menu-template-no-customizer--Style') ==
      'light' ? '#000' : '#b7b7b7';

    let filters = [{
        id: 0,
        name: dict_all
      },
      {
        id: 1,
        name: dict_by_day
      },
      {
        id: 2,
        name: dict_by_month
      },
      {
        id: 3,
        name: dict_by_year
      },
    ]




    function get_power_by_vehicle(data, total) {
      let sdata = data.map(i => ({ value: i.value, name: i.name }));
      var dom = document.getElementById('get_power_by_vehicle');
      var myChart = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
      });
      var option;
      let color = [
        "#FFD24C", // sariq (eng katta bo‘lak)
        "#4BA3C7", // havorang
        "#7AD67A", // och yashil
        "#FF884C", // to‘q sariq
        "#B266FF", // binafsha
        "#FF6666", // qizil
        "#6EB5FF", // ko‘k
        "#5CC97B", // yashil
        "#A472FF", // to‘q binafsha
        "#FFB84D", // och sariq
        "#99CCFF" // och ko‘k
      ];

      option = {
        textStyle: {
          fontFamily: "Arial, sans-serif"
        },
        color,
        title: {
          text: total,
          left: 'center',
          top: '38%',
          textStyle: {
            fontSize: 18,
            fontWeight: 'bold',
            color: default_color
          },
        },
        legend: {
          top: 'bottom',
          orient: 'horizontal',
          left: 'center',
          itemGap: 10,
          textStyle: {
            color: default_color,
            fontSize: '1.3rem'
          }
        },
        tooltip: {
          backgroundColor: 'white',
           textStyle: {
                fontSize: 20,     // 🔥 shu yerda o'zgartirasan
                color: '#000'
            }
        },
        series: [{
          type: 'pie',
          radius: ['20%', '60%'],
          center: ['50%', '42%'],
          avoidLabelOverlap: false,
          itemStyle: {
            borderRadius: 10,
            borderWidth: 2,
            borderColor: 'none',
            shadowColor: 'rgba(0, 0, 0, 0.5)',
            shadowBlur: 20
          },
          label: {
            show: true, // Show labels
            position: 'outside', // Place labels outside the pie chart
            formatter: '{c}', // Format the labels
            textStyle: {
              fontSize: 22, // Adjust the font size of the labels
              fontWeight: 'bold',
              color: '#b7b7b7',
            },
            backgroundColor: 'none',
          },
          minAngle: 20,
          emphasis: {
            label: {
              show: true,
              backgroundColor: 'none',
            }
          },
          labelLine: {
            show: true,
            length: 20,
            backgroundColor: 'none',
          },
          data: sdata.map((item, index) => {
            return {
              color: '#fff',
              value: item.value,
              name: item.name,
              itemStyle: {
                shadowColor: color[index],
                shadowBlur: 10,
                borderRadius: 10,
                borderColor: color[index],
              },
            };
          })
        }]
      };
      if (option && typeof option === 'object') {
        myChart.setOption(option);
      }
      window.addEventListener('resize', myChart.resize);
    }
    $.ajax({
      type: "GET",
      url: `${AJAXPHP}?act=power_by_vehicle`,
      dataType: "json",
      encode: true,
      success: function(data) {
        const totalValue = data.reduce((sum, item) => sum + parseInt(item.value), 0);
        get_power_by_vehicle(data, totalValue);
      }
    })



    // 🧩 TEST MA’LUMOTLAR
//     const eventTypeChartDataByFilter = {
//       0: {
//         legend: [
//         "Маданий тадбирлар",
//           "Сиёсий тадбирлар",
//           "Спорт тадбирлар",
//           "Бошқа тадбирлар",
//         ],
//         data: [2, 4, 2, 5],
//       },
//       1: {
//         legend: [
//         "Маданий тадбирлар",
//           "Сиёсий тадбирлар",
//           "Спорт тадбирлар",
//           "Бошқа тадбирлар",
//         ],
//         data: [1, 3, 2, 4],
//       },
//       2: {
//         legend: [
//        "Маданий тадбирлар",
//           "Сиёсий тадбирлар",
//           "Спорт тадбирлар",
//           "Бошқа тадбирлар",
//         ],
//         data: [3, 0, 1, 2],
//       },
//       3: {
//         legend: [
//         "Маданий тадбирлар",
//           "Сиёсий тадбирлар",
//           "Спорт тадбирлар",
//           "Бошқа тадбирлар",
//         ],
//         data: [2, 5, 1, 3],
//       },
//     };









    
//     // 🧾 Modal ma’lumotlari
//     const eventsByCategoryAndRegion = {
//       "Маданий тадбирлар": {
//         "Тошкент": [
//           { id: 1, title: "“Семь лун” спектакли ", date: "2025-11-10", place: "Шайхонтоҳур т.Илҳом театри", desc: "",
//             participants: 64 },
//           { id: 2, title: "Кино намойишлари янги премъера", date: "2025-11-12",
//             place: "А.Навоий номидаги киночилар уйи", desc: "", participants: 76 }
//         ],
//         "Самарқанд": [
//           { id: 3, title: "Юнесконинг 43-сессиясига бағишланган концерт томошо дастурини ўтказилиши",
//             date: "2025-11-05", place: "Самарқанд вилояти мусиқали драмма театри майдонида",
//             desc: "Ҳудудий ижрочилар", participants: 36 }
//         ],
//         "Тошкент вилояти": [
//           { id: 3, title: "“REVEREM SHOV” бўлиб ўтади", date: "2025-11-05", place: "Анҳор саройи", desc: "",
//             participants: 55 }
//         ]
//       },
//       "Сиёсий тадбирлар": {
//         "Самарқанд": [
//           { id: 3, title: "ЮНЕСКО Бош конференциясининг 43 сессияси", date: "2025-11-05",
//             place: "“Silk Road” туризм маркази", desc: "", participants: 45 }
//         ]
//       },
//       "Спорт тадбирлар": {
//         "Тошкент": [
//           { id: 21, title: "Спортнинг футбол тури бўйича Биринчи лига “pley-off” босқичи", date: "2025-11-20",
//             place: "Яшнобод т.Олимпия шахарчаси", desc: "10км марафон", participants: 70 },
//           { id: 22, title: "Спортнинг юнон-рум тури бўйича Ўзбекистон чемпионати", date: "2025-11-25",
//             place: "Яшнобод т.“Odil Akhmedov Football Academy”", desc: "", participants: 50 }
//         ],
//         "Навоий": [
//           { id: 23, title: "Спортнинг Гандбол тури бўйича ёшлар ўртасида Ўзбекистон чемпионати", date: "2025-11-21",
//             place: "Навоий ш. Гандбол спорт залида", desc: "", participants: 60 }
//         ]
//       },
//       "Бошқа тадбирлар": {
//         "Сирдарё": [
//           { id: 31, title: "Педагок кадрлар аттестациясининг малака синов имтиҳонлари", date: "2025-11-14",
//             place: "Шодлик МФЙдаги “Баркамол авлод” болалар мактаби биносида", desc: "", participants: 50 }
//         ]
//       }
//     };

//     // 🔽 Filter ro‘yxat
//     const eventTypeFilters = [
//       { id: 0, name: "Ҳаммаси" },
//       { id: 1, name: "Бугун" },
//       { id: 2, name: "Ой бўйича" },
//       { id: 3, name: "Йил бўйича" },
//     ];

//     function renderEventTypeChart(data, total) {
//       // sdata aniqlanadi (legend + data dan)
//       const sdata = (data.legend || []).map((name, i) => ({
//         value: (data.data && data.data[i]) ? data.data[i] : 0,
//         name: name
//       }));

//       const dom = document.getElementById("get_events_by_type");
//       const chart = echarts.init(dom, null, { renderer: 'canvas', useDirtyRect: false });

//       // ranglar massivi — option ichida "color" sifatida ishlatiladi
//       const color = [
//         "#FFD24C", // sariq (eng katta bo‘lak)
//         "#4BA3C7", // havorang
//         "#7AD67A", // och yashil
//         "#FF884C", // to‘q sariq
//         "#B266FF", // binafsha
//         "#FF6666", // qizil
//         "#6EB5FF", // ko‘k
//         "#5CC97B", // yashil
//         "#A472FF", // to‘q binafsha
//         "#FFB84D", // och sariq
//         "#99CCFF" // och ko‘k
//       ];


//       let option = {
//         textStyle: { fontFamily: "Arial, sans-serif" },
//         color,
//         title: {
//           text: total,
//           left: 'center',
//           top: '32%',
//           textStyle: {
//             fontSize: 22,
//             fontWeight: 'bold',
//             color: '#b7b7b7'
//           },
//         },
//         legend: {
//           top: 'bottom',
//           orient: 'horizontal',
//           left: 'center',
//           textStyle: { color: '#b7b7b7', fontSize: '1.3rem' }
//         },
//             tooltip: {
//             backgroundColor: 'white',
//             textStyle: {
//                 fontSize: 20,     // 🔥 shu yerda o'zgartirasan
//                 color: '#000'
//             }
//         },

//         series: [{
//           type: 'pie',
//           radius: ['20%', '60%'],
//           center: ['50%', '35%'],
//           itemStyle: {
//             borderRadius: 10,

//             shadowColor: 'rgba(0,0,0,0.5)',
//             shadowBlur: 20
//           },

//           label: {
//             show: true,
//             position: 'outside',
//             formatter: '{c}',
//             textStyle: { fontSize: 20, fontWeight: 'bold', color: '#b7b7b7' }
//           },
//           labelLine: { show: true, length: 20, length2: 12 },
//           data: sdata.map((item, index) => ({
//             value: item.value,
//             name: item.name,
//             itemStyle: {
//               // rang va yengil soya
//               color: color[index % color.length],
//               borderColor: '#fff',
//               borderRadius: 10,
//               shadowColor: color[index % color.length],
//               shadowBlur: 12
//             }
//           }))
//         }]
//       };

//       chart.setOption(option);

//       window.addEventListener('resize', chart.resize);

//       let currentEvents = [];

//       chart.off('click');
//       chart.on('click', function(params) {
//         const category = params.name;

//         const regionsObj = (eventsByCategoryAndRegion[category]) ? eventsByCategoryAndRegion[category] : {};
//         const regionEntries = Object.keys(regionsObj).map(regionName => ({
//           region: regionName,
//           count: (regionsObj[regionName] || []).length
//         })).sort((a, b) => b.count - a.count);

//         let bodyHtml = '';
//         if (regionEntries.length === 0) {
//           bodyHtml =
//             `<div class="alert alert-secondary">Ушбу категория бўйича вилоятларда тадбир топилмади.</div>`;
//         } else {
//           bodyHtml = `<div class="mb-2">Вилоятлар кесимидаги <strong>${category}</strong></div>`;
//           bodyHtml += `<div class="list-group">`;
//           regionEntries.forEach(e => {
//             bodyHtml += `
//         <button type="button" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center region-item"
// data-category="${escapeHtml(category)}" data-region="${escapeHtml(e.region)}">
// <span>${escapeHtml(e.region)}</span>
// <span class="badge bg-primary rounded-pill">${e.count}</span>
//         </button>
//       `;
//           });
//           bodyHtml += `</div>`;
//         }

//         $("#eventTypeModalLabel").text(`"${category}" — вилоятлар кесими`);
//         $("#eventTypeModalBody").html(bodyHtml);
//         const eventTypeModal = new bootstrap.Modal(document.getElementById('eventTypeModal'));
//         eventTypeModal.show();
//       });

//       // ===== Click: region-item → 2-modal (batafsil tadbirlar) =====
//       $(document).on('click', '#eventTypeModalBody .region-item', function() {
//         const category = $(this).data('category');
//         const region = $(this).data('region');
//         currentEvents = ((eventsByCategoryAndRegion[category] || {})[region]) || [];

//         let html = `
//     <div class="row">
//       <div class="col-md-2">
//         <div class="list-group" id="eventList">
//   `;

//         if (currentEvents.length === 0) {
//           html += `<div class="alert alert-secondary">Бу вилоят учун тадбирлар рўйхати бўш.</div>`;
//         } else {
//           currentEvents.forEach((ev, i) => {
//             html += `
//         <button type="button"
// class="list-group-item list-group-item-action ${i === 0 ? 'active' : ''}"
// data-evindex="${i}">
// ${escapeHtml(ev.title)}
//         </button>
//       `;
//           });
//         }

//         html += `
//         </div>
//       </div>
//       <div class="col-md-10" id="eventDetail">
//   `;

//         if (currentEvents.length > 0) {
//           const ev = currentEvents[0];
//           html += `
//        <div class="">
//            <div class="space-main-modal-box">
//         <div class="row">
//             <div class="col-6">
//                <div class="space-main-head">
// <h4>${escapeHtml(ev.place)}</h4>
//                </div>
//                 <div class="space-main-body-umumu">
//                   <div class="space-main-body-img">
//                     <img src="./templates/hr/img/bozor-tayyor.png" alt="">
//                   </div>
//                   <div class="row pt-3">
//                       <div class="col-4">
//                           <video width="100%" autoplay loop muted>
//                               <source src="/templates/hr/videos/video-4.mp4" type="video/mp4">
//                           </video>
//                       </div>
//                        <div class="col-4">
//                           <video width="100%" autoplay loop muted>
//                               <source src="/templates/hr/videos/video-5.mp4" type="video/mp4">
//                           </video>
//                       </div>
//                        <div class="col-4">
//                           <video width="100%" autoplay loop muted>
//                               <source src="/templates/hr/videos/video-6.mp4" type="video/mp4">
//                           </video>
//                       </div>
//                   </div>
//                </div>
//             </div>
//             <div class="col-3">
//                <div class="space-main-head">
//                      <h4>Ҳудуд ҳақида маълумотлар</h4>
//                </div>
//                  <div class="space-main-body-password">
//                      <ul>
//                          <li>
//                           <img src="https://i.ytimg.com/vi/bpA1FDdZcgU/maxresdefault.jpg" alt="" style="height:300px; width:100%; object-fit:cover;">
//                         </li>
//                                              <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg"   width="18" height="18" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
//                             <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
//                             <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
//                           </svg></span> Манзили: </h6>
// <p>${escapeHtml(ev.place)}</p>
//                                                                       </li>


//                                                     <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
//                             <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
//                           </svg></span>Ҳудуд администратор тел рақами: </h6>
//                                                       <p>+998 90 123-45-67 +998 91 123-45-67</p>
//                                                   </li>
//                                                   <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
//                             <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
//                           </svg></span>Майдони: </h6>
//                                                       <p>4046.86 m²</p>
//                                                                     </li>
//                                                                       <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
//                             <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
//                           </svg></span>Камералар сони: </h6>
//                                                       <p>50 та</p>
//                                                                     </li>
//                                                                     <li> 
//                                                                         <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
//                           <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
//                           <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
//                         </svg></span>Кириш чиқиш эшиклар сони: </h6>
//                                                                         <p>4 та</p>
//                                                                     </li>
//                                                   <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
//                             <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
//                           </svg></span>Ҳудуд раҳбари: </h6>
//                                                       <p>Бердиев Музаффар +998 90 234-76-90</p>
//                                                   </li>

//                                                   <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
//                             <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
//                           </svg></span> Ҳамкор ташкилотлар алоқа: </h6>
//                                                       <p> ИИВ- +998 91 123-45-67 ФВВ- +998 97 851-12-23</p>
//                                                   </li>

//                      </ul>
//                </div>
//             </div>
//             <div class="col-3">
//                 <div class="space-main-head">
//                      <h4>МГ томонидан ажратилган куч воситалар</h4>
//                </div>
//                  <div class="space-main-body-duty">
//                     <ul>
//                      <li class="alert alert-dark" role="alert">МГ жавобгар:  <span>лейтенант Умрзаков Жавоҳир </span> </li>
//                      <li class="alert alert-dark" role="alert">Қатнашадиган фуқароларнинг тахминий сони:  <span>300 нафар </span> </li>
//                      <li class="alert alert-dark" role="alert">Тадбирнинг бошланиш ва тугаш вақти:  <span>08:00 - 12:00 </span> </li>
// <li class="alert alert-dark" role="alert">Жами шахсий таркиб:  <span>${escapeHtml(String(ev.participants || 'N/A'))} нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">МГ ҳарбий хизматчилари:  <span>2 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">ИИВ ҳарбий хизматчилари:  <span>3 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">ФВВ ҳарбий хизматчилари:  <span>4 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">МГ МСГр:  <span>4 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">ИИВ спринг:  <span>3 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">Техникалар:  <span>12 та</span></li>       
//                             <li class="alert alert-dark" role="alert">Алоқа воситалари:  <span>12 та</span></li>       
//                             <li class="alert alert-dark" role="alert">Металодетектор:  <span>8 та</span></li>       
//                             <li class="alert alert-dark" role="alert">Тадбир ўтказувчи ташаббускор:  <span>Алишер Навоий номидаги киночилар уйи</span></li>       
//                     </ul>
//                </div>
//             </div>
//         </div>
//     </div>

//         </div>
//     `;
//         } else {
//           html += `<div class="alert alert-secondary">Tadbir topilmadi.</div>`;
//         }

//         html += `
//       </div>
//     </div>
//   `;

//         $("#eventListModalLabel").text(`${region} — ${category}`);
//         $("#eventListModalBody").html(html);
//         const listModal = new bootstrap.Modal(document.getElementById('eventListModal'));
//         listModal.show();
//       });

//       // 🟢 Chapdagi ro‘yxatdan bosilganda tafsilotni yangilash
//       $(document).on('click', '#eventList .list-group-item', function() {
//         $('#eventList .list-group-item').removeClass('active');
//         $(this).addClass('active');

//         const index = $(this).data('evindex');
//         const ev = currentEvents[index];

//         $('#eventDetail').html(`
//       <div class="">
//            <div class="space-main-modal-box">
//         <div class="row">
//             <div class="col-6">
//                <div class="space-main-head">
// <h4>${escapeHtml(ev.place)}</h4>
//                </div>
//                 <div class="space-main-body-umumu">
//                   <div class="space-main-body-img">
//                     <img src="./templates/hr/img/bozor-tayyor.png" alt="">
//                   </div>
//                   <div class="row">
//                       <div class="col-4 pt-3">
//                           <video width="100%" height="300" autoplay loop muted>
//                               <source src="/templates/hr/videos/video-4.mp4" type="video/mp4">
//                           </video>
//                       </div>
//                        <div class="col-4">
//                           <video width="100%" height="300" autoplay loop muted>
//                               <source src="/templates/hr/videos/video-5.mp4" type="video/mp4">
//                           </video>
//                       </div>
//                        <div class="col-4">
//                           <video width="100%" height="300" autoplay loop muted>
//                               <source src="/templates/hr/videos/video-6.mp4" type="video/mp4">
//                           </video>
//                       </div>
//                   </div>
//                </div>
//             </div>
//             <div class="col-3">
//                <div class="space-main-head">
//                      <h4>Ҳудуд ҳақида маълумотлар</h4>
//                </div>
//                  <div class="space-main-body-password">
//                      <ul>
//                          <li>
//                           <img src="https://i.ytimg.com/vi/bpA1FDdZcgU/maxresdefault.jpg" alt="" style="height:300px; width:100%; object-fit:cover;">
//                         </li>
//                                              <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg"   width="18" height="18" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
//                             <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
//                             <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
//                           </svg></span> Манзили: </h6>
// <p>${escapeHtml(ev.place)}</p>
//                                                                       </li>


//                                                     <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
//                             <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
//                           </svg></span>Ҳудуд администратор тел рақами: </h6>
//                                                       <p>+998 90 123-45-67 +998 91 123-45-67</p>
//                                                   </li>
//                                                   <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
//                             <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
//                           </svg></span>Майдони: </h6>
//                                                       <p>4046.86 m²</p>
//                                                                     </li>
//                                                                       <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
//                             <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
//                           </svg></span>Камералар сони: </h6>
//                                                       <p>50 та</p>
//                                                                     </li>
//                                                                     <li> 
//                                                                         <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
//                           <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
//                           <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
//                         </svg></span>Кириш чиқиш эшиклар сони: </h6>
//                                                                         <p>4 та</p>
//                                                                     </li>
//                                                   <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
//                             <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
//                           </svg></span>Ҳудуд раҳбарии: </h6>
//                                                       <p>Бердиев Музаффар +998 90 234-76-90</p>
//                                                   </li>

//                                                   <li>
//                                                       <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
//                             <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
//                           </svg></span> Ҳамкор ташкилотлар алоқа: </h6>
//                                                       <p> ИИВ- +998 91 123-45-67 ФВВ- +998 97 851-12-23</p>
//                                                   </li>

//                      </ul>
//                </div>
//             </div>
//             <div class="col-3">
//                 <div class="space-main-head">
//                      <h4>МГ томонидан ажратилган куч воситалар</h4>
//                </div>
//                  <div class="space-main-body-duty">
//                     <ul>
//                      <li class="alert alert-dark" role="alert">МГ жавобгар:  <span>лейтенант Умрзаков Жавоҳир </span> </li>
//                      <li class="alert alert-dark" role="alert">Қатнашадиган фуқароларнинг тахминий сони:  <span>300 нафар </span> </li>
//                      <li class="alert alert-dark" role="alert">Тадбирнинг бошланиш ва тугаш вақти:  <span>08:00 - 12:00 </span> </li>
// <li class="alert alert-dark" role="alert">Жами шахсий таркиб:  <span>${escapeHtml(String(ev.participants || 'N/A'))} нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">МГ ҳарбий хизматчилари:  <span>2 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">ИИВ ҳарбий хизматчилари:  <span>3 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">ФВВ ҳарбий хизматчилари:  <span>4 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">МГ МСГр:  <span>4 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">ИИВ спринг:  <span>3 нафар</span> </li>
//                             <li class="alert alert-dark" role="alert">Техникалар:  <span>12 та</span></li>       
//                             <li class="alert alert-dark" role="alert">Алоқа воситалари:  <span>12 та</span></li>       
//                             <li class="alert alert-dark" role="alert">Металодетектор:  <span>8 та</span></li>       
//                             <li class="alert alert-dark" role="alert">Тадбир ўтказувчи ташаббускор:  <span>Алишер Навоий номидаги киночилар уйи</span></li>       
//                     </ul>
//                </div>
//             </div>
//         </div>
//     </div>

//         </div>
//   `);
//       });

//       // ===== Kichik util: HTML escape =====
//       function escapeHtml(text) {
//         if (!text && text !== 0) return '';
//         return String(text)
//           .replace(/&/g, '&amp;')
//           .replace(/</g, '&lt;')
//           .replace(/>/g, '&gt;')
//           .replace(/"/g, '&quot;')
//         .replace(/'/g, '&#039;');
//     }


//   }


  // 🚀 Boshlang‘ich yuklash
  // const initialData = eventTypeChartDataByFilter[0];
  // const totalInitial = initialData.data.reduce((sum, v) => sum + v, 0);
  // renderEventTypeChart(initialData, totalInitial);
























  /* qo'shimcha kiritgan joyim */
  // 🎯 Ma’lumotlar
  const chartDataByFilter2 = {
    0: {
      legend: [
      "Ўқув",
        "Тарбиявий",
        "Назорат",
        "Техник",
        "Таълим ва касбий тайёргарлик",
        "Спорт ва жисмоний тайёргарлик"
      ],
      data: [108, 92, 69, 89, 46, 27]
    },
    2: {
      legend: [
       "Ўқув",
        "Тарбиявий",
        "Назорат",
        "Техник",
        "Таълим ва касбий тайёргарлик",
        "Спорт ва жисмоний тайёргарлик"
      ],
      data: [40, 30, 22, 25, 18, 10]
    },
    3: {
      legend: [
       "Ўқув",
        "Тарбиявий",
        "Назорат",
        "Техник",
        "Таълим ва касбий тайёргарлик",
        "Спорт ва жисмоний тайёргарлик"
      ],
      data: [200, 160, 120, 150, 90, 60]
    }
  };

  // 🧾 Tafsilotlar (modal uchun)
  const eventDetails3 = {
   "Ўқув": [
      "Отиш машғулотлари - 12",
      "Тактик машғулотлар - 34",
      "Техник машқлар - 14",
      "Муҳандислик ва сапёр тайёргарлиги - 9",
      "Тиббий машғулотлар - 6",
      "Жисмоний ва психологик тайёргарлик - 4",
      "Алоқа ва радиотехник тайёргарлик машғулотлари - 13",
      "Жанговар тайёргарлик бўйича йиғилишлар ва назорат машғулотлари - 20"
    ],
   "Тарбиявий": [
      "Ватанпарварлик ва маънавий машғулотлар - 12",
      "Тантанали саф тортиш маросимлари - 15",
      "Очиқ эшиклар куни - 20",
      "Маданий-оммавий тадбирлар - 21",
      "Маънавий-психологик тайёргарлик машғулотлари - 24"
    ],
   "Назорат": [
      "Жанговар ва хизматга тайёргарлик текширувлари - 14",
      "Қўмондонлик ёки бошқарув томонидан инспекторлик текшируви - 17",
      "Энг яхши бўлинма (ҳарбий қисм) танлови - 19",
      "Қурол, техника ва ўқ-дорилар ҳисобини текшириш - 19"
    ],
    "Техник": [
      "Техника ва қуролларга техник хизмат кўрсатиш ва таъмирлаш - 21",
      "Парклар, казармалар ва омборларда тартиб ўрнатиш - 24",
      "Мулкни инвентаризация қилиш - 25",
      "Ҳудудни ободонлаштириш, хўжалик ишлари - 19"
    ],
    "Таълим": [
      "Офицер ва прапоршчиклар учун малака ошириш курслари - 24",
      "Янги қурол ва техникани ўрганиш бўйича машғулотлар - 10",
      "Қўмондонлик таркиби учун семинар ва услубий йиғилишлар - 9",
      "Ҳудудлар ўртасида тажриба алмашиш - 3"
    ],
    "Спорт ва жисмоний тайёргарлик": [
      "Жисмоний тайёргарлик нормативларини топшириш - 1",
      "Бўлинмалар ўртасида мусобақалар - 10",
      "Ҳарбий-спорт байрамлари - 8",
      "ГТО стандартларига тайёргарлик - 8"
    ]
  };

  // 🔽 Filter ro‘yxat
  const filters2 = [
    { id: 0, name: "Ҳаммаси" },
    { id: 2, name: "Ой" },
    { id: 3, name: "Йил" }
  ];

  // 🎨 Ranglar
  const colorSet2 = [
    "#FFD24C", // sariq (eng katta bo‘lak)
    "#4BA3C7", // havorang
    "#7AD67A", // och yashil
    "#FF884C", // to‘q sariq
    "#B266FF", // binafsha
    "#FF6666", // qizil
    "#6EB5FF", // ko‘k
    "#5CC97B", // yashil
    "#A472FF", // to‘q binafsha
    "#FFB84D", // och sariq
    "#99CCFF" // och ko‘k
  ];


  // 📊 Chart funksiyasi
  function renderIdoraviyChart(data, total) {
    const sdata = data.legend.map((name, i) => ({ value: data.data[i], name }));

    const dom = document.getElementById("get_departmental_events");
    const chart = echarts.init(dom);

    const option = {
      textStyle: { fontFamily: "Arial, sans-serif" },
      color: colorSet2,
      title: {
        text: total,
        left: "center",
        top: "32%",
        textStyle: { fontSize: 20, fontWeight: "bold", color: "#b7b7b7" }
      },
      legend: {
        top: "bottom",
        orient: "horizontal",
        left: "center",
        textStyle: { color: "#b7b7b7", fontSize: "1.3rem" }
      },
      tooltip: { backgroundColor: "white",  textStyle: {
                fontSize: 20,    
                color: '#000'
            } },
      series: [{
        type: "pie",
        radius: ['20%', '60%'],
        center: ['50%', '35%'],
        itemStyle: {
          borderRadius: 10,
          borderWidth: 2,
          shadowColor: 'rgba(0,0,0,0.5)',
          shadowBlur: 20
        },

        label: {
          show: true,
          position: "outside",
          formatter: "{c}",
          textStyle: { fontSize: 20, fontWeight: "bold", color: "#b7b7b7" }
        },
        labelLine: { show: true, length: 20 },
        data: sdata.map((item, index) => ({
          value: item.value,
          name: item.name,
        }))
      }]
    };

    chart.setOption(option);
    window.addEventListener("resize", chart.resize);

    // Modalni ochish
    chart.off("click");
    chart.on("click", function(params) {
      const category = params.name;
      const details = eventDetails3[category] || ["Ma’lumot topilmadi"];
      $("#eventTypeModalLabel1").text(category);
      $("#eventTypeModalBody1").html(
        `<ul class="list-group">${details.map(d => `<li class="list-group-item">${d}</li>`).join("")}</ul>`
      );
      $("#eventTypeModal1").modal("show");
    });
  }

  // SELECTni to‘ldirish
  filters2.forEach(item => {
    $("#departmental_events").append(`<option value="${item.id}">${item.name}</option>`);
  });

  //  SELECT o‘zgarsa chartni yangilash
  $("#departmental_events").change(function() {
    const id = $(this).val();
    const selected = chartDataByFilter2[id] || chartDataByFilter2[0];
    const total = selected.data.reduce((a, b) => a + b, 0);
    renderIdoraviyChart(selected, total);
  });

  // Dastlab yuklash
  const initialData2 = chartDataByFilter2[0];
  const totalInitial2 = initialData2.data.reduce((a, b) => a + b, 0);
  renderIdoraviyChart(initialData2, totalInitial2);




  // JTSB chart uchun funksiya Boshlang‘ich
  // Har bir viloyat uchun chart ma'lumotlari
  // JTSB diagram hududlar kesimida tugashi





  // qo'shimcha kiritgan joyim

  // function get_events_by_region1(data) {
  //   var dom = document.getElementById('get_events_by_region1');
  //   var myChart = echarts.init(dom, null, {
  //     renderer: 'canvas',
  //     useDirtyRect: false
  //   });
  //   var option;
  //   var colors = ['#28C76F', '#00CFE8', '#7367F0', '#45FFCA', '#A149FA', '#E3FCBF', '#00FFAB',
  //     '#B983FF', '#94B3FD', '#998CEB', '#00AF91', '#6499E9', '#F3CCFF',
  //   ];
  //   option = {
  //     textStyle: {
  //       fontFamily: "Arial, sans-serif"
  //     },
  //     xAxis: {
  //       type: 'category',
  //       data: data.map(item => item.name),
  //       axisLabel: {
  //         interval: 0,
  //         fontSize: '1rem',
  //         rotate: 50, // Show all labels
  //         color: default_color,
  //       },
  //       axisLine: {
  //         show: false // Remove the background X line
  //       },
  //       splitLine: {
  //         show: false // Remove the background X line
  //       }
  //     },
  //     grid: {
  //       bottom: 110,
  //       right: 30,
  //       left: 100,
  //     },
  //     yAxis: {
  //       type: 'value',
  //       label: {
  //         show: true,
  //       },
  //       axisLabel: {
  //         color: default_color,
  //          fontSize: 20
  //       },
  //       axisLine: {
  //         show: false // Remove the background Y line
  //       },
  //       splitLine: {
  //         show: false // Remove the background X line
  //       }
  //     },
  //     tooltip: {
  //       backgroundColor: default_color,
  //        textStyle: {
  //               fontSize: 20,     // 🔥 shu yerda o'zgartirasan
  //               color: '#000'
  //           }
  //     },
  //     series: [{
  //       data: data.map(item => parseInt(item.gcount)),
  //       type: 'bar',
  //       barMaxWidth: 60,
  //       barMaxHeight: 60,
  //       itemStyle: {
  //         color: function(params) {
  //           return colors[params.dataIndex % colors
  //             .length]; // Use different colors for each bar
  //         },
  //         borderRadius: [8, 8, 0, 0] // Add border-radius only to the top of the bar line
  //       },
  //       label: {
  //         fontSize: 22,
  //         show: true, // Show the value on top of the bar
  //         position: 'top',
  //         color: default_color,
  //       }
  //     }]
  //   };
  //   if (option && typeof option === 'object') {
  //     myChart.setOption(option);
  //   }
  //   window.addEventListener('resize', myChart.resize);
  // }
  // $.ajax({
  //   type: "GET",
  //   url: `${AJAXPHP}?act=get_events_by_region1`,
  //   dataType: "json",
  //   encode: true,
  //   success: function(data) {
  //     get_events_by_region1(data);
  //     const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount), 0);
  //     $("#get_events_by_region_total1").html(`(${totalValue})`)
  //   }
  // })

  // filters.forEach((item) => {
  //   $('#get_events_by_region_filter1').append(`<option value="${item.id}">${item.name}</option>`)
  // })
  // $('#get_events_by_region_filter1').change(function(data) {
  //   let id = $(this).val();
  //   $.ajax({
  //     type: "GET",
  //     url: `${AJAXPHP}?act=get_events_by_region1&date=${id}`,
  //     dataType: "json",
  //     encode: true,
  //     success: function(data) {
  //       get_events_by_region1(data);
  //       const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount),
  //         0);
  //       $("#get_events_by_region_total1").html(`(${totalValue})`)
  //     }
  //   })
  // })

  function get_events_by_region2(data) {
    var dom = document.getElementById('get_events_by_region2');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });
    var option;
    var colors = ['#28C76F', '#00CFE8', '#7367F0', '#45FFCA', '#A149FA', '#E3FCBF', '#00FFAB',
      '#B983FF', '#94B3FD', '#998CEB', '#00AF91', '#6499E9', '#F3CCFF',
    ];
    option = {
      textStyle: {
        fontFamily: "Arial, sans-serif"
      },
      xAxis: {
        type: 'category',
        data: data.map(item => item.name),
        axisLabel: {
          interval: 0,
          fontSize: '1rem',
          rotate: 50, // Show all labels
          color: default_color,
        },
        axisLine: {
          show: false // Remove the background X line
        },
        splitLine: {
          show: false // Remove the background X line
        }
      },
      grid: {
        bottom: 110,
        right: 30,
        left: 100,
      },
      yAxis: {
        type: 'value',
        label: {
          show: true,
        },
        axisLabel: {
          color: default_color,
          fontSize:20
        },
        axisLine: {
          show: false // Remove the background Y line
        },
        splitLine: {
          show: false // Remove the background X line
        }
      },
      tooltip: {
        backgroundColor: default_color,
         textStyle: {
                fontSize: 20,     // 🔥 shu yerda o'zgartirasan
                color: '#000'
            }
      },
      series: [{
        data: data.map(item => parseInt(item.gcount)),
        type: 'bar',
        barMaxWidth: 60,
        barMaxHeight: 60,
        // itemStyle: {
        //     color: function(params) {
        //         return colors[params.dataIndex % colors
        //             .length]; // Use different colors for each bar
        //     },
        //     borderRadius: [8, 8, 0, 0] // Add border-radius only to the top of the bar line
        // },
        label: {
          fontSize: 22,
          show: true, // Show the value on top of the bar
          position: 'top',
          color: default_color,
        }
      }]
    };
    if (option && typeof option === 'object') {
      myChart.setOption(option);
    }
    window.addEventListener('resize', myChart.resize);
  }
  $.ajax({
    type: "GET",
    url: `${AJAXPHP}?act=get_events_by_region2`,
    dataType: "json",
    encode: true,
    success: function(data) {
      get_events_by_region2(data);
      const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount), 0);
      $("#get_events_by_region_total1").html(`(${totalValue})`)
    }
  })

  filters.forEach((item) => {
    $('#get_events_by_region_filter2').append(`<option value="${item.id}">${item.name}</option>`)
  })
  $('#get_events_by_region_filter2').change(function(data) {
    let id = $(this).val();
    $.ajax({
      type: "GET",
      url: `${AJAXPHP}?act=get_events_by_region2&date=${id}`,
      dataType: "json",
      encode: true,
      success: function(data) {
        get_events_by_region2(data);
        const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount),
          0);
        $("#get_events_by_region_total1").html(`(${totalValue})`)
        }
      })
    })

  {/literal}
</script>
<!-- / Content -->
{include file="footer.tpl"}