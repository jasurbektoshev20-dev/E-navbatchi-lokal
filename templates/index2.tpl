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
        <div class="col-4 mb-2">
            <div class="col-md-12 col-lg-12 mb-2">
                <div class="card">
                    <div class="mx-3 my-2 row">
                        <div class="col-9">
                            <h5 class="card-title">{$Dict.jts_services}</h5>
                        </div>
                        <div class="chart-container" style="height: 78vh;" id="get_transport_type"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12 col-lg-8 mb-2">
            <div class="row">
                <div class="col-md-12 col-lg-12 mb-2">
                    <div class="card">
                        <div class="mx-3 my-2 row">
                            <div class="col-9">
                                <h5 class="card-title">{$Dict.jts_services}</h5>
                            </div>
                            <div class="chart-container" id="get_human_chart"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-lg-12 mb-2">
                    <div class="card">
                        <div class="mx-3 my-2 row">
                            <div class="col-9">
                                <h5 class="card-title">{$Dict.jts_services}</h5>
                            </div>
                            <div class="chart-container" id="power_by_vehicle"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/assets/pathsData.js"></script>
<script src="/assets/js/echarts.min.js"></script>
<script>
    var AJAXPHP = "ajax{$AddURL}.php";
    {literal}
        let color = localStorage.getItem('templateCustomizer-vertical-menu-template-no-customizer--Style') == 'light' ?
            '#000' : '#fff';

        function get_transport_type(data, legend, name) {
            var dom = document.getElementById('get_transport_type');
            // let color = ['#2FA4FF', '#28FFBF', '#F6FA70', '#43919B', '#837DFF', '#4EF037', '#FF8FE5', '#E8FFE8', '#FF9D76'];
            var myChart = echarts.init(dom);
            var option;

            const pathSymbols = {
                human: humanPath,
                car: carPath2,
                moto: motoPath,
                reindeer: horsePath,
            };
            const labelSetting = {
                show: true,
                position: 'right',
                offset: [14, 0],
                fontSize: 16,
                color

            };

            function makeOption(type, symbol) {
                return {
                    textStyle: {
                        fontFamily: "Arial, sans-serif"
                    },
                    title: {
                        text: data[0].date,
                        textStyle: {
                            color
                        }
                    },
                    legend: {
                        textStyle: {
                            color
                        },
                        data: legend
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    grid: {
                        containLabel: true,
                        top: 20,
                        bottom: 5,
                        right: 5,
                        left: 5
                    },
                    yAxis: {
                        data: name,
                        inverse: true,
                        axisLine: { show: false },
                        axisTick: { show: false },
                        axisLabel: {
                            margin: 30,
                            fontSize: 14,
                            color
                        },
                        axisPointer: {
                            label: {
                                show: true,
                                margin: 30
                            }
                        }
                    },
                    xAxis: {
                        splitLine: { show: false },
                        axisLabel: { show: false },
                        axisTick: { show: false },
                        axisLine: { show: false }
                    },
                    animationDurationUpdate: 500,
                    series: [{
                            name: legend[0],
                            id: 'bar1',
                            type: type,
                            label: labelSetting,
                            symbolRepeat: true,
                            symbolSize: ['80%', '60%'],
                            barCategoryGap: '40%',
                            universalTransition: {
                                enabled: true,
                                delay: function(idx, total) {
                                    return (idx / total) * 1000;
                                }
                            },
                            data: [{
                                    value: data[0].qb_staff,
                                    symbol: symbol || pathSymbols.human
                                },
                                {
                                    value: data[0].qb_auto,
                                    symbol: symbol || pathSymbols.car
                                },
                                {
                                    value: data[0].qb_moto,
                                    symbol: symbol || pathSymbols.moto
                                }, {
                                    value: data[0].qb_ot,
                                    symbol: symbol || pathSymbols.reindeer
                                },
                            ]
                        },
                        {
                            name: legend[1],
                            id: 'bar2',
                            type: type,
                            barGap: '10%',
                            label: labelSetting,
                            symbolRepeat: true,
                            symbolSize: ['80%', '60%'],
                            universalTransition: {
                                enabled: true,
                                delay: function(idx, total) {
                                    return (idx / total) * 1000;
                                }
                            },
                            data: [{
                                    value: data[0].mg_staff,
                                    symbol: symbol || pathSymbols.human
                                },
                                {
                                    value: data[0].mg_auto,
                                    symbol: symbol || pathSymbols.car
                                },
                                {
                                    value: data[0].mg_moto,
                                    symbol: symbol || pathSymbols.moto
                                },
                                {
                                    value: data[0].mg_ot,
                                    symbol: symbol || pathSymbols.reindeer
                                },
                            ]
                        }
                    ]
                };
            }
            const options = [
                makeOption('pictorialBar'),
                makeOption('bar'),
                makeOption('pictorialBar', 'diamond')
            ];
            var optionIndex = 0;
            option = options[optionIndex];
            setInterval(function() {
                optionIndex = (optionIndex + 1) % options.length;
                myChart.setOption(options[optionIndex]);
            }, 3000);

            if (option && typeof option === 'object') {
                myChart.setOption(option);
            }
            window.addEventListener('resize', myChart.resize);
        }

        $.ajax({
            type: "GET",
            url: `${AJAXPHP}?act=power`,
            dataType: "json",
            encode: true,
            success: function(res) {
                let data = res.data
                let legend = res.legend
                let name = res.patruls
                get_transport_type(data, legend, name);
            }
        })

        function get_human_chart(data, total) {
            var dom = document.getElementById('get_human_chart');
            var myChart = echarts.init(dom);
            const symbols = [humanPath, carPath2, motoPath, horsePath];

            let max = -Infinity;
            data.data.forEach(obj => {
                Object.values(obj).forEach(value => {
                    const numValue = Number(value);
                    if (!isNaN(numValue) && numValue > max) {
                        max = numValue;
                    }
                });
            });

            const bodyMax = max + 5

            const labelSetting = {
                show: true,
                position: 'top',
                offset: [0, -20],
                fontSize: 18,
                fontFamily: 'Arial'
            };
            const markLineSetting = {
                symbol: 'none',
                lineStyle: {
                    opacity: 1
                },
                data: [{
                        type: 'max',
                        label: {
                            formatter: 'max: {c}'
                        }
                    },
                    {
                        type: 'min',
                        label: {
                            formatter: 'min: {c}'
                        }
                    }
                ]
            };
            var option = {
                textStyle: {
                    fontFamily: "Arial, sans-serif"
                },
                tooltip: {},
                legend: {
                    data: ['data'],
                    itemStyle: {
                        color,
                        fontSize: 16
                    }
                },
                xAxis: {
                    data: data.legend,
                    axisTick: { show: false },
                    axisLine: { show: false },
                    axisLabel: {
                        show: true,
                        color,
                        fontSize: 16
                    }
                },
                yAxis: {
                    max: bodyMax,
                    offset: 20,
                    splitLine: { show: false },
                    axisLabel: { show: true, color }
                },
                grid: {
                    top: 'center',
                    height: '75%',
                    top: 50,
                    bottom: 0,
                    right: 5,
                    left: 50
                },
                markLine: {
                    z: -100
                },
                series: [{
                        type: 'pictorialBar',
                        symbolClip: true,
                        symbolBoundingData: bodyMax,
                        label: labelSetting,
                        data: [{
                                value: data.data[0].staff,
                                symbol: symbols[0]
                            },
                            {
                                value: data.data[0].auto,
                                symbol: symbols[1]
                            },
                            {
                                value: data.data[0].moto,
                                symbol: symbols[2],

                            },
                            {
                                value: data.data[0].ot,
                                symbol: symbols[3]
                            }
                        ],
                        markLine: markLineSetting,
                        z: 10
                    },
                    {
                        type: 'pictorialBar',
                        symbolBoundingData: bodyMax,
                        animationDuration: 0,
                        itemStyle: {
                            color: '#ccc'
                        },
                        data: [{
                                value: 1,
                                symbol: symbols[0]
                            },
                            {
                                value: 1,
                                symbol: symbols[1]
                            },
                            {
                                value: 1,
                                symbol: symbols[2],

                            },
                            {
                                value: 1,
                                symbol: symbols[3]
                            },
                        ]
                    }
                ]
            };

            if (option && typeof option === 'object') {
                myChart.setOption(option);
            }
            window.addEventListener('resize', myChart.resize);
        }

        function power_by_vehicle(data, total) {
            var dom = document.getElementById('power_by_vehicle');
            var myChart = echarts.init(dom);
            var option = {
                textStyle: {
                    fontFamily: "Arial, sans-serif"
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    left: 'center',
                    data: data.legend,
                },
                radar: [{
                    indicator: [
                        { text: data.legend[0], max: parseInt(data.data[0].staff) + 5 },
                        { text: data.legend[1], max: parseInt(data.data[0].auto) + 5 },
                        { text: data.legend[2], max: parseInt(data.data[0].moto) + 5 },
                        { text: data.legend[3], max: parseInt(data.data[0].ot) + 5 },
                    ],
                    center: ['center', 'center'],
                    radius: 130,
                }],
                series: [{
                    type: 'radar',
                    tooltip: {
                        trigger: 'item'
                    },
                    label: {
                        show: true,
                        offset: [0, -10],
                        fontSize: 16,
                        color,
                    },
                    areaStyle: {
                        color: '#91CC75'
                    },
                    data: [{
                        value: Object.values(data.data[0]),
                        name: 'Режалаштирилган тадбирлар',
                    }]
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
                power_by_vehicle(data);
                get_human_chart(data);
            }
        })
    {/literal}
</script>
{include file="footer.tpl"}