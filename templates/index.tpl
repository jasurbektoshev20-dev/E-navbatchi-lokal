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

.place-list li {
  padding: 12px 16px;
  background-color: #f8f9fa;
  border-radius: 8px;
  margin-bottom: 8px;
  cursor: pointer;
  transition: 0.2s ease;
  font-size: 16px;
}

.place-list li:hover {
  background-color: #e9f2ff;
  border-color: #007bff;
}

.place-list li.active {
  color: white;
  background: linear-gradient(72.47deg, #7367f0 22.16%, rgba(115, 103, 240, 0.7) 76.47%);
}

.space-main-modal-box h4{
  font-size: 24px;
  text-align: center;
}

.space-main-body-img{
  width: 100%;
  height: 55vh;
}

.space-main-body-img img{
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.space-main-body-password ul{
  list-style-type: none;
  padding:0px;
}

.space-main-body-password ul li{
  margin: 8px 0px;
  border:1px solid #435ebe;
  border-radius:7px;
  padding:6px;
  background-color: #3b3f41;
}

.space-main-body-password ul li h6{
  font-size: 18px;
  margin: 0;
  padding-bottom: 4px;
}

.space-main-body-password ul li h6 span{
  padding-top: 15px;
  margin-right: 7px;
}

.space-main-body-password ul li p{
  padding: 0;
  margin: 0;
  font-size: 18px;
  padding-left: 10px;
}

.space-main-body-duty ul{
  list-style-type: none;
  padding: 0;
}

.space-main-body-duty ul li{
  font-size:18px;
}

.modal-title{
  border1px solid red;
}

.chart-container{
  display: flex;
  gap: 10px;
  padding: 0px 20px;
}

.region-box{
  padding: 10px;
   box-shadow: 3px 1px 29px 0px rgba(34, 60, 80, 0.26);
   background-color: #fff;
   border-radius: 7px;
   margin-top: 30px;
 
}

.scrollable{
  height: 340px;
  list-style-type: none;
  padding: 0;
  overflow-y: auto;
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
        <h5 class="card-title">Milliy gvardiyaning hududiy boshqarmalari javobgarlik obyektlari</h5>
      </div>
      <div class="col-4">
        <select class="form-select" id="event_count"></select>
      </div>
      <div class="chart-container" id="all_events_by_type"></div>
    </div>
  </div>
</div>

<!-- 🟢 Kengaytirilgan modal -->
<div class="modal fade" id="chartModal" tabindex="-1">
  <div class="modal-dialog modal-xxl modal-dialog-centered"> <!-- 🔸 to‘liq ekran -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="chartModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="row">
          <!-- Chap taraf: Ro‘yxat -->
          <div class="col-md-2 border-end pe-4" id="chartModalList"></div>
          <!-- O‘ng taraf: Batafsil ma’lumot -->
          <div class="col-md-10" id="chartModalDetail">
            <div class="text-center text-muted fs-5 mt-5">Joyni tanlang...</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


    <!-- JTSB html chartining html qismi tugashi -->




        <div class="col-md-4 col-lg-4 mb-2">
            <div class="card">
                <div class="mx-3 my-2 row">
                    <div class="col-8">
                        <h5 class="card-title">Ommaviy tadbirlar</h5>
                    </div>
                    <div class="col-4">
                        <select class="form-select" id="public_events"> </select>
                    </div>
                    <div class="chart-container" id="get_events_by_type"></div>
                </div>
            </div>
        </div>
{* <div class="modal fade" id="eventTypeModal" tabindex="-1" aria-labelledby="eventTypeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eventTypeModalLabel">Kategoriya ma’lumotlari</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Yopish"></button>
      </div>
      <div class="modal-body" id="eventTypeModalBody">
        <!-- JS orqali ma’lumotlar joylanadi -->
      </div>
    </div>
  </div>
</div> *}

             <!-- 1-modali: kategoriya → viloyatlar kesimi -->
          <div class="modal fade" id="eventTypeModal" tabindex="-1" aria-labelledby="eventTypeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="eventTypeModalLabel">Kategoriya ma’lumotlari</h5>
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
                  <h5 class="modal-title" id="eventListModalLabel">Tadbirlar ro‘yxati</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Yopish"></button>
                </div>
                <div class="modal-body" id="eventListModalBody">
                   {* <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-10"></div>
                   </div> *}
                </div>
              </div>
            </div>
          </div>







             <div class="col-md-4 col-lg-4 mb-2">
            <div class="card">
                <div class="mx-3 my-2 row">
                    <div class="col-8">
                        <h5 class="card-title">Idoraviy tadbirlar</h5>
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




      {*  <div class="col-md-12 col-lg-4 mb-2">
            <div class="card">
                <div class="mx-3 my-2 row">
                    <div class="col-12">
                        <h5 class="card-title">{$Dict.jts_services}</h5>
                    </div>
                    <div class="chart-container" id="get_power_by_vehicle">
                      
                    </div>
                </div>
            </div>
        </div>*}


        <div class="col-md-4 col-lg-4 mt-4">
            <div class="card">
                <div class="mx-3 my-2 row">
                    <div class="col-8">
                        <h5 class="card-title">Jamoat tartibini saqlash hududlar kesimida
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
                        <h5 class="card-title">Hududlar kesimida ommaviy tadbirlar
                        </h5>
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
                        <h5 class="card-title">Hududlar kesimida idoraviy tadbirlar
                        </h5>
                    </div>
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
            // Send AJAX request when page is loaded
            $.ajax({
              url: `${AJAXPHP}?act=get_object_types`,
              type: 'GET',
              dataType: 'json',
              success: function(response) {
                console.log('AJAX response:', response);
              },
              error: function(xhr, status, error) {
                console.error('AJAX error:', error);
              }
            });
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

        // function all_events(data, total) {
        //     let maxEvents = -Infinity;
        //     let maxReydEvents = -Infinity;
        //     data.data.forEach(obj => {
        //         maxEvents = Math.max(maxEvents, parseInt(obj.events)) + 2;
        //         maxReydEvents = Math.max(maxReydEvents, parseInt(obj.reyd_events)) + 2;
        //     });

        //     function calculateAverages(data) {
        //         const averagedData = data.data.map(entry => {
        //             const avgEvents = ((parseInt(entry.events) + parseInt(entry.reyd_events)) / 2);
        //             return avgEvents;
        //         });

        //         return averagedData;
        //     }

        //     var dom = document.getElementById('all_events');
        //     var myChart = echarts.init(dom);
        //     var option = {
        //         textStyle: {
        //             fontFamily: "Arial, sans-serif"
        //         },
        //         tooltip: {
        //             trigger: 'axis',
        //             axisPointer: {
        //                 type: 'cross',
        //                 crossStyle: {
        //                     color: '#999'
        //                 }
        //             }
        //         },
        //         toolbox: {
        //             iconStyle: {
        //                 normal: {
        //                     color
        //                 }
        //             },
        //             feature: {
        //                 magicType: { show: true, type: ['line', 'bar'] },
        //                 saveAsImage: { show: true }
        //             }
        //         },
        //         legend: {
        //             textStyle: {
        //                 color,
        //             },
        //             data: data.legend,
        //             bottom: 0
        //         },
        //         xAxis: [{
        //             type: 'category',
        //             axisLabel: {
        //                 color
        //             },
        //             data: data.data.map(item => item.date),
        //             axisPointer: {
        //                 type: 'shadow'
        //             },
        //         }],
        //         yAxis: [{
        //                 type: 'value',
        //                 min: 0,
        //                 max: maxEvents,
        //                 splitLine: {
        //                     lineStyle: {
        //                         color: '#484d69' // Change the color here
        //                     }
        //                 },
        //                 axisLabel: {
        //                     formatter: '{value}',
        //                     color
        //                 }
        //             },
        //             {
        //                 type: 'value',
        //                 min: 0,
        //                 max: maxReydEvents,
        //                 splitLine: {
        //                     lineStyle: {
        //                         color: '#484d69' // Change the color here
        //                     }
        //                 },
        //                 axisLabel: {
        //                     formatter: '{value}',
        //                     color
        //                 }
        //             }
        //         ],
        //         series: [{
        //                 name: data.legend[0],
        //                 type: 'bar',
        //                 smooth: true,
        //                 lineStyle: {
        //                     width: 3
        //                 },
        //                 tooltip: {
        //                     valueFormatter: function(value) {
        //                         return value;
        //                     }
        //                 },
        //                 itemStyle: {
        //                     color: '#FFD581',
        //                     borderRadius: [8, 8, 0, 0]
        //                 },
        //                 data: data.data.map(item => item.events)
        //             },
        //             {
        //                 name: data.legend[1],
        //                 type: 'bar',
        //                 smooth: true,
        //                 lineStyle: {
        //                     width: 3
        //                 },
        //                 tooltip: {
        //                     valueFormatter: function(value) {
        //                         return value;
        //                     }
        //                 },
        //                 itemStyle: {
        //                     color: '#6DECB9',
        //                     borderRadius: [8, 8, 0, 0]
        //                 },
        //                 data: data.data.map(item => item.reyd_events)
        //             },
        //             {
        //                 name: dict_avaregae,
        //                 type: 'line',
        //                 smooth: true,
        //                 lineStyle: {
        //                     width: 3
        //                 },
        //                 yAxisIndex: 1,
        //                 tooltip: {
        //                     valueFormatter: function(value) {
        //                         return value;
        //                     }
        //                 },
        //                 itemStyle: {
        //                     color: '#E9007F',
        //                     borderRadius: [8, 8, 0, 0],
        //                 },
        //                 data: calculateAverages(data)
        //             }
        //         ]
        //     };

        //     if (option && typeof option === 'object') {
        //         myChart.setOption(option);
        //     }
        //     window.addEventListener('resize', myChart.resize);
        // }
        // $.ajax({
        //     type: "GET",
        //     url: `${AJAXPHP}?act=all_events`,
        //     dataType: "json",
        //     encode: true,
        //     success: function(data) {
        //         all_events(data);
        //     }
        // })

        function get_power_by_vehicle(data, total) {
            let sdata = data.map(i => ({ value: i.value, name: i.name }));
            var dom = document.getElementById('get_power_by_vehicle');
            var myChart = echarts.init(dom, null, {
                renderer: 'canvas',
                useDirtyRect: false
            });
            var option;
            let color = [
                '#00FA9A', // Medium Spring Green
                '#98FB98', // Pale Green
                '#87CEFA', // Light Sky Blue
                '#00CFE8', // Light Blue
                '#F0E68C', // Khaki
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
                        fontSize: '1rem'
                    }
                },
                tooltip: {
                    backgroundColor: 'white',
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
                            fontSize: 16, // Adjust the font size of the labels
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
const eventTypeChartDataByFilter = {
  0: {
    legend: [
      "Madaniy tadbirlar",
      "Siyosiy tadbirlar",
      "Sport tadbirlar",
      "Boshqa tadbirlar",
    ],
    data: [2,4,2,5],
  },
  1: {
    legend: [
      "Madaniy tadbirlar",
      "Siyosiy tadbirlar",
      "Sport tadbirlar",
      "Boshqa tadbirlar",
    ],
    data: [1,3,2,4],
  },
  2: {
    legend: [
      "Madaniy tadbirlar",
      "Siyosiy tadbirlar",
      "Sport tadbirlar",
      "Boshqa tadbirlar",
    ],
    data: [3,0,1,2],
  },
  3: {
    legend: [
      "Madaniy tadbirlar",
      "Siyosiy tadbirlar",
      "Sport tadbirlar",
      "Boshqa tadbirlar",
    ],
    data: [2,5,1,3],
  },
};

// 🧾 Modal ma’lumotlari
const eventsByCategoryAndRegion = {
      "Madaniy tadbirlar": {
        "Toshkent": [
          { id: 1, title: "“Семь лун” спектакли ", date: "2025-11-10", place: "Шайхонтоҳур т.Илҳом театри", desc: "", participants: 64 },
          { id: 2, title: "Кино намойишлари янги премъера", date: "2025-11-12", place: "А.Навоий номидаги киночилар уйи", desc: "", participants: 76 }
        ],
        "Samarqand": [
          { id: 3, title: "Юнесконинг 43-сессиясига бағишланган концерт томошо дастурини ўтказилиши", date: "2025-11-05", place: "Самарқанд вилояти мусиқали драмма театри майдонида", desc: "Hududiy ijrochilar", participants: 36 }
        ]
        ,
        "Toshkent viloyati": [
          { id: 3, title: "“REVEREM SHOV” бўлиб ўтади", date: "2025-11-05", place: "Anhor saroyi", desc: "", participants: 55 }
        ]
      },
      "Siyosiy tadbirlar": {
        "Samarqand": [
          { id: 3, title: "ЮНЕСКО Бош конференциясининг 43 сессияси", date: "2025-11-05", place: "“Silk Road” туризм маркази", desc: "", participants: 45 }
        ]
      },
      "Sport tadbirlar": {
        "Toshkent": [
          { id: 21, title: "Спортнинг футбол тури бўйича Биринчи лига “pley-off” босқичи", date: "2025-11-20", place: "Яшнобод т.Олимпия шахарчаси", desc: "10km marafon", participants: 70 },
          { id: 22, title: "Спортнинг юнон-рум тури бўйича Ўзбекистон чемпионати", date: "2025-11-25", place: "Яшнобод т.“Odil Akhmedov Football Academy”", desc: "", participants: 50 }
        ],
        "Navoiy": [
          { id: 23, title: "Спортнинг Гандбол тури бўйича ёшлар ўртасида Ўзбекистон чемпионати", date: "2025-11-21", place: "Навоий ш. Гандбол спорт залида", desc: "", participants: 60 }
        ]
      },
      "Boshqa tadbirlar": {
        "Sirdaryo": [
          { id: 31, title: "Педагок кадрлар аттестациясининг малака синов имтиҳонлари", date: "2025-11-14", place: "Шодлик МФЙдаги “Баркамол авлод” болалар мактаби биносида", desc: "", participants: 50 }
        ]
      }
    };

// 🔽 Filter ro‘yxat
const eventTypeFilters = [
  { id: 0, name: "Hammasi" },
  { id: 1, name: "Bugun" },
  { id: 2, name: "Oy bo‘yicha" },
  { id: 3, name: "Yil bo‘yicha" },
];
function renderEventTypeChart(data, total) {
  // sdata aniqlanadi (legend + data dan)
  const sdata = (data.legend || []).map((name, i) => ({
    value: (data.data && data.data[i]) ? data.data[i] : 0,
    name: name
  }));

  const dom = document.getElementById("get_events_by_type");
  const chart = echarts.init(dom, null, { renderer: 'canvas', useDirtyRect: false });

  // ranglar massivi — option ichida "color" sifatida ishlatiladi
  const color = [
    "#FF6B6B",
    "#4ECDC4",
    "#FFD93D",
    "#C77DFF",
    "#6BCB77",
    "#4D96FF",
    "#FF914D",
  ];

  let option = {
    textStyle: { fontFamily: "Arial, sans-serif" },
    color,
    title: {
      text: total,
      left: 'center',
      top: '32%',
      textStyle: {
        fontSize: 18,
        fontWeight: 'bold',
        color: '#444'
      },
    },
    legend: {
      top: 'bottom',
      orient: 'horizontal',
      left: 'center',
      textStyle: { color: '#555', fontSize: '1rem' }
    },
    tooltip: { backgroundColor: 'white' },
    series: [{
      type: 'pie',
     radius: ['20%', '50%'],
          center: ['50%', '35%'],
          itemStyle: {
            borderRadius: 10,
          
            shadowColor: 'rgba(0,0,0,0.5)',
            shadowBlur: 20
          },

      label: {
        show: true,
        position: 'outside',
        formatter: '{c}',
        textStyle: { fontSize: 16, fontWeight: 'bold', color: '#888' }
      },
      labelLine: { show: true, length: 20, length2: 12 },
      data: sdata.map((item, index) => ({
        value: item.value,
        name: item.name,
        itemStyle: {
          // rang va yengil soya
          color: color[index % color.length],
          borderColor: '#fff',
          borderRadius: 10,
          shadowColor: color[index % color.length],
          shadowBlur: 12
        }
      }))
    }]
  };

  chart.setOption(option);

// 🧱 Chart event handlerlar
window.addEventListener('resize', chart.resize);

let currentEvents = []; // 🟢 global event saqlovchi

// ===== Click handler: Category → show regions modal =====
chart.off('click');
chart.on('click', function (params) {
  const category = params.name;

  const regionsObj = (eventsByCategoryAndRegion[category]) ? eventsByCategoryAndRegion[category] : {};
  const regionEntries = Object.keys(regionsObj).map(regionName => ({
    region: regionName,
    count: (regionsObj[regionName] || []).length
  })).sort((a, b) => b.count - a.count);

  let bodyHtml = '';
  if (regionEntries.length === 0) {
    bodyHtml = `<div class="alert alert-secondary">Ushbu kategoriya bo'yicha viloyatlarda tadbir topilmadi.</div>`;
  } else {
    bodyHtml = `<div class="mb-2"> Viloyatlar kesimidagi <strong>${category}</strong></div>`;
    bodyHtml += `<div class="list-group">`;
    regionEntries.forEach(e => {
      bodyHtml += `
        <button type="button" class="list-group-item list-group-item-action d-flex justify-content-between align-items-center region-item"
                data-category="${escapeHtml(category)}" data-region="${escapeHtml(e.region)}">
          <span>${escapeHtml(e.region)}</span>
          <span class="badge bg-primary rounded-pill">${e.count}</span>
        </button>
      `;
    });
    bodyHtml += `</div>`;
  }

  $("#eventTypeModalLabel").text(`"${category}" — viloyatlar kesimi`);
  $("#eventTypeModalBody").html(bodyHtml);
  const eventTypeModal = new bootstrap.Modal(document.getElementById('eventTypeModal'));
  eventTypeModal.show();
});

// ===== Click: region-item → 2-modal (batafsil tadbirlar) =====
$(document).on('click', '#eventTypeModalBody .region-item', function () {
  const category = $(this).data('category');
  const region = $(this).data('region');
  currentEvents = ((eventsByCategoryAndRegion[category] || {})[region]) || [];

  let html = `
    <div class="row">
      <div class="col-md-2">
        <div class="list-group" id="eventList">
  `;

  if (currentEvents.length === 0) {
    html += `<div class="alert alert-secondary">Bu viloyat uchun tadbirlar ro'yxati bo'sh.</div>`;
  } else {
    currentEvents.forEach((ev, i) => {
      html += `
        <button type="button"
          class="list-group-item list-group-item-action ${i === 0 ? 'active' : ''}"
          data-evindex="${i}">
          ${escapeHtml(ev.title)}
        </button>
      `;
    });
  }

  html += `
        </div>
      </div>
      <div class="col-md-10" id="eventDetail">
  `;

  if (currentEvents.length > 0) {
    const ev = currentEvents[0];
    html += `
       <div class="">
           <div class="space-main-modal-box">
        <div class="row">
            <div class="col-6">
               <div class="space-main-head">
                     <h4>${escapeHtml(ev.place)}</h4>
               </div>
                <div class="space-main-body-umumu">
                  <div class="space-main-body-img">
                    <img src="./templates/hr/img/bozor-tayyor.png" alt="">
                  </div>
                  <div class="row">
                      <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-4.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-5.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-6.mp4" type="video/mp4">
                          </video>
                      </div>
                  </div>
               </div>
            </div>
            <div class="col-3">
               <div class="space-main-head">
                     <h4>Hudud haqida ma'lumotlar</h4>
               </div>
                 <div class="space-main-body-password">
                     <ul>
                         <li>
                          <img src="https://i.ytimg.com/vi/bpA1FDdZcgU/maxresdefault.jpg" alt="" style="height:300px; width:100%; object-fit:cover;">
                        </li>
                                             <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"   width="18" height="18" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                            <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                          </svg></span> Manzili: </h6>
                                                      <p>${escapeHtml(ev.place)}</p>
                                                                      </li>
                                            
                                                                      
                                                    <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span>Hudud administrator tel raqami: </h6>
                                                      <p>+998 90 123-45-67 +998 91 123-45-67</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                            <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                          </svg></span>Maydoni: </h6>
                                                      <p>4046.86 m²</p>
                                                                    </li>
                                                                      <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                            <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                          </svg></span>Kameralar soni: </h6>
                                                      <p>50 ta</p>
                                                                    </li>
                                                                    <li> 
                                                                        <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                          <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
                          <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
                        </svg></span>Kirish chiqish eshiklar soni: </h6>
                                                                        <p>4 ta</p>
                                                                    </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                          </svg></span>Hudud rahbari: </h6>
                                                      <p>Berdiyev Muzaffar +998 90 234-76-90</p>
                                                  </li>
                                                
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span> Hamkor tashkilotlar aloqa: </h6>
                                                      <p> IIV- +998 91 123-45-67 FVV- +998 97 851-12-23</p>
                                                  </li>
                                        
                     </ul>
               </div>
            </div>
            <div class="col-3">
                <div class="space-main-head">
                     <h4>MG tomonidan ajratilgan kuch vositalar</h4>
               </div>
                 <div class="space-main-body-duty">
                    <ul>
                     <li class="alert alert-dark" role="alert">MG javobgar:  <span>leytenant Umrzakov Javohir </span> </li>
                     <li class="alert alert-dark" role="alert">Qatnashadigan fuqarolarning taxminiy soni:  <span>300 nafar </span> </li>
                     <li class="alert alert-dark" role="alert">Tadbirning boshlanish va tugash vaqti:  <span>08:00 - 12:00 </span> </li>
                            <li class="alert alert-dark" role="alert">Jami shaxsiy tarkib:  <span>${escapeHtml(String(ev.participants || 'N/A'))} nafar</span> </li>
                            <li class="alert alert-dark" role="alert">MG harbiy xizmatchilari:  <span>2 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">IIV harbiy xizmatchilari:  <span>3 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">FVV harbiy xizmatchilari:  <span>4 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">MG MSGr:  <span>4 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">IIV spring:  <span>3 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">Texnikalar:  <span>12 ta</span></li>       
                            <li class="alert alert-dark" role="alert">Aloqa vositalari:  <span>12 ta</span></li>       
                            <li class="alert alert-dark" role="alert">Metalodetektor:  <span>8 ta</span></li>       
                            <li class="alert alert-dark" role="alert">Tadbir o'tkazuvchi tashabbuskor:  <span>Alisher Navoiy nomidagi kinochilar uyi</span></li>       
                    </ul>
               </div>
            </div>
        </div>
    </div>
        
        </div>
    `;
  } else {
    html += `<div class="alert alert-secondary">Tadbir topilmadi.</div>`;
  }

  html += `
      </div>
    </div>
  `;

  $("#eventListModalLabel").text(`${region} — ${category}`);
  $("#eventListModalBody").html(html);
  const listModal = new bootstrap.Modal(document.getElementById('eventListModal'));
  listModal.show();
});

// 🟢 Chapdagi ro‘yxatdan bosilganda tafsilotni yangilash
$(document).on('click', '#eventList .list-group-item', function () {
  $('#eventList .list-group-item').removeClass('active');
  $(this).addClass('active');

  const index = $(this).data('evindex');
  const ev = currentEvents[index];

  $('#eventDetail').html(`
      <div class="">
           <div class="space-main-modal-box">
        <div class="row">
            <div class="col-6">
               <div class="space-main-head">
                     <h4>${escapeHtml(ev.place)}</h4>
               </div>
                <div class="space-main-body-umumu">
                  <div class="space-main-body-img">
                    <img src="./templates/hr/img/bozor-tayyor.png" alt="">
                  </div>
                  <div class="row">
                      <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-4.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-5.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-6.mp4" type="video/mp4">
                          </video>
                      </div>
                  </div>
               </div>
            </div>
            <div class="col-3">
               <div class="space-main-head">
                     <h4>Hudud haqida ma'lumotlar</h4>
               </div>
                 <div class="space-main-body-password">
                     <ul>
                         <li>
                          <img src="https://i.ytimg.com/vi/bpA1FDdZcgU/maxresdefault.jpg" alt="" style="height:300px; width:100%; object-fit:cover;">
                        </li>
                                             <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"   width="18" height="18" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                            <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                          </svg></span> Manzili: </h6>
                                                      <p>${escapeHtml(ev.place)}</p>
                                                                      </li>
                                            
                                                                      
                                                    <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span>Hudud administrator tel raqami: </h6>
                                                      <p>+998 90 123-45-67 +998 91 123-45-67</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                            <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                          </svg></span>Maydoni: </h6>
                                                      <p>4046.86 m²</p>
                                                                    </li>
                                                                      <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                            <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                          </svg></span>Kameralar soni: </h6>
                                                      <p>50 ta</p>
                                                                    </li>
                                                                    <li> 
                                                                        <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                          <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
                          <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
                        </svg></span>Kirish chiqish eshiklar soni: </h6>
                                                                        <p>4 ta</p>
                                                                    </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                          </svg></span>Hudud rahbari: </h6>
                                                      <p>Berdiyev Muzaffar +998 90 234-76-90</p>
                                                  </li>
                                                
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span> Hamkor tashkilotlar aloqa: </h6>
                                                      <p> IIV- +998 91 123-45-67 FVV- +998 97 851-12-23</p>
                                                  </li>
                                        
                     </ul>
               </div>
            </div>
            <div class="col-3">
                <div class="space-main-head">
                     <h4>MG tomonidan ajratilgan kuch vositalar</h4>
               </div>
                 <div class="space-main-body-duty">
                    <ul>
                     <li class="alert alert-dark" role="alert">MG javobgar:  <span>leytenant Umrzakov Javohir </span> </li>
                     <li class="alert alert-dark" role="alert">Qatnashadigan fuqarolarning taxminiy soni:  <span>300 nafar </span> </li>
                     <li class="alert alert-dark" role="alert">Tadbirning boshlanish va tugash vaqti:  <span>08:00 - 12:00 </span> </li>
                            <li class="alert alert-dark" role="alert">Jami shaxsiy tarkib:  <span>${escapeHtml(String(ev.participants || 'N/A'))} nafar</span> </li>
                            <li class="alert alert-dark" role="alert">MG harbiy xizmatchilari:  <span>2 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">IIV harbiy xizmatchilari:  <span>3 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">FVV harbiy xizmatchilari:  <span>4 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">MG MSGr:  <span>4 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">IIV spring:  <span>3 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">Texnikalar:  <span>12 ta</span></li>       
                            <li class="alert alert-dark" role="alert">Aloqa vositalari:  <span>12 ta</span></li>       
                            <li class="alert alert-dark" role="alert">Metalodetektor:  <span>8 ta</span></li>       
                            <li class="alert alert-dark" role="alert">Tadbir o'tkazuvchi tashabbuskor:  <span>Alisher Navoiy nomidagi kinochilar uyi</span></li>       
                    </ul>
               </div>
            </div>
        </div>
    </div>
        
        </div>
  `);
});

// ===== Kichik util: HTML escape =====
function escapeHtml(text) {
  if (!text && text !== 0) return '';
  return String(text)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}







}





























// 🔽 Filterni to‘ldirish
eventTypeFilters.forEach((item) => {
  $("#public_events").append(
    `<option value="${item.id}">${item.name}</option>`
  );
});

// 🔁 Filter o‘zgarsa chartni yangilash
$("#public_events").change(function () {
  const id = $(this).val();
  const selected = eventTypeChartDataByFilter[id] || eventTypeChartDataByFilter[0];
  const total = selected.data.reduce((sum, v) => sum + v, 0);
  renderEventTypeChart(selected, total);
});

// 🚀 Boshlang‘ich yuklash
const initialData = eventTypeChartDataByFilter[0];
const totalInitial = initialData.data.reduce((sum, v) => sum + v, 0);
renderEventTypeChart(initialData, totalInitial);





    







      /* qo'shimcha kiritgan joyim */
     // 🎯 Ma’lumotlar
const chartDataByFilter2 = {
  0: {
    legend: [
      "O‘quv-jangovar",
      "Tarbiyaviy",
      "Nazorat va inspektsion",
      "Texnik va xo‘jalik",
      "Ta’lim va kasbiy tayyorgarlik",
      "Sport va jismoniy tayyorgarlik"
    ],
    data: [108, 92, 69, 89, 46, 27]
  },
  2: {
    legend: [
      "O‘quv-jangovar",
      "Tarbiyaviy",
      "Nazorat va inspektsion",
      "Texnik va xo‘jalik",
      "Ta’lim va kasbiy tayyorgarlik",
      "Sport va jismoniy tayyorgarlik"
    ],
    data: [40, 30, 22, 25, 18, 10]
  },
  3: {
    legend: [
      "O‘quv-jangovar",
      "Tarbiyaviy",
      "Nazorat va inspektsion",
      "Texnik va xo‘jalik",
      "Ta’lim va kasbiy tayyorgarlik",
      "Sport va jismoniy tayyorgarlik"
    ],
    data: [200, 160, 120, 150, 90, 60]
  }
};

// 🧾 Tafsilotlar (modal uchun)
const eventDetails3 = {
  "O‘quv-jangovar": [
    "Otish mashg‘ulotlari - 12",
    "Taktik mashg‘ulotlar - 34",
    "Texnik mashqlar - 14",
    "Muhandislik va sapyor tayyorgarligi - 9",
    "Tibbiy mashg‘ulotlar - 6",
    "Jismoniy va psixologik tayyorgarlik - 4",
    "Aloqa va radiotexnik tayyorgarlik mashg‘ulotlari - 13",
    "Jangovar tayyorgarlik bo‘yicha yig‘ilishlar va nazorat mashg‘ulotlari - 20"
  ],
  "Tarbiyaviy": [
    "Vatanparvarlik va ma’naviy mashg‘ulotlar - 12",
    "Tantanali saf tortish marosimlari - 15",
    "Ochiq eshiklar kuni - 20",
    "Madaniy-ommaviy tadbirlar - 21",
    "Ma’naviy-psixologik tayyorgarlik mashg‘ulotlari - 24"
  ],
  "Nazorat va inspektsion": [
    "Jangovar va xizmatga tayyorgarlik tekshiruvlari - 14",
    "Qo‘mondonlik yoki boshqaruv tomonidan inspektorlik tekshiruvi - 17",
    "Eng yaxshi bo‘linma (harbiy qism) tanlovi - 19",
    "Qurol, texnika va o‘q-dorilar hisobini tekshirish - 19"
  ],
  "Texnik va xo‘jalik": [
    "Texnika va qurollarga texnik xizmat ko‘rsatish va ta’mirlash - 21",
    "Parklar, kazarmalar va omborlarda tartib o‘rnatish - 24",
    "Mulkni inventarizatsiya qilish - 25",
    "Hududni obodonlashtirish, xo‘jalik ishlari - 19"
  ],
  "Ta’lim va kasbiy tayyorgarlik": [
    "Ofitser va praporshchiklar uchun malaka oshirish kurslari - 24",
    "Yangi qurol va texnikani o‘rganish bo‘yicha mashg‘ulotlar - 10",
    "Qo‘mondonlik tarkibi uchun seminar va uslubiy yig‘ilishlar - 9",
    "Hududlar o‘rtasida tajriba almashish - 3"
  ],
  "Sport va jismoniy tayyorgarlik": [
    "Jismoniy tayyorgarlik normativlarini topshirish - 1",
    "Bo‘linmalar o‘rtasida musobaqalar - 10",
    "Harbiy-sport bayramlari - 8",
    "GTO standartlariga tayyorgarlik - 8"
  ]
};

// 🔽 Filter ro‘yxat
const filters2 = [
  { id: 0, name: "Hammasi" },
  { id: 2, name: "Oy" },
  { id: 3, name: "Yil" }
];

// 🎨 Ranglar
const colorSet2 = ["#FF6B6B", "#4ECDC4", "#FFD93D", "#C77DFF", "#6BCB77", "#4D96FF"];

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
      textStyle: { color: "#555", fontSize: "1rem" }
    },
    tooltip: { backgroundColor: "white" },
    series: [
      {
        type: "pie",
         radius: ['20%', '50%'],
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
          textStyle: { fontSize: 15, fontWeight: "bold", color: "#777" }
        },
        labelLine: { show: true, length: 20 },
        data: sdata.map((item, index) => ({
          value: item.value,
          name: item.name,
          itemStyle: {
            color: colorSet2[index % colorSet2.length],
            shadowColor: colorSet2[index % colorSet2.length],
            shadowBlur: 12
          }
        }))
      }
    ]
  };

  chart.setOption(option);
  window.addEventListener("resize", chart.resize);

  // Modalni ochish
  chart.off("click");
  chart.on("click", function (params) {
    const category = params.name;
    const details = eventDetails3[category] || ["Ma’lumot topilmadi"];
    $("#eventTypeModalLabel1").text(category);
    $("#eventTypeModalBody1").html(
      `<ul class="list-group">${details.map(d => `<li class="list-group-item">${d}</li>`).join("")}</ul>`
    );
    $("#eventTypeModal1").modal("show");
  });
}

