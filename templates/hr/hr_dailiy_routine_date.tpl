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
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body d-flex justify-content-between">
					{if isset($daily_outfit2[0])}
						<h4 style="margin: 0;">
							{$daily_outfit2[0].object_name}га {$daily_outfit2[0].day_name} санасида тушган нарядлар рўйхати.
						</h4>
					{/if}
					<button id="new" type="button" class="btn btn-primary waves-effect waves-light">
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
					<table class="datatables-projects table border-top">
						<thead>
							<tr>
								<th style="white-space: nowrap" class="text-center">т/р</th>
								<th style="white-space: nowrap" class="text-center">Патрул Тури</th>
								<th class="text-center">Йўналиши</th>
								<th class="text-center">Сменаси</th>
								<th class="text-center">ФИШ</th>
								<th class="text-center">Бўлинма</th>
								<th class="text-center">Эпикрофка</th>
								<th class="text-center">Бодикамера</th>
								<th class="text-center">Автомобил</th>
								<th style="white-space: nowrap" class="text-center">Отлар сони</th>
								<th class="text-center">Итлар</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="table-body">

							{foreach from=$RoutineDate item=obekt key=tkey}
								<tr>
									<td class="text-center">{$tkey + 1}</td>
									<td class="text-center">{$obekt.patrul_type}</td>
									<td class="text-center">{$obekt.direction}</td>
									<td class="text-center">{$obekt.smena}</td>
									<td class="text-center">{$obekt.staff}</td>
									<td class="text-center">{$obekt.structure_name}</td>
									<td class="text-center">{$obekt.epic}</td>
									<td class="text-center" onclick="attachmentBody({$obekt.id})">
										<a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-camera-video-fill" viewBox="0 0 16 16">
												<path fill-rule="evenodd"
													d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2z" />
											</svg></a>
									</td>
									<td class="text-center">{$obekt.car}</td>
									<td class="text-center">{$obekt.horse_count}</td>
									<td class="text-center">{$obekt.dog_type}</td>
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

