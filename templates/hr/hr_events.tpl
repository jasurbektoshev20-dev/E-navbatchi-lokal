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
                                <th class="text-center">Манзил</th>
                                <th class="text-center">Тури</th>
                                <th class="text-center">Номи</th>
                                <th class="text-center">Йўналиши</th>
                                <th class="text-center">Кўриниши</th>
                                <th class="text-center">Бошланиш вақти</th>
                                <th class="text-center">Тугаш вақти</th>
                                <th class="text-center">Фуқаролар сони</th>
                                <th class="text-center">Tadbirga masul tashkilot</th>
                                <th class="text-center">Masul FISH</th>
                                <th class="text-center">Telefon</th>
                                <th class="text-center">IIV masul FISH</th>
                                <th class="text-center">ИИВ ҲХ сони</th>
                                <th class="text-center">FVV masul FISH</th>
                                <th class="text-center">ФВВ ҲХ сони</th>
                                <th class="text-center">МГ МСГр masul FISH</th>
                                <th class="text-center">МГ МСГр сони</th>
                                <th class="text-center">ИИВ Спринг masul FISH</th>
                                <th class="text-center">ИИВ Спринг сони</th>
                                <th class="text-center">Zaxiraga masul</th>
                                <th class="text-center">Zaxira сони</th>
                                <th class="text-center">Тадбирни ўтказувчи ташаббускор</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Events item=item key=tkey name=name}
                                <tr class="lb" id="row_{$item.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td class="text-center">
                                        <a href="hr.php?act=public_event_duty&mid={$item.id|crypt}">
                                            {$item.region_name}
                                        </a>
                                    </td>
                                    <td class="text-center">{$item.obj_name}</td>
                                    <td class="text-center">{$item.event_type}</td>     
                                    <td class="text-center">{$item.event_name}</td>
                                    <td class="text-center">{$item.direction_event}</td>
                                    <td class="text-center">{$item.command}</td>
                                    <td class="text-center">{$item.start_time}</td>
                                    <td class="text-center">{$item.end_time}</td>
                                    <td class="text-center">{$item.citizens_count}</td>
                                    <td class="text-center">{$item.event_responsible_organization}</td>
                                    <td class="text-center">{$item.responsible_name}</td>
                                    <td class="text-center">{$item.responsible_phone}</td>
                                    <td class="text-center">{$item.responsible_iiv_name}</td>
                                    <td class="text-center">{$item.iiv_count}</td>
                                    <td class="text-center">{$item.responsible_fvv_name}</td>
                                    <td class="text-center">{$item.fvv_count}</td>
                                    <td class="text-center">{$item.responsible_msgr_name}</td>
                                    <td class="text-center">{$item.mg_count}</td>
                                    <td class="text-center">{$item.responsible_spring_name}</td>
                                    <td class="text-center">{$item.iiv_spring_count}</td>
                                    <td class="text-center">{$item.reserve_name} {$item.reserve_name}</td>
                                    <td class="text-center">{$item.reserve_count} {$item.reserve_count}</td>
                                    <td class="text-center">{$item.organizer}</td>
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