// 🧭 SELECTni to‘ldirish
filters2.forEach(item => {
  $("#public_events1").append(`<option value="${item.id}">${item.name}</option>`);
});

// 🔁 SELECT o‘zgarsa chartni yangilash
$("#public_events1").change(function () {
  const id = $(this).val();
  const selected = chartDataByFilter2[id] || chartDataByFilter2[0];
  const total = selected.data.reduce((a, b) => a + b, 0);
  renderIdoraviyChart(selected, total);
});

// 🚀 Dastlab yuklash
const initialData2 = chartDataByFilter2[0];
const totalInitial2 = initialData2.data.reduce((a, b) => a + b, 0);
renderIdoraviyChart(initialData2, totalInitial2);




    // JTSB chart uchun funksiya Boshlang‘ich
// 📊 Har bir viloyat uchun chart ma'lumotlari
const chartDataByFilter = {
  0: { legend: ["Bozorlar", "Parklar", "Xiyobonlar", "Boshqa joylar"], data: [12, 20, 34, 45] },
  1: { legend: ["Bozorlar", "Parklar", "Xiyobonlar", "Boshqa joylar"], data: [2,4, 4, 3] },
  2: { legend: ["Bozorlar", "Parklar", "Xiyobonlar", "Boshqa joylar"], data: [5,6, 4, 7] },
  3: { legend: ["Bozorlar", "Parklar", "Xiyobonlar", "Boshqa joylar"], data: [6,4, 3, 5] },
  4: { legend: ["Bozorlar", "Parklar", "Xiyobonlar", "Boshqa joylar"], data: [3,6, 5, 4] }
};

