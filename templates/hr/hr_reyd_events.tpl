{include file="header.tpl"}

<style>
    {literal}
        .table thead th,
        .table tbody td {
            text-transform: none !important;
            font-size: 16px;
        }

        .dt-buttons {
            gap: 10px;
            margin-left: 20px;
        }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <!--/ Card Border Shadow -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex" style="justify-content: space-between;">
                    <h4>{$ThisMenu.name}</h4>
                    <button id="new" type="button" class="btn btn-primary waves-effect waves-light"
                        data-bs-toggle="submitModal" data-bs-target="#modal">
                        <i class="menu-icon tf-icons ti ti-plus"></i>{$Dict.adding}
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top">
                        <thead>
                            <tr>
                                <th>No̱</th>
                                {* <th class="text-center">{$Dict.region}</th> *}
                                <th class="text-center">{$Dict.structure}</th>
                                <th class="text-center">{$Dict.responsible}</th>
                                <th class="text-center">{$Dict.staff}</th>
                                <th class="text-center">Бошланиш вақти</th>
                                <th class="text-center">Тугаш вақти</th>
                                <th class="text-center">Техника сони</th>
                                <th class="text-center">Асосий</th>
                                <th class="text-center">Тури</th>
                                <th class="text-center">Холат ҳақида қисқача</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Events item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                <td class="text-right">{$tkey+1}</td>
                                {* <td class="text-center">{$Table.region_id}</td> *}
                                <td class="text-center">{$Table.structure_name}</td>
                                <td class="text-center">{$Table.responsible_name}</td>
                                <td class="text-center">{$Table.staff_count}</td>
                                <td class="text-center">{$Table.start_date}</td>
                                <td class="text-center">{$Table.end_date}</td>
                                <td class="text-center">{$Table.vehicles_count}</td>
                                <td class="text-center">{$Table.type}</td>
                                <td class="text-center">{$Table.exercises_type}</td>
                                <td class="text-center">{$Table.description}</td>
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a rel="{$Table.id|crypt}" class="dropdown-item editAction"
                                                href="javascript:void(0);"><i
                                                    class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
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
        </div>
        <!--/ Projects table -->
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
                            <label>Hududiy bo'linmalar</label>
                            <select required class="select form-control" name="structure_id" id="structure_id">
                                <option value="">{$Dict.choose}</option>
                            </select>
                        </div>

                        <div class="col-sm-6">
                            <label>{$Dict.masul}</label>
                            <select required class="select form-control" name="responsible_id" id="responsible_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$staffs item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name} {$Item1.lastname} {$Item1.firstname}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.contingent}</label>
                            <input required type="number" class="form-control" name="staff_count" id="staff_count" value="">
                        </div>
                        <div class="col-sm-6">
                            <label for="start_date" class="form-label">Бошланиш вақти</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="start_date" />
                        </div>
                          <div class="col-sm-6">
                            <label for="end_date" class="form-label">Тугаш вақти</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="end_date" />
                        </div>

                         <div class="col-sm-6">
                            <label>Техника сони</label>
                            <input required type="number" class="form-control" name="vehicles_count" id="vehicles_count" value="">
                        </div>

                        <div class="col-sm-6">
                            <label>Асосий</label>
                            <select required class="select form-control" name="type" id="type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$types item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name1}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>Машқ тури</label>
                            <select required class="select form-control" name="exercises_type" id="exercises_type">
                                <option value="">{$Dict.choose}</option>
                                <option value="Қуролдан отиш">Қуролдан отиш</option>
                                <option value="Танкда отиш">Танкда отиш</option>
                            </select>
                        </div>
                          <div class="col-sm-12">
                            <label>{$Dict.case_summary}</label>
                            <textarea required class="form-control" rows=4 name="description" id="description"></textarea>
                        </div>   
                        <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
                                {$Dict.cancel}
                            </button>
                            <button id="SubButtonHrSetMarker" type="button" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--/ Edit Modal -->

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
    {literal}

    const flatpickrDate = document.querySelector('#start_date');
    if (flatpickrDate) {
        flatpickrDate.flatpickr({
           enableTime: true,
            dateFormat: "Y-m-d H:i",
            time_24hr: true,
            monthSelectorType: 'static'
        });
    }

    let start_date;
    $('#start_date').on('change', function() {
        let [datePart, timePart] = this.value.split(' ');
        let [day, month, year] = datePart.split('-');

        start_date = `${year}-${month}-${day} ${timePart}`;
    });


     const flatpickrEndDate = document.querySelector('#end_date');
    if (flatpickrEndDate) {
        flatpickrEndDate.flatpickr({
            enableTime: true,
            dateFormat: "Y-m-d H:i",
            time_24hr: true,
            monthSelectorType: 'static'
        });
    }

    let end_date;
    $('#end_date').on('change', function() {
        let [datePart, timePart] = this.value.split(' ');
        let [day, month, year] = datePart.split('-');

        end_date = `${year}-${month}-${day} ${timePart}`;
    });



    
    $('#region_id').change(function(event) {
        $.get("ajax.php?act=get_divisions&structure_id=" + this.value, function(html) {
            var sInfo = jQuery.parseJSON(html);
            $('#structure_id').empty();
            $('#structure_id').append(`<option value="">Танланг</option>`);
            sInfo.forEach((item, index) => {
                $('#structure_id').append(`<option value="${item.id}">${item.name}</option>`);
            });
        });
    });



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
       
        $.get("hrajax.php?act=get_reyd_events&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);
             console.log('sinfo: ', sInfo)
            // $('#region_id').val(sInfo.region_id);
            // $('#region_id').trigger("change");
            $('#structure_id').val(sInfo.structure_id).trigger("change");
            $('#responsible_id').val(sInfo.responsible_id);
            $('#responsible_id').trigger("change");
            $('#type').val(sInfo.type);
            $('#type').trigger("change");
            $('#exercises_type').val(sInfo.exercises_type);
            $('#exercises_type').trigger("change");
            $('#start_date').val(sInfo.start_date);
            $('#end_date').val(sInfo.end_date);
            $('#staff_count').val(sInfo.staff_count);
            $('#vehicles_count').val(sInfo.vehicles_count);
            $('#responsible').val(sInfo.responsible);
            $('#description').val(sInfo.description);
            $('#id').val(sInfo.id);
        });
    })

    $('#new').click(function() {
        $('#submitModal').modal('toggle');
        $('#region_id').val(0);
        $('#region_id').trigger("change");
        $('#structure_id').val(0);
        $('#structure_id').trigger("change");
         $('#responsible_id').val(0);
        $('#responsible_id').trigger("change");
         $('#type').val(0);
        $('#type').trigger("change");
         $('#exercises_type').val(0);
        $('#exercises_type').trigger("change");
        $('#start_date').val("");
        $('#end_date').val("");
        $('#staff_count').val("");
        $('#vehicles_count').val("");
        $('#description').val("");
        $('#id').val(0)
    });

    // Form validation and submit
        $('#SubButtonHrSetMarker').on('click', function(event) {
                event.preventDefault();
                event.stopPropagation();
                var form_data = new FormData();
                form_data.append('structure_id', $('#structure_id').val() || $('#region_id').val());
                form_data.append('responsible_id', $('#responsible_id').val());
                form_data.append('type', $('#type').val());
                form_data.append('exercises_type', $('#exercises_type').val());
                form_data.append('start_date', $('#start_date').val());
                form_data.append('end_date', $('#end_date').val());
                form_data.append('staff_count', $('#staff_count').val());
                form_data.append('vehicles_count', $('#vehicles_count').val());
                form_data.append('description', $('#description').val());
                form_data.append('id', $('#id').val());

                $.ajax({
                    url: 'hrajax.php?act=act_reyd_events',
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
        });

        
    // Delete Record
    $('.datatables-projects tbody').on('click', '.delete', function() {
        var RowId = $(this).attr('rel');
        $.get("hrajax.php?act=del_reyd_events&rowid=" + RowId, function(html) {
            if (html == 0) {
                $("#row_" + RowId).remove();
            }
        });
    });

    {/literal}
</script>

{include file="footer.tpl"}