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
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex justify-content-between">
                    <h4>Obyektlar bo'yicha naryadlar</h4>
                    <button id="new" type="button" class="btn btn-primary">
                        <i class="menu-icon tf-icons ti ti-plus"></i> Qo‘shish
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
                                <th>No</th>
                                <th>Sana</th>
                                <th>Hudud</th>
                                <th>Obyekt nomi</th>
                         
                                <th>Bo'linma</th>
                                <th>Javobgar shaxs</th>
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
                                    <td>{$obekt.division}</td>
                                    <td>{$obekt.responsible}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$obekt.id|crypt}" class="dropdown-item editAction" href="#"><i
                                                        class="ti ti-pencil me-1"></i>Tahrirlash</a>
                                                <a rel="{$obekt.id|crypt}" class="dropdown-item delete" href="#"><i
                                                        class="ti ti-trash me-1"></i>O‘chirish</a>
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
                            <label>Sana</label>
                            <input type="date" class="form-control" id="day" required />
                        </div>
                   
                        <div class="col-sm-6">
                            <label>Hududni tanlang</label>
                            <select id="structure_id" class="form-select" required>
                                <option value="">Tanlang...</option>
                                {foreach from=$Regions item=str}
                                    <option value="{$str.id}">{$str.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>Bo‘linmani tanlang</label>
                            <select id="division_id" class="form-select">
                                <option value="">Tanlang...</option>
                                {foreach from=$Divisions item=str}
                                    <option value="{$str.id}">{$str.name}</option>
                                {/foreach}
                            </select>
                        </div>
                          
                        <!-- Javobgar shaxs -->
                        <div class="col-sm-6">
                            <label>Javobgar shaxs</label>
                            <select id="responsible_id" class="form-select">
                                <option value="">Tanlang...</option>
                                  {foreach from=$Responsible item=obj}
                                    <option value="{$obj.id}">{$obj.name}</option>
                                {/foreach}
                            </select>
                        </div>
                           <div class="col-sm-6">
                            <label>Obyektni tanlang</label>
                            <select id="object_id" class="form-select" required>
                                <option value="">Tanlang...</option>
                                {foreach from=$Objects item=obj}
                                    <option value="{$obj.id}">{$obj.name}</option>
                                {/foreach}
                            </select>
                        </div>
                 
                        <div class="col-12 text-center mt-3">
                               <input type="hidden" id="id" value="">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Bekor
                                qilish</button>
                            <button id="saveBtn" type="submit" class="btn btn-primary">Saqlash</button>
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
   {literal}
       $(document).ready(function () {


    $('#new').click(function () {
        const modal = new bootstrap.Modal(document.getElementById('submitModal'));
        modal.show();

        const form = $('.needs-validation')[0];
        form.reset();
        form.classList.remove('was-validated');

        $('#id').val('');
        $('#structure_id').val('').trigger('change');
        $('#division_id').val('').trigger('change');
        $('#responsible_id').empty().append('<option value="">Tanlang...</option>');
        $('#object_id').val('');
        $('#day').val('');
    });

    $('.datatables-projects tbody').on('click', '.editAction', function () {
        const RowId = $(this).attr('rel');

        // 🔹 1. Asosiy ma’lumotni olish
        $.get('hrajax.php', { act: 'get_daily_routine', rowid: RowId })
            .done(function (html) {
                const sInfo = jQuery.parseJSON(html);
                if (!sInfo) return console.error('Xatolik: sInfo bo‘sh.');

                // 🔹 Form maydonlarini to‘ldirish
                $('#day').val(sInfo.date || '');
                $('#id').val(sInfo.id || '');
                $('#object_id').val(sInfo.object_id || '').trigger('change');
                $('#structure_id').val(sInfo.structure_id || '').trigger('change');

                // 🔹 2. Bo‘linmalarni yuklash
                $.get('ajax.php', {
                    act: 'get_divisions',
                    structure_id: sInfo.structure_id
                })
                    .done(function (divisions) {
                        if (!divisions || !divisions.length) {
                            console.warn('Bo‘linmalar topilmadi');
                            return;
                        }

                        const $division = $('#division_id');
                        $division.empty().append('<option value="">Tanlang...</option>');

                        $.each(JSON.parse(divisions), function (_, d) {
                            $division.append(`<option value="${d.id}">${d.name}</option>`);
                        });

                        // Agar sInfo.division_id bo‘lsa, o‘shani tanlash
                        $division.val(sInfo.division_id || '').trigger('change');

                        // 🔹 3. Xodimlarni yuklash
                        $.get('ajax.php', {
                            act: 'get_staff',
                            division_id: sInfo.division_id || sInfo.structure_id
                        })
                            .done(function (staff) {                                
                                const $staff = $('#responsible_id');
                                $staff.empty().append('<option value="">Tanlang...</option>');

                                $.each(JSON.parse(staff), function (_, d) {
                                    console.log(111, d);
                                    
                                    $staff.append(`<option value="${d.id}">${d.name}</option>`);
                                });

                                $staff.val(sInfo.responsible_id || '').trigger('change');
                            })
                            .fail(function (xhr) {
                                console.error('Xodimlar yuklanmadi:', xhr.status, xhr.statusText);
                            });
                    })
                    .fail(function (xhr) {
                        console.error('Bo‘linmalar yuklanmadi:', xhr.status, xhr.statusText);
                    });

                // 🔹 4. Modalni ochish
                const modal = new bootstrap.Modal(document.getElementById('submitModal'));
                modal.show();
            })
            .fail(function (xhr) {
                console.error('get_daily_routine so‘rovi xato:', xhr.status, xhr.statusText);
            });
    });



   // selectlar
    $('#structure_id').change(function () {
        const structureId = $(this).val();
        if (!structureId) {
            $('#division_id').empty().append('<option value="">Tanlang...</option>');
            $('#responsible_id').empty().append('<option value="">Tanlang...</option>');
            return;
        }

        // Hududga mos bo‘linmalar
        $.get('ajax.php', {
            act: 'get_divisions',
            structure_id: structureId
        }, function (divisions) {
            $('#division_id').empty().append('<option value="">Tanlang...</option>');
            $.each(divisions, function (i, d) {
                $('#division_id').append('<option value="' + d.id + '">' + d.name + '</option>');
            });
        }, 'json');

        // Hududga mos xodimlar
        $.get('ajax.php', {
            act: 'get_staff',
            structure_id: structureId
        }, function (staff) {
            $('#responsible_id').empty().append('<option value="">Tanlang...</option>');
            $.each(staff, function (i, d) {
                $('#responsible_id').append('<option value="' + d.id + '">' + d.name + '</option>');
            });
        }, 'json');
    });

    $('#division_id').change(function () {
        const divisionId = $(this).val();
        if (!divisionId) {
            $('#responsible_id').empty().append('<option value="">Tanlang...</option>');
            return;
        }

        $.get('ajax.php', {
            act: 'get_staff',
            division_id: divisionId
        }, function (staff) {
            $('#responsible_id').empty().append('<option value="">Tanlang...</option>');
            $.each(staff, function (i, d) {
                $('#responsible_id').append('<option value="' + d.id + '">' + d.name + '</option>');
            });
        }, 'json');
    });


    // Malumot yuborish
   
    const bsForms = $('.needs-validation');
    Array.prototype.slice.call(bsForms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            event.preventDefault();
            event.stopPropagation();

            if (!form.checkValidity()) {
                form.classList.add('was-validated');
                return;
            }

            const form_data = new FormData();
            form_data.append('id', $('#id').val());
            form_data.append('day', $('#day').val());
            form_data.append('structure_id', $('#structure_id').val());
            form_data.append('division_id', $('#division_id').val());
            form_data.append('responsible_id', $('#responsible_id').val());
            form_data.append('object_id', $('#object_id').val());

            $.ajax({
                url: 'hrajax.php?act=act_daily_routine',
                type: 'POST',
                data: form_data,
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function (res) {
                    if (res == 0) {
                        $('#submitModal').modal('hide');
                        Swal.fire({
                            icon: 'success',
                            title: 'Ma\'lumot saqlandi!',
                            showConfirmButton: false,
                            timer: 1000
                        });
                        setTimeout(() => location.reload(), 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Xatolik!',
                            text: res.message || 'Saqlashda xatolik yuz berdi.'
                        });
                    }
                },
                error: function (xhr) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Server bilan aloqa yo‘q!',
                        text: xhr.responseText
                    });
                }
            });

            form.classList.add('was-validated');
        });
    });

  
    // O'chirish
  
    $('.datatables-projects tbody').on('click', '.delete', function () {
        const RowId = $(this).attr('rel');
        Swal.fire({
            title: "Ishonchingiz komilmi?",
            text: "Bu yozuv o‘chiriladi!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Ha, o‘chirilsin!",
            cancelButtonText: "Bekor qilish"
        }).then((result) => {
            if (result.isConfirmed) {
                $.get("hrajax.php?act=del_daily_routine&rowid=" + RowId, function (html) {
                    if (parseInt(html) === 0) {
                        $("#row_" + RowId).remove();
                        Swal.fire({
                            icon: 'success',
                            title: 'O‘chirildi!',
                            showConfirmButton: false,
                            timer: 1000
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Xatolik!',
                            text: 'O‘chirishda xato yuz berdi.'
                        });
                    }
                }).fail(function (xhr) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Server bilan aloqa yo‘q!',
                        text: xhr.statusText
                    });
                });
            }
        });
    });

});


    {/literal}

</script>


{include file="footer.tpl"}