// 📍 Viloyatlar ro‘yxati
const publicFilters = [
  { id: 0, name: "Hammasi" },
  { id: 1, name: "Andijon" },
  { id: 2, name: "Toshkent" },
  { id: 3, name: "Sirdaryo" },
  { id: 4, name: "Jizzax" },
];

// 🧭 Select to‘ldirish
publicFilters.forEach((item) => {
  $('#event_count').append(`<option value="${item.id}">${item.name}</option>`);
});

// 🧱 Har bir viloyat uchun joylar ro‘yxati
const categoryPlacesByRegion = {
  1: {
    "Bozorlar": ["Andijon markaziy bozori", "Jahon savdo kompleksi"],
    "Parklar": ["Navro‘z bog‘i", "Bolalar bog‘i"],
    "Xiyobonlar": ["Bobur xiyoboni", "Guliston xiyoboni"],
    "Boshqa joylar":["Yaxudiylar xiyoboni", "Yaxudiylar qabristoni"]
  },
  2: {
    "Bozorlar": ["Toshkent bozori 1", "Toshkent bozori 2"],
    "Parklar": ["Ekopark", "Lokomotiv bog‘i"],
    "Xiyobonlar": ["Mustaqillik xiyoboni", "Amir Temur xiyoboni"],
    "Boshqa joylar":["Yaxudiylar xiyoboni", "Yaxudiylar uyi"]
  },
  3: {
    "Bozorlar": ["Sirdaryo bozori 1"],
    "Parklar": ["Sirdaryo parki"],
    "Xiyobonlar": ["Sirdaryo xiyoboni"],
    "Boshqa joylar":["Yaxudiylar xiyoboni", "Yaxudiylar uyi"]
  },
  4: {
    "Bozorlar": ["Jizzax bozori 1", "Jizzax bozori 2"],
    "Parklar": ["Jizzax parki 1"],
    "Xiyobonlar": ["Jizzax xiyoboni"],
    "Boshqa joylar":["Yaxudiylar xiyoboni", "Yaxudiylar uyi"]
  }
};

