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


    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <div class="row">

        <div class="col-md-4 col-lg-4 mb-2">
            <div class="card">
                <div class="mx-3 my-2 row">
                    <div class="col-8">
                        <h5 class="card-title">Jamoat tartibini saqlash bo'yicha</h5>
                    </div>
                    <div class="col-4">
                        <select class="form-select" id="event_count"> </select>
                    </div>
                    <div class="chart-container" id="all_events_by_type"></div>
                </div>
            </div>
        </div>

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
                        <select class="form-select" id="get_events_by_region_filter"> </select>
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





     /*  funksiya o'zgartirgan joyim */

// 🧩 TEST MA’LUMOTLAR (faqat lokal uchun)
const eventTypeChartDataByFilter = {
    0: { // Hammasi
        legend: ["Madaniy tadbirlar", "Sport tadbirlari", "1-darajali tashrif tadbirlari", "2-darajali tashrif tadbirlari", "Boshqa tadbirlar"],
        data: [30, 20, 15, 10, 15]
    },
     1: { // Bugun
        legend: ["Madaniy tadbirlar", "Sport tadbirlari", "1-darajali tashrif tadbirlari", "2-darajali tashrif tadbirlari", "Boshqa tadbirlar"],
        data: [30, 20, 15, 10, 15]
    },
    2: { // Oy
      legend: ["Madaniy tadbirlar", "Sport tadbirlari", "1-darajali tashrif tadbirlari", "2-darajali tashrif tadbirlari", "Boshqa tadbirlar"],
        data: [120,300,200,320,190]
    },
    3: { // Yil
     legend: ["Madaniy tadbirlar", "Sport tadbirlari", "1-darajali tashrif tadbirlari", "2-darajali tashrif tadbirlari", "Boshqa tadbirlar"],
        data: [12000, 25000, 17000, 20000,]
    }
};

// 🔽 Filter uchun ro‘yxat
const eventTypeFilters = [
    { id: 0, name: "Hammasi" },
    { id: 1, name: "Bugun" },
    { id: 2, name: "Oy bo‘yicha" },
    { id: 3, name: "Yil bo‘yicha" }
];

// 📊 Asosiy funksiya (nom o‘zgarmaydi)
function get_events_by_type(data, total) {
    let sdata = data.legend.map((name, i) => ({
        value: data.data[i],
        name: name
    }));

    var dom = document.getElementById('get_events_by_type');
    var myChartType = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
    });

    // 🌈 Yorqin, ko‘kka yaqin ranglar palitrasi
let color = [
    '#005AE0', // Deep Blue
    '#00B8A9', // Teal
    '#F8D210', // Bright Yellow
    '#FA26A0', // Magenta
    '#2FF3E0', // Cyan
];
    let option = {
        textStyle: {
            fontFamily: "Arial, sans-serif"
        },
        color,
        title: {
            text: total,
            left: 'center',
            top: '30%',
            textStyle: {
                fontSize: 18,
                fontWeight: 'bold',
                color: default_color
            },
            subtextStyle: {
                fontSize: 13,
                color: '#999'
            }
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
            radius: ['20%', '50%'],
            center: ['50%', '35%'],
            avoidLabelOverlap: false,
            itemStyle: {
                borderRadius: 10,
                borderWidth: 2,
                shadowColor: 'rgba(0, 0, 0, 0.5)',
                shadowBlur: 20
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{c}',
                textStyle: {
                    fontSize: 16,
                    fontWeight: 'bold',
                    color: '#b7b7b7',
                },
            },
            labelLine: {
                show: true,
                length: 20,
            },
            data: sdata.map((item, index) => ({
                value: item.value,
                name: item.name,
                itemStyle: {
                    shadowColor: color[index],
                    shadowBlur: 10,
                    borderRadius: 10,
                    borderColor: color[index],
                },
            }))
        }]
    };

    myChartType.setOption(option);
    window.addEventListener('resize', myChartType.resize);
}

// 🔽 Select uchun variantlar
eventTypeFilters.forEach((item) => {
    $('#public_events').append(`<option value="${item.id}">${item.name}</option>`);
});

// 🔁 Select o‘zgarsa, chart yangilansin
$('#public_events').change(function () {
    let id = $(this).val();
    const selected = eventTypeChartDataByFilter[id] || eventTypeChartDataByFilter[0];
    const total = selected.data.reduce((sum, v) => sum + v, 0);
    get_events_by_type(selected, total);
});

