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
                                <th>{$Dict.date}</th>
                                <th>{$Dict.photo}</th>
                                <th>{$Dict.masul}</th>
                                <th>{$Dict.photo}</th>
                                <th>{$Dict.staff_2}</th>
                                <th>{$Dict.photo}</th>
                                <th>{$Dict.staff_3}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Duty item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td>{$tkey+1}</td>
                                    <td>{$Table.date}</td>
                                    <td>
                                        {if $Table.photo1 neq ""}
                                            <img src="/pictures/staffs/{$Table.photo1}" height="50">
                                        {else}
                                            <img src="assets/images/no_img.png" height="28">
                                        {/if}
                                    </td>
                                    <td>{$Table.name1}</td>
                                    <td>
                                        {if $Table.photo2 neq ""}
                                            <img src="/pictures/staffs/{$Table.photo2}" height="50">
                                        {else}
                                            <img src="assets/images/no_img.png" height="28">
                                        {/if}
                                    </td>
                                    <td>{$Table.name2}</td>
                                    <td>
                                        {if $Table.photo3 neq ""}
                                            <img src="/pictures/staffs/{$Table.photo3}" height="50">
                                        {else}
                                            <img src="assets/images/no_img.png" height="28">
                                        {/if}
                                    </td>
                                    <td>{$Table.name3}</td>
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
                        <div class="col-12">
                            <label for="date" class="form-label">{$Dict.date}</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="date" />
                        </div>
                        <div class="col-12">
                            <label>{$Dict.masul}</label>
                            <select required class="form-control" name="staff1" id="staff1">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Staffs item=Item4 key=ikey4}
                                    <option value="{$Item4.id}">{$Item4.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-12">
                            <label>{$Dict.staff_2}</label>
                            <select required class="form-control" name="staff2" id="staff2">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Staffs item=Item4 key=ikey4}
                                    <option value="{$Item4.id}">{$Item4.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-12">
                            <label>{$Dict.staff_3}</label>
                            <select required class="form-control" name="staff3" id="staff3">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Staffs item=Item4 key=ikey4}
                                    <option value="{$Item4.id}">{$Item4.name}</option>
                                {/foreach}
                            </select>
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

        function getCurrentDate() {
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0'); // Months are 0-indexed
            const day = String(now.getDate()).padStart(2, '0');
            return `${year}-${month}-${day}`;
        }

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
            $.get("hrajax.php?act=del_duty_staff&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });

        $('#new').click(function() {
            $('#submitModal').modal('toggle');

            $('#id').val(0);
            $('#date').val(getCurrentDate());
            $('#staff1').val(0);
            $('#staff1').trigger("change");
            $('#staff2').val(0);
            $('#staff2').trigger("change");
            $('#staff3').val(0);
            $('#staff3').trigger("change");
        });

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');

            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=get_duty_staff&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#id').val(sInfo.id);
                $('#date').val(sInfo.date);
                $('#staff1').val(sInfo.staff1);
                $('#staff1').trigger("change");
                $('#staff2').val(sInfo.staff2);
                $('#staff2').trigger("change");
                $('#staff3').val(sInfo.staff3);
                $('#staff3').trigger("change");
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
                    form_data.append('structure_id', RegDyn);
                    form_data.append('date', $('#date').val());
                    form_data.append('staff1', $('#staff1').val());
                    form_data.append('staff2', $('#staff2').val());
                    form_data.append('staff3', $('#staff3').val());

                    $.ajax({
                        url: 'hrajax.php?act=act_duty_staff',
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
                                alert("Ushbu kunga avval ma'lumot kiritilgan!");
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