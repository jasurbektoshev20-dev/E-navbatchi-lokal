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
                                <th class="text-center">{$Dict.region}</th>
                                <th class="text-center">{$Dict.distcity}</th>
                                <th class="text-center">{$Dict.type}</th>
                                <th class="text-center">{$Dict.date}</th>
                                <th class="text-center">{$Dict.contingent}</th>
                                <th class="text-center">{$Dict.stand}</th>
                                <th class="text-center">{$Dict.transport}</th>
                                <th class="text-center">{$Dict.masul}</th>
                                <th class="text-center">{$Dict.case_summary}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Events item=Table key=tkey}
                            <tr class="lb" id="row_{$Table.id|crypt}">
                                <td class="text-right">{$tkey+1}</td>
                                <td class="text-center">{$Table.region_id}</td>
                                <td class="text-center">{$Table.distcity_id}</td>
                                <td class="text-center">{$Table.type}</td>
                                <td class="text-center">{$Table.date}</td>
                                <td class="text-center">{$Table.staff_count}</td>
                                <td class="text-center">{$Table.stand}</td>
                                <td class="text-center">{$Table.transport}</td>
                                <td class="text-center">{$Table.responsible}</td>
                                <td class="text-center">{$Table.text}</td>
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
                            <label>{$Dict.distcity}</label>
                            <select class="select form-control" name="distcity_id" id="distcity_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Distcity item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.type}</label>
                            <select required class="select form-control" name="type" id="type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$EventTypes item=Item3 key=ikey3}
                                    <option value="{$Item3.id}">{$Item3.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="date" class="form-label">{$Dict.date}</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="date" />
                        </div>
                        <div class="col-sm-4">
                            <label>{$Dict.contingent}</label>
                            <input required type="number" class="form-control" name="staff_count" id="staff_count" value="">
                        </div>
                        <div class="col-sm-4">
                            <label>{$Dict.stand}</label>
                            <input required type="text" class="form-control" name="stand" id="stand" value="">
                        </div>
                        <div class="col-sm-4">
                            <label>{$Dict.transport}</label>
                            <input required type="text" class="form-control" name="transport" id="transport" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.auto_number}</label>
                            <input required type="number" class="form-control" name="auto_number" id="auto_number" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.masul}</label>
                            <input required type="text" class="form-control" name="responsible" id="responsible" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.event_participants}</label>
                            <input required type="number" class="form-control" name="event_participants" id="event_participants" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.guard_staffs}</label>
                            <input required type="number" class="form-control" name="guard_staffs" id="guard_staffs" value="">
                        </div>
                        <div class="col-sm-12">
                            <label>{$Dict.case_summary}</label>
                            <textarea required class="form-control" rows=4 name="text" id="text"></textarea>
                        </div>
                        <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
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
    const flatpickrDate = document.querySelector('#date');
    if (flatpickrDate) {
        flatpickrDate.flatpickr({
            monthSelectorType: 'static'
        });
    }

    let date;
    $('#date').on('change', function() {
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

        $.get("hrajax.php?act=get_events&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);
            
            $('#region_id').val(sInfo.region_id);
            $('#region_id').trigger("change");
            $('#distcity_id').val(sInfo.distcity_id);
            $('#distcity_id').trigger("change");
            $('#type').val(sInfo.type);
            $('#type').trigger("change");
            $('#date').val(sInfo.date);
            $('#staff_count').val(sInfo.staff_count);
            $('#stand').val(sInfo.stand);
            $('#transport').val(sInfo.transport);
            $('#responsible').val(sInfo.responsible);
            $('#text').val(sInfo.text);
            $('#event_participants').val(sInfo.event_participants);
            $('#auto_number').val(sInfo.auto_number);
            $('#guard_staffs').val(sInfo.guard_staffs);
            $('#id').val(sInfo.id);
        });
    })

    $('#new').click(function() {
        $('#submitModal').modal('toggle');

        $('#region_id').val(0);
        $('#region_id').trigger("change");
        $('#distcity_id').val(0);
        $('#distcity_id').trigger("change");
        $('#type').val(0);
        $('#type').trigger("change");
        $('#date').val("");
        $('#staff_count').val("");
        $('#stand').val("");
        $('#transport').val("");
        $('#responsible').val("");
        $('#text').val("");
        $('#event_participants').val("");
        $('#auto_number').val("");
        $('#guard_staffs').val("");
        $('#id').val(0)
    });

    // Form validation and submit
    const bsValidationForms = $('.needs-validation');
    Array.prototype.slice.call(bsValidationForms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            } else {
                event.preventDefault();
                event.stopPropagation();
                var form_data = new FormData();

                form_data.append('region_id', $('#region_id').val());
                form_data.append('distcity_id', $('#distcity_id').val());
                form_data.append('type', $('#type').val());
                form_data.append('date', $('#date').val());
                form_data.append('staff_count', $('#staff_count').val());
                form_data.append('stand', $('#stand').val());
                form_data.append('transport', $('#transport').val());
                form_data.append('responsible', $('#responsible').val());
                form_data.append('text', $('#text').val());
                form_data.append('event_participants', $('#event_participants').val());
                form_data.append('auto_number', $('#auto_number').val());
                form_data.append('guard_staffs', $('#guard_staffs').val());
                form_data.append('id', $('#id').val());

                $.ajax({
                    url: 'hrajax.php?act=act_events',
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
        $.get("hrajax.php?act=del_events&rowid=" + RowId, function(html) {
            if (html == 0) {
                $("#row_" + RowId).remove();
            }
        });
    });

    {/literal}
</script>

{include file="footer.tpl"}