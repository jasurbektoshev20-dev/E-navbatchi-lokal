{include file="header.tpl"}

<style>
{literal}
.table thead th,
.table tbody td {
    text-transform: none !important;
    font-size: 16px;
}
.filter-box {
    display: flex;
    gap: 10px;
    align-items: center;
}
{/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <!-- HEADER -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <h4>{$ThisMenu.name}</h4>

                    <!-- DATE FILTER -->
                    <div class="filter-box">
                        <input type="text" id="start_date" class="form-control" placeholder="Бошланиш санаси">
                        <input type="text" id="finish_date" class="form-control" placeholder="Тугаш санаси">
                        <button id="clearFilter" class="btn btn-secondary">
                            Тозалаш
                        </button>
                    </div>

                    <button id="new" type="button" class="btn btn-primary">
                        <i class="ti ti-plus"></i> {$Dict.adding}
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- TABLE -->
    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table table-bordered">
                        <thead>
                            <tr>
                                <th>t/r</th>
                                <th class="text-center">Ҳудуд</th>
                                <th class="text-center">Жойи</th>
                                <th class="text-center">Тури</th>
                                <th class="text-center">Тоифаси</th>
                                <th class="text-center">Номи</th>
                                <th class="text-center">Йўналиши</th>
                                <th class="text-center">Кўриниши</th>
                                <th class="text-center">Бошланиш вақти</th>
                                <th class="text-center">Тугаш вақти</th>
                                <th class="text-center">Фуқаролар сони</th>
                                <th class="text-center">Тадбирга масъул ташкилот</th>
                                <th class="text-center">Тадбирга масъул ФИШ</th>
                                <th class="text-center">Тадбирга масъул телефони</th>
                                <th class="text-center">МГ жавобгар</th>
                                <th class="text-center">МГ сони</th>
                                <th class="text-center">ИИВ маъсули ФИШ</th>
                                <th class="text-center">ИИВ ҲХ сони</th>
                                <th class="text-center">ФВВ маъсули ФИШ</th>
                                <th class="text-center">ФВВ ҲХ сони</th>
                                <th class="text-center">МГ МСГр маъсули ФИШ</th>
                                <th class="text-center">МГ МСГр сони</th>
                                <th class="text-center">ИИВ Спринг маъсули ФИШ</th>
                                <th class="text-center">ИИВ Спринг сони</th>
                                <th class="text-center">Захирага маъсули ФИШ</th>
                                <th class="text-center">Захира сони</th>
                                <th class="text-center">Тадбирни ўтказувчи ташаббускор</th>
                                <th class="text-center">Ҳолат ҳақида қисқача</th>
                                <th class="text-center">Камералар</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody id="events_tbody"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Edit Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="needs-validation" novalidate id="eventForm">
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
                            <label>Ўтказиладиган жой манзили</label>
                            <input required type="text" class="form-control" name="object_id" id="object_id" value="">
                        </div>
                        <div class="col-sm-4">
                            <label>тури</label>
                            <select required class="select form-control" name="event_type" id="event_type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$EventTypes item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.event_type}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Тоифаси</label>
                            <select required class="select form-control" name="event_category" id="event_category">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$EventCategory item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.event_category}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Номи</label>
                            <input required type="text" class="form-control" name="event_name" id="event_name" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Йўналиши</label>
                            <select required class="select form-control" name="event_direction" id="event_direction">
                                <option value="">{$Dict.choose}</option>
                                <option value="Халқаро">Халқаро</option>
                                <option value="Республика">Республика</option>
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Кўриниши</label>
                            <select required class="select form-control" name="event_view" id="event_view">
                                <option value="">{$Dict.choose}</option>
                                <option value="Ҳукумат қарори асосидаги тадбир">Ҳукумат қарори асосидаги тадбир</option>
                                <option value="Пулли хизмат асосида тадбир">Пулли хизмат асосида тадбир</option>
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Бошланиш вақти</label>
                            <input type="datetime" class="form-control" placeholder="DD-MM-YYYY" id="start_event_date"
                                name="start_event" />
                        </div>

                        <div class="col-sm-4">
                            <label>Тугаш вақти</label>
                            <input type="datetime" class="form-control" placeholder="DD-MM-YYYY" id="finish_event_date"
                                name="finish_event" />
                        </div>

                        <div class="col-sm-4">
                            <label>{$Dict.event_participants}</label>
                            <input required type="number" class="form-control" name="people_count"
                                id="event_participants" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Масъул ташкилот</label>
                            <select required class="select form-control" name="event_responsible_organization" id="event_responsible_organization">
                                <option value="">{$Dict.choose}</option>
                                <option value="ИИБ">ИИБ</option>
                                <option value="ФВВ">ФВВ</option>
                                <option value="МГ">МГ</option>
                            </select>
                        </div>
                        
                        <div class="col-sm-4">
                            <label>Ташкилот масъули ФИШ</label>
                            <input required type="text" class="form-control" name="responsible_name" id="responsible_name"  value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Ташкилот масъули телефон рақами</label>
                            <input required type="text" class="form-control" name="responsible_phone" id="responsible_phone" placeholder="90 345 76 87"  value="">
                        </div>

                         <div class="col-sm-4">
                            <label>МГ масъул ФИШ</label>
                            <input required type="text" class="form-control" name="responsible_mg_name" id="responsible_mg_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>МГ сони</label>
                            <input required type="number" class="form-control" name="event_number_mg" id="event_number_mg"
                                value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ масъул ФИШ</label>
                            <input type="text" class="form-control" name="responsible_iiv_name" id="responsible_iiv_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ ҲХ сони</label>
                            <input type="number" class="form-control" name="iiv_count" id="event_number_iiv"
                                value="">
                        </div>

                         <div class="col-sm-4">
                            <label>ФВВ масъул ФИШ</label>
                            <input type="text" class="form-control" name="responsible_fvv_name" id="responsible_fvv_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ФВВ ҲХ сони</label>
                            <input type="number" class="form-control" name="fvv_count" id="event_number_fvv"
                                value="">
                        </div>

                       <div class="col-sm-4">
                            <label>МГ МСГр масъул ФИШ</label>
                            <input type="text" class="form-control" name="responsible_msgr_name" id="responsible_msgr_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>МГ МСГр сони</label>
                            <input type="number" class="form-control" name="mg_count" id="mg_count" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ Спринг масъул ФИШ</label>
                            <input type="text" class="form-control" name="responsible_spring_name" id="responsible_spring_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ Спринг сони</label>
                            <input type="number" class="form-control" name="spring_count" id="event_number_spring" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Захирага масъул ФИШ</label>
                            <input type="text" class="form-control" name="reserve_name" id="reserve_name"  value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Захира сони</label>
                            <input type="number" class="form-control" name="reserve_count" id="reserve_count" value="">
                        </div>

                        <div class="col-sm-8">
                            <label>Тадбирни ўтказувчи ташаббускор ташкилот</label>
                            <input required type="text" class="form-control" name="organizer" id="organizer"
                                value="">
                        </div>
                           <div class="col-sm-6">
                            <label>Объект жойлашуви X </label>
                            <input required type="text" class="form-control" name="lat" id="lat" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>Оект жойлашуви Y</label>
                            <input required type="text" class="form-control" name="long" id="long" value="">
                        </div>
                        <div class="col-sm-12">
                            <label>{$Dict.case_summary}</label>
                            <textarea class="form-control" rows=3 name="situation_text" id="situation_text"></textarea>
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
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
{* <script src="/assets/assets/vendor/js/bootstrap.bundle.min.js"></script>  *}