// 🚀 Dastlab chartni yuklash
const initialEventTypeData = eventTypeChartDataByFilter[0];
const totalInitialEventType = initialEventTypeData.data.reduce((sum, v) => sum + v, 0);
get_events_by_type(initialEventTypeData, totalInitialEventType);









      /* qo'shimcha kiritgan joyim */
      
          // 🎨 Ranglar (boshqacha nom bilan)
let colorSet2 = [
    '#2563EB', // Deep Blue (asosiy brend rangi)
    '#0EA5E9', // Sky Blue (yorqin aksent)
    '#14B8A6', // Teal Green (balansli professional ohang)
    '#F59E0B', // Amber (ko'zga tashlanadigan muvozanat)
    '#EF4444', // Soft Red (highlight yoki ogohlantirish)
    '#8B5CF6', // Violet (premium aksent)
];


// 🧩 TEST MA’LUMOTLAR (bazadan kelmaydi)
const chartDataByFilter2 = {
    0: { // default
        legend: ["Paligonda", "O'quv jarayonida", "Xizmat safari", "Ta'tilda", "Shifoxonada", "Jangovor navbatchilikda", "Naryadda"],
        data: [12,34,25, 30, 18, 22, 27]
    },
    1: { // bugun
              legend: ["Paligonda", "O'quv jarayonida", "Xizmat safari", "Ta'tilda", "Shifoxonada", "Jangovor navbatchilikda", "Naryadda"],
        data: [5,9,3, 4, 2, 1, 2]
    },
    2: { // oy
                legend: ["Paligonda", "O'quv jarayonida", "Xizmat safari", "Ta'tilda", "Shifoxonada", "Jangovor navbatchilikda", "Naryadda"],
        data: [23,12,10, 14, 9, 12, 8]
    },
    3: { // yil
               legend: ["Paligonda", "O'quv jarayonida", "Xizmat safari", "Ta'tilda", "Shifoxonada", "Jangovor navbatchilikda", "Naryadda"],
        data: [90,140,120, 90, 70, 100, 80]
    }
};

// 🧾 SELECT uchun filterlar
const filters2 = [
    { id: 0, name: "Hammasi" },
    { id: 2, name: "Oy" },
    { id: 3, name: "Yil" }
];

// 🟢 Chart funksiyasi
function get_events_by_type1_local(data, total) {
    let sdata2 = [];
    data.data.forEach((i, k) => {
        sdata2.push({ value: i, name: data.legend[k] });
    });

    var dom2 = document.getElementById('get_events_by_type1');
    var chart2 = echarts.init(dom2, null, {
        renderer: 'canvas',
        useDirtyRect: false
    });

    var option2 = {
        textStyle: {
            fontFamily: "Arial, sans-serif"
        },
        color: colorSet2,
        title: {
            text: total,
            left: 'center',
            top: '32%',
            textStyle: {
                fontSize: 18,
                fontWeight: 'bold',
                color: '#333'
            },
        },
        legend: {
            top: 'bottom',
            orient: 'horizontal',
            left: 'center',
            itemGap: 10,
            textStyle: {
                color: '#444',
                fontSize: '1rem'
            }
        },
        tooltip: {
            backgroundColor: 'white',
        },
        series: [{
            type: 'pie',
            radius: ['25%', '55%'],
            center: ['50%', '40%'],
            avoidLabelOverlap: false,
            itemStyle: {
                borderRadius: 10,
                borderWidth: 2,
                borderColor: 'none',
                shadowColor: 'rgba(0, 0, 0, 0.5)',
                shadowBlur: 20
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{c}',
                textStyle: {
                    fontSize: 15,
                    fontWeight: 'bold',
                    color: '#777',
                },
            },
            minAngle: 15,
            labelLine: {
                show: true,
                length: 18,
            },
            data: sdata2.map((item, index) => ({
                value: item.value,
                name: item.name,
                itemStyle: {
                    borderColor: colorSet2[index],
                    shadowColor: colorSet2[index],
                    shadowBlur: 10,
                }
            }))
        }]
    };

    if (option2 && typeof option2 === 'object') {
        chart2.setOption(option2);
    }
    window.addEventListener('resize', chart2.resize);
}

// 🧭 SELECT to‘ldirish
filters2.forEach((item) => {
    $('#public_events1').append(`<option value="${item.id}">${item.name}</option>`);
});

