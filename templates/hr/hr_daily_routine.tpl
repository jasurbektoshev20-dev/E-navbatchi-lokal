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

        .search-dropdown li:hover {
        background: rgba(0,255,136,.15);
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

            .search-dropdown li:hover {
            background: rgba(0,255,136,.15);
            }



    {/literal}
</style>
<div class="flex-grow-1 container-p-y container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex justify-content-between">
                    <h4>Объектлар бўйича нарядлар</h4>
                    <button id="new" type="button" class="btn btn-primary">
                        <i class="menu-icon tf-icons ti ti-plus"></i> Қўшиш
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Jadval -->
    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top">
                        <thead>
                            <tr>
                                <th>Т/р</th>
                                <th>Сана</th>
                                <th>Ҳудуд</th>
                                <th>Объект номи</th>
                                <th>Жавобгар шахс</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Rountines item=obekt key=tkey}
                                <tr id="row_{$obekt.id|crypt}">
                                    <td>{$tkey+1}</td>
                                    <td><a href="hr.php?act=dailiy_routine_date&mid={$smarty.get.mid}&obyekt={$obekt.id|escape:'url'}"
                                            class="text-primary text-decoration-underline">{$obekt.date} </a></td>
                                    <td>{$obekt.structure}</td>
                                    <td>{$obekt.object}</td>
                                    <td>{$obekt.responsible}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$obekt.id|crypt}" class="dropdown-item editAction" href="#"><i
                                                        class="ti ti-pencil me-1"></i>Таҳрирлаш</a>
                                                <a rel="{$obekt.id|crypt}" class="dropdown-item delete" href="#"><i
                                                        class="ti ti-trash me-1"></i>Ўчириш</a>
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
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label>Сана</label>
                            <input type="date" class="form-control" id="day" required />
                        </div>

                        <div class="col-sm-6">
                            <label>Ҳудудни танланг</label>
                            <select id="region_id" class="form-select">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=str}
                                    <option value="{$str.id}">{$str.name}</option>
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

                        <div class="col-sm-6 position-relative" id="responsible-wrapper">
                            <label>Жавобгар шахс</label>

                            <!-- 🔍 Qidiruv input -->
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
                                {foreach from=$Responsible item=obj}
                                    <option value="{$obj.id}">{$obj.name}</option>
                                {/foreach}
                            </select>

                            <!-- 🔽 Dropdown list -->
                            <ul id="responsible_list" class="search-dropdown"></ul>
                        </div>

                        <div class="col-sm-6 position-relative" id="object-wrapper">
                            <label>Объектни Танланг</label>

                            <!-- 🔍 Qidiruv input -->
                            <input
                                type="text"
                                id="object_search"
                                class="form-control mb-1"
                                placeholder="Объектни қидиринг..."
                                autocomplete="off"
                                required
                            >

                            <!-- 🟢 Asl select (yashirin) -->
                            <select id="object_id" class="form-select d-none">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Objects item=obj}
                                    <option value="{$obj.id}">{$obj.name}</option>
                                {/foreach}
                            </select>

                            <!-- 🔽 Dropdown -->
                            <ul id="object_list" class="search-dropdown"></ul>
                        </div>


                        <div class="col-12 text-center mt-3">
                            <input type="hidden" id="id" value="">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Бекор
                                қилиш</button>
                            <button id="saveBtn" type="submit" class="btn btn-primary">Сақлаш</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
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
    var dict_choose = "{$Dict.choose}"

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




           // obyekt nomini qidirish
           const objectSelect = document.getElementById('object_id');
            const objectSearch = document.getElementById('object_search');
            const objectList   = document.getElementById('object_list');

            // select → array
            const objectsArr = Array.from(objectSelect.options)
            .filter(o => o.value)
            .map(o => ({ id: o.value, name: o.text }));

            function renderObjectList(list) {
            objectList.innerHTML = '';

            if (!list.length) {
                objectList.style.display = 'none';
                return;
            }

            list.forEach(item => {
                const li = document.createElement('li');
                li.textContent = item.name;

                li.onclick = () => {
                objectSearch.value = item.name;
                objectSelect.value = item.id;

                // 🔥 agar change ishlatilsa
                objectSelect.dispatchEvent(new Event('change'));

                objectList.style.display = 'none';
                };

                objectList.appendChild(li);
            });

            objectList.style.display = 'block';
            }

            // 🔍 yozilganda
            objectSearch.addEventListener('input', function () {
            const val = this.value.toLowerCase();

            if (!val) {
                objectSelect.value = '';
                objectList.style.display = 'none';
                return;
            }

            renderObjectList(
                objectsArr.filter(o => o.name.toLowerCase().includes(val))
            );
            });

            // 🔹 focus bo‘lsa – hammasi
            objectSearch.addEventListener('focus', function () {
            renderObjectList(objectsArr);
            });

            // 🔹 tashqariga bosilsa yopiladi
            document.addEventListener('click', e => {
            if (!document.getElementById('object-wrapper').contains(e.target)) {
                objectList.style.display = 'none';
            }
            });












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

        // Delete Record
        $('.datatables-projects tbody').on('click', '.delete', function() {
            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=del_daily_routine&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                    // dt_basic.row($(this).parents('tr')).remove().draw();
                }
            });
        });

        $('#new').click(function() {
            $('#submitModal').modal('toggle');
            $('#structure_id').val(0);
            $('#structure_id').trigger("change");
            $('#responsible_id').val(0);
            $('#responsible_id').trigger("change");
            $('#object_id').val(0);
            $('#object_id').trigger("change");
            $('#day').val("");
            $('#id').val(0);
        });

      
        $('.datatables-projects tbody').on('click', '.editAction', function () {
                $('#submitModal').modal('show');

                const RowId = $(this).attr('rel');

                $.getJSON("hrajax.php?act=get_daily_routine&rowid=" + RowId, function (sInfo) {
                    console.log('EDIT DATA:', sInfo);

                    // oddiylar
                    $('#structure_id').val(sInfo.structure_id);
                    $('#region_id').val(sInfo.structure_id);
                    $('#day').val(sInfo.date);
                    $('#id').val(sInfo.id);

                    /* =========================
                    RESPONSIBLE
                    ========================= */
                    $('#responsible_id').val(sInfo.responsible_id);

                    const respText = $('#responsible_id option:selected').text();
                    $('#responsible_search').val(respText);

                    /* =========================
                    OBJECT
                    ========================= */
                    $('#object_id').val(sInfo.object_id);

                    const objText = $('#object_id option:selected').text();
                    $('#object_search').val(objText);
                });
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

                    form_data.append('responsible_id', $('#responsible_id').val());
                    form_data.append('object_id', $('#object_id').val());
                    form_data.append('day', $('#day').val());

                    $.ajax({
                        url: 'hrajax.php?act=act_daily_routine',
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

    {/literal}
</script>

{include file="footer.tpl"}