<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-simple modal-edit-user">
		<div class="modal-content p-1 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="localForm" class="needs-validation" novalidate>
					<div class="row g-3">

						<div class="col-sm-4">
							<label>Патрул турини танланг</label>
							<select class="form-control" id="patrul_type">
								<option value="">Танланг...</option>
								{foreach from=$PatrulTypes item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-sm-4">
							<label>Йўналишни киритинг</label>
							<input required type="number" class="form-control" name="direction" id="direction">
						</div>

						<div class="col-sm-4">
							<label>Сменани киритинг</label>
							<input required type="number" class="form-control" name="smena" id="smena">
						</div>

						<div class="col-sm-6 mt-3">
							<label for="responsible_person_date">Ҳарбий хизматчиларни танланг</label>
							<select required id="staff_id" class="select2 form-select" multiple>
								{foreach from=$Staffs item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-sm-4">
							<label for="select2Multiple" class="form-label">Эпикировкани танланг</label>
							<select id="epikirofka_id" class="select2 form-select" multiple>
								{foreach from=$Epikirovka item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-sm-4">
							<label>Автомобилни танланг</label>
							<select id="car_id" class="form-control">
								<option value="">Танланг...</option>
								{foreach from=$Cars item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-sm-4">
							<label>Отлар сони</label>
							<input type="number" class="form-control" name="horse_count" id="horse_count">
						</div>

						<div class="col-sm-4">
							<label>Itni танланг</label>
							<select id="dog_id" class="form-control">
								<option value="">Танланг...</option>
								{foreach from=$Dogtypes item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<!-- Tugmalar -->
						<div class="col-12 text-center mt-5">
							<input type="hidden" id="id" value="">
							<button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"
								aria-label="Close">
								Бекор қилиш
							</button>
							<button id="saveBtn" class="btn btn-primary me-sm-3 me-1">Сақлаш</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


{* Bodikamera modal *}
<div class="modal fade" id="bodyModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="row g-3">
                    <div class="col-12">
                        <label>Kamera tanlang</label>
                        <select required class="form-control" name="bodycam_id" id="bodycam_id">
                            <option value="">{$Dict.choose}</option>
                            {foreach from=$BodyCams item=Item key=ikey}
                                <option value="{$Item.id}">{$Item.name}</option>
                            {/foreach}
                        </select>
                    </div>  
                    <div class="col-12 text-center">
                        <input type="hidden" name="body_id" id="body_id" value="">
                        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
                            {$Dict.cancel}
                        </button>
                        <button type="submit" id="submit" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
                    </div>
                </div>
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

	    var dt_basic_table = $('.datatables-projects'),
            dt_basic;

        // DataTable with buttons
        if (dt_basic_table.length) {
            dt_basic = dt_basic_table.DataTable({
                displayLength: 10,
                lengthMenu: [5, 10, 25, 50, 75, 100, 1000]
            });
        }


		$(function() {
			const select2 = $('.select2');
			if (select2.length) {
				select2.each(function() {
					const $this = $(this);
					$this.wrap('<div class="position-relative"></div>').select2({
						placeholder: 'Танланг...',
						dropdownParent: $this.parent()
					});
				});
			}
		});

		function attachmentBody(body_id){
			$('#body_id').val(body_id);
			$('#bodyModal').modal('toggle');
			$('#bodycam_id').val('');
			$('#bodycam_id').trigger("change");
		}

		$(document).ready(function() {

			$('#new').click(function() {
				$('#localForm')[0].reset();
				$('#id').val('');
				$('.select2').val(null).trigger('change');
				$('#submitModal').modal('show');
			});

	


		 $('#submit').on('click', function() {
            var form_data = new FormData();
             console.log("body ", $('#body_id').val())
            form_data.append('bodycam_id', $('#bodycam_id').val());
            form_data.append('rowid', $('#body_id').val());

            $.ajax({
                url: 'hrajax.php?act=update_dailiy_routine_bodycam',
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
           });
			const urlParams = new URLSearchParams(window.location.search);
			const obyekt_id = urlParams.get('obyekt');

			$('.datatables-projects tbody').on('click', '.editAction', function() {
				$('#submitModal').modal('toggle');
				const RowId = $(this).attr('rel');

				$.get('hrajax.php?act=get_dailiy_routine_date&rowid=' + RowId, function(html) {
					const sInfo = jQuery.parseJSON(html);
					console.log('Edit data:', sInfo);

					$('#id').val(sInfo.id);
					$('#patrul_type').val(sInfo.patrul_type).trigger('change');
					$('#dog_id').val(sInfo.dog_id).trigger('change');
					$('#direction').val(sInfo.direction);
					$('#smena').val(sInfo.smena);
					$('#horse_count').val(sInfo.horse_count);
					$('#car_id').val(sInfo.car_id).trigger('change');
					$('#staff_id').val(sInfo.staff_id).trigger('change');
					if (sInfo.epikirofka_id) {
						const epik = sInfo.epikirofka_id.replace(/[{}]/g, '').split(',').map(x => x
							.trim());
						$('#epikirofka_id').val(epik).trigger('change');
					}
				});
			});

			$('#localForm').on('submit', function(e) {
				e.preventDefault();
				const form = this;

				if (!form.checkValidity()) {
					e.stopPropagation();
					form.classList.add('was-validated');
					return;
				}

				const id = $('#id').val();
				const form_data = new FormData();

				form_data.append('id', id);
				form_data.append('routine_id', obyekt_id);
				form_data.append('patrul_type', $('#patrul_type').val());
				form_data.append('dog_id', $('#dog_id').val());
				form_data.append('direction', $('#direction').val());
				form_data.append('smena', $('#smena').val());
				form_data.append('horse_count', $('#horse_count').val());
				form_data.append('car_id', $('#car_id').val());
				form_data.append('epikirofka_id', $('#epikirofka_id').val());
				form_data.append('staff_id', $('#staff_id').val());

				const actUrl = id ? 'hrajax.php?act=act_dailiy_routine_date' :
					'hrajax.php?act=act_dailiy_routine_date';

				$.ajax({
					url: actUrl,
					type: 'POST',
					data: form_data,
					processData: false,
					contentType: false,
					dataType: 'json',
					success: function(res) {
						console.log('Server javobi:', res);
						if (res.status === 'ok' || res == 0) {
							Swal.fire({
								icon: 'success',
								title: id ? 'Маълумот янгиланди!' : 'Маълумот сақланди!',
								timer: 1000,
								showConfirmButton: false
							});
							$('#submitModal').modal('hide');
							setTimeout(() => location.reload(), 1000);
						} else {
							Swal.fire({
								icon: 'error',
								title: 'Хатолик!',
								text: res.message ||
									'Сақлашда муаммо юз берди.'
							});
						}
					},
					error: function(xhr) {
						Swal.fire({
							icon: 'error',
							title: 'Сервер билан алоқа йўқ!',
							text: xhr
								.responseText
						});
					}
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
						$.get('hrajax.php?act=del_dailiy_routine_date&rowid=' + RowId, function(res) {
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