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

  {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
  <div class="row">

    <!-- JTSB html chartining html qismi boshi -->
    <div class="col-md-4 col-lg-4 mb-2">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h5 class="card-title">Жавобгарлик объектлари</h5>
          </div>
          <div class="col-4">
            <select class="form-select" id="event_count">
              <option value="">Ҳудудлар</option>

              {foreach from=$Regions item=Item1 key=ikey1}
                <option value="{$Item1.id}">{$Item1.name}</option>
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
            <h5 class="card-title">Оммавий тадбирлар</h5> <br>
          </div>
          <div class="col-4">
            <select class="form-select" id="public_events">
              <option value="">Ҳудудлар</option>
              {foreach from=$Regions item=Item1 key=ikey1}
                <option value="{$Item1.id}">{$Item1.name}</option>
              {/foreach}
            </select>
          </div>
          <div class="chart-container" id="public_events_by_type"></div>
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
            <h5 class="card-title">Идоравий тадбирлар</h5> <br>
          </div>
          <div class="col-4">
            <select class="form-select" id="public_events1"> </select>
          </div>
          <div class="chart-container" id="get_events_by_type1"></div>
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
            <h5 class="card-title">Жамоат тартибини сақлаш ҳудудлар кесимида
            </h5>
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
            <h5 class="card-title">Оммавий тадбирлар ҳудудлар кесимида
            </h5>
          </div>
  

          <div class="chart-container" id="public_events_by_region"></div>
        </div>
      </div>
    </div>

    <div class="col-md-4 col-lg-4 mt-4">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h5 class="card-title">Идоравий тадбирлар ҳудудлар кесимида
            </h5>
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
            top: '32%',
            textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' },
          },
          legend: {
            top: 'bottom',
            left: 'center',
            textStyle: { color: '#b7b7b7', fontSize: '1rem' }
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
              textStyle: { fontSize: 16, fontWeight: 'bold', color: '#b7b7b7' }
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
              axisLabel: { interval: 0, fontSize: '1rem', rotate: 45, color: '#b7b7b7' },
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
              label: { fontSize: 16, show: true, position: 'top', color: '#b7b7b7' }
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
            public_events_by_type(response?.stats);
            public_events_by_region(response)
          },
          error: function(xhr, status, error) {
            console.error('AJAX error:', error);
          }
        })
      }

      getEvents()
      

      function public_events_by_type(data = []) {
        const dom = document.getElementById('public_events_by_type');
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
            textStyle: { color: '#b7b7b7', fontSize: '1rem' }
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
              textStyle: { fontSize: 16, fontWeight: 'bold', color: '#b7b7b7' }
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

        // myChart.on('click', function(params) {
        //   if (structure_id) {
        //     window.location.href = `hr.php?act=regions_map&region_id=${structure_id}&object_type=${params.data.id}`
        //   }else{
        //     window.location.href = `hr.php?act=regions_map&object_type=${params.data.id}`
        //   }

        // });
      }


      // 📊 Pastdagi diagramma (faqat "Ҳаммаси" uchun)
      function public_events_by_region(data) {
        const dom = document.getElementById('public_events_by_region');
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
              axisLabel: { interval: 0, fontSize: '1rem', rotate: 45, color: '#b7b7b7' },
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
              label: { fontSize: 16, show: true, position: 'top', color: '#b7b7b7' }
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
      'light' ? '#000' : '#fff';

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


  /* qo'shimcha kiritgan joyim */
  // 🎯 Ma’lumotlar
  const chartDataByFilter2 = {
    0: {
      legend: [
      "Ўқув-жанговар",
        "Тарбиявий",
        "Назорат ва инспекцион",
        "Техник ва хўжалик",
        "Таълим ва касбий тайёргарлик",
        "Спорт ва жисмоний тайёргарлик"
      ],
      data: [108, 92, 69, 89, 46, 27]
    },
    2: {
      legend: [
       "Ўқув-жанговар",
        "Тарбиявий",
        "Назорат ва инспекцион",
        "Техник ва хўжалик",
        "Таълим ва касбий тайёргарлик",
        "Спорт ва жисмоний тайёргарлик"
      ],
      data: [40, 30, 22, 25, 18, 10]
    },
    3: {
      legend: [
       "Ўқув-жанговар",
        "Тарбиявий",
        "Назорат ва инспекцион",
        "Техник ва хўжалик",
        "Таълим ва касбий тайёргарлик",
        "Спорт ва жисмоний тайёргарлик"
      ],
      data: [200, 160, 120, 150, 90, 60]
    }
  };

  // 🧾 Tafsilotlar (modal uchun)
  const eventDetails3 = {
   "Ўқув-жанговар": [
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
   "Назорат ва инспекцион": [
      "Жанговар ва хизматга тайёргарлик текширувлари - 14",
      "Қўмондонлик ёки бошқарув томонидан инспекторлик текшируви - 17",
      "Энг яхши бўлинма (ҳарбий қисм) танлови - 19",
      "Қурол, техника ва ўқ-дорилар ҳисобини текшириш - 19"
    ],
    "Техник ва хўжалик": [
      "Техника ва қуролларга техник хизмат кўрсатиш ва таъмирлаш - 21",
      "Парклар, казармалар ва омборларда тартиб ўрнатиш - 24",
      "Мулкни инвентаризация қилиш - 25",
      "Ҳудудни ободонлаштириш, хўжалик ишлари - 19"
    ],
    "Таълим ва касбий тайёргарлик": [
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

    const dom = document.getElementById("get_events_by_type1");
    const chart = echarts.init(dom);

    const option = {
      textStyle: { fontFamily: "Arial, sans-serif" },
      color: colorSet2,
      title: {
        text: total,
        left: "center",
        top: "32%",
        textStyle: { fontSize: 18, fontWeight: "bold", color: "#444" }
      },
      legend: {
        top: "bottom",
        orient: "horizontal",
        left: "center",
        textStyle: { color: "#b7b7b7", fontSize: "1rem" }
      },
      tooltip: { backgroundColor: "white" },
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
          textStyle: { fontSize: 15, fontWeight: "bold", color: "#b7b7b7" }
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
    $("#public_events1").append(`<option value="${item.id}">${item.name}</option>`);
  });

  //  SELECT o‘zgarsa chartni yangilash
  $("#public_events1").change(function() {
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

  function get_events_by_region1(data) {
    var dom = document.getElementById('get_events_by_region1');
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
        },
        axisLine: {
          show: false // Remove the background Y line
        },
        splitLine: {
          show: false // Remove the background X line
        }
      },
      tooltip: {
        backgroundColor: 'white',
      },
      series: [{
        data: data.map(item => parseInt(item.gcount)),
        type: 'bar',
        barMaxWidth: 60,
        barMaxHeight: 60,
        itemStyle: {
          color: function(params) {
            return colors[params.dataIndex % colors
              .length]; // Use different colors for each bar
          },
          borderRadius: [8, 8, 0, 0] // Add border-radius only to the top of the bar line
        },
        label: {
          fontSize: 16,
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
    url: `${AJAXPHP}?act=get_events_by_region1`,
    dataType: "json",
    encode: true,
    success: function(data) {
      get_events_by_region1(data);
      const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount), 0);
      $("#get_events_by_region_total1").html(`(${totalValue})`)
    }
  })

  filters.forEach((item) => {
    $('#get_events_by_region_filter1').append(`<option value="${item.id}">${item.name}</option>`)
  })
  $('#get_events_by_region_filter1').change(function(data) {
    let id = $(this).val();
    $.ajax({
      type: "GET",
      url: `${AJAXPHP}?act=get_events_by_region1&date=${id}`,
      dataType: "json",
      encode: true,
      success: function(data) {
        get_events_by_region1(data);
        const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount),
          0);
        $("#get_events_by_region_total1").html(`(${totalValue})`)
      }
    })
  })

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
        },
        axisLine: {
          show: false // Remove the background Y line
        },
        splitLine: {
          show: false // Remove the background X line
        }
      },
      tooltip: {
        backgroundColor: 'white',
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
          fontSize: 16,
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