<script>

var dict_edit   = "{$Dict.edit}";
var dict_delete = "{$Dict.delete}";

{literal}

let dt;

/* ===== DATEPICKER ===== */
flatpickr("#start_date", {
    dateFormat: "Y-m-d"
});
flatpickr("#finish_date", {
    dateFormat: "Y-m-d"
});

/* ===== LOAD EVENTS ===== */
function loadEvents(start_date = '', finish_date = '') {

    $.ajax({
        url: 'ajax.php?act=get_events_date',
        type: 'POST',
        dataType: 'json',
        data: {
            start_date: start_date,
            finish_date: finish_date
        },
        success: function(res) {

            let html = '';
            let i = 1;

            res.Events.forEach(item => {
                html += `
                <tr id="row_${item.id}">
                    <td>${i++}</td>
                    <td class="text-center">${item.region_name ?? ''}</td>
                    <td class="text-center">${item.object_name ?? ''}</td>
                    <td class="text-center">${item.event_type ?? ''}</td>
                    <td class="text-center">${item.event_category ?? ''}</td>
                    <td class="text-center">${item.event_name ?? ''}</td>
                    <td class="text-center">${item.event_direction ?? ''}</td>
                    <td class="text-center">${item.event_view ?? ''}</td>
                    <td class="text-center">${item.start_event ?? ''}</td>
                    <td class="text-center">${item.finish_event ?? ''}</td>
                    <td class="text-center">${item.people_count ?? ''}</td>
                    <td class="text-center">${item.event_responsible_organization ?? ''}</td>
                    <td class="text-center">${item.responsible_name ?? ''}</td>
                    <td class="text-center">${item.responsible_phone ?? ''}</td>
                    <td class="text-center">${item.responsible_mg_name ?? ''}</td>
                    <td class="text-center">${item.mg_counts ?? ''}</td>
                    <td class="text-center">${item.responsible_iiv_name ?? ''}</td>
                    <td class="text-center">${item.iiv_count ?? ''}</td>
                    <td class="text-center">${item.responsible_fvv_name ?? ''}</td>
                    <td class="text-center">${item.fvv_count ?? ''}</td>
                    <td class="text-center">${item.responsible_msgr_name ?? ''}</td>
                    <td class="text-center">${item.sapyor ?? ''}</td>
                    <td class="text-center">${item.responsible_spring_name ?? ''}</td>
                    <td class="text-center">${item.spring_count ?? ''}</td>
                    <td class="text-center">${item.reserve_name ?? ''}</td>
                    <td class="text-center">${item.reserve_count ?? ''}</td>
                    <td class="text-center">${item.organizer ?? ''}</td>
                    <td class="text-center">${item.comment ?? ''}</td>
                    <td class="text-center">
                        <a href="hr.php?act=events_cam&mid=${item.id}">
                            <i class="ti ti-camera" style="font-size:26px;"></i>
                        </a>
                    </td>
                    <td class="text-center">
                        <div class="dropdown">
                            <button class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                <i class="ti ti-dots-vertical"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item editAction" href="javascript:void(0);" data-id="${item.id}" rel="${item.id}">
                                    <i class="ti ti-pencil me-1"></i>${dict_edit}
                                </a>
                                <a class="dropdown-item deleteAction" href="javascript:void(0);" rel="${item.id}">
                                    <i class="ti ti-trash me-1"></i>${dict_delete}
                                </a>
                            </div>
                        </div>
                    </td>
                </tr>`;
            });

            if (dt) dt.destroy();
            $('#events_tbody').html(html);

            dt = $('.datatables-projects').DataTable({
                pageLength: 10,
                lengthMenu: [10, 25, 50, 100]
            });
        }
    });
}

