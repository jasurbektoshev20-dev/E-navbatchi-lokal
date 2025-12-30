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
        .search-dropdown {
            position: absolute;
            width: 100%;
            background: #0f172a;
            border: 1px solid rgba(0,255,136,.3);
            border-radius: 10px;
            max-height: 220px;
            overflow-y: auto;
            list-style: none;
            padding: 0;
            margin-top: 4px;
            z-index: 9999;
            display: none;
        }

        .search-dropdown li {
        padding: 8px 12px;
        cursor: pointer;
        color: #eaffea;
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
                                <th>т/р</th>
                                <th class="text-center">Ҳудуд</th>
                                <th class="text-center">Туман</th>
                                <th class="text-center">Номи</th>
                                <th class="text-center">Тури</th>
                                {* <th class="text-center">Uzunlik</th>
                                <th class="text-center">Kenglik</th> *}
                                <th class="text-center">Объект ҳақида маълумот</th>
                                <th class="text-center">Камера</th>
                                <th class="text-center">Жавобгар шахс</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        
                             {foreach from=$embassy_objects item=item key=tkey name=name}
                                <tr class="lb" id="row_{$item.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td class="text-center">{$item.structure_name}</td>
                                    <td class="text-center">{$item.district}</td>     
                                    <td class="text-center">{$item.name}</td>
                                    <td class="text-center">{$item.type_name}</td>
                                    {* <td class="text-center">{$item.lat}</td>
                                    <td class="text-center">{$item.long}</td> *}
                                  <td class="text-center">
                                        <a href="hr.php?act=categorized_object_detail&mid={$item.id}">
                                            <i class="ti ti-file-description me-1" style="font-size: 28px;"></i>
                                        </a>
                                    </td>

                                    <td class="text-center">
                                        <a href="hr.php?act=categorized_object_camera&mid={$item.id}">
                                            <i class="ti ti-camera me-1" style="font-size: 28px;"></i>
                                        </a>
                                    </td>

                                    <td class="text-center">
                                        <a href="hr.php?act=categorized_object_responsible&mid={$item.id}">
                                            <i class="ti ti-user-shield me-1" style="font-size: 28px;"></i>
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
                            <label>Ҳудудий бўлинма</label>
                            <select class="select form-control" name="structure_id" id="structure_id">
                                <option value="">{$Dict.choose}</option>
                                 {foreach from=$units item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.structure_name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Туман</label>
                            <input required type="text" class="form-control" name="district"
                                id="district" value="">
                        </div>

                          <div class="col-sm-4">
                            <label>Объект тури</label>
                            <select required class="select form-control" name="obj_type" id="obj_type">
                                <option value="1">{$Dict.choose}</option>
                                {foreach from=$types item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.type_name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Номи</label>
                            <input required type="text" class="form-control" name="obj_name" id="obj_name" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Узунлик (lat)</label>
                            <input required type="text" class="form-control" name="obj_lat" id="obj_lat"  value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Кенглик (long)</label>
                            <input required type="text" class="form-control" name="obj_long" id="obj_long"  value="">
                        </div>



                          <div class="col-sm-4">
                            <label>Пост телефон рақами</label>
                            <input required type="text" class="form-control phone-mask" name="post_phone" id="post_phone" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Манзили</label>
                            <input required type="text" class="form-control" name="obj_address" id="obj_address" value="">
                        </div>
                      
                     

                        {* <div class="col-sm-4">
                            <label>{$Dict.masul}</label>
                            <select class="select form-control" name="responsible_id" id="responsible_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$troops item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.troop_name}</option>
                                {/foreach}
                            </select>
                        </div> *}
                         <div class="col-sm-6 position-relative" id="responsible-wrapper">
                            <label>{$Dict.masul}</label>

                            <!-- Qidiruv input -->
                            <input
                                type="text"
                                id="responsible_search"
                                class="form-control mb-1"
                                placeholder="Жавобгарни қидиринг..."
                                autocomplete="off"
                            >

                            <!-- 🟢 Asl select (yashirin) -->
                            <select id="responsible_id" class="form-select d-none">
                                <option value="">{$Dict.choose}</option>
                              {foreach from=$troops item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.troop_name}</option>
                                {/foreach}
                            </select>

                            <!-- 🔽 Dropdown list -->
                            <ul id="responsible_list" class="search-dropdown"></ul>
                        </div>

                         <div class="col-sm-4">
                            <label>Бўлинма телефон рақами</label>
                            <input required type="text" class="form-control phone-mask" name="structure_phone" id="structure_phone" value="">
                        </div>

                          <div class="col-sm-4">
                            <label>Профилактика инспектори</label>
                            <input required type="text" class="form-control" name="prevention_inspector" id="prevention_inspector" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефон рақами</label>
                            <input required type="text" class="form-control phone-mask" name="inspector_phone" id="inspector_phone" value="">
                        </div>
                    
                        <div class="col-sm-4">
                            <label>Ҳудудий ИИБ</label>
                            <input required type="text" class="form-control" name="territorial_iib" id="territorial_iib" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефон рақами</label>
                            <input required type="text" class="form-control phone-mask" name="iib_phone" id="iib_phone" value="">
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

        document.querySelectorAll('.phone-mask').forEach(input => {
            const mask = IMask(input, {
                mask: '00 000-00-00'
            });

            // default holatda +998 turishi uchun
          
        });

           const responsibleSelect = document.getElementById('responsible_id');
            const responsibleSearch = document.getElementById('responsible_search');
            const responsibleList   = document.getElementById('responsible_list');

            // select → array
            const responsibles = Array.from(responsibleSelect.options)
            .filter(o => o.value)
            .map(o => ({ id: o.value, name: o.text }));

            function renderResponsible(list) {
            responsibleList.innerHTML = '';

            if (!list.length) {
                responsibleList.style.display = 'none';
                return;
            }

            list.forEach(item => {
                const li = document.createElement('li');
                li.textContent = item.name;

                li.onclick = () => {
                responsibleSearch.value = item.name;
                responsibleSelect.value = item.id;

                // 🔥 agar change event ishlatilsa
                responsibleSelect.dispatchEvent(new Event('change'));

                responsibleList.style.display = 'none';
                };

                responsibleList.appendChild(li);
            });

            responsibleList.style.display = 'block';
            }

            // 🔍 inputda yozilganda
            responsibleSearch.addEventListener('input', function () {
            const val = this.value.toLowerCase();

            if (!val) {
                responsibleSelect.value = '';
                responsibleList.style.display = 'none';
                return;
            }

            renderResponsible(
                responsibles.filter(r => r.name.toLowerCase().includes(val))
            );
            });

            // 🔹 focus bo‘lsa hammasi chiqadi
            responsibleSearch.addEventListener('focus', function () {
            renderResponsible(responsibles);
            });

            // 🔹 tashqariga bosilsa yopiladi
            document.addEventListener('click', e => {
            if (!document.getElementById('responsible-wrapper').contains(e.target)) {
                responsibleList.style.display = 'none';
            }
            });


        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');
            var RowId = $(this).attr('rel');

            $.get("hrajax.php?act=get_embassy_objects&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#district').val(sInfo.district);
                $('#obj_lat').val(sInfo.lat);
                $('#obj_long').val(sInfo.long);
                $('#obj_name').val(sInfo.name);
                $('#obj_type').val(sInfo.type_id);
                $('#obj_type').trigger("change");
                $('#structure_id').val(sInfo.structure_id).trigger("change");
                // $('#responsible_id').val(sInfo.responsible_id);
                // $('#responsible_id').trigger("change");
                $('#responsible_id').val(sInfo.responsible_id);
                const respText = $('#responsible_id option:selected').text();
                $('#responsible_search').val(respText);
                $('#post_phone').val(sInfo.post_phone);
                $('#obj_address').val(sInfo.address);
                $('#structure_phone').val(sInfo.military_unit_phone);
                $('#prevention_inspector').val(sInfo.iiv_inspector);
                $('#inspector_phone').val(sInfo.iiv_inspector_phone);
                $('#territorial_iib').val(sInfo.iiv_unit);
                $('#iib_phone').val(sInfo.iiv_unit_phone);
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
            $('#district').val('');
            $('#obj_long').val('');
            $('#obj_lat').val('');
            $('#obj_name').val('');
            $('#obj_type').val(0);
            $('#obj_type').trigger("change");
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
                   form_data.append('structure_id', $('#structure_id').val());
                    form_data.append('obj_type', $('#obj_type').val());
                    form_data.append('district', $('#district').val());
                    form_data.append('obj_lat', $('#obj_lat').val());
                    form_data.append('obj_long', $('#obj_long').val());
                    form_data.append('obj_name', $('#obj_name').val());
        
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
                   
                    form_data.append('id', $('#id').val());
                    $.ajax({
                        url: 'hrajax.php?act=act_embassy_objects',
                        dataType: 'json',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data,
                        type: 'post',
                       success: function(res) {
                            console.log("rs", res.status);
                           
                            if (res.status == 0) {
                               
                                location.reload();
                            } else {
                                // Xatolik (status 0 emas) bo'lsa
                                // Agar javobda xatolik xabari bo'lsa (masalan, res.message) uni ko'rsatish
                                var errorMessage = res.message || "Amalni bajarishda xatolik yuz berdi.";
                                alert(errorMessage);
                                // console.error(res); // Xatolikni konsolga chiqarish
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
            $.get("hrajax.php?act=del_embassy_objects&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });
        
    {/literal}
</script>

{include file="footer.tpl"}