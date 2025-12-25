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
                    <h4>Хизматга жалб этилганлар</h4>
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
                                <th class="text-center">Сана</th>
                                <th class="text-center">Бўлинма</th>
                                <th class="text-center">Хизмат тури</th>
                                <th class="text-center">Хизмат йўналиши</th>
                                <th class="text-center">Ҳарбий хизматчи</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$duty_embassy item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td class="text-center">{$Table.date}</td> 
                                     <td class="text-center">{$Table.structure_name}</td>
                                    <td class="text-center">{$Table.duty_type}</td>
                                    <td class="text-center">{$Table.duty_direction}</td>
                                    <td class="text-center">{$Table.staff_name}</td>
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


<!-- Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                    <input type="hidden" name="object_id" id="object_id">

                        <div class="col-6">
                            <label>Сана</label>
                            <input required type="datetime" class="form-control" placeholder="DD-MM-YYYY" name="date" id="date" value="">
                        </div>

                        <div class="col-6">
                            <label>{$Dict.territorial_short}</label>
                            <select  class="select form-control" name="structure_id" id="structure_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$units item=Item6 key=ikey6}
                                    <option value="{$Item6.id}">{$Item6.structure_name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-6">
                            <label>Хизмат</label>
                            <select  class="select form-control" name="duty_type" id="duty_type">
                                <option value="">{$Dict.choose}</option>
                                <option value="Пиёда патрул">Пиёда патрул</option>
                                <option value="Гуруҳ бошлиғи">Гуруҳ бошлиғи</option>
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Хизмат йўналиши</label>
                            <input required type="number" class="form-control" name="duty_direction" id="duty_direction" value="">
                        </div>

                        <div class="col-sm-12">
                           <label class="form-label">Ҳарбий хизматчи</label>
                            <input type="text" id="staffSearch"
                                class="form-control mb-2"
                                placeholder="Қидириш...">

                            <select id="staff_id"
                                    class="form-select d-none"
                                    size="8">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$troops item=obj}
                                    <option value="{$obj.id}">
                                        {$obj.troop_name}
                                    </option>
                                {/foreach}
                            </select>
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
    var dict_choose = "{$Dict.choose}";
    {literal}

                const searchInput = document.getElementById('staffSearch');
            const selectBox   = document.getElementById('staff_id');

            searchInput.addEventListener('focus', () => {
                selectBox.classList.remove('d-none');
            });

            searchInput.addEventListener('input', function () {
                const filter = this.value.toLowerCase();
                const options = selectBox.querySelectorAll('option');

                options.forEach(opt => {
                    if (opt.value === "") return;
                    opt.style.display = opt.text.toLowerCase().includes(filter)
                        ? ''
                        : 'none';
                });

                // yozish boshlanganida ham ochiq tursin
                selectBox.classList.remove('d-none');
            });

            // option tanlanganda
            selectBox.addEventListener('change', function () {
                const selected = this.options[this.selectedIndex];
                if (selected && selected.value) {
                    searchInput.value = selected.text;
                    selectBox.classList.add('d-none');
                }
            });

            // tashqariga bosilganda yopilsin
            document.addEventListener('click', function (e) {
                if (!searchInput.contains(e.target) && !selectBox.contains(e.target)) {
                    selectBox.classList.add('d-none');
                }
            });

          function getUrlParameter(name) {
            name = name.replace(/[\[\]]/g, '\\$&');
            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
            var results = regex.exec(window.location.href);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, ' '));
        }

        var object_id = getUrlParameter('mid');


           const flatpickrDate = document.querySelector('#date');
        if (flatpickrDate) {
            flatpickrDate.flatpickr({
                enableTime: true,
            dateFormat: "Y-m-d",
            time_24hr: true,
            monthSelectorType: 'static'
            });
        }

        let start_event_date;
        $('#date').on('change', function() {
           let [datePart, timePart] = this.value.split(' ');
            let [day, month, year] = datePart.split('-');

            start_event_date = `${year}-${month}-${day}`;
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


        $('#new').click(function() {
            $('#submitModal').modal('toggle');
            $('#structure_id').val(0);
            $('#structure_id').trigger("change");
             $('#duty_type').val(0);
            $('#duty_type').trigger("change");
            $('#staff_id').val(0);
            $('#staff_id').trigger("change");
            $('#date').val('');
            $('#duty_direction').val('');
           $('#object_id').val(object_id);
        });

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');

            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=get_embassy_objects_responsible&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#id').val(sInfo.rowid);
                $('#structure_id').val(sInfo.structure_id);
                $('#duty_type').val(sInfo.duty_type);
                $('#duty_direction').val(sInfo.duty_direction);
                $('#staff_id').val(sInfo.staff_id);
                $('#date').val(sInfo.date);
                $('#object_id').val(sInfo.object_id); // bu yerda object_id set qilinadi
               
            });
        })



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
                    form_data.append('structure_id', $('#structure_id').val());
                    form_data.append('duty_type', $('#duty_type').val());
                    form_data.append('duty_direction', $('#duty_direction').val());
                    form_data.append('staff_id', $('#staff_id').val());
                    form_data.append('date', $('#date').val());
                      form_data.append('object_id', $('#object_id').val());

                    $.ajax({
                        url: 'hrajax.php?act=act_embassy_objects_responsible',
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
            $.get("hrajax.php?act=del_embassy_objects_responsible&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });

    {/literal}
</script>

{include file="footer.tpl"}