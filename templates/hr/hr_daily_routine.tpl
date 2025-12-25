{include file="header.tpl"}

<style>
{literal}
.table th, .table td { font-size:15px; vertical-align:middle; }
{/literal}
</style>

<div class="container-fluid container-p-y">

    <!-- HEADER -->
    <div class="card mb-3">
        <div class="card-body d-flex justify-content-between align-items-center">
            <h4>{$ThisMenu.name}</h4>

            <div class="d-flex gap-2">
                <input type="text" id="start_date" class="form-control" placeholder="Boshlanish sana">
                <input type="text" id="finish_date" class="form-control" placeholder="Tugash sana">
                <button class="btn btn-info" id="btn_filter">Ko‘rish</button>
            </div>

            <button id="new" class="btn btn-primary">
                <i class="ti ti-plus"></i> {$Dict.adding}
            </button>
        </div>
    </div>

    <!-- TABLE -->
    <div class="card">
        <div class="table-responsive">
            <table class="table table-bordered datatables-projects">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Ҳудуд</th>
                        <th>Жойи</th>
                        <th>Номи</th>
                        <th>Бошланиш</th>
                        <th>Тугаш</th>
                        <th>Фуқаро</th>
                        <th>Камера</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="events_tbody"></tbody>
            </table>
        </div>
    </div>

</div>

<!-- MODAL -->
<div class="modal fade" id="submitModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content p-3">
            <form id="eventForm">
                <input type="hidden" id="id" value="0">

                <div class="row g-3">
                    <div class="col-md-6">
                        <label>Номи</label>
                        <input type="text" id="event_name" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Фуқаро сони</label>
                        <input type="number" id="people_count" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>Бошланиш</label>
                        <input type="text" id="start_event" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>Тугаш</label>
                        <input type="text" id="finish_event" class="form-control">
                    </div>
                </div>

                <div class="text-center mt-3">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        {$Dict.cancel}
                    </button>
                    <button class="btn btn-primary" id="saveBtn">
                        {$Dict.save}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>

<script>
/* ===== DICT ===== */
var dict_edit   = "{$Dict.edit}";
var dict_delete = "{$Dict.delete}";
</script>

<script>
{literal}
/* ===== DATE PICKER ===== */
flatpickr('#start_date', {dateFormat:'Y-m-d'});
flatpickr('#finish_date', {dateFormat:'Y-m-d'});

/* ===== LOAD EVENTS ===== */
function loadEvents(start='', finish='') {

    let fd = new FormData();
    if(start) fd.append('start_date', start);
    if(finish) fd.append('finish_date', finish);

    $.ajax({
        url: 'ajax.php?act=get_events_date',
        type: 'POST',
        data: fd,
        dataType: 'json',
        contentType: false,
        processData: false,
        success: function(res) {

            let tbody = $('#events_tbody').empty();

            if(!res.Events || res.Events.length === 0){
                tbody.html('<tr><td colspan="9" class="text-center">Маълумот йўқ</td></tr>');
                return;
            }

            $.each(res.Events, function(i,e){
                tbody.append(`
                    <tr id="row_${e.id}">
                        <td>${i+1}</td>
                        <td>${e.region_name}</td>
                        <td>${e.object_name}</td>
                        <td>${e.event_name}</td>
                        <td>${e.start_event}</td>
                        <td>${e.finish_event}</td>
                        <td>${e.people_count}</td>
                        <td class="text-center">
                            <a href="hr.php?act=events_cam&mid=${e.id}">
                                <i class="ti ti-camera"></i>
                            </a>
                        </td>
                        <td>
                            <div class="dropdown">
                                <button class="btn p-0" data-bs-toggle="dropdown">
                                    <i class="ti ti-dots-vertical"></i>
                                </button>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item editAction" rel="${e.id}" href="#">
                                        ✏️ ${dict_edit}
                                    </a>
                                    <a class="dropdown-item delete" rel="${e.id}" href="#">
                                        🗑 ${dict_delete}
                                    </a>
                                </div>
                            </div>
                        </td>
                    </tr>
                `);
            });

            if($.fn.DataTable.isDataTable('.datatables-projects')){
                $('.datatables-projects').DataTable().destroy();
            }

            $('.datatables-projects').DataTable({pageLength:10});
        }
    });
}

/* ===== PAGE LOAD ===== */
$(document).ready(function(){
    loadEvents();
});

/* ===== FILTER ===== */
$('#btn_filter').on('click', function(){
    loadEvents($('#start_date').val(), $('#finish_date').val());
});

/* ===== DELETE ===== */
$(document).on('click','.delete',function(e){
    e.preventDefault();
    let id = $(this).attr('rel');
    if(!confirm('Ўчиришга ишончингиз комилми?')) return;

    $.get('hrajax.php?act=del_daily_routine&rowid='+id, function(res){
        if(res==0) $('#row_'+id).remove();
    });
});

/* ===== EDIT ===== */
$(document).on('click','.editAction',function(e){
    e.preventDefault();
    let id = $(this).attr('rel');
    $('#submitModal').modal('show');

    $.getJSON('hrajax.php?act=get_daily_routine&rowid='+id, function(r){
        $('#id').val(r.id);
        $('#event_name').val(r.event_name);
        $('#people_count').val(r.people_count);
        $('#start_event').val(r.start_event);
        $('#finish_event').val(r.finish_event);
    });
});

/* ===== NEW ===== */
$('#new').on('click',function(){
    $('#eventForm')[0].reset();
    $('#id').val(0);
    $('#submitModal').modal('show');
});
{/literal}
</script>

{include file="footer.tpl"}