// 📈 Yuqoridagi chartni chizish
// ✅ Yuqoridagi chart (dumaloq diagramma)
function all_events_by_type(data, total, regionId = 0) {
  const dom = document.getElementById('all_events_by_type');
  const myChart = echarts.init(dom);
  const colors = ['#FF6F61', '#6B5B95', '#88B04B', '#FFA07A', '#9370DB', '#9ACD32'];

  const option = {
    color: colors,
    textStyle: { fontFamily: "Arial, sans-serif" },
    title: {
      text: total,
      left: 'center',
      top: '47%',
      textStyle: { fontSize: 18, fontWeight: 'bold', color: '#444' },
    },
    legend: {
      top: 'bottom',
      left: 'center',
      textStyle: { color: '#555', fontSize: '1rem' }
    },
    tooltip: { backgroundColor: 'white' },
    series: [{
    type: 'pie',
    radius: ['30%', '70%'],    // radiusni kattalashtirdik
    center: ['50%', '50%'], 
      label: { show: true, formatter: '{c}', fontSize: 15, color: '#777' },
      itemStyle: { borderRadius: 10, shadowColor: 'rgba(0,0,0,0.3)', shadowBlur: 15 },
      data: data.legend.map((name, i) => ({ name, value: data.data[i] }))
    }]
  };

  myChart.setOption(option);
  window.addEventListener('resize', myChart.resize);

  // ⚡ Avvalgi click eventni olib tashlaymiz
  myChart.off('click');

  // ⚡ Chart bosilganda modal ochiladi
  myChart.on('click', function(params) {
    const categoryName = params.name;
    const selectedRegionId = parseInt($('#event_count').val()) || regionId;
    const places = categoryPlacesByRegion[selectedRegionId]?.[categoryName] || [];

    if (places.length === 0) return;

    const regionName = publicFilters.find(f => f.id === selectedRegionId)?.name || "Hudud";
    $('#chartModalLabel').text(`${regionName} bo'yicha : ${categoryName}`);

    // joylar ro'yxati
    let listHtml = `<ul class="place-list">`;
    places.forEach((p, i) => listHtml += `<li class="${i === 0 ? 'active' : ''}">${p}</li>`);
    listHtml += `</ul>`;
    $('#chartModalList').html(listHtml);

    // modal kontent
    $('#chartModalDetail').html(`
      <div class="">
           <div class="space-main-modal-box">
        <div class="row">
            <div class="col-6">
               <div class="space-main-head">
                     <h4>${places[0]}</h4>
               </div>
                <div class="space-main-body-umumu">
                  <div class="space-main-body-img">
                    <img src="./templates/hr/img/bozor-tayyor.png" alt="">
                  </div>
                  <div class="row">
                      <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-4.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-5.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-6.mp4" type="video/mp4">
                          </video>
                      </div>
                  </div>
               </div>
            </div>
            <div class="col-3">
               <div class="space-main-head">
                     <h4>Pasport Ma'lumotlari</h4>
               </div>
                 <div class="space-main-body-password">
                     <ul>
                         <li>
                          <img src="https://avatars.mds.yandex.net/get-altay/11203687/2a00000191df4ae274c345831af6ac067645/orig" alt="" style="height:400px; width:100%; object-fit:cover;">
                        </li>
                                             <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"   width="18" height="18" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                            <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                          </svg></span> Manzili: </h6>
                                                      <p>Oʻzbekiston, Toshkent shahri, Nayman koʻchasi, 69</p>
                                                                      </li>
                                                                         <li>
                                    <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dice-1" viewBox="0 0 16 16">
                                    <circle cx="8" cy="8" r="1.5"/>
                                    <path d="M13 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zM3 0a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V3a3 3 0 0 0-3-3z"/>
                                  </svg></span> Hudud joylashgan mahalla: </h6>
                                                      <p>Rohat mahallasi</p>
                                                                      </li>
                                                                        <li>
                                                                          <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shop-window" viewBox="0 0 16 16">
                            <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5m2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5"/>
                          </svg></span> Savdo obyektlar soni: </h6>
                                                                          <p>70 ta</p>
                                                                      </li>
                                                    <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span>Administrator telefon raqami: </h6>
                                                      <p>+998 90 123-45-67 +998 91 123-45-67</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                            <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                          </svg></span>Maydoni: </h6>
                                                      <p>4046.86 m²</p>
                                                                    </li>
                                                                    <li> 
                                                                        <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                          <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
                          <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
                        </svg></span>Kirish chiqish eshiklar soni: </h6>
                                                                        <p>4 ta</p>
                                                                    </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                          </svg></span>Bozor rahbari: </h6>
                                                      <p>Berdiyev Muzaffar +998 90 234-76-90</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                          </svg></span>Bozor uchastkavoyi: </h6>
                                                      <p>Toshev Jasurbek +998 91 233-76-96</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span> Hamkor tashkilotlar aloqa: </h6>
                                                      <p> IIV- +998 91 123-45-67 FVV- +998 97 851-12-23</p>
                                                  </li>
                                        
                     </ul>
               </div>
            </div>
            <div class="col-3">
                <div class="space-main-head">
                     <h4>MG tomonidan ajratilgan kuch vositalar</h4>
               </div>
                 <div class="space-main-body-duty">
                    <ul>
                     <li class="alert alert-dark" role="alert">MG javobgar:  <span>leytenant Umrzakov Javohir </span> </li>
                            <li class="alert alert-dark" role="alert">Jami shaxsiy tarkib:  <span>20 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">Piyoda patrullar:  <span>12 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">Avto patrullar:  <span>8 nafar</span>  </li>
                            <li class="alert alert-dark" role="alert">Yo'nalishlar:  <span>4 ta</span>   </li>
                              <li class="alert alert-dark" role="alert">Sektorlar soni:  <span>4 ta</span>   </li>
                            <li class="alert alert-dark" role="alert">Kameralar soni:  <span>12 ta</span>   </li>
                            <li class="alert alert-dark" role="alert">Tashvish tugmalar soni:  <span>4 ta</span>   </li>
                            <li class="alert alert-dark" role="alert">Xizmat hayvonlari:  <span>8 ta</span>  </li>
                            <li class="alert alert-dark" role="alert">Maxsus vositalar soni:  <span>12 ta</span>  </li>
                            <li class="alert alert-dark" role="alert">Texnikalar:  <span>12 ta</span></li>       
                    </ul>
               </div>
            </div>
        </div>
    </div>
        
        </div>

    `);

    $('#chartModal').modal('show');

    // joy bosilganda nomi yangilansin
    $('.place-list li').on('click', function() {
      $('.place-list li').removeClass('active');
      $(this).addClass('active');
     const placeName = $(this).text(); // tanlangan joy nomi
const otherTexts = ["Passport Ma'lumotlari", "MG tomonidan ajratilgan kuch vositalar"]; // qolgan ikkita matn

$('#chartModalDetail .space-main-head h4').each(function(index) {
  if (index === 0) {
    $(this).text(placeName); // birinchisiga joy nomi
  } else {
    $(this).text(otherTexts[index - 1]); // qolganlariga boshqa textlar
  }
});
    });
  });
}


