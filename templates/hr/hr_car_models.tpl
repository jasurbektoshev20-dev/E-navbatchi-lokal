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
                                <th>т/р</th>
                                <th>{$Dict.name}</th>
                                <th>{$Dict.photo}</th>
                                <th>{$Dict.width}</th>
                                <th>{$Dict.height}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$RefCarModels item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td>{$tkey+1}</td>
                                    <td>{$Table.name}</td>
                                    <td>
                                        {if $Table.photo neq ""}
                                            <img src="/pictures/cars/{$Table.photo}" height="50">
                                        {else}
                                            <img src="assets/images/no_img.png" height="28">
                                        {/if}
                                    </td>
                                    <td>{$Table.car_width}</td>
                                    <td>{$Table.car_height}</td>
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
                <div class="row g-3">
                    <div class="col-12">
                        <label>{$Dict.name}</label>
                        <input type="text" class="form-control" name="name" id="name" value="">
                    </div>
                    <div class="col-4">
                        <label>{$Dict.width}</label>
                        <input type="number" class="form-control" name="car_width" id="car_width" value="">
                    </div>
                    <div class="col-4">
                        <label>{$Dict.height}</label>
                        <input type="number" class="form-control" name="car_height" id="car_height" value="">
                    </div>
                    <div class="col-4">
                        <label>{$Dict.keyword}</label>
                        <input type="text" class="form-control" name="key" id="key" value="">
                    </div>
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
                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
                            {$Dict.cancel}
                        </button>
                        <button type="submit" id="submit" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--/ Edit Modal -->

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>

<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"

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
        $.get("hrajax.php?act=del_car_models&rowid=" + RowId, function(html) {
            if (html == 0) {
                $("#row_" + RowId).remove();
            }
        });
    });

    $('#new').click(function() {
        $('#submitModal').modal('toggle');

        $('#id').val(0);
        $('#name').val("");
        $('#photo').val("");
        $('#car_width').val("");
        $('#car_height').val("");
    });

    $('.datatables-projects tbody').on('click', '.editAction', function() {
        $('#submitModal').modal('toggle');

        var RowId = $(this).attr('rel');
        $.get("hrajax.php?act=get_car_models&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);

            $('#id').val(sInfo.id);
            $('#name').val(sInfo.name);
            $('#photo').val(sInfo.key);
            $('#car_width').val(sInfo.car_width);
            $('#key').val(sInfo.photo);
            $('#car_height').val(sInfo.car_height);
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

    $('#submit').on('click', function() {
        var form_data = new FormData();

        form_data.append('id', $('#id').val());
        form_data.append('name', $('#name').val());
        form_data.append('car_width', $('#car_width').val());
        form_data.append('car_height', $('#car_height').val());
        form_data.append('key', $('#key').val());

        if (myDropzone.files.length > 0) {
            myDropzone.files.forEach(function(file, index) {
                form_data.append('photo', file);
            });
        } else {
            form_data.append('photo', $('#photo').val());
        }

        $.ajax({
            url: 'hrajax.php?act=act_car_models',
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
    });

    {/literal}
</script>

{include file="footer.tpl"}