// 🔄 SELECT o‘zgarganda chartni yangilash
$('#public_events1').change(function() {
    const id = $(this).val();
    const data = chartDataByFilter2[id];
    if (data) {
        const totalValue = data.data.reduce((sum, v) => sum + v, 0);
        get_events_by_type1_local(data, totalValue);
    }
});

// 🚀 Dastlabki chart (Hammasi)
const defaultData2 = chartDataByFilter2[0];
const totalValue2 = defaultData2.data.reduce((sum, v) => sum + v, 0);
get_events_by_type1_local(defaultData2, totalValue2);




      
      // Get so'rovlari uchun lokalniy funksiya all_events_by_type

// 📊 Grafik chizish funksiyasi
function all_events_by_type(data, total) {
    let sdata = [];
    data.data.forEach((i, k) => {
        sdata.push({ value: i, name: data.legend[k] })
    });

    var dom = document.getElementById('all_events_by_type');
    var myChart = echarts.init(dom, null, {
        renderer: 'canvas',
        useDirtyRect: false
    });

    let color = [
    '#FF6F61', '#6B5B95', '#88B04B', '#F7CAC9',
    '#92A8D1', '#955251', '#B565A7'
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
                borderWidth: 2,
                shadowColor: 'rgba(0,0,0,0.5)',
                shadowBlur: 20
            },
            label: {
                show: true,
                position: 'outside',
                formatter: '{c}',
                textStyle: { fontSize: 16, fontWeight: 'bold', color: '#888' }
            },
            labelLine: { show: true, length: 20 },
            data: sdata.map((item, index) => ({
                value: item.value,
                name: item.name,
                itemStyle: {
                    borderColor: color[index],
                    borderRadius: 10,
                    shadowColor: color[index],
                    shadowBlur: 10
                }
            }))
        }]
    };

    myChart.setOption(option);
    window.addEventListener('resize', myChart.resize);
}

// 🧩 TEST MA’LUMOTLAR
const chartDataByFilter = {
    0: { // default (hammasi)
        legend: ["Bozorlar", "Parklar", "Xiyobonlar"],
        data: [450, 270, 320]
    },
    1: { // bugun
        legend: ["Bozorlar", "Parklar", "Xiyobonlar"],
        data: [200, 170, 350]
    },
    2: { // oy
         legend: ["Bozorlar", "Parklar", "Xiyobonlar"],
        data: [1500, 3700, 2500]
    },
    3: { // yil
        legend: ["Bozorlar", "Parklar", "Xiyobonlar"],
        data: [10000, 25000, 17000]
    }
};

const publicFilters = [
    { id: 1, name: "Hammasi" },
    { id: 2, name: "Oy" },
    { id: 3, name: "Yil" }
];

publicFilters.forEach((item) => {
    $('#event_count').append(`<option value="${item.id}">${item.name}</option>`);
});

// 🔄 SELECT o‘zgarganda chartni yangilash
$('#event_count').change(function() {
    const id = $(this).val();
    const data = chartDataByFilter[id];
    if (data) {
        const totalValue = data.data.reduce((sum, v) => sum + v, 0);
        all_events_by_type(data, totalValue);
    }
});


$('#public_events').empty();
publicFilters.forEach((item) => {
    $('#public_events').append(`<option value="${item.id}">${item.name}</option>`);
});

// Boshlang‘ich chart
let defaultData = chartDataByFilter[0];
const totalValue = defaultData.data.reduce((sum, item) => sum + item, 0);
all_events_by_type(defaultData, totalValue);

// Filter o‘zgarsa
$('#public_events').change(function() {
    let id = $(this).val();
    let newData = chartDataByFilter[id];
    const totalValue = newData.data.reduce((sum, item) => sum + item, 0);
    all_events_by_type(newData, totalValue);
});




        function get_events_by_region(data) {
            var dom = document.getElementById('get_events_by_region');
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
            url: `${AJAXPHP}?act=get_events_by_region`,
            dataType: "json",
            encode: true,
            success: function(data) {
                get_events_by_region(data);
                const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount), 0);
                $("#get_events_by_region_total").html(`(${totalValue})`)
            }
        })

        filters.forEach((item) => {
            $('#get_events_by_region_filter').append(`<option value="${item.id}">${item.name}</option>`)
        })
        $('#get_events_by_region_filter').change(function(data) {
            let id = $(this).val();
            $.ajax({
                type: "GET",
                url: `${AJAXPHP}?act=get_events_by_region&date=${id}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    get_events_by_region(data);
                    const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount),
                        0);
                    $("#get_events_by_region_total").html(`(${totalValue})`)
                }
            })
        })


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