<!-- Edit Modal -->
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
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Тадбир ўтказиладиган жой</label>
                            <select required class="select form-control" name="object_id" id="object_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$jts_objects item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Тадбир тури</label>
                            <select required class="select form-control" name="event_type" id="event_type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$EventTypes item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.event_type}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Тадбир номи</label>
                            <input required type="text" class="form-control" name="event_name" id="event_name" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Тадбир йўналиши</label>
                            <select required class="select form-control" name="event_direction" id="event_direction">
                                <option value="">{$Dict.choose}</option>
                                <option value="Xalqaro">Халқаро</option>
                                <option value="Respublika">Республика</option>
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Тадбир кўриниши</label>
                            <select required class="select form-control" name="event_view" id="event_view">
                                <option value="">{$Dict.choose}</option>
                                <option value="Ҳукумат қарори асосидаги тадбир">Ҳукумат қарори асосидаги тадбир</option>
                                <option value="Пулли хизмат асосида тадбир">Пулли хизмат асосида тадбир</option>
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label for="start_event" class="form-label">Бошланиш вақти</label>
                            <input type="datetime" class="form-control" placeholder="DD-MM-YYYY" id="start_event_date"
                                name="start_event" />
                        </div>

                        <div class="col-sm-4">
                            <label for="finish_event" class="form-label">Тугаш вақти</label>
                            <input type="datetime" class="form-control" placeholder="DD-MM-YYYY" id="finish_event_date"
                                name="finish_event" />
                        </div>

                        <div class="col-sm-4">
                            <label>{$Dict.event_participants}</label>
                            <input required type="number" class="form-control" name="people_count"
                                id="event_participants" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Tadbirga mas'ul tashkilot</label>
                            <select required class="select form-control" name="event_responsible_organization" id="event_responsible_organization">
                                <option value="">{$Dict.choose}</option>
                                <option value="IIB">IIB</option>
                                <option value="FVV">FVV</option>
                                <option value="MG">MG</option>
                            </select>
                        </div>
                        
                        <div class="col-sm-4">
                            <label>Mas'ul nomi</label>
                            <input required type="text" class="form-control" name="responsible_name" id="responsible_name"  value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Mas'ul telefon raqami</label>
                            <input required type="text" class="form-control" name="responsible_phone" id="responsible_phone"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>IIV masul</label>
                            <input required type="text" class="form-control" name="responsible_iiv_name" id="responsible_iiv_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ ҲХ сони</label>
                            <input required type="number" class="form-control" name="iiv_count" id="event_number_iiv"
                                value="">
                        </div>

                         <div class="col-sm-4">
                            <label>FVV masul</label>
                            <input required type="text" class="form-control" name="responsible_fvv_name" id="responsible_fvv_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ФВВ ҲХ сони</label>
                            <input required type="number" class="form-control" name="fvv_count" id="event_number_fvv"
                                value="">
                        </div>

                       <div class="col-sm-4">
                            <label>МГ МСГр masul</label>
                            <input required type="text" class="form-control" name="responsible_msgr_name" id="responsible_msgr_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>МГ МСГр сони</label>
                            <input required type="number" class="form-control" name="mg_count" id="mg_count" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ Спринг masul</label>
                            <input required type="text" class="form-control" name="responsible_spring_name" id="responsible_spring_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ Спринг сони</label>
                            <input required type="number" class="form-control" name="spring_count" id="event_number_spring" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Zaxiraga masul</label>
                            <input required type="text" class="form-control" name="reserve_name" id="reserve_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Zaxira сони</label>
                            <input required type="number" class="form-control" name="reserve_count" id="reserve_count" value="">
                        </div>

                        <div class="col-sm-8">
                            <label>Тадбирни ўтказувчи ташаббускор</label>
                            <input required type="text" class="form-control" name="organizer" id="organizer"
                                value="">
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

        const flatpickrDate = document.querySelector('#start_event_date');
        if (flatpickrDate) {
            flatpickrDate.flatpickr({
                enableTime: true,
            dateFormat: "d-m-Y H:i",
            time_24hr: true,
            monthSelectorType: 'static'
            });
        }

        let start_event_date;
        $('#start_event_date').on('change', function() {
           let [datePart, timePart] = this.value.split(' ');
            let [day, month, year] = datePart.split('-');

            start_event_date = `${year}-${month}-${day} ${timePart}`;
        })



        const flatpickrDate2 = document.querySelector('#finish_event_date');
        if (flatpickrDate2) {
            flatpickrDate2.flatpickr({
                enableTime: true,
            dateFormat: "d-m-Y H:i",
            time_24hr: true,
            monthSelectorType: 'static'
            });
        }

        let finish_event_date;
        $('#finish_event_date').on('change', function() {
             let [datePart, timePart] = this.value.split(' ');
        let [day, month, year] = datePart.split('-');

        finish_event_date = `${year}-${month}-${day} ${timePart}`;
        })



        // $('#region_id').change(function(event) {
        //     $.ajax({
        //         type: "GET",
        //         url: `ajax.php?act=get_distcity_by_id&id=${this.value}`,
        //         dataType: "json",
        //         encode: true,
        //         success: function(data) {
        //             $("#distcity_id").empty();
        //             data.forEach(item => {
        //                 $("#distcity_id").append(`<option value="${item.id}">${item.name}</option>`);
        //             });
        //         }
        //     })
        // })

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
                $('#object_id').val(sInfo.jts_object_id);
                $('#event_type').val(sInfo.public_event_type);
                $('#event_direction').val(sInfo.direction_event);
                $('#event_view').val(sInfo.command);
                $('#event_responsible_organization').val(sInfo.event_responsible_organization);
                $('#region_id').trigger("change");
                $('#object_id').trigger("change");
                $('#event_type').trigger("change");
                $('#event_direction').trigger("change");
                $('#event_view').trigger("change");
                $('#event_responsible_organization').trigger("change");
                $('#start_event_date').val(sInfo.start_time);
                $('#finish_event_date').val(sInfo.end_time);
                $('#staff_count').val(sInfo.people_count);
                $('#event_name').val(sInfo.event_name);
                $('#responsible_name').val(sInfo.responsible_name);
                $('#responsible_phone').val(sInfo.responsible_phone);
                $('#responsible_iiv_name').val(sInfo.responsible_iiv_name);
                $('#responsible_msgr_name').val(sInfo.responsible_msgr_name);
                $('#reserve_count').val(sInfo.reserve_count);
                $('#reserve_name').val(sInfo.reserve_name);
                $('#responsible_spring_name').val(sInfo.responsible_spring_name);
                $('#responsible_fvv_name').val(sInfo.responsible_fvv_name);
                $('#organizer').val(sInfo.organizer);
                $('#event_participants').val(sInfo.citizens_count);
                $('#event_number_iiv').val(sInfo.fvv_count);
                $('#event_number_fvv').val(sInfo.fvv_count);
                $('#mg_count').val(sInfo.mg_count);
                $('#event_number_spring').val(sInfo.iiv_spring_count);
                $('#id').val(sInfo.id);
            });
        })

        $('#new').click(function() {
            $('#submitModal').modal('toggle');
            $('#region_id').val(0);
            $('#region_id').trigger("change");
            $('#object_id').val(0);
            $('#object_id').trigger("change");
            $('#event_type').val(0);
            $('#event_type').trigger("change");
            $('#event_direction').val(0);
            $('#event_direction').trigger("change");
            $('#event_view').val(0);
            $('#event_view').trigger("change");
             $('#event_responsible_organization').val(0);
            $('#event_responsible_organization').trigger("change");
            $('#organizer').val("");
            $('#event_name').val("");
            $('#responsible_name').val("");
            $('#responsible_phone').val("");
            $('#responsible_iiv_name').val("");
            $('#responsible_msgr_name').val("");
            $('#reserve_count').val("");
            $('#reserve_name').val("");
            $('#responsible_spring_name').val("");
            $('#responsible_fvv_name').val("");
            $('#start_event_date').val("");
            $('#finish_event_date').val("");
            $('#event_participants').val("");
            $('#mg_count').val("");
            $('#event_number_spring').val("");
            $('#event_number_fvv').val("");
            $('#event_number_iiv').val("");
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
                    form_data.append('object_id', $('#object_id').val());
                    form_data.append('event_type', $('#event_type').val());
                    form_data.append('event_direction', $('#event_direction').val());
                    form_data.append('event_view', $('#event_view').val());
                    form_data.append('event_responsible_organization', $('#event_responsible_organization').val());
                    form_data.append('start_event', $('#start_event_date').val());
                    form_data.append('finish_event', $('#finish_event_date').val());
                    form_data.append('organizer', $('#organizer').val());
                    form_data.append('event_name', $('#event_name').val());
                    form_data.append('responsible_name', $('#responsible_name').val());
                    form_data.append('responsible_phone', $('#responsible_phone').val());
                    form_data.append('responsible_iiv_name', $('#responsible_iiv_name').val());
                    form_data.append('responsible_msgr_name', $('#responsible_msgr_name').val());
                    form_data.append('reserve_count', $('#reserve_count').val());
                    form_data.append('reserve_name', $('#reserve_name').val());
                    form_data.append('responsible_spring_name', $('#responsible_spring_name').val());
                    form_data.append('responsible_fvv_name', $('#responsible_fvv_name').val());
                    form_data.append('people_count', $('#event_participants').val());
                    form_data.append('mg_count', $('#mg_count').val());
                    form_data.append('spring_count', $('#event_number_spring').val());
                    form_data.append('fvv_count', $('#event_number_fvv').val());
                    form_data.append('iiv_count', $('#event_number_iiv').val());
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