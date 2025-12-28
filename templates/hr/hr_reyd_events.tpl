{include file="header.tpl"}

<style>
{literal}
.table thead th,
.table tbody td {
    text-transform: none !important;
    font-size: 16px;
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

                    <div class="filter-box" style="display: flex;">
                        <input type="text" id="start_date" class="form-control" placeholder="Бошланиш санаси" style="margin-right: 5px;">
                        <input type="text" id="finish_date" class="form-control" placeholder="Тугаш санаси" style="margin-right: 5px;">
                        <button id="clearFilter" class="btn btn-secondary">Тозалаш</button>
                    </div>

                    <button id="new" class="btn btn-primary">
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
                            <th>т/р</th>
                            <th class="text-center">{$Dict.region}</th>
                            <th class="text-center">{$Dict.structure}</th>
                            <th class="text-center">{$Dict.responsible}</th>
                            <th class="text-center">{$Dict.staff}</th>
                            <th class="text-center">Бошланиш вақти</th>
                            <th class="text-center">Тугаш вақти</th>
                            <th class="text-center">Техника сони</th>
                            <th class="text-center">Асосий</th>
                            <th class="text-center">Машқ тури</th>
                            <th class="text-center">Ҳолат ҳақида қисқача</th>
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

<!-- MODAL -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content p-4">
            <div class="modal-body">

                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>

                <form id="reydEventsForm" novalidate>
                    <div class="row g-3">

                        <div class="col-sm-6">
                            <label>{$Dict.region}</label>
                            <select class="form-control" name="region_id" id="region_id" required>
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=r}
                                    <option value="{$r.id}">{$r.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-6">
                            <label>Hududiy bo‘linma</label>
                            <select class="form-control" name="structure_id" id="structure_id" required>
                                <option value="">{$Dict.choose}</option>
                            </select>
                        </div>

                        <div class="col-sm-6">
                            <label>{$Dict.masul}</label>
                            <select class="form-control" name="responsible_id" id="responsible_id" required>
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$staffs item=s}
                                    <option value="{$s.id}">{$s.name} {$s.lastname} {$s.firstname}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-6">
                            <label>{$Dict.contingent}</label>
                            <input type="number" class="form-control" name="staff_count" id="staff_count" required>
                        </div>

                        <div class="col-sm-6">
                            <label>Бошланиш вақти</label>
                            <input type="text" class="form-control" name="start_date" id="start_date_modal">
                        </div>

                        <div class="col-sm-6">
                            <label>Тугаш вақти</label>
                            <input type="text" class="form-control" name="end_date" id="end_date_modal">
                        </div>

                        <div class="col-sm-6">
                            <label>Техника сони</label>
                            <input type="number" class="form-control" name="vehicles_count" id="vehicles_count">
                        </div>

                        <div class="col-sm-6">
                            <label>Асосий</label>
                            <select class="form-control" name="type" id="type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$types item=t}
                                    <option value="{$t.id}">{$t.name1}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-12">
                            <label>Машқ тури</label>
                            <select class="form-control" name="exercises_type" id="exercises_type">
                                <option value="">{$Dict.choose}</option>
                                <option value="Қуролдан отиш">Қуролдан отиш</option>
                                <option value="Танкда отиш">Танкда отиш</option>
                            </select>
                        </div>

                        <div class="col-sm-12">
                            <label>{$Dict.case_summary}</label>
                            <textarea class="form-control" name="description" id="description" rows="4"></textarea>
                        </div>

                        <input type="hidden" name="id" id="id" value="0">

                        <div class="col-12 text-center">
                            <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">
                                {$Dict.cancel}
                            </button>
                            <button type="submit" class="btn btn-primary">
                                {$Dict.save}
                            </button>
                        </div>

                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>

<script>
{literal}

let dt;

/* DATEPICKER */
flatpickr("#start_date", { dateFormat: "Y-m-d" });
flatpickr("#finish_date", { dateFormat: "Y-m-d" });
flatpickr("#start_date_modal", { dateFormat: "Y-m-d" });
flatpickr("#end_date_modal", { dateFormat: "Y-m-d" });

/* REGION -> STRUCTURE */
$('#region_id').on('change', function () {
    $.get('ajax.php?act=get_divisions&structure_id=' + this.value, function (res) {
        let data = JSON.parse(res);
        $('#structure_id').html('<option value="">Танланг</option>');
        data.forEach(i => {
            $('#structure_id').append(`<option value="${i.id}">${i.name}</option>`);
        });
    });
});

/* LOAD TABLE */
function loadEvents() {
    $.post('ajax.php?act=get_reyd_events_date', {}, function (res) {

        let html = '';
        let i = 1;

        res.Events.forEach(item => {
            html += `
            <tr id="row_${item.id}">
                <td>${i++}</td>
                <td>${item.region_name ?? ''}</td>
                <td>${item.structure_name ?? ''}</td>
                <td>${item.responsible ?? ''}</td>
                <td>${item.staff_count ?? ''}</td>
                <td>${item.start_date ?? ''}</td>
                <td>${item.end_date ?? ''}</td>
                <td>${item.vehicles_count ?? ''}</td>
                <td>${item.type ?? ''}</td>
                <td>${item.exercises_type ?? ''}</td>
                <td>${item.description ?? ''}</td>
                <td>
                    <a href="javascript:void(0)" class="editAction" data-id="${item.id}">
                        <i class="ti ti-pencil"></i>
                    </a>
                </td>
            </tr>`;
        });

        if (dt) dt.destroy();
        $('#events_tbody').html(html);
        dt = $('.datatables-projects').DataTable();
    }, 'json');
}

/* PAGE LOAD */
$(document).ready(loadEvents);

/* NEW */
$('#new').on('click', function () {
    $('#reydEventsForm')[0].reset();
    $('#id').val(0);
    bootstrap.Modal.getOrCreateInstance(document.getElementById('submitModal')).show();
});

/* EDIT */
$('.datatables-projects tbody').on('click', '.editAction', function () {
    let id = $(this).data('id');

    $.get('hrajax.php?act=get_reyd_events&rowid=' + id, function (res) {

        let s = JSON.parse(res);

        $('#region_id').val(s.region_id).trigger('change');
        $('#structure_id').val(s.structure_id);
        $('#responsible_id').val(s.responsible_id);
        $('#staff_count').val(s.staff_count);
        $('#vehicles_count').val(s.vehicles_count);
        $('#type').val(s.type);
        $('#exercises_type').val(s.exercises_type);
        $('#start_date_modal').val(s.start_date);
        $('#end_date_modal').val(s.end_date);
        $('#description').val(s.description);
        $('#id').val(s.id);

        bootstrap.Modal.getOrCreateInstance(document.getElementById('submitModal')).show();
    });
});

/* SAVE */
$(document).on('submit', '#reydEventsForm', function (e) {
    e.preventDefault();

    let formData = new FormData(this);

    $.ajax({
        url: 'hrajax.php?act=act_reyd_events',
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function (res) {
            res = res.trim();
            let p = res.split('<&sep&>');
            if (p[0] === '0') {
                bootstrap.Modal.getInstance(document.getElementById('submitModal')).hide();
                loadEvents();
            } else alert(res);
        }
    });
});

{/literal}
</script>

{include file="footer.tpl"}
