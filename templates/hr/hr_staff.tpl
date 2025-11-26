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
                                <th class="text-center">{$Dict.photo}</th>
                                <th class="text-center">{$Dict.lastname}</th>
                                <th class="text-center">{$Dict.firstname}</th>
                                <th class="text-center">{$Dict.username}</th>
                                <th class="text-center">{$Dict.phone}</th>
                                {* <th class="text-center">{$Dict.role}</th>
                                <th class="text-center">{$Dict.position}</th> *}
                                <th class="text-center">{$Dict.rank}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Staffs item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td>{$Table.structure}</td>
                                    <td class="text-center">
                                        {if $Table.photo neq ""}
                                            <img src="/pictures/staffs/{$Table.photo}" height="50" class="Thumb">
                                        {else}
                                            <img src="/assets/images/nophoto2.png" height="28" class="Thumb">
                                        {/if}
                                    </td>
                                    <td>{$Table.lastname}</td>
                                    <td>{$Table.firstname}</td>
                                    <td>{$Table.username}</td>
                                    <td>{$Table.phone}</td>
                                    {* <td>{$Table.role_name}</td>
                                    <td>{$Table.position}</td> *}
                                    <td>{$Table.rank}</td>
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
                            <label>{$Dict.region}</label>
                            <select required class="select form-control" name="region_id" id="region_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=Item6 key=ikey6}
                                    <option value="{$Item6.id}">{$Item6.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.territorial_short}</label>
                            <select id="structure_id" class="form-select">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Structures item=obj}
                                    <option value="{$obj.id}">{$obj.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        {* <div class="col-6">
                            <label>{$Dict.role}</label>
                            <select required class="select form-control" name="role" id="role">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Roles item=Item6 key=ikey6}
                                    <option value="{$Item6.id}">{$Item6.name}</option>
                                {/foreach}
                            </select>
                        </div> *}
                        {* <div class="col-6">
                            <label>{$Dict.position}</label>
                            <select required class="select form-control" name="position_id" id="position_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$HrPositions item=Item6 key=ikey6}
                                    <option value="{$Item6.id}">{$Item6.name}</option>
                                {/foreach}
                            </select>
                        </div> *}
                        <div class="col-6">
                            <label>{$Dict.rank}</label>
                            <select required class="select form-control" name="rank_id" id="rank_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$RefRanks item=Item6 key=ikey6}
                                    <option value="{$Item6.id}">{$Item6.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-6">
                            <label>{$Dict.lastname}</label>
                            <input required type="text" class="form-control" name="lastname" id="lastname" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.firstname}</label>
                            <input required type="text" class="form-control" name="firstname" id="firstname" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.surname}</label>
                            <input type="text" class="form-control" name="surname" id="surname" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.phone}</label>
                            <input required type="text" class="form-control" name="phone" id="phone" value="">
                        </div>
                        {* <div class="col-6">
                            <label>{$Dict.username}</label>
                            <input type="text" class="form-control" name="username" id="username" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.password}</label>
                            <input type="text" class="form-control" name="password" id="password" value="">
                        </div> *}
                        <div class="col-12">
                            <label class="form-label">{$Dict.choose_file}</label>
                            <div action="/upload" class="dropzone needsclick" id="staff-photo">
                                <div class="dz-message needsclick">
                                    {$Dict.drop_file}
                                </div>
                                <div class="fallback">
                                    <input name="file" type="file" />
                                </div>
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <input type="hidden" name="photo" id="photo" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"
                                aria-label="Close">
                                {$Dict.cancel}
                            </button>
                            <button type="submit" id="submit" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
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
    var dict_choose = "{$Dict.choose}";
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

        // Filtering
        $('#region_id').change(function(event) {
            $.get("ajax.php?act=get_divisions&structure_id=" + this.value, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#structure_id').empty();
                $('#structure_id').append(`<option value="">${dict_choose}</option>`);
                sInfo.forEach((item, index) => {
                    $('#structure_id').append(`<option value="${item.id}">${item.name}</option>`);
                });
            });
        });

        $('#new').click(function() {
            $('#submitModal').modal('toggle');
            $('#region_id').val(0);
            $('#region_id').trigger("change");
            $('#structure_id').val(0);
            $('#structure_id').trigger("change");
            // $('#role').val(0);
            // $('#role').trigger("change");
            // $('#position_id').val(0);
            // $('#position_id').trigger("change");
            $('#rank_id').val(0);
            $('#rank_id').trigger("change");
            $('#lastname').val("");
            $('#firstname').val("");
            $('#surname').val("");
            $('#phone').val("");
            // $('#username').val("");
            // $('#password').val("");
        });

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');

            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=get_staffs&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#id').val(sInfo.id);
                $('#region_id').val(sInfo.structure_id);
                $('#structure_id').val(sInfo.structure_id);
                // $('#role').val(sInfo.role_id);
                // $('#position_id').val(sInfo.position_id);
                $('#rank_id').val(sInfo.rank_id);
                $('#lastname').val(sInfo.lastname);
                $('#firstname').val(sInfo.firstname);
                $('#surname').val(sInfo.surname);
                $('#phone').val(sInfo.phone);
                $('#username').val(sInfo.username);
                $('#photo').val(sInfo.photo);
                // $('#password').val(sInfo.password);
            });
        })


        const previewTemplate = `
            <div class="dz-preview dz-file-preview">
                <div class="dz-details">
                    <div class="dz-thumbnail">
                        <img data-dz-thumbnail>
                        <span class="dz-nopreview">No preview</span>
                        <div class="dz-success-mark"></div>
                        <div class="dz-error-mark"></div>
                        <div class="dz-error-message"><span data-dz-errormessage></span></div>
                        <div class="progress">
                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100" data-dz-uploadprogress></div>
                        </div>
                    </div>
                    <div class="dz-filename" data-dz-name></div>
                    <div class="dz-size" data-dz-size></div>
                </div>
            </div>
        `;

        const dropzoneBasic = document.querySelector('#staff-photo');
        var myDropzone = new Dropzone(dropzoneBasic, {
            previewTemplate: previewTemplate,
            parallelUploads: 1,
            maxFilesize: 5000,
            addRemoveLinks: true,
            maxFiles: 1,
            acceptedFiles: 'image/*',
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
                    form_data.append('id', $('#id').val());
                    
                    if ($('#structure_id').val() == 0) {
                        form_data.append('structure_id', $('#region_id').val());
                    } else {
                        form_data.append('structure_id', $('#structure_id').val() || $('#region_id').val());
                    }

                    // form_data.append('role', $('#role').val());
                    // form_data.append('position_id', $('#position_id').val());
                    form_data.append('rank_id', $('#rank_id').val());
                    form_data.append('lastname', $('#lastname').val());
                    form_data.append('firstname', $('#firstname').val());
                    form_data.append('surname', $('#surname').val());
                    form_data.append('phone', $('#phone').val());
                    // form_data.append('username', $('#username').val());
                    // form_data.append('password', $('#password').val());

                    if (myDropzone.files.length > 0) {
                        myDropzone.files.forEach(function(file, index) {
                            form_data.append('photo', file);
                        });
                    } else {
                        form_data.append('photo', $('#photo').val());
                    }

                    $.ajax({
                        url: 'hrajax.php?act=act_staffs',
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
            $.get("hrajax.php?act=del_staffs&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });

    {/literal}
</script>

{include file="footer.tpl"}