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
                                <th>ID</th>
                                <th>{$Dict.parent}</th>
                                <th>{$Dict.name}</th>
                                <th>{$Dict.shortname}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Tables item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td>{$Table.id}</td>
                                    <td>{$Table.parent}</td>
                                    <td>{$Table.name}</td>
                                    <td>{$Table.shortname}</td>
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
                        <div class="col-6">
                            <label for="id" class="form-label">{$Dict.id}</label>
                            <input required type="number" class="form-control" id="id" />
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.parent}</label>
                            <select required class="select form-control" name="parent" id="parent">
                                <option value="0">{$Dict.choose}</option>
                                {foreach from=$Regions item=Item key=ikey1}
                                    <option value="{$Item.id}">{$Item.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-6">
                            <label for="name1" class="form-label">{$Dict.name1}</label>
                            <input required type="text" class="form-control" id="name1" />
                        </div>
                        <div class="col-6">
                            <label for="name2" class="form-label">{$Dict.name2}</label>
                            <input required type="text" class="form-control" id="name2" />
                        </div>
                        <div class="col-6">
                            <label for="name3" class="form-label">{$Dict.name3}</label>
                            <input required type="text" class="form-control" id="name3" />
                        </div>
                        <div class="col-6">
                            <label for="shortname1" class="form-label">{$Dict.shortname1}</label>
                            <input required type="text" class="form-control" id="shortname1" />
                        </div>
                        <div class="col-6">
                            <label for="shortname2" class="form-label">{$Dict.shortname2}</label>
                            <input required type="text" class="form-control" id="shortname2" />
                        </div>
                        <div class="col-6">
                            <label for="shortname3" class="form-label">{$Dict.shortname3}</label>
                            <input required type="text" class="form-control" id="shortname3" />
                        </div>
                        <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
                                {$Dict.cancel}
                            </button>
                            <button id="submit" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--/ Edit Modal -->

<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
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
    var RegDyn = "{$RegDyn}"

    {literal}
        var dt_basic_table = $('.datatables-projects'),
            dt_basic;

        // DataTable with buttons
        if (dt_basic_table.length) {
            dt_basic = dt_basic_table.DataTable({
                displayLength: 10,
                lengthMenu: [5, 10, 25, 50, 75, 100, 1000]
            });
        }

        // Delete Record
        $('.datatables-projects tbody').on('click', '.delete', function() {
            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=del_structure&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });

        $('#new').click(function() {
            $('#submitModal').modal('toggle');

            $('#id').val("");
            $('#parent').val(0);
            $('#parent').trigger("change");
            $('#name1').val("");
            $('#name2').val("");
            $('#name3').val("");
            $('#shortname1').val("");
            $('#shortname2').val("");
            $('#shortname3').val("");
        });

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');

            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=get_structure&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#id').val(sInfo.id);
                $('#parent').val(sInfo.parent);
                $('#parent').trigger("change");
                $('#name1').val(sInfo.name1);
                $('#name2').val(sInfo.name2);
                $('#name3').val(sInfo.name3);
                $('#shortname1').val(sInfo.shortname1);
                $('#shortname2').val(sInfo.shortname2);
                $('#shortname3').val(sInfo.shortname3);
            });
        })

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

                    form_data.append('id', $('#id').val());
                    form_data.append('parent', $('#parent').val());
                    form_data.append('name1', $('#name1').val());
                    form_data.append('name2', $('#name2').val());
                    form_data.append('name3', $('#name3').val());
                    form_data.append('shortname1', $('#shortname1').val());
                    form_data.append('shortname2', $('#shortname2').val());
                    form_data.append('shortname3', $('#shortname3').val());

                    $.ajax({
                        url: 'hrajax.php?act=act_structure',
                        dataType: 'text',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data,
                        type: 'post',
                        success: function(resdata) {
                            //console.log(resdata);
                            var NewArray = resdata.split("<&sep&>");
                            if (NewArray[0] == 0) {
                                location.reload();
                            }
                        }
                    });
                    
                }
                form.classList.add('was-validated');
            });
        });

    {/literal}
</script>

{include file="footer.tpl"}