// 📊 Pastdagi diagramma (faqat "Hammasi" uchun)
function get_events_by_region(data, containerId = 'get_events_by_region') {
  const dom = document.getElementById(containerId);
  if (!dom) return console.error('❌ Diagramma konteyner topilmadi:', containerId);

  const myChart = echarts.init(dom);
  const colors = ['#1E3A8A', '#9333EA', '#DC2626', '#065F46', '#B45309', '#0E7490', '#4B5563'];

  const option = {
    textStyle: { fontFamily: "Arial, sans-serif" },
    xAxis: {
      type: 'category',
      data: data.map(item => item.name),
      axisLabel: { interval: 0, fontSize: '1rem', rotate: 45, color: '#333' },
      axisLine: { show: false }, splitLine: { show: false }
    },
    grid: { bottom: 110, right: 30, left: 100 },
    yAxis: { type: 'value', axisLabel: { color: '#333' }, axisLine: { show: false }, splitLine: { show: false } },
    tooltip: { backgroundColor: 'white' },
    series: [{
      data: data.map(item => parseInt(item.gcount)),
      type: 'bar',
      barMaxWidth: 60,
      itemStyle: { color: (p) => colors[p.dataIndex % colors.length], borderRadius: [8, 8, 0, 0] },
      label: { fontSize: 16, show: true, position: 'top', color: '#555' }
    }]
  };

  myChart.setOption(option);
  window.addEventListener('resize', myChart.resize);
}

