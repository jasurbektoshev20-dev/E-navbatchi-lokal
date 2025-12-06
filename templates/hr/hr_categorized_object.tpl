{include file="header.tpl"}

<style>
    {literal}
        .table thead th,
        .table tbody td {
            text-transform: none !important;
            font-size: 18px;
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
                    <table class="datatables-projects table table-bordered">
                        <thead>
                            <tr>
                                <th>t/r</th>
                                <th class="text-center">Ҳудуд</th>
                                <th class="text-center">Tuman</th>
                                <th class="text-center">Номи</th>
                                <th class="text-center">Тури</th>
                                <th class="text-center">Uzunlik</th>
                                <th class="text-center">Kenglik</th>
                                <th class="text-center">Obyekt haqida ma'lumot</th>
                                <th class="text-center">Kamera</th>
                                <th class="text-center">Javobgar shaxs</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                         {* <tr class="lb" id="row">
                                    <td class="text-right">1</td>
                                    <td class="text-center">Toshkent</td>
                                    <td class="text-center">Chilonzor</td>     
                                    <td class="text-center">Indoneziya elchixonasi</td>
                                    <td class="text-center">elchixona</td>
                                    <td class="text-center">41234333</td>
                                    <td class="text-center">63452222</td>
                                  <td class="text-center">
                                        <a href="hr.php?act=categorized_object_detail&mid=">
                                            <i class="ti ti-file-description me-1" style="font-size: 30px;"></i>
                                        </a>
                                    </td>

                                    <td class="text-center">
                                        <a href="hr.php?act=categorized_object_camera&mid=">
                                            <i class="ti ti-camera me-1" style="font-size: 30px;"></i>
                                        </a>
                                    </td>

                                    <td class="text-center">
                                        <a href="hr.php?act=categorized_object_responsible&mid=">
                                            <i class="ti ti-user-check me-1" style="font-size: 30px;"></i>
                                        </a>
                                    </td>

                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="" class="dropdown-item delete"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr> *}
                             {foreach from=$Events item=item key=tkey name=name}
                                <tr class="lb" id="row_{$item.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td class="text-center">{$item.region_id}</td>
                                    <td class="text-center">{$item.obj_district}</td>     
                                    <td class="text-center">{$item.obj_name}</td>
                                    <td class="text-center">{$item.obj_type}</td>
                                    <td class="text-center">{$item.obj_lat}</td>
                                    <td class="text-center">{$item.obj_long}</td>
                                    <td class="text-center">
                                         <a href="hr.php?act=categorized_object_detail&mid={$item.id|crypt}">
                                             <i class="ti ti-camera me-1"></i> 
                                        </a>
                                    </td>
                                    <td class="text-center">
                                      <a href="hr.php?act=categorized_object_camera&mid={$item.id|crypt}">
                                           <i class="ti ti-camera me-1"></i> 
                                        </a>
                                   </td>
                                    <td class="text-center">
                                       <a href="hr.php?act=categorized_object_responsible&mid={$item.id|crypt}">
                                          <i class="ti ti-camera me-1"></i> 
                                        </a>
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$item.id|crypt}" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="{$item.id|crypt}" class="dropdown-item delete"
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


<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">

                        <div class="col-sm-4">
                            <label>{$Dict.region}</label>
                            <select required class="select form-control" name="region_id" id="region_id">
                                <option value="1">{$Dict.choose}</option>
                                {foreach from=$Regions item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Tuman</label>
                            <input required type="text" class="form-control" name="district"
                                id="district" value="">
                        </div>

                          <div class="col-sm-4">
                            <label>Obyekt тури</label>
                            <select required class="select form-control" name="obj_type" id="obj_type">
                                <option value="1">{$Dict.choose}</option>
                                {foreach from=$EventTypes item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.obj_type}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>номи</label>
                            <input required type="text" class="form-control" name="obj_name" id="obj_name" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Uzunlik (lat)</label>
                            <input required type="text" class="form-control" name="obj_lat" id="obj_lat"  value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Kenglik (long)</label>
                            <input required type="text" class="form-control" name="obj_long" id="obj_long"  value="">
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

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
<script src="https://unpkg.com/imask"></script>

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

            $.get("hrajax.php?act=get_events&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#region_id').val(sInfo.region_id);
                $('#region_id').trigger("change");
                $('#district').val(sInfo.district);
                $('#obj_lat').val(sInfo.obj_lat);
                $('#obj_long').val(sInfo.obj_long);
                $('#obj_name').val(sInfo.obj_name);
                $('#obj_type').val(sInfo.obj_type);
                $('#obj_type').trigger("change");

    
                $('#id').val(sInfo.id);
            });
        })

        $('#new').click(function() {
            $('#submitModal').modal('toggle');
            $('#region_id').val(0);
            $('#region_id').trigger("change");
            $('#district').val('');
            $('#obj_long').val('');
            $('#obj_lat').val('');
            $('#obj_name').val('');
            $('#obj_type').val(0);
            $('#obj_type').trigger("change");

            $('#id').val(0)
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
                    form_data.append('obj_type', $('#obj_type').val());
                    form_data.append('district', $('#district').val());
                    form_data.append('obj_lat', $('#obj_lat').val());
                    form_data.append('obj_long', $('#obj_long').val());
                    form_data.append('obj_name', $('#obj_name').val());
                   
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