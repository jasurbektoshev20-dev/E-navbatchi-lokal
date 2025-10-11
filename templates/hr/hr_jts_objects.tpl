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
                                <th class="text-center">{$Dict.structure}</th>
                                <th class="text-center">{$Dict.type}</th>
                                <th class="text-center">{$Dict.name}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Tables item=Table key=tkey}
                            <tr class="lb" id="row_{$Table.id|crypt}">
                                <td class="text-right">{$tkey+1}</td>
                                <td class="text-center">{$Table.structure}</td>
                                <td class="text-center">{$Table.type}</td>
                                <td class="text-center">{$Table.name}</td>
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
                        {if $UserStructure}
                            <div class="col-sm-6">
                                <label>{$Dict.region}</label>
                                <select class="select form-control" name="region_id" id="region_id">
                                    <option value="">{$Dict.choose}</option>
                                    {foreach from=$Regions item=Item key=ikey1}
                                        <option value="{$Item.id}">{$Item.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {/if}
                        <div class="col-sm-6">
                            <label>{$Dict.structure}</label>
                            <select required class="select form-control" name="structure" id="structure">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Structures item=Item key=ikey1}
                                    <option value="{$Item.id}">{$Item.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.object_type}</label>
                            <select required class="select form-control" name="type" id="type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$ObjectTypes item=Item key=ikey1}
                                    <option value="{$Item.id}">{$Item.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.name1}</label>
                            <input required type="text" class="form-control" name="name1" id="name1" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.name2}</label>
                            <input required type="text" class="form-control" name="name2" id="name2" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.name3}</label>
                            <input required type="text" class="form-control" name="name3" id="name3" value="">
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

    $('#region_id').change(function(event) {
        $.ajax({
            type: "GET",
            url: `ajax.php?act=get_distcity_by_id&id=${this.value}`,
            dataType: "json",
            encode: true,
            success: function(data) {
                $("#structure").empty();
                data.forEach(item => { 
                    $("#structure").append(`<option value="${item.id}">${item.name}</option>`);
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

        $.get("hrajax.php?act=get_jts_objects&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);
            
            $('#structure').val(sInfo.structure);
            $('#structure').trigger("change");
            $('#type').val(sInfo.type);
            $('#type').trigger("change");
            $('#name1').val(sInfo.name1);
            $('#name2').val(sInfo.name2);
            $('#name3').val(sInfo.name3);
            $('#id').val(sInfo.id);
        });
    })

    $('#new').click(function() {
        $('#submitModal').modal('toggle');

        $('#structure').val(0);
        $('#structure').trigger("change");
        $('#type').val(0);
        $('#type').trigger("change");
        $('#name1').val("");
        $('#name2').val("");
        $('#name3').val("");
        $('#id').val("");
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

                form_data.append('structure', $('#structure').val());
                form_data.append('type', $('#type').val());
                form_data.append('name1', $('#name1').val());
                form_data.append('name2', $('#name2').val());
                form_data.append('name3', $('#name3').val());
                form_data.append('id', $('#id').val());

                $.ajax({
                    url: 'hrajax.php?act=act_jts_objects',
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
        $.get("hrajax.php?act=del_jts_objects&rowid=" + RowId, function(html) {
            if (html == 0) {
                $("#row_" + RowId).remove();
            }
        });
    });

    {/literal}
</script>

{include file="footer.tpl"}