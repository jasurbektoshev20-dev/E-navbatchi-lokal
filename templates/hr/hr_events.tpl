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
                                <th class="text-center">ИИВ ҲХ сони</th>
                                <th class="text-center">ФВВ ҲХ сони</th>
                                <th class="text-center">МГ МСГр сони</th>
                                <th class="text-center">ИИВ Спринг сони</th>
                                <th class="text-center">Тадбирга масъул</th>
                                <th class="text-center">Тадбирни ўтказувчи ташаббускор</th>
                                <th></th>
                            </tr>
                        </thead>
                         <tbody>
                        {foreach from=$Events item=item key=tkey name=name}
                             <tr class="lb" id="row_{$item.id|crypt}">
                                <td class="text-right">{$tkey+1}</td>
                                <td class="text-center">
                                     <a href="hr.php?act=public_event_duty&mid=&date=">
                                         {$item.name3}
                                    </a>
                                </td>
                                <td class="text-center">{$item.jts_object_id}</td>
                                <td class="text-center">{$item.type}</td>
                                <td class="text-center">Спортнинг Гандбол тури бўйича ёшлар ўртасида Ўзбекистон чемпионати</td>
                                <td class="text-center">Республика</td>
                                <td class="text-center">Ҳукумат қарори асосидаги тадбир</td>
                                <td class="text-center">08.11.2025-й 09:00</td>
                                <td class="text-center">08.11.2025-й 17:00</td>
                                <td class="text-center">120</td>
                                <td class="text-center">12</td>
                                <td class="text-center">4</td>
                                <td class="text-center">6</td>
                                <td class="text-center">8</td>
                                <td class="text-center">МГ НВББ лейтенант И.Эсонбоев</td>
                                <td class="text-center">Спорт бошқармаси</td>
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
                            <select required class="select form-control" name="event_place" id="event_place">
                                <option value="">{$Dict.choose}</option>
                                    <option value="Ўзбекистон Республикаси Ташқи ишлар вазирлиги">Ўзбекистон Республикаси Ташқи ишлар вазирлиги</option>
                                    <option value="Олий Мажлис Қонунчилик палатаси мажлислар зали">Олий Мажлис Қонунчилик палатаси мажлислар зали</option>
                                    <option value="“Дўстлик саройи” (Халқлар дўстлиги саройи)">“Дўстлик саройи” (Халқлар дўстлиги саройи)</option>
                                    <option value="“Силк Роад” туризм маркази">“Силк Роад” туризм маркази</option>
                            </select>
                        </div>

                          <div class="col-sm-4">
                            <label>Тадбир тури</label>
                            <select required class="select form-control" name="event_type" id="event_type">
                                <option value="">{$Dict.choose}</option>
                                    <option value="Сиёсий тадбирлар	">Сиёсий тадбирлар</option>
                                    <option value="Маданий тадбирлар	">Маданий тадбирлар	</option>
                                    <option value="Спорт тадбирлар">“Спорт тадбирлар</option>
                                    <option value="Бошқа тадбирлар	">Бошқа тадбирлар</option>
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
                            <label for="start_event_date" class="form-label">Бошланиш вақти</label>
                            <input type="date" class="form-control" placeholder="DD-MM-YYYY" id="start_event_date" />
                        </div>

                        <div class="col-sm-4">
                            <label for="finish_event_date" class="form-label">Тугаш вақти</label>
                            <input type="date" class="form-control" placeholder="DD-MM-YYYY" id="finish_event_date" />
                        </div>

                       <div class="col-sm-4">
                            <label>{$Dict.event_participants}</label>
                            <input required type="number" class="form-control" name="event_participants" id="event_participants" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ ҲХ сони</label>
                            <input required type="number" class="form-control" name="event_number_iiv" id="event_number_iiv" value="">
                        </div>

                       <div class="col-sm-4">
                            <label>ФВВ ҲХ сони</label>
                            <input required type="number" class="form-control" name="event_number_fvv" id="event_number_fvv" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>МГ МСГр сони</label>
                            <input required type="number" class="form-control" name="event_number_msgr" id="event_number_msgr" value="">
                        </div>

                          <div class="col-sm-4">
                            <label>ИИВ Спринг сони</label>
                            <input required type="number" class="form-control" name="event_number_spring" id="event_number_spring" value="">
                        </div>
                         <div class="col-sm-8">
                            <label>Тадбирни ўтказувчи ташаббускор</label>
                            <input required type="text" class="form-control" name="event_initiator" id="event_initiator" value="">
                        </div>

                        <div class="col-sm-6">
                            <label>{$Dict.masul}</label>
                            <input required type="text" class="form-control" name="responsible" id="responsible" value="">
                        </div>
                      <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
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
            monthSelectorType: 'static'
        });
    }

    let start_event_date;
    $('#start_event_date').on('change', function() {
        var dateComponents = this.value.split('-');
        start_event_date = dateComponents[2] + '-' + dateComponents[1] + '-' + dateComponents[0];
    })



    const flatpickrDate2 = document.querySelector('#finish_event_date');
    if (flatpickrDate2) {
        flatpickrDate2.flatpickr({
            monthSelectorType: 'static'
        });
    }

    let finish_event_date;
    $('#finish_event_date').on('change', function() {
        var dateComponents = this.value.split('-');
        finish_event_date = dateComponents[2] + '-' + dateComponents[1] + '-' + dateComponents[0];
    })



    $('#region_id').change(function(event) {
        $.ajax({
            type: "GET",
            url: `ajax.php?act=get_distcity_by_id&id=${this.value}`,
            dataType: "json",
            encode: true,
            success: function(data) {
                $("#distcity_id").empty();
                data.forEach(item => { 
                    $("#distcity_id").append(`<option value="${item.id}">${item.name}</option>`);
                });
            }
        })
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

    $('.datatables-projects tbody').on('click', '.editAction', function() {
        $('#submitModal').modal('toggle');
        var RowId = $(this).attr('rel');

        $.get("hrajax.php?act=get_events&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);
            
            $('#region_id').val(sInfo.region_id);
            $('#event_place').val(sInfo.event_place);
            $('#event_type').val(sInfo.event_type);
            $('#event_direction').val(sInfo.event_direction);
            $('#event_view').val(sInfo.event_view);
            $('#region_id').trigger("change");
            $('#event_place').trigger("change");
            $('#event_type').trigger("change");
            $('#event_direction').trigger("change");
            $('#event_view').trigger("change");


            $('#start_event_date').val(sInfo.start_event_date);
            $('#finish_event_date').val(sInfo.finish_event_date);
            $('#staff_count').val(sInfo.staff_count);
            $('#stand').val(sInfo.stand);
            $('#transport').val(sInfo.transport);
            $('#responsible').val(sInfo.responsible);
            $('#event_name').val(sInfo.event_name);
            $('#event_initiator').val(sInfo.event_initiator);
            $('#text').val(sInfo.text);
            $('#event_participants').val(sInfo.event_participants);
            $('#event_number_iiv').val(sInfo.event_number_iiv);
            $('#event_number_fvv').val(sInfo.event_number_fvv);
            $('#event_number_msgr').val(sInfo.event_number_msgr);
            $('#event_number_spring').val(sInfo.event_number_spring);
            $('#auto_number').val(sInfo.auto_number);
            $('#guard_staffs').val(sInfo.guard_staffs);
            $('#id').val(sInfo.id);
        });
    })

    $('#new').click(function() {
        $('#submitModal').modal('toggle');
        $('#region_id').val(0);
        $('#region_id').trigger("change");
        $('#event_place').val(0);
        $('#event_place').trigger("change");
        $('#event_type').val(0);
        $('#event_type').trigger("change");
        $('#event_direction').val(0);
        $('#event_direction').trigger("change");
        $('#event_view').val(0);
        $('#event_view').trigger("change");
        $('#responsible').val("");
        $('#event_initiator').val("");
        $('#event_name').val("");
        $('#start_event_date').val("");
        $('#finish_event_date').val("");
        $('#event_participants').val("");
        $('#event_number_msgr').val("");
        $('#event_number_spring').val("");
        $('#event_number_fvv').val("");
        $('#event_number_iiv').val("");
        $('#id').val(0)
    });

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
                form_data.append('region_id', $('#region_id').val());
                form_data.append('event_place', $('#event_place').val());
                form_data.append('event_type', $('#event_type').val());
                form_data.append('event_direction', $('#event_direction').val());
                form_data.append('event_view', $('#event_view').val());
                form_data.append('start_event_date', $('#start_event_date').val());
                form_data.append('finish_event_date', $('#finish_event_date').val());
                form_data.append('responsible', $('#responsible').val());
                form_data.append('event_initiator', $('#event_initiator').val());
                form_data.append('event_name', $('#event_name').val());
                form_data.append('event_participants', $('#event_participants').val());
                form_data.append('event_number_msgr', $('#event_number_msgr').val());
                form_data.append('event_number_spring', $('#event_number_spring').val());
                form_data.append('event_number_fvv', $('#event_number_fvv').val());
                form_data.append('event_number_iiv', $('#event_number_iiv').val());
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