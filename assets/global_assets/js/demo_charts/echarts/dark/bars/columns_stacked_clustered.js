/* ------------------------------------------------------------------------------
 *
 *  # Echarts - Clustered columns example
 *
 *  Demo JS code for clustered column chart [dark theme]
 *
 * ---------------------------------------------------------------------------- */


// Setup module
// ------------------------------

var EchartsColumnsStackedClusteredDark = function() {


    //
    // Setup module components
    //

    // Clustered column chart
    var _columnsStackedClusteredDarkExample = function() {
        if (typeof echarts == 'undefined') {
            console.warn('Warning - echarts.min.js is not loaded.');
            return;
        }

        // Define element
        var columns_clustered_element = document.getElementById('columns_clustered');


        //
        // Charts configuration
        //

        if (columns_clustered_element) {

            // Initialize chart
            var columns_clustered = echarts.init(columns_clustered_element);


            //
            // Chart config
            //

            // Options
            columns_clustered.setOption({

                // Define colors
                color: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80'],

                // Global text styles
                textStyle: {
                    fontFamily: 'Roboto, Arial, Verdana, sans-serif',
                    fontSize: 15
                },

                // Chart animation duration
                animationDuration: 750,

                // Setup grid
                grid: {
                    left: 0,
                    right: 5,
                    top: 55,
                    bottom: 0,
                    containLabel: true
                },

                // Add legend
                legend: {
                    data: [
                        'Тадбирлар','Шахсий таркиб'

                    ],
                    itemHeight: 2,
                    itemGap: 8,
                    textStyle: {
                        padding: [0, 10],
                        color: '#fff'
                    }
                },

                // Add tooltip
                tooltip: {
                    trigger: 'axis',
                    backgroundColor: 'rgba(255,255,255,0.9)',
                    padding: [10, 15],
                    textStyle: {
                        color: '#222',
                        fontSize: 13,
                        fontFamily: 'Roboto, sans-serif'
                    }
                },

                // Horizontal axis
                xAxis: [
                    {
                        type: 'category',
                        data: ['Шкала'],
                        axisLabel: {
                            color: '#fff',
                            fontSize: 15
                        },
                        axisLine: {
                            lineStyle: {
                                color: 'rgba(255,255,255,0.25)'
                            }
                        },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: 'rgba(255,255,255,0.1)',
                                type: 'dashed'
                            }
                        }
                    },
                    {
                        type: 'category',
                        axisLine: {show:false},
                        axisTick: {show:false},
                        axisLabel: {show:false},
                        splitArea: {show:false},
                        splitLine: {show:false},
                        data: ['Шкала']
                    }
                ],

                // Vertical axis
                yAxis: [{
                    type: 'value',
                    axisLabel: {
                        color: '#fff',
                        formatter: '{value} ms'
                    },
                    axisLine: {
                        lineStyle: {
                            color: 'rgba(255,255,255,0.25)'
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: 'rgba(255,255,255,0.1)'
                        }
                    },
                    splitArea: {
                        show: true,
                        areaStyle: {
                            color: ['rgba(255,255,255,0.01)', 'rgba(0,0,0,0.01)']
                        }
                    }
                }],

                // Axis pointer
                axisPointer: [{
                    lineStyle: {
                        color: 'rgba(255,255,255,0.25)'
                    }
                }],

                // Add series
                series: [


                    {
                        name: 'Тадбирлар',
                        type: 'bar',
                        z: 1,
                        xAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#81C784',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'top'
                                }
                            }
                        },
                        data: [17]
                    },
                    {
                        name: 'Шахсий таркиб',
                        type: 'bar',
                        z: 1,
                        xAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#64B5F6',
                                label: {
                                    show: true,
                                    padding: 5,
                                    position: 'top'
                                }
                            }
                        },
                        data: [98]
                    }
                ]
            });
        }


        //
        // Resize charts
        //

        // Resize function
        var triggerChartResize = function() {
            columns_clustered_element && columns_clustered.resize();
        };

        // On sidebar width change
        var sidebarToggle = document.querySelectorAll('.sidebar-control');
        if (sidebarToggle) {
            sidebarToggle.forEach(function(togglers) {
                togglers.addEventListener('click', triggerChartResize);
            });
        }

        // On window resize
        var resizeCharts;
        window.addEventListener('resize', function() {
            clearTimeout(resizeCharts);
            resizeCharts = setTimeout(function () {
                triggerChartResize();
            }, 200);
        });
    };


    //
    // Return objects assigned to module
    //

    return {
        init: function() {
            _columnsStackedClusteredDarkExample();
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
    EchartsColumnsStackedClusteredDark.init();
});
