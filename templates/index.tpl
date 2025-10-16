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
  background-color: #ecf0f1;
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
<div class="modal fade" id="eventTypeModal" tabindex="-1" aria-labelledby="eventTypeModalLabel" aria-hidden="true">
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
      "Ochiq jamoat hududlari",
      "Madaniy",
      "Sport",
      "Diniy",
      "Ta’lim",
      "Savdoyarmarka",
      "Ma’muriy va siyosiy",
    ],
    data: [79, 107, 121, 60, 85, 43, 37],
  },
  1: {
    legend: [
      "Ochiq jamoat hududlari",
      "Madaniy",
      "Sport",
      "Diniy",
      "Ta’lim",
      "Savdoyarmarka",
      "Ma’muriy va siyosiy",
    ],
    data: [20, 30, 40, 15, 25, 10, 5],
  },
  2: {
    legend: [
      "Ochiq jamoat hududlari",
      "Madaniy",
      "Sport",
      "Diniy",
      "Ta’lim",
      "Savdoyarmarka",
      "Ma’muriy va siyosiy",
    ],
    data: [40, 60, 70, 35, 50, 25, 15],
  },
  3: {
    legend: [
      "Ochiq jamoat hududlari",
      "Madaniy",
      "Sport",
      "Diniy",
      "Ta’lim",
      "Savdoyarmarka",
      "Ma’muriy va siyosiy",
    ],
    data: [100, 150, 200, 90, 120, 60, 50],
  },
};