// 🔄 Select o‘zgarganda
// 🔄 Select o‘zgarganda yuqoridagi chart + pastdagi qismni yangilash
$('#event_count').on('change', function() {
  const id = parseInt($(this).val());
  const regionBoxes = $('#get_events_by_region');

  // avval konteynerni tozalaymiz
  regionBoxes.empty();

  // 🔹 Har doim yuqoridagi chartni yangilaymiz
  const data = chartDataByFilter[id];
  const totalValue = data.data.reduce((a, b) => a + b, 0);
  all_events_by_type(data, totalValue, id); // yuqoridagi pie chartni yangilash

  // 🔹 "Hammasi" tanlanganda pastdagi diagramma qayta chiziladi
  if (id === 0) {
    // containerni to‘liq qayta yaratamiz
    regionBoxes.html('<div id="get_events_by_region_chart" style="width:100%; height:400px;"></div>');

    // get_events_by_region chaqirish uchun konteyner id ni moslab o‘zgartiramiz
    const dom = document.getElementById('get_events_by_region_chart');
    const myChart = echarts.init(dom);
    const colors = ['#1E3A8A', '#9333EA', '#DC2626', '#065F46', '#B45309', '#0E7490', '#4B5563'];

    let option = {
      textStyle: { fontFamily: "Arial, sans-serif" },
      xAxis: {
        type: 'category',
        data: regionData5.map(item => item.name),
        axisLabel: { interval: 0, fontSize: '1rem', rotate: 45, color: '#333' },
        axisLine: { show: false }, splitLine: { show: false }
      },
      grid: { bottom: 110, right: 30, left: 100 },
      yAxis: { type: 'value', axisLabel: { color: '#333' }, axisLine: { show: false }, splitLine: { show: false } },
      tooltip: { backgroundColor: 'white' },
      series: [{
        data: regionData5.map(item => parseInt(item.gcount)),
        type: 'bar',
        barMaxWidth: 60,
        itemStyle: { color: (p) => colors[p.dataIndex % colors.length], borderRadius: [8, 8, 0, 0] },
        label: { fontSize: 16, show: true, position: 'top', color: '#555' }
      }]
    };

    myChart.setOption(option);
    window.addEventListener('resize', myChart.resize);

  } else {
    // ✅ Viloyat tanlanganda – uchta kategoriya chiqadi
    const cats = data.legend;
    const placesByCat = categoryPlacesByRegion[id] || {};

    cats.forEach(cat => {
      const places = placesByCat[cat] || [];
      let listHtml = '<ul class="place-list scrollable">';
      places.forEach(p => listHtml += `<li class="category-item" data-cat="${cat}" data-place="${p}">${p}</li>`);
      listHtml += '</ul>';

      regionBoxes.append(`
        <div class="col-3">
          <div class="region-box">
           <h5 class="mb-2 text-center text-primary">${cat}</h5>
             ${listHtml}
          </div>
        </div>
      `);
    });
  }
});

