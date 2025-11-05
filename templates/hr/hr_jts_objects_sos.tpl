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
                    <h4 class="m-0">Tashvish tugmalari</h4>
                    {* <h4>{$ThisMenu.name}</h4> *}
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
                                <th class="text-center">Koordinata X</th>
                                <th class="text-center">Koordinata Y</th>
                                <th class="text-center">Nomi</th>
                                
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$sos_buttons item=obekt key=tkey}
                            <tr class="lb" id="row_{$obekt.id|crypt}">
                                <td class="text-right">{$tkey+1}</td>
                                <td class="text-center">{$obekt.long}</td>
                                <td class="text-center">{$obekt.lat}</td>
                                <td class="text-center">{$obekt.name}</td>
                  
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a rel="{$obekt.id|crypt}" class="dropdown-item editAction"
                                                href="javascript:void(0);"><i
                                                    class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                            <a rel="{$obekt.id|crypt}" class="dropdown-item delete"
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
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="needs-validation" novalidate>
                  <!-- 🔥 Yangi qo‘shiladigan yashirin input -->
                  
  <input type="hidden" name="object_id" id="object_id">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label>Nomini kiriting</label>
                            <input required type="text" class="form-control" name="address" id="address">
                        </div>
                        <div class="col-sm-6">
                            <label>Uzunlik Y </label>
                            <input required type="text" class="form-control" name="lat" id="lat" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>Kenglik X</label>
                            <input required type="text" class="form-control" name="long" id="long" value="">
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

      function getUrlParameter(name) {
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)');
    var results = regex.exec(window.location.href);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

var urlId = getUrlParameter('id');  // bu endi "1" bo'ladi



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
         $.get("hrajax.php?act=get_jts_objects_sos&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);
            $('#address').val(sInfo.name);
            $('#lat').val(sInfo.lat);
            $('#long').val(sInfo.long);
            $('#object_id').val(sInfo.object_id); // bu yerda object_id set qilinadi
            $('#id').val(sInfo.rowid);    
        });
    });

$('#new').on('click', function (e) {
    e.preventDefault();

    // Bootstrap 5 modalni olish
    const modalEl = document.getElementById('submitModal');
    const modal = new bootstrap.Modal(modalEl);

    // Formani tozalash
    $('form.needs-validation')[0].reset();
    $('form.needs-validation').removeClass('was-validated');

    // Formadagi qiymatlarni tozalash
    $('#address').val("").trigger('change');
    $('#lat').val('');
    $('#long').val('');
       $('#object_id').val(urlId);  // URL dan kelgan id
    $('#id').val(urlId);         // update qilish uchun

    // Modalni ochish
    modal.show();
});



   const bsValidationForms = $('.needs-validation');
    Array.prototype.slice.call(bsValidationForms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            event.stopPropagation();

            if (!form.checkValidity()) {
                form.classList.add('was-validated');
                return;
            }

            var form_data = new FormData();

            // Barcha form elementlarini to‘plash
            // form_data.append('id', $('#id').val());
            form_data.append('object_id', $('#object_id').val());
            form_data.append('name', $('#address').val());
            form_data.append('lat', $('#lat').val());
            form_data.append('long', $('#long').val());


            
            // 🔥 AJAX orqali backendga yuborish
            $.ajax({
                url: 'hrajax.php?act=act_jts_objects_sos',
                type: 'POST',
                data: form_data,
                contentType: false,
                processData: false,
                success: function (resdata) {
                    //console.log(resdata);
                    var NewArray = resdata.split("<&sep&>");
                    if (NewArray[0] == 0) {
                        location.reload();
                    } else {
                        alert(resdata);
                    }
                },
                error: function () {
                    Swal.fire({
                        icon: 'error',
                        title: 'Aloqa xatosi!',
                        text: 'Server bilan bog‘lanishda muammo.'
                    });
                }
            });

            form.classList.add('was-validated');
        });
    });

    // Delete Record 
    $('.datatables-projects tbody').on('click', '.delete', function() {
         var RowId = $(this).attr('rel');
          $.get("hrajax.php?act=del_jts_objects_sos&rowid=" + RowId,
           function(html) {
             if (html == 0) { $("#row_" + RowId).remove();
             } }); });
    {/literal}
</script>

{include file="footer.tpl"}