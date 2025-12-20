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
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex justify-content-between">
                    <h4>Маҳаллалар рўйхати</h4>
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
                    <table class="datatables-projects table table-border">
                        <thead>
                            <tr>
                                <th style="white-space: nowrap">Т/р</th>
                                <th>Ҳудуд</th>
                                <th>Туман</th>
                                <th style="white-space: nowrap">Маҳалла номи</th>
                                <th style="white-space: nowrap">МФЙ раиси</th>
                                <th>Телефон</th>
                                <th style="white-space: nowrap">Ҳоким ёрдамчиси</th>
                                <th>Телефон</th>
                                <th style="white-space: nowrap">Ёшлар етакчиси</th>
                                <th>Телефон</th>
                                <th style="white-space: nowrap">Хотин қизлар фаоли</th>
                                <th>Телефон</th>
                                <th style="white-space: nowrap">Солиқ инспектори</th>
                                <th>Телефон</th>
                                <th style="white-space: nowrap">Ижтимоий ходим</th>
                                <th>Телефон</th>
                                <th style="white-space: nowrap">ИИВ раҳбари</th>
                                <th style="white-space: nowrap">Телефон</th>
                                <th style="white-space: nowrap">ФВВ раҳбари</th>
                                <th style="white-space: nowrap">Телефон</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$neighborhoods item=obekt key=tkey}
                                <tr id="row_{$obekt.id|crypt}">
                                    <td>{$tkey+1}</td>
                                    <td>{$obekt.structure_id}</td>
                                    <td>{$obekt.district}</td>
                                    <td>{$obekt.name}</td>
                                    <td>{$obekt.head}</td>
                                    <td>{$obekt.head_phone}</td>
                                    <td>{$obekt.assistant_governor}</td>
                                    <td>{$obekt.assistant_governor_phone}</td>
                                    <td>{$obekt.youth_leader}</td>
                                    <td>{$obekt.youth_leader_phone}</td>
                                    <td>{$obekt.womens_activist}</td>
                                    <td>{$obekt.womens_activist_phone}</td>
                                    <td>{$obekt.tax_inspector}</td>
                                    <td>{$obekt.tax_inspector_phone}</td>
                                    <td>{$obekt.social_employe}</td>
                                    <td>{$obekt.social_employe_phone}</td>
                                    <td>{$obekt.head_iiv}</td>
                                    <td>{$obekt.head_iiv_phone}</td>
                                    <td>{$obekt.head_fvv}</td>
                                    <td>{$obekt.head_fvv_phone}</td>
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
    <div class="modal-dialog modal-xl modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        
                        <div class="col-sm-4">
                            <label>Ҳудудни танланг</label>
                            <select id="structure_id" class="form-select">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=str}
                                    <option value="{$str.id}">{$str.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>Туманни ёзинг</label>
                            <input required type="text" class="form-control" name="district" id="district" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Маҳалла номи</label>
                            <input required type="text" class="form-control" name="neighborhood_name" id="neighborhood_name" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>МФЙ раиси FISH</label>
                            <input required type="text" class="form-control" name="neighborhood_head" id="neighborhood_head" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input required type="text" class="form-control phone-mask" name="neighborhood_head_phone" id="neighborhood_head_phone" value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Ҳоким ёрдамчиси</label>
                            <input required type="text" class="form-control" name="assistant_governor" id="assistant_governor" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input required type="text" class="form-control phone-mask" name="assistant_governor_phone" id="assistant_governor_phone" value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Ёшлар етакчиси</label>
                            <input required type="text" class="form-control" name="youth_leader" id="youth_leader" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input required type="text" class="form-control phone-mask" name="youth_leader_phone" id="youth_leader_phone" value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Хотин қизлар фаоли</label>
                            <input required type="text" class="form-control" name="womens_activist" id="womens_activist" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input required type="text" class="form-control phone-mask" name="womens_activist_phone" id="womens_activist_phone" value="">
                        </div>

                         <div class="col-sm-4">
                            <label>Солиқ инспектори</label>
                            <input required type="text" class="form-control" name="tax_inspector" id="tax_inspector" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input required type="text" class="form-control phone-mask" name="tax_inspector_phone" id="tax_inspector_phone" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Ижтимоий ходим</label>
                            <input required type="text" class="form-control" name="social_employe" id="social_employe" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input required type="text" class="form-control phone-mask" name="social_employe_phone" id="social_employe_phone" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>ИИВ раҳбари</label>
                            <input type="text" class="form-control" name="head_iiv" id="head_iiv" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input type="text" class="form-control phone-mask" name="head_iiv_phone" id="head_iiv_phone" value="">
                        </div>

                          <div class="col-sm-4">
                            <label>ФВВ раҳбари</label>
                            <input type="text" class="form-control" name="head_fvv" id="head_fvv" value="">
                        </div>

                        <div class="col-sm-4">
                            <label>Телефонi</label>
                            <input type="text" class="form-control phone-mask" name="head_fvv_phone" id="head_fvv_phone" value="">
                        </div>

                        <div class="col-12 text-center mt-3">
                            <input type="hidden" id="id" value="">
                            <button type="button" class="btn btn-label-secondary" data-bs-dismiss="modal">Бекор
                                қилиш</button>
                            <button id="saveBtn" type="button" class="btn btn-primary">Сақлаш</button>
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
<script src="https://unpkg.com/imask"></script>

<script>
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

	
            $(document).ready(function() {

            document.querySelectorAll('.phone-mask').forEach(input => {
                const mask = IMask(input, {
                    mask: '00 000-00-00'
                });

                // default holatda +998 turishi uchun
                // mask.value = '';
            });


            $('#new').click(function() {
                $('#id').val('');
                $('#submitModal').modal('show');
            });

            $('#saveBtn').on('click', function() {
                var form_data = new FormData();
                form_data.append('id', $('#id').val());
                form_data.append('structure_id', $('#structure_id').val());
                form_data.append('district', $('#district').val());
                form_data.append('neighborhood_name', $('#neighborhood_name').val());
                form_data.append('neighborhood_head', $('#neighborhood_head').val());
                form_data.append('neighborhood_head_phone', $('#neighborhood_head_phone').val());
                form_data.append('assistant_governor', $('#assistant_governor').val());
                form_data.append('assistant_governor_phone', $('#assistant_governor_phone').val());
                form_data.append('youth_leader', $('#youth_leader').val());
                form_data.append('youth_leader_phone', $('#youth_leader_phone').val());
                form_data.append('womens_activist', $('#womens_activist').val());
                form_data.append('womens_activist_phone', $('#womens_activist_phone').val());
                form_data.append('tax_inspector', $('#tax_inspector').val());
                form_data.append('tax_inspector_phone', $('#tax_inspector_phone').val());
                form_data.append('social_employe', $('#social_employe').val());
                form_data.append('social_employe_phone', $('#social_employe_phone').val());
                form_data.append('head_iiv', $('#head_iiv').val());
                form_data.append('head_iiv_phone', $('#head_iiv_phone').val());
                form_data.append('head_fvv', $('#head_fvv').val());
                form_data.append('head_fvv_phone', $('#head_fvv_phone').val());

                $.ajax({
                    url: 'hrajax.php?act=act_neighborhood',
                    dataType: 'text',
                    cache: false,
                    contentType: false,
                    processData: false,
                    data: form_data,
                    type: 'post',
                    success: function(resdata) {
                        let obj = JSON.parse(resdata);
                    
                        if (obj.status == 'ok') {
                            location.reload();
                        } else {
                            alert(resdata);
                        }
                    }
                });
                console.log('clicked')
            });
		
			$('.datatables-projects tbody').on('click', '.editAction', function() {
				$('#submitModal').modal('toggle');
				const RowId = $(this).attr('rel');

				$.get('hrajax.php?act=get_neighborhood&rowid=' + RowId, function(html) {
					const sInfo = jQuery.parseJSON(html);
					$('#id').val(sInfo.id);
                    $('#structure_id').val(sInfo.structure_id).trigger('change');
                    $('#district').val(sInfo.district);
                    $('#neighborhood_name').val(sInfo.name);
                    $('#neighborhood_head').val(sInfo.head);
                    $('#neighborhood_head_phone').val(sInfo.head_phone);
                    $('#assistant_governor').val(sInfo.assistant_governor);
                    $('#assistant_governor_phone').val(sInfo.assistant_governor_phone);
                    $('#youth_leader').val(sInfo.youth_leader);
                    $('#youth_leader_phone').val(sInfo.youth_leader_phone);
                    $('#womens_activist').val(sInfo.womens_activist);
                    $('#womens_activist_phone').val(sInfo.womens_activist_phone);
                    $('#tax_inspector').val(sInfo.tax_inspector);
                    $('#tax_inspector_phone').val(sInfo.tax_inspector_phone);
                    $('#social_employe').val(sInfo.social_employe);
                    $('#social_employe_phone').val(sInfo.social_employe_phone);
                    $('#head_iiv').val(sInfo.head_iiv);
                    $('#head_iiv_phone').val(sInfo.head_iiv_phone);
                    $('#head_fvv').val(sInfo.head_fvv);
                    $('#head_fvv_phone').val(sInfo.head_fvv_phone);
				});
			});


			$('.datatables-projects tbody').on('click', '.delete', function() {
				const RowId = $(this).attr('rel');
				Swal.fire({
					title: "Ишончингиз комилми?",
					text: "Бу ёзув ўчирилади!",
					icon: "warning",
					showCancelButton: true,
					confirmButtonText: "Ҳа, ўчирилсин!",
					cancelButtonText: "Бекор қилиш"
				}).then((result) => {
					if (result.isConfirmed) {
						$.get('hrajax.php?act=del_neighborhood&rowid=' + RowId, function(res) {
							if (parseInt(res) === 0) {
								Swal.fire({
									icon: 'success',
									title: 'Ўчирилди!',
									timer: 1000,
									showConfirmButton: false
								});
								setTimeout(() => location.reload(), 1200);
							} else {
								Swal.fire({
									icon: 'error',
									title: 'Хатолик!',
									text: 'Ўчиришда муаммо юз берди.'
								});
							}
						});
					}
				});
			});
		});

	{/literal}
</script>

{include file="footer.tpl"}