// 🧩 Har bir joy bosilganda — modal ochiladi
$(document).on('click', '.category-item', function() {
  const placeName = $(this).text();
  const regionId = parseInt($('#event_count').val());
  const cat = $(this).closest('.region-box').find('h5').text();

  $('#chartModalLabel').text(`${publicFilters.find(f => f.id === regionId)?.name || 'Hudud'} bo'yicha : ${cat}`);
  $('#chartModalList').html(`
    <ul class="place-list">
      <li class="active">${placeName}</li>
    </ul>
  `);

  $('#chartModalDetail').html(`
   <div class="">
           <div class="space-main-modal-box">
        <div class="row">
            <div class="col-6">
               <div class="space-main-head">
                     <h4>${placeName}</h4>
               </div>
                <div class="space-main-body-umumu">
                  <div class="space-main-body-img">
                    <img src="./templates/hr/img/bozor-tayyor.png" alt="">
                  </div>
                  <div class="row">
                      <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-4.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-5.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop muted>
                              <source src="/templates/hr/videos/video-6.mp4" type="video/mp4">
                          </video>
                      </div>
                  </div>
               </div>
            </div>
            <div class="col-3">
               <div class="space-main-head">
                     <h4>Pasport Ma'lumotlari</h4>
               </div>
                 <div class="space-main-body-password">
                     <ul>
                         <li>
                          <img src="https://avatars.mds.yandex.net/get-altay/11203687/2a00000191df4ae274c345831af6ac067645/orig" alt="" style="height:400px; width:100%; object-fit:cover;">
                        </li>
                                            <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"   width="18" height="18" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                            <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10"/>
                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
                          </svg></span> Manzili: </h6>
                                                      <p>Oʻzbekiston, Toshkent shahri, Nayman koʻchasi, 69</p>
                                                                      </li>
                                                                         <li>
                                    <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dice-1" viewBox="0 0 16 16">
                                    <circle cx="8" cy="8" r="1.5"/>
                                    <path d="M13 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zM3 0a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V3a3 3 0 0 0-3-3z"/>
                                  </svg></span> Hudud joylashgan mahalla: </h6>
                                                      <p>Rohat mahallasi</p>
                                                                      </li>
                                                                        <li>
                                                                          <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-shop-window" viewBox="0 0 16 16">
                            <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5m2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5"/>
                          </svg></span> Savdo obyektlar soni: </h6>
                                                                          <p>70 ta</p>
                                                                      </li>
                                                    <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span>Administrator telefon raqami: </h6>
                                                      <p>+998 90 123-45-67 +998 91 123-45-67</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                            <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                          </svg></span>Maydoni: </h6>
                                                      <p>4046.86 m²</p>
                                                                    </li>
                                                                    <li> 
                                                                        <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                          <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
                          <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
                        </svg></span>Kirish chiqish eshiklar soni: </h6>
                                                                        <p>4 ta</p>
                                                                    </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                          </svg></span>Bozor rahbari: </h6>
                                                      <p>Berdiyev Muzaffar +998 90 234-76-90</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                          </svg></span>Bozor uchastkavoyi: </h6>
                                                      <p>Toshev Jasurbek +998 91 233-76-96</p>
                                                  </li>
                                                  <li>
                                                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                          </svg></span> Hamkor tashkilotlar aloqa: </h6>
                                                      <p> IIV- +998 91 123-45-67 FVV- +998 97 851-12-23</p>
                                                  </li>
                                        
                     </ul>
               </div>
            </div>
            <div class="col-3">
                <div class="space-main-head">
                     <h4>MG tomonidan ajratilgan kuch vositalar</h4>
               </div>
                 <div class="space-main-body-duty">
                    <ul>
                       <li class="alert alert-dark" role="alert">MG javobgar:  <span>leytenant Umrzakov Javohir </span> </li>
                            <li class="alert alert-dark" role="alert">Jami shaxsiy tarkib:  <span>20 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">Piyoda patrullar:  <span>12 nafar</span> </li>
                            <li class="alert alert-dark" role="alert">Avto patrullar:  <span>8 nafar</span>  </li>
                            <li class="alert alert-dark" role="alert">Yo'nalishlar:  <span>4 ta</span>   </li>
                              <li class="alert alert-dark" role="alert">Sektorlar soni:  <span>4 ta</span>   </li>
                            <li class="alert alert-dark" role="alert">Kameralar soni:  <span>12 ta</span>   </li>
                            <li class="alert alert-dark" role="alert">Tashvish tugmalar soni:  <span>4 ta</span>   </li>
                            <li class="alert alert-dark" role="alert">Xizmat hayvonlari:  <span>8 ta</span>  </li>
                            <li class="alert alert-dark" role="alert">Maxsus vositalar soni:  <span>12 ta</span>  </li>
                            <li class="alert alert-dark" role="alert">Texnikalar:  <span>12 ta</span></li>          
                    </ul>
               </div>
            </div>
        </div>
    </div>
        
        </div>

  `);
  $('#chartModal').modal('show');
});

// 🔧 Dastlabki diagramma va chartlar
const regionData5 = [
  { name: "Toshkent", gcount: 10 },
  { name: "Andijon", gcount: 11 },
  { name: "Sirdaryo", gcount: 6 },
  { name: "Jizzax", gcount: 7 },
];

get_events_by_region(regionData5);
const defaultData4 = chartDataByFilter[0];
const totalValue4 = defaultData4.data.reduce((a, b) => a + b, 0);
all_events_by_type(defaultData4, totalValue4, 0);



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