// 🧾 Modal ma’lumotlari
const eventDetails2 = {
  "Ochiq jamoat hududlari": [
    "Maydonlar - 12",
    "Bog‘lar, xiyobonlar, bulvarlar, sohilbo‘yi hududlari - 32",
    "Dam olish zonalari va plyajlar - 23",
    "Savdo markazlari va bozorlar atrofi - 12",
  ],
  "Madaniy": [
    "Madaniyat saroylari, teatrlar, konsert zallari - 34",
    "Kinoteatrlar, ko‘rgazma markazlari - 45",
    "Sirklar, hayvonot bog‘lari, muzeylar - 12",
    "Attraksionlar parklari va ko‘ngilochar zonalar - 16",
  ],
  "Sport": [
    "Stadionlar, sport majmualari, arenalar - 45",
    "Muz maydonlari, basseynlar, muz saroylari - 23",
    "Avtodromlar, motodromlar, otishmaydonlar - 25",
    "Ko‘cha sport maydonchalari va fan-zonalar - 28",
  ],
  "Diniy": [
    "Masjidlar, cherkovlar, monastirlar, ibodatxonalar - 14",
    "Ularning atrofidagi jamoat joylari - 26",
    "Diniy yurishlar, ibodat marosimlari o‘tkaziladigan joylar - 20",
  ],
  "Ta’lim": [
    "Maktablar, universitetlar, kollejlar, oromgohlar - 36",
    "Ta’lim muassasalari hovlilari, sport maydonchalari - 30",
    "Yoshlar markazlari va volontyorlar maskanlari - 19",
  ],
  "Savdoyarmarka": [
    "Bozorlar, savdo komplekslari, yarmarka maydonlari - 10",
    "Qishloq xo‘jaligi ko‘rgazmalari va savdo pavilyonlari - 14",
    "Savdo-ko‘ngilochar markazlar - 19",
  ],
  "Ma’muriy va siyosiy": [
    "Hokimlik binolari oldidagi maydonlar - 16",
    "Konferens-zallar, kongress markazlar - 13",
    "Diplomatik vakolatxonalar atrofi - 8",
  ],
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

  // resize handler
  window.addEventListener('resize', chart.resize);

  // modal event (oldingi modal id va body ga mos ravishda)
  chart.off('click');
  chart.on('click', function (params) {
    const category = params.name;
    const details = (typeof eventDetails2 !== 'undefined' && eventDetails2[category]) ? eventDetails2[category] : ["Ma’lumot topilmadi"];
    $("#eventTypeModalLabel").text(category);
    $("#eventTypeModalBody").html(
      `<ul class="list-group">${details.map(d => `<li class="list-group-item">${d}</li>`).join('')}</ul>`
    );
    $("#eventTypeModal").modal("show");
  });
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
                    <img src="./templates/hr/img/rasm3.png" alt="">
                  </div>
                  <div class="row">
                      <div class="col-4">
                          <video width="100%" height="300" autoplay loop>
                              <source src="./templates/hr/videos/video-1.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop>
                              <source src="./templates/hr/videos/video-2.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop>
                              <source src="./templates/hr/videos/video-3.mp4" type="video/mp4">
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
                    </svg></span> Manzili</h6>
                                                <p>Oʻzbekiston, Andijon viloyati, Andijon shahri, Nayman koʻchasi, 69</p>
                                            </li>
                                              <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                      <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                    </svg></span>Administrator telefon raqami</h6>
                                                <p>+998 90 123-45-67 +998 91 123-45-67</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                      <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                    </svg></span>Maydoni</h6>
                                                <p>4046.86 m²</p>
                                            </li>
                                             <li> 
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-camera-video" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2zm11.5 5.175 3.5 1.556V4.269l-3.5 1.556zM2 4a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h7.5a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1z"/>
</svg></span>Kameralar soni</h6>
                                                <p>35 ta</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                      <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                    </svg></span>Bozor rahbari</h6>
                                                <p>Berdiyev Muzaffar +998 90 234-76-90</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                      <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                    </svg></span>Bozor uchastkavoyi</h6>
                                                <p>Toshev Jasurbek +998 91 233-76-96</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                      <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                    </svg></span> Hamkor tashkilotlar aloqa</h6>
                                                <p> IIV- +998 91 123-45-67 FVV- +998 97 851-12-23 MG- +99876 123-76-90</p>
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
                       <li class="alert alert-dark" role="alert">MG javobgar telefon nomer:  <span>+998 90 123-89-09</span> </li>
                       <li class="alert alert-dark" role="alert">Piyoda patrullar:  <span>12</span> </li>
                       <li class="alert alert-dark" role="alert">Tumaris:  <span>12</span>  </li>
                       <li class="alert alert-dark" role="alert">MPG:  <span>12</span>   </li>
                       <li class="alert alert-dark" role="alert">Mototsikl patrullar:  <span>12</span>   </li>
                       <li class="alert alert-dark" role="alert">Jangovar ekipaj:  <span>12</span>   </li>
                       <li class="alert alert-dark" role="alert">Otlik :  <span>12</span>  </li>
                       <li class="alert alert-dark" role="alert">It :  <span>12</span>  </li>
                       <li class="alert alert-dark" role="alert">Madat guruxi:  <span>12</span></li>
                       <li class="alert alert-dark" role="alert">Texnikalar:  <span>12</span></li>        
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
                    <img src="./templates/hr/img/rasm3.png" alt="">
                  </div>
                  <div class="row">
                      <div class="col-4">
                          <video width="100%" height="300" autoplay loop>
                              <source src="./templates/hr/videos/video-1.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop>
                              <source src="./templates/hr/videos/video-2.mp4" type="video/mp4">
                          </video>
                      </div>
                       <div class="col-4">
                          <video width="100%" height="300" autoplay loop>
                              <source src="./templates/hr/videos/video-3.mp4" type="video/mp4">
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
                    </svg></span> Manzili</h6>
                                                <p>Oʻzbekiston, Andijon viloyati, Andijon shahri, Nayman koʻchasi, 69</p>
                                            </li>
                                              <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                      <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                    </svg></span>Administrator telefon raqami</h6>
                                                <p>+998 90 123-45-67 +998 91 123-45-67</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-border-all" viewBox="0 0 16 16">
                      <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z"/>
                    </svg></span>Maydoni</h6>
                                                <p>4046.86 m²</p>
                                            </li>
                                             <li> 
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-camera-video" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2zm11.5 5.175 3.5 1.556V4.269l-3.5 1.556zM2 4a1 1 0 0 0-1 1v6a1 1 0 0 0 1 1h7.5a1 1 0 0 0 1-1V5a1 1 0 0 0-1-1z"/>
</svg></span>Kameralar soni</h6>
                                                <p>35 ta</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg"  width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                      <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                    </svg></span>Bozor rahbari</h6>
                                                <p>Berdiyev Muzaffar +998 90 234-76-90</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                      <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                    </svg></span>Bozor uchastkavoyi</h6>
                                                <p>Toshev Jasurbek +998 91 233-76-96</p>
                                            </li>
                                            <li>
                                                <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-telephone-forward" viewBox="0 0 16 16">
                      <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                    </svg></span> Hamkor tashkilotlar aloqa</h6>
                                                <p> IIV- +998 91 123-45-67 FVV- +998 97 851-12-23 MG- +99876 123-76-90</p>
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
                       <li class="alert alert-dark" role="alert">MG javobgar telefon nomer:  <span>+998 90 123-89-09</span> </li>
                       <li class="alert alert-dark" role="alert">Piyoda patrullar:  <span>12</span> </li>
                       <li class="alert alert-dark" role="alert">Tumaris:  <span>12</span>  </li>
                       <li class="alert alert-dark" role="alert">MPG:  <span>12</span>   </li>
                       <li class="alert alert-dark" role="alert">Mototsikl patrullar:  <span>12</span>   </li>
                       <li class="alert alert-dark" role="alert">Jangovar ekipaj:  <span>12</span>   </li>
                       <li class="alert alert-dark" role="alert">Otlik :  <span>12</span>  </li>
                       <li class="alert alert-dark" role="alert">It :  <span>12</span>  </li>
                       <li class="alert alert-dark" role="alert">Madat guruxi:  <span>12</span></li>
                       <li class="alert alert-dark" role="alert">Texnikalar:  <span>12</span></li>        
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