/* ===== PAGE LOAD ===== */
$(document).ready(function () {
    loadEvents(); // bugungi
});

/* ===== FILTER ===== */
$('#start_date, #finish_date').on('change', function () {
    let s = $('#start_date').val();
    let f = $('#finish_date').val();
    if (s && f) loadEvents(s, f);
});

/* ===== CLEAR FILTER ===== */
$('#clearFilter').on('click', function () {
    $('#start_date').val('');
    $('#finish_date').val('');
    loadEvents();
});



$('#eventForm').on('submit', function (e) {
    e.preventDefault();

    let formData = new FormData(this);

    $.ajax({
        url: 'hrajax.php?act=act_events',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (res) {

            // 🔥 MUHIM: tozalaymiz
            res = res.trim();

            let parts = res.split('<&sep&>');

            if (parts[0] === '0') {

                const modalEl = document.getElementById('submitModal');

                // 🔥 TO‘G‘RI USUL
                const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
                modal.hide();

                // jadvalni yangilash
                location.reload();

            } else {
                alert(res);
            }
        }
    });
});




// Edit Record
$('.datatables-projects tbody').on('click', '.editAction', function (e) {
    e.preventDefault();

    let RowId = $(this).data('id');
    if (!RowId) return;

    $.get('hrajax.php?act=get_events&rowid=' + RowId, function (res) {

        let data = JSON.parse(res);

        // 🔥 MUHIM: array ichidan obyektni olamiz
        if (!data.length) return;
        let sInfo = data[0];

        // SELECTS
        $('#region_id').val(sInfo.region_id).trigger('change');
        $('#event_type').val(sInfo.event_type).trigger('change');
        $('#event_category').val(sInfo.event_category_id).trigger('change');
        $('#event_direction').val(sInfo.event_direction);
        $('#event_view').val(sInfo.event_view);
        $('#event_responsible_organization')
            .val(sInfo.event_responsible_organization)
            .trigger('change');

        // TEXT INPUTS
        $('#object_id').val(sInfo.object_name);
        $('#event_name').val(sInfo.event_name);
        $('#responsible_name').val(sInfo.responsible_name);
        $('#responsible_phone').val(sInfo.responsible_phone);
        $('#responsible_mg_name').val(sInfo.responsible_mg_name);
        $('#responsible_iiv_name').val(sInfo.responsible_iiv_name);
        $('#responsible_fvv_name').val(sInfo.responsible_fvv_name);
        $('#responsible_msgr_name').val(sInfo.responsible_msgr_name);
        $('#responsible_spring_name').val(sInfo.responsible_spring_name);
        $('#reserve_name').val(sInfo.reserve_name);
        $('#organizer').val(sInfo.organizer);

        // COUNTS
        $('#event_participants').val(sInfo.people_count);
        $('#event_number_mg').val(sInfo.mg_counts);
        $('#mg_count').val(sInfo.sapyor_count);
        $('#event_number_iiv').val(sInfo.iiv_count);
        $('#event_number_fvv').val(sInfo.fvv_count);
        $('#event_number_spring').val(sInfo.spring_count);
        $('#reserve_count').val(sInfo.reserve_count);

        // DATETIME FIX
        if (sInfo.start_event) {
            $('#start_event_date').val(
                sInfo.start_event.replace(' ', 'T').substring(0, 16)
            );
        }

        if (sInfo.finish_event) {
            $('#finish_event_date').val(
                sInfo.finish_event.replace(' ', 'T').substring(0, 16)
            );
        }

        // MAP + COMMENT
        $('#lat').val(sInfo.lat);
        $('#long').val(sInfo.long);
        $('#situation_text').val(sInfo.comment);

        $('#id').val(sInfo.id);

        // MODAL OPEN
        const modalEl = document.getElementById('submitModal');
        const modal = bootstrap.Modal.getOrCreateInstance(modalEl);
        modal.show();
    });
});


 // Delete Record
$('.datatables-projects tbody').on('click', '.deleteAction', function () {

    if (!confirm('Ўчиришга ишончингиз комилми?')) return;

    let RowId = $(this).attr('rel');

    $.get('hrajax.php?act=del_events&rowid=' + RowId, function (html) {
        if (html == 0) {
            $('#row_' + RowId).remove();
        }
    });
});


{/literal}
</script>

{include file="footer.tpl"}
