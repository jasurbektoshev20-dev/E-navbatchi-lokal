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

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <!--/ Card Border Shadow -->
    <div class="row">

        <div class="col-12">
            <div class="card">
                <div class="mx-3 my-2 d-flex" style="justify-content: space-between; align-items: center">
                    <ul class="nav nav-tabs nav-fill mx-3" role="tablist">
                        <li class="nav-item">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
                                data-bs-target="#charts" id="chartButton"
                                aria-controls="charts" aria-selected="false">
                                <i class="tf-icons ti ti-chart-histogram ti-xs me-1"></i> {$Dict.diagram}
                            </button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                data-bs-target="#tables" aria-controls="tables"
                                aria-selected="true">
                                <i class="tf-icons ti ti-table ti-xs me-1"></i> {$Dict.table}
                            </button>
                        </li>
                    </ul>
                    <button id="new" type="button" class="btn btn-primary waves-effect waves-light"
                        data-bs-toggle="submitModal" data-bs-target="#modal">
                        <i class="menu-icon tf-icons ti ti-plus"></i>{$Dict.adding}
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="tab-content p-0 mt-3">
        <div class="tab-pane fade card" id="tables" role="tabpanel">
            <div class="card-datatable table-responsive">
                <table class="datatables-projects table border-top">
                    <thead>
                        <tr>
                            <th>No̱</th>
                            <th class="text-center">{$Dict.region}</th>
                            <th class="text-center">{$Dict.crime_type}</th>
                            <th class="text-center">{$Dict.comitted_crime}</th>
                            <th class="text-center">{$Dict.comitted_date}</th>
                            <th class="text-center">{$Dict.incident_place}</th>
                            <th class="text-center">{$Dict.citizen}</th>
                            <th class="text-center">{$Dict.work_place}</th>
                            <th class="text-center">{$Dict.case_summary}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$Violations item=Table key=tkey}
                            <tr class="lb" id="row_{$Table.id|crypt}">
                                <td class="text-right">{$tkey+1}</td>
                                <td class="text-center">{$Table.region_id}</td>
                                <td class="text-center">{$Table.violation_type}</td>
                                <td class="text-center">
                                    {if $Table.type == 1} {$Dict.crime} {else} {$Dict.notable_crime} {/if}
                                </td>
                                <td class="text-center">{$Table.date}</td>
                                <td class="text-center">{$Table.incident_place}</td>
                                <td class="text-center">{$Table.citizen}</td>
                                <td class="text-center">{$Table.work_place}</td>
                                <td class="text-center">{$Table.text}</td>
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a rel="{$Table.id|crypt}" class="dropdown-item editAction"
                                                href="javascript:void(0);"><i class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                            <a rel="{$Table.id|crypt}" class="dropdown-item delete"
                                                href="javascript:void(0);"><i
                                                    class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
        <div class="tab-pane fade show active" id="charts" role="tabpanel">
            <div class="row">


           {*O'zgartirgan joyim*}


             {*   <div class="col-md-12 col-lg-5 mb-2">
                    <div class="card">
                        <div class="mx-1 my-2 row">
                            <div class="col-9">
                                <h5 class="card-title">{$Dict.get_crime_by_region}
                                    <span class="text-success" id="get_crime_by_region_total"></span>
                                </h5>
                            </div>
                            <div class="col-3">
                                <select class="form-select" id="get_crime_by_region_filter">
                                    
                                </select>
                            </div>
                            <div class="chart-container" id="get_crime_by_region"></div>
                        </div>
                    </div>
                </div>*}

      




                 




                <div class="col-md-12 col-lg-12">

                    <div class="row">

                      <div class="col-6">

                            <div class="card">

                                <div class="mx-1 my-2 row">
                                    <div class="col-8">
                                        <h5 class="card-title">Mamuriy huquqbuzarliklar</h5>
                                    </div>
                                    <div class="col-4">
                                        <select class="form-select" id="get_crime_by_type_filter">
                                            
                                        </select>
                                    </div>
                                    <div class="chart-container2" id="get_crime_by_type"  style="height: 600px;"></div>

                                </div>
                            </div>
                        </div>

                    
                        <div class="col-6">
                            <div class="card">
                                <div class="mx-1 my-2 row">
                                    <div class="col-8">
                                        <h5 class="card-title">Jinoiy huquqbuzarliklar</h5>
                                    </div>
                                    <div class="col-4">
                                        <select class="form-select" id="get_crimes_filter">
                                            
                                        </select>
                                    </div>
                                    {* {if $UserStructure eq 1}
                                        <div class="col-3">
                                            <select class="form-select" id="listed_crimes">
                                                <option value="0">{$Dict.all}</option>
                                                {foreach from=$Regions item=region key=mkey}
                                                    <option value="{$region.id}">{$region.name}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    {/if} *}
                                    <div class="chart-container2" id="get_crimes" style="height: 600px;"></div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-6 mt-4">
                        <div class="card p-3">
                            <div class="row mb-3">
                            <div class="col-8">
                                <h5 class="card-title">
                                Ma'muriy huquqbuzarliklar hududlar kesimida
                                <span id="mamuriy_huquq_chart_total"></span>
                                </h5>
                            </div>
                            <div class="col-4">
                                <select class="form-select" id="mamuriy_huquq_select"></select>
                            </div>
                            </div>
                            <div class="chart-container" id="mamuriy_huquq_chart" style="height: 600px;"></div>
                        </div>
                        </div>


                          <div class="col-md-6 col-lg-6 mt-4">
                        <div class="card p-3">
                            <div class="row mb-3">
                            <div class="col-8">
                                <h5 class="card-title">
                                Jinoiy huquqbuzarliklar hududlar kesimida
                                <span id="jinoiy_huquq_chart_total"></span>
                                </h5>
                            </div>
                            <div class="col-4">
                                <select class="form-select" id="jinoiy_huquq_select"></select>
                            </div>
                            </div>
                            <div class="chart-container" id="jinoiy_huquq_chart" style="height: 600px;"></div>
                        </div>
                        </div>





                    </div>



               {*     <div class="card  mt-3">

                        <div class="mx-1 my-2 row">

                            <div class="col-9">
                                <h5 class="card-title">{$Dict.crime_by_week}
                                    <span class="text-success" id="crime_by_week_total"></span>
                                </h5>
                            </div>

                            <div class="col-3">
                                <select class="form-select" id="crime_by_week_total_filter">
                                    
                                </select>
                            </div>
                            
                            <div class="chart-container2" id="crime_by_week"></div>

                        </div>

                    </div>*}





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
                            <label>{$Dict.distcity}</label>
                            <select class="select form-control" name="distcity_id" id="distcity_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Distcity item=Item1 key=ikey1}
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
        let filters = [
                {
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
        let default_color = localStorage.getItem('templateCustomizer-vertical-menu-template-no-customizer--Style') == 'light' ?
            '#000' : '#fff';

        const flatpickrDate = document.querySelector('#date');
        const flatpickrbirthdate = document.querySelector('#birthdate');
        if (flatpickrDate) {
            flatpickrDate.flatpickr({
                monthSelectorType: 'static'
            });
        }
        if (flatpickrbirthdate) {
            flatpickrbirthdate.flatpickr({
                static: true
            });
        }

        let date;
        $('#date').on('change', function() {
            var dateComponents = this.value.split('-');
            date = dateComponents[2] + '-' + dateComponents[1] + '-' + dateComponents[0];
        })
        $('#birthdate').on('change', function() {
            var dateComponents = this.value.split('-');
            date = dateComponents[2] + '-' + dateComponents[1] + '-' + dateComponents[0];
        })

        $('#region_id').change(function(event) {
            $.ajax({
                type: "GET",
                url: `ajax.php?act=get_distcity_by_id&id=${this.value}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    $("#distcity_id").empty();
                    data.forEach(item => {
                        $("#distcity_id").append(`<option value="${item.id}">${item.name}</option>`);
                    });
                }
            })
        })

        var dt_basic_table = $('.datatables-projects'),
            dt_basic;

        // DataTable with buttons
        if (dt_basic_table.length) {
            dt_basic = dt_basic_table.DataTable({
                displayLength: 10,
                lengthMenu: [5, 10, 25, 50, 75, 100, 1000]
            });
        }

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');
            var RowId = $(this).attr('rel');

            $.get("hrajax.php?act=get_violations&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#region_id').val(sInfo.region_id);
                $('#region_id').trigger("change");
                $('#distcity_id').val(sInfo.distcity_id);
                $('#distcity_id').trigger("change");
                $('#violation_type').val(sInfo.violation_type);
                $('#violation_type').trigger("change");
                $('#type').val(sInfo.type);
                $('#type').trigger("change");
                $('#date').val(sInfo.date);
                $('#incident_place').val(sInfo.incident_place);
                $('#citizen').val(sInfo.citizen);
                $('#birthdate').val(sInfo.birthdate);
                $('#live_adress').val(sInfo.live_adress);
                $('#work_place').val(sInfo.work_place);
                $('#text').val(sInfo.text);
                $('#lat').val(sInfo.lat);
                $('#lon').val(sInfo.lon);
                $('#id').val(sInfo.id);
            })
        })

        $('#new').click(function() {
            $('#submitModal').modal('toggle');

            $('#region_id').val(0);
            $('#region_id').trigger("change");
            $('#distcity_id').val("");
            $('#distcity_id').trigger("change");
            $('#violation_type').val(0);
            $('#violation_type').trigger("change");
            $('#type').val(0);
            $('#type').trigger("change");
            $('#date').val("");
            $('#incident_place').val("");
            $('#citizen').val("");
            $('#birthdate').val("");
            $('#live_adress').val("");
            $('#work_place').val("");
            $('#text').val("");
            $('#lat').val("");
            $('#lon').val("");
            $('#id').val(0);
        });

        // Form validation and submit
        const bsValidationForms = $('.needs-validation');
        Array.prototype.slice.call(bsValidationForms).forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    event.preventDefault();
                    event.stopPropagation();
                    var form_data = new FormData();

                    form_data.append('region_id', $('#region_id').val());
                    form_data.append('distcity_id', $('#distcity_id').val());
                    form_data.append('violation_type', $('#violation_type').val());
                    form_data.append('type', $('#type').val());
                    form_data.append('date', $('#date').val());
                    form_data.append('incident_place', $('#incident_place').val());
                    form_data.append('citizen', $('#citizen').val());
                    form_data.append('birthdate', $('#birthdate').val());
                    form_data.append('live_adress', $('#live_adress').val());
                    form_data.append('work_place', $('#work_place').val());
                    form_data.append('text', $('#text').val());
                    form_data.append('lat', $('#lat').val());
                    form_data.append('lon', $('#lon').val());
                    form_data.append('id', $('#id').val());

                    $.ajax({
                        url: 'hrajax.php?act=act_violations',
                        dataType: 'text',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data,
                        type: 'post',
                        success: function(resdata) {
                            var NewArray = resdata.split("<&sep&>");
                            if (NewArray[0] == 0) {
                                location.reload();
                            } else {
                                alert(resdata);
                            }
                        }
                    });
                }
                form.classList.add('was-validated');
            });
        });

        // Delete Record
        $('.datatables-projects tbody').on('click', '.delete', function() {
            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=del_violations&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });



        // charts
        function get_crime_by_region(data, total) {
            let min = parseInt(data[0].gcount);
            let max = parseInt(data[0].gcount);
            data.forEach(obj => {
                if (parseInt(obj.gcount) != 0) {
                    if (parseInt(obj.gcount) < min) {
                        min = parseInt(obj.gcount);
                    }
                    if (parseInt(obj.gcount) > max) {
                        max = parseInt(obj.gcount);
                    }
                }
            });

            var dom = document.getElementById('get_crime_by_region');
            var colors = ['#28C76F', '#00CFE8', '#7367F0', '#45FFCA', '#A149FA', '#E3FCBF', '#00FFAB',
                '#B983FF', '#94B3FD', '#998CEB', '#00AF91', '#6499E9', '#F3CCFF',
            ];
            var myChart = echarts.init(dom);
            var option;
            option = {
                textStyle: {
                    fontFamily: "Arial, sans-serif"
                },
                grid: {
                    containLabel: true,
                    top: 10,
                    bottom: 25,
                    right: 20,
                    left: 10
                },
                xAxis: {
                    name: 'score',
                    axisLabel: {
                        interval: 0,
                        fontSize: '16px',
                        color: default_color,
                    },
                    axisLine: {
                        show: false // Remove the background X line
                    },
                    splitLine: {
                        show: false // Remove the background X line
                    }
                },
                yAxis: {
                    type: 'category',
                    data: data.map(item => item.name),

                    axisLabel: {
                        interval: 0,
                        fontSize: '16px',
                        color: default_color,
                    },
                    label: {
                        show: false,
                    },
                },
                visualMap: {
                    show: true,
                    orient: 'horizontal',
                    left: 'center',
                    min: min,
                    max: max,
                    text: ['High Score', 'Low Score'],
                    // Map the score column to color
                    dimension: 0,
                    inRange: {
                        color: ['#28C76F', '#F7EC09', '#FF004D']
                    }
                },
                tooltip: {
                    backgroundColor: 'white',
                },
                series: [{
                    data: data.map(item => parseInt(item.gcount)),
                    type: 'bar',
                    barMaxWidth: 60,

                    itemStyle: {
                        borderRadius: [0, 8, 8, 0] // Add border-radius only to the top of the bar line
                    },
                    encode: {
                        // Map the "amount" column to X axis.
                        x: 'score',
                        // Map the "product" column to Y axis
                        y: 'product'
                    },
                    label: {
                        fontSize: 12,
                        show: true, // Show the value on top of the bar
                        position: 'right',
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
            url: `${AJAXPHP}?act=get_crime_by_region`,
            dataType: "json",
            encode: true,
            success: function(data) {
                get_crime_by_region(data);
                const totalValue = data.reduce((sum, item) => sum + parseInt(item.gcount), 0);
                $("#get_crime_by_region_total").html(`(${totalValue})`)
            }
        })

        filters.forEach((item) => {
            $('#get_crime_by_region_filter').append(`
                <option value="${item.id}">${item.name}</option>
            `)
        })
        $('#get_crime_by_region_filter').change(function(data) {
            let id = $(this).val();
            $.ajax({
                type: "GET",
                url: `${AJAXPHP}?act=get_crime_by_region&date=${id}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    get_crime_by_region(data);
                    const totalValue = data.reduce((sum, item) => parseInt(sum) + parseInt(item.gcount), 0);
                    $("#get_crime_by_region_total").html(`(${totalValue})`)
                }
            })
        })


        function crime_by_week(data) {
            var dom = document.getElementById('crime_by_week');
            var myChart = echarts.init(dom, null, {
                renderer: 'canvas',
                useDirtyRect: false
            });
            console.log(data);
            var option;
            var colors = ['#00CFE8', '#7367F0', '#45FFCA', '#A149FA', '#E3FCBF', '#94B3FD', '#6499E9'];
            option = {
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: data.map(item => item.date),
                    axisLabel: {
                        // interval: 0,
                        fontSize: '12px',
                        color: default_color,
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#ccc' // x-axis line color
                        }
                    }
                },
                grid: {
                    containLabel: true,
                    top: 10,
                    bottom: 20,
                    right: 20,
                    left: 20
                },

                yAxis: {
                    type: 'value',
                    axisLabel: {
                        // interval: 0,
                        fontSize: '12px',
                        color: default_color,
                    },
                    axisLine: {
                        lineStyle: {
                            color: '#ccc' 
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: 'grey' ,
                            width: 1
                        }
                    }
                },
                tooltip: {
                    triggerOn: 'mousemove', // Show tooltip on mousemove
                    formatter: function(params) {
                        var value = params.value; // Get the value of the hovered data point
                        return 'Value: ' + value;
                    },
                    extraCssText: 'transform: translate(-50%, -100%);'
                },
                series: [
                    {
                        data: data.map(item => item.value),
                        type: 'line',
                        smooth: true,
                        lineStyle: {
                            color: '#009688', 
                            width: 0
                        },
                        areaStyle: {
                            color: 'rgba(0, 0, 255, 0.2)'
                            // color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            //     offset: 0,
                            //     color: '#FF004D' // area gradient start color
                            // },{
                            //     offset: 0.5,
                            //     color: '#F7EC09' // area gradient end color
                            // }, {
                            //     offset: 1,
                            //     color: '#28C76F' // area gradient end color
                            // },])
                        },
                       
                        
                    }
                ]
            };



            if (option && typeof option === 'object') {
                myChart.setOption(option);
            }
            window.addEventListener('resize', myChart.resize);
        }
        $.ajax({
            type: "GET",
            url: `${AJAXPHP}?act=crime_by_week&date=1`,
            dataType: "json",
            encode: true,
            success: function(data) {
                crime_by_week(data);
                const totalValue = data.reduce((sum, item) => sum + parseInt(item.value), 0);
                $("#crime_by_week_total").html(`(${totalValue})`)
            }
        })


        filters.forEach((item) => {
            if(item.id == 2 || item.id == 3){

                $('#crime_by_week_total_filter').append(`
                    <option value="${item.id == 2 ? 1 : 2}">${item.name}</option>
                `)
            }
        })
        $('#crime_by_week_total_filter').change(function(data) {
            let id = $(this).val();
            $.ajax({
                type: "GET",
                url: `${AJAXPHP}?act=crime_by_week&date=${id}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    crime_by_week(data);                    
                    const totalValue = data.reduce((sum, item) => sum + parseInt(item.value), 0);
                    $("#crime_by_week_total").html(`(${totalValue})`)
                }
            })
        })



    



 const crimeChartDataByFilter = {
    0: {
      legend: ["183-modda", "184\u00B9-modda", "184\u00B3-modda","185-modda","185\u00B2-modda", "185\u00B3-modda", "186-modda", "187-modda", "188-modda", "188\u00B9-modda","188\u00B2-modda","188\u00B3-modda","189-modda","189\u00B9-modda", "191-modda", "192-modda", "63-modda", "72-modda", "79-modda", "88-modda", "90-modda","90\u00B9-modda", "91-modda","91\u00B9-modda","91\u00B2-modda", "161-modda", "47-modda", "56\u00B9-modda", "185\u00B9-modda", "210\u00B9-modda", "61-modda", "194\u00B9-modda", "195\u00B9-modda", "196-modda"],
      data: [20, 10, 25, 20, 10,12,23,8,9,11,4,6,5,9,15,18,10,9, 19,20,17,34,8,7,10,11,23,12,23,43,31,32,2,4]
    },
     1: {
     legend: ["183-modda", "184\u00B9-modda", "184\u00B3-modda","185-modda","185\u00B2-modda", "185\u00B3-modda", "186-modda", "187-modda", "188-modda", "188\u00B9-modda","188\u00B2-modda","188\u00B3-modda","189-modda","189\u00B9-modda", "191-modda", "192-modda", "63-modda", "72-modda", "79-modda", "88-modda", "90-modda","90\u00B9-modda", "91-modda","91\u00B9-modda","91\u00B2-modda", "161-modda", "47-modda", "56\u00B9-modda", "185\u00B9-modda", "210\u00B9-modda", "61-modda", "194\u00B9-modda", "195\u00B9-modda", "196-modda"],
     data: [32, 23, 14, 10, 15,12,26,8,7,11,4,3,5,9,15,18,10,7, 19,20,12,34,5,4,10,11,23,12,23,43,31,32,6,9]
    },
      2: {
     legend: ["183-modda", "184\u00B9-modda", "184\u00B3-modda","185-modda","185\u00B2-modda", "185\u00B3-modda", "186-modda", "187-modda", "188-modda", "188\u00B9-modda","188\u00B2-modda","188\u00B3-modda","189-modda","189\u00B9-modda", "191-modda", "192-modda", "63-modda", "72-modda", "79-modda", "88-modda", "90-modda","90\u00B9-modda", "91-modda","91\u00B9-modda","91\u00B2-modda", "161-modda", "47-modda", "56\u00B9-modda", "185\u00B9-modda", "210\u00B9-modda", "61-modda", "194\u00B9-modda", "195\u00B9-modda", "196-modda"],
     data: [25, 18, 12, 10, 15,15,23,8,7,11,7,3,5,9,17,18,10,3, 19,20,12,34,3,7,10,11,23,10,23,43,31,32,4,4]
    },
      3: {
      legend: ["183-modda", "184\u00B9-modda", "184\u00B3-modda","185-modda","185\u00B2-modda", "185\u00B3-modda", "186-modda", "187-modda", "188-modda", "188\u00B9-modda","188\u00B2-modda","188\u00B3-modda","189-modda","189\u00B9-modda", "191-modda", "192-modda", "63-modda", "72-modda", "79-modda", "88-modda", "90-modda","90\u00B9-modda", "91-modda","91\u00B9-modda","91\u00B2-modda", "161-modda", "47-modda", "56\u00B9-modda", "185\u00B9-modda", "210\u00B9-modda", "61-modda", "194\u00B9-modda", "195\u00B9-modda", "196-modda"],
     data: [23, 17, 13, 10, 15,12,21,8,7,14,4,3,5,10,15,18,10,9, 19,20,14,34,5,7,17,11,23,6,19,43,31,32,3,5]
    },
  };

  // 🔽 Filter variantlar
  const crimeFilters = [
    { id: 0, name: "Hammasi" },
    { id: 1, name: "Bugun" },
    { id: 2, name: "Oy bo‘yicha" },
    { id: 3, name: "Yil bo‘yicha" }
  ];

  // 📊 Asosiy funksiya (nom o‘zgarmaydi)
  function get_crime_by_type(data, total) {
    let sdata = data.legend.map((name, i) => ({
      value: data.data[i],
      name: name
    }));

    var dom = document.getElementById('get_crime_by_type');
    var myChart = echarts.init(dom, null, {
      renderer: 'canvas',
      useDirtyRect: false
    });

    // 🌈 Korporativ to‘q ranglar palitrasi (modern dashboard)
    let color = [
      '#264653', // To‘q moviy-yashil
      '#2A9D8F', // Yashil-moviy
      '#E9C46A', // Oltin sariq
      '#F4A261', // Iliq to‘q sariq
      '#E76F51', // To‘q qizil
      '#6A4C93', // Binafsha
      '#457B9D'  // Moviy
    ];

    let option = {
    textStyle: {
        fontFamily: "Arial, sans-serif"
    },
    color,
    title: {
        text: total.toLocaleString(),
        left: 'center',
        top: '35%',
        textStyle: {
            fontSize: 22,
            fontWeight: 'bold',
            color: '#E9C46A'
        },
    },
    legend: {
        show: true,            // ✅ pastdagi yozuvlar ko‘rinsin
        bottom: 0,
        orient: 'horizontal',
        left: 'center',
        itemGap: 15,
        textStyle: {
            color: '#b7b7b7',
            fontSize: 14,
            fontWeight: 'bold'
        }
    },
    tooltip: {
        trigger: 'item',
        formatter: '{b}: {c}'  // Hoverda nom va qiymat chiqadi
    },
    series: [{
        type: 'pie',
        radius: ['30%', '55%'],
        center: ['50%', '40%'],
        avoidLabelOverlap: true,
        itemStyle: {
            borderRadius: 10,
            borderWidth: 2
        },
        label: {
            show: true,
            position: 'outside',
            formatter: '{c}', // faqat raqam
            fontSize: 15,
            fontWeight: 'bold',
            color: '#b7b7b7'
        },
        labelLine: {
            show: true,
            length: 15
        },
        data: sdata.map((item, index) => ({
            value: item.value,
            name: item.name,
            itemStyle: {
                shadowColor: color[index],
                shadowBlur: 10,
                borderRadius: 10,
                borderColor: color[index]
            }
        }))
    }]
};

    myChart.setOption(option);
    window.addEventListener('resize', myChart.resize);
  }

  // 🔽 Select uchun variantlarni chiqarish
  crimeFilters.forEach((item) => {
    $('#get_crime_by_type_filter').append(`<option value="${item.id}">${item.name}</option>`);
  });

  // 🔁 Select o‘zgarsa — chart yangilansin
  $('#get_crime_by_type_filter').change(function () {
    let id = $(this).val();
    const selected = crimeChartDataByFilter[id] || crimeChartDataByFilter[0];
    const total = selected.data.reduce((sum, v) => sum + v, 0);
    get_crime_by_type(selected, total);
  });

  // 🚀 Dastlabki chartni yuklash
  const initialCrimeData = crimeChartDataByFilter[0];
  const totalInitialCrime = initialCrimeData.data.reduce((sum, v) => sum + v, 0);
  get_crime_by_type(initialCrimeData, totalInitialCrime);





// 🧩 TEST MA’LUMOTLAR (faqat lokal uchun)
const crimesChartDataByFilter = {
  0: { // Hammasi
    legend: ["250\u00B9-modda. Protexnika buyumlarining qonunga xilof muomulasi", "259\u00B9-modda. O'ta muhim va toifalangan obyektlarning qo'riqlanishini ta'minlashga doir majburiyatlarni bajarmaslik"],
    data: [50, 35]
  },
  1: { // Bugun
  legend: ["250\u00B9-modda. Protexnika buyumlarining qonunga xilof muomulasi", "259\u00B9-modda. O'ta muhim va toifalangan obyektlarning qo'riqlanishini ta'minlashga doir majburiyatlarni bajarmaslik"],
    data: [30, 25]
  },
  2: { // Oy
    legend: ["250\u00B9-modda. Protexnika buyumlarining qonunga xilof muomulasi", "259\u00B9-modda. O'ta muhim va toifalangan obyektlarning qo'riqlanishini ta'minlashga doir majburiyatlarni bajarmaslik"],
    data: [150, 90]
  },
  3: { // Yil
  legend: ["250\u00B9-modda. Protexnika buyumlarining qonunga xilof muomulasi", "259\u00B9-modda. O'ta muhim va toifalangan obyektlarning qo'riqlanishini ta'minlashga doir majburiyatlarni bajarmaslik"],
    data: [500, 354]
  }
};

// 🔽 Filter uchun ro‘yxat
const crimesFilters = [
  { id: 0, name: "Hammasi" },
  { id: 1, name: "Bugun" },
  { id: 2, name: "Oy bo‘yicha" },
  { id: 3, name: "Yil bo‘yicha" }
];

/* 🎨 Chart funksiyasi */
function get_crimes(dataset, total) {
  // ❗ Ma’lumotlarni formatga o‘tkazamiz (map ishlashi uchun)
  let sdata = dataset.legend.map((name, i) => ({
    name: name,
    value: dataset.data[i]
  }));

  var dom = document.getElementById('get_crimes');
  var myChart = echarts.init(dom, null, { renderer: 'canvas', useDirtyRect: false });

  let color = ['#00FA9A', '#00CFE8', '#4EF037', '#20B2AA', '#FFD700', '#ff9900'];

  let option = {
    textStyle: { fontFamily: "Arial, sans-serif" },
    color,
    title: {
      text: total,
      left: 'center',
      top: '31%',
      textStyle: { fontSize: 18, fontWeight: 'bold', color: '#333' },
    },
    legend: {
      bottom: '0',
      orient: 'horizontal',
      left: 'center',
      itemGap: 10,
      textStyle: { color: '#555', fontSize: '1rem' }
    },
    tooltip: { backgroundColor: 'white' },
    series: [{
      type: 'pie',
      radius: ['25%', '55%'],
      center: ['50%', '34%'],
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
        textStyle: { fontSize: 16, fontWeight: 'bold', color: '#b7b7b7' },
      },
      minAngle: 20,
      labelLine: { show: true, length: 10 },
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

  myChart.setOption(option);
  window.addEventListener('resize', myChart.resize);
}

/* 🔽 Filter variantlarini yaratish */
crimesFilters.forEach(item => {
  $('#get_crimes_filter').append(`<option value="${item.id}">${item.name}</option>`);
});

/* 🔁 Filter tanlanganda yangilash */
$('#get_crimes_filter').change(function () {
  let id = $(this).val();
  const selected = crimesChartDataByFilter[id] || crimesChartDataByFilter[0];
  const total = selected.data.reduce((sum, v) => sum + v, 0);
  get_crimes(selected, total);
});

// 🚀 Dastlab yuklash
const initialCrimesData = crimesChartDataByFilter[0];
const totalCrimesInitial = initialCrimesData.data.reduce((sum, v) => sum + v, 0);
get_crimes(initialCrimesData, totalCrimesInitial);








const mamuriyHuquqDataByFilter = {
  0: { // Hammasi
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Xorazm", "Surxondaryo"],
    values: [120, 150, 100, 120, 60, 140, 100]
  },
  1: { // Bugun
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Xorazm", "Surxondaryo"],
    values: [5, 3, 2, 4, 1, 0, 2]
  },
  2: { // Oy
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Xorazm", "Surxondaryo"],
    values: [50, 40, 30, 35, 20, 15, 10]
  },
  3: { // Yil
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Xorazm", "Surxondaryo"],
    values: [600, 480, 450, 400, 300, 250, 200]
  }
};

/* 🔽 Filter variantlari */
const mamuriyHuquqFilters = [
  { id: 0, name: "Hammasi" },
  { id: 1, name: "Bugun" },
  { id: 2, name: "Oy bo‘yicha" },
  { id: 3, name: "Yil bo‘yicha" }
];

/* 📊 Chart funksiyasi */
function mamuriy_huquq_chart(data) {
  const dom = document.getElementById('mamuriy_huquq_chart');
  const myChart = echarts.init(dom, null, { renderer: 'canvas', useDirtyRect: false });

      let colors = [
      '#264653', // To‘q moviy-yashil
      '#2A9D8F', // Yashil-moviy
      '#E9C46A', // Oltin sariq
      '#F4A261', // Iliq to‘q sariq
      '#E76F51', // To‘q qizil
      '#6A4C93', // Binafsha
      '#457B9D'  // Moviy
    ];

  const totalValue = data.values.reduce((sum, v) => sum + v, 0);
  document.getElementById("mamuriy_huquq_chart_total").innerText = `(${totalValue})`;

  const option = {
    textStyle: { fontFamily: "Arial, sans-serif" },
    grid: { bottom: 80, right: 30, left: 60 },
    tooltip: { backgroundColor: 'white' },
    xAxis: {
      type: 'category',
      data: data.labels,
      axisLabel: { interval: 0, rotate: 40, color: '#555' },
      axisLine: { show: false },
      splitLine: { show: false }
    },
    yAxis: {
      type: 'value',
      axisLabel: { color: '#555' },
      axisLine: { show: false },
      splitLine: { show: false }
    },
    series: [{
      type: 'bar',
      data: data.values,
      barMaxWidth: 60,
      itemStyle: {
        color: function(params) {
          return colors[params.dataIndex % colors.length];
        },
        borderRadius: [8, 8, 0, 0]
      },
      label: {
        show: true,
        position: 'top',
        color: '#666',
        fontSize: 14,
        fontWeight: 'bold'
      }
    }]
  };

  myChart.setOption(option);
  window.addEventListener('resize', myChart.resize);
}

/* 🔽 Filter select to‘ldirish */
mamuriyHuquqFilters.forEach(item => {
  $('#mamuriy_huquq_select').append(`<option value="${item.id}">${item.name}</option>`);
});

/* 🔁 Filter o‘zgarsa chart yangilansin */
$('#mamuriy_huquq_select').change(function () {
  const id = $(this).val();
  const selected = mamuriyHuquqDataByFilter[id] || mamuriyHuquqDataByFilter[0];
  mamuriy_huquq_chart(selected);
});

/* 🚀 Dastlab yuklash */
mamuriy_huquq_chart(mamuriyHuquqDataByFilter[0]);




const jinoiyHuquqDataByFilter = {
  0: { // Hammasi
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Buxoro", "Xorazm"],
    values: [250, 300, 150, 200, 340, 100, 120]
  },
  1: { // Bugun
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Buxoro", "Xorazm"],
    values: [10, 8, 5, 6, 4, 2, 3]
  },
  2: { // Oy
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Buxoro", "Xorazm"],
    values: [80, 70, 60, 55, 50, 30, 25]
  },
  3: { // Yil
    labels: ["Toshkent", "Samarqand", "Farg‘ona", "Andijon", "Namangan", "Buxoro", "Xorazm"],
    values: [1200, 950, 880, 850, 760, 640, 500]
  }
};

/* 🔽 Filter variantlari */
const jinoiyHuquqFilters = [
  { id: 0, name: "Hammasi" },
  { id: 1, name: "Bugun" },
  { id: 2, name: "Oy bo‘yicha" },
  { id: 3, name: "Yil bo‘yicha" }
];

/* 📊 Chart funksiyasi */
function jinoiy_huquq_chart(data) {
  const dom = document.getElementById('jinoiy_huquq_chart');
  const myChart = echarts.init(dom, null, { renderer: 'canvas', useDirtyRect: false });

   let colors = ['#00FA9A', '#00CFE8', '#4EF037', '#20B2AA', '#FFD700', '#ff9900'];

  const totalValue = data.values.reduce((sum, v) => sum + v, 0);
  document.getElementById("jinoiy_huquq_chart_total").innerText = `(${totalValue})`;

  const option = {
    textStyle: { fontFamily: "Arial, sans-serif" },
    grid: { bottom: 100, right: 30, left: 70 },
    tooltip: { backgroundColor: 'white' },
    xAxis: {
      type: 'category',
      data: data.labels,
      axisLabel: { interval: 0, rotate: 40, color: '#555' },
      axisLine: { show: false },
      splitLine: { show: false }
    },
    yAxis: {
      type: 'value',
      axisLabel: { color: '#555' },
      axisLine: { show: false },
      splitLine: { show: false }
    },
    series: [{
      type: 'bar',
      data: data.values,
      barMaxWidth: 60,
      itemStyle: {
        color: function(params) {
          return colors[params.dataIndex % colors.length];
        },
        borderRadius: [8, 8, 0, 0]
      },
      label: {
        show: true,
        position: 'top',
        color: '#666',
        fontSize: 14,
        fontWeight: 'bold'
      }
    }]
  };

  myChart.setOption(option);
  window.addEventListener('resize', myChart.resize);
}

/* 🔽 Filter select to‘ldirish */
jinoiyHuquqFilters.forEach(item => {
  $('#jinoiy_huquq_select').append(`<option value="${item.id}">${item.name}</option>`);
});

/* 🔁 Filter o‘zgarsa chart yangilansin */
$('#jinoiy_huquq_select').change(function () {
  const id = $(this).val();
  const selected = jinoiyHuquqDataByFilter[id] || jinoiyHuquqDataByFilter[0];
  jinoiy_huquq_chart(selected);
});

/* 🚀 Dastlab yuklash */
jinoiy_huquq_chart(jinoiyHuquqDataByFilter[0]);



    {/literal}
</script>

{include file="footer.tpl"}