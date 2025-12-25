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
                    <h4>Obyekt haqida ma'lumot</h4>
                    {* <button id="new" type="button" class="btn btn-primary waves-effect waves-light"
                        data-bs-toggle="submitModal" data-bs-target="#modal">
                        <i class="menu-icon tf-icons ti ti-plus"></i>{$Dict.adding}
                    </button> *}
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
                                <th class="text-center">Номи</th>
                                <th class="text-center">Пост телефон рақами</th>
                                <th class="text-center">Расм</th>
                                <th class="text-center">Манзили</th>
                                <th class="text-center">Ҳудудий бўлинма</th>
                                <th class="text-center">Масъул раҳбар</th>
                                <th class="text-center">Бўлинма телефон рақами</th>
                                <th class="text-center">Профилактика инспектори</th>
                                <th class="text-center">Телефон</th>
                                <th class="text-center">Ҳудудий ИИБ</th>
                                <th class="text-center">ИИБ телефон рақами</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$embassy_object item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                 <td class="text-right">{$tkey+1}</td>
                                 <td class="text-center">{$Table.name}</td>
                                <td class="text-center">{$Table.post_phone}</td>
                               <td class="text-center">
                                    {if isset($Table.photo) && $Table.photo|trim neq ""}
                                        <img src="/pictures/embassy/{$Table.photo}"
                                            style="width:50px;height:50px;object-fit:cover;">
                                    {else}
                                        <img src="/assets/images/german_flag.png"
                                            style="width:50px;height:50px;object-fit:cover;">
                                    {/if}
                                </td>
                                                                <td class="text-center">{$Table.address}</td>
                                <td class="text-center">{$Table.structure_name}</td>
                                <td class="text-center">{$Table.responsible}</td>
                                <td class="text-center">{$Table.military_unit_phone}</td>
                                <td class="text-center">{$Table.iiv_inspector}</td>
                                <td class="text-center">{$Table.iiv_inspector_phone}</td>
                                <td class="text-center">{$Table.iiv_unit}</td>
                                <td class="text-center">{$Table.iiv_unit_phone}</td>
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
     <div class="row">
        <div class="col-12 mt-3">
            <button type="button" class="btn btn-primary waves-effect waves-light" onclick="window.history.back()"
            >
                Ортга
            </button>
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
                            <label>Пост телефон рақами</label>
                            <input required type="text" class="form-control" name="post_phone" id="post_phone" value="">
                        </div>

                        <div class="col-sm-6">
                            <label>Манзили</label>
                            <input required type="text" class="form-control" name="obj_address" id="obj_address" value="">
                        </div>
                      
                         <div class="col-sm-6">
                            <label>Ҳудудий бўлинмалар</label>
                            <select required class="select form-control" name="structure_id" id="structure_id">
                                <option value="">{$Dict.choose}</option>
                                 {foreach from=$staffs item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
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
                            <label>Бўлинма телефон рақами</label>
                            <input required type="number" class="form-control" name="structure_phone" id="structure_phone" value="">
                        </div>

                          <div class="col-sm-6">
                            <label>Профилактика инспектори</label>
                            <input required type="text" class="form-control" name="prevention_inspector" id="prevention_inspector" value="">
                        </div>

                        <div class="col-sm-6">
                            <label>Телефон рақами</label>
                            <input required type="number" class="form-control" name="inspector_phone" id="inspector_phone" value="">
                        </div>
                    
                        <div class="col-sm-6">
                            <label>Ҳудудий ИИБ</label>
                            <input required type="text" class="form-control" name="territorial_iib" id="territorial_iib" value="">
                        </div>

                        <div class="col-sm-6">
                            <label>Телефон рақами</label>
                            <input required type="number" class="form-control" name="iib_phone" id="iib_phone" value="">
                        </div>
                        <div class="col-12">
                            <label class="form-label">{$Dict.choose_file}</label>
                            <div action="/upload" class="dropzone needsclick" id="obj-foto">
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
    
            $('#structure_id').val(sInfo.structure_id).trigger("change");
            $('#responsible_id').val(sInfo.responsible_id);
            $('#responsible_id').trigger("change");
            $('#post_phone').val(sInfo.post_phone);
            $('#obj_address').val(sInfo.obj_address);
            $('#structure_phone').val(sInfo.structure_phone);
            $('#prevention_inspector').val(sInfo.prevention_inspector);
            $('#inspector_phone').val(sInfo.inspector_phone);
            $('#territorial_iib').val(sInfo.territorial_iib);
            $('#iib_phone').val(sInfo.iib_phone);
            $('#photo').val(sInfo.photo);

            $('#id').val(sInfo.id);
        });
    });

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

        const dropzoneBasic = document.querySelector('#obj-foto');
        var myDropzone = new Dropzone(dropzoneBasic, {
            previewTemplate: previewTemplate,
            parallelUploads: 1,
            maxFilesize: 5000,
            addRemoveLinks: true,
            maxFiles: 1,
            acceptedFiles: 'image/*',
        });

    $('#new').click(function() {
        $('#submitModal').modal('toggle');
        $('#region_id').val(0);
        $('#region_id').trigger("change");
        $('#structure_id').val(0);
        $('#structure_id').trigger("change");
         $('#responsible_id').val(0);
         $('#post_phone').val('');
         $('#structure_phone').val('');
         $('#prevention_inspector').val('');
         $('#inspector_phone').val('');
         $('#territorial_iib').val('');
         $('#iib_phone').val('');
         $('#obj_address').val('');
        $('#responsible_id').trigger("change");
        $('#id').val(0)
    });

    // Form validation and submit
        $('#SubButtonHrSetMarker').on('click', function(event) {
                event.preventDefault();
                event.stopPropagation();
                var form_data = new FormData();
                form_data.append('structure_id', $('#structure_id').val() || $('#region_id').val());
                form_data.append('responsible_id', $('#responsible_id').val());
                form_data.append('post_phone', $('#post_phone').val());
                form_data.append('structure_phone', $('#structure_phone').val());
                form_data.append('prevention_inspector', $('#prevention_inspector').val());
                form_data.append('inspector_phone', $('#inspector_phone').val());
                form_data.append('territorial_iib', $('#territorial_iib').val());
                form_data.append('iib_phone', $('#iib_phone').val());
                form_data.append('obj_address', $('#obj_address').val());
                form_data.append('id', $('#id').val());
                if (myDropzone.files.length > 0) {
                    myDropzone.files.forEach(function(file, index) {
                        form_data.append('photo', file);
                    });
                } else {
                    form_data.append('photo', $('#photo').val());
                }

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