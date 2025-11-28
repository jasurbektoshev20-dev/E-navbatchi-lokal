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
								<th class="text-center">Т/р</th>
								<th class="text-center">Патрул Тури</th>
								<th class="text-center">ФИШ</th>
								<th class="text-center">Бўлинма</th>
								<th class="text-center">Эпикрофка</th>
								<th class="text-center">Бодй камера</th>
								<th class="text-center">Автомобил</th>
								<th class="text-center">Otlar soni</th>
								<th class="text-center">Itlar</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="table-body">
						 {foreach from=$EventDuties item=item key=tkey name=name}
								<tr id="row_{$item.id|crypt}">
									<td class="text-center">{$tkey+1}</td>
									<td class="text-center">{$item.patrul_type}</td>
									<td class="text-center">{$item.staff}</td>
									<td class="text-center">{$item.structure_name}</td>
									<td class="text-center">{$item.epic}</td>
                                    <td class="text-center">
										<a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												fill="currentColor" class="bi bi-camera-video-fill" viewBox="0 0 16 16">
												<path fill-rule="evenodd"
													d="M0 5a2 2 0 0 1 2-2h7.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 4.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 13H2a2 2 0 0 1-2-2z" />
											</svg></a>
									</td>
									<td class="text-center">{$item.car_name}</td>
									<td class="text-center">{$item.horse_count}</td>
									<td class="text-center">{$item.dog_id}</td>
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
	</div>
</div>

<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-simple modal-edit-user">
		<div class="modal-content p-1 p-md-5">
			<div class="modal-body">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				<form id="localForm" class="needs-validation" novalidate>
					<div class="row g-3">
                     
						<div class="col-sm-6">
							<label>Hududni танланг</label>
							  <select class="form-select" id="region_id" name="region_id">
								    <option value="">Танланг...</option>
                                    {foreach from=$Structure item=st key=mkey}
                                        <option class="selectOption" value="{$st.id}">{$st.name}</option>
                                    {/foreach}
                            </select>
						</div>

						   <div class="col-sm-6">
                            <label>{$Dict.territorial_short}</label>
                            <select id="structure_id" class="form-select" name="structure_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$StructureAll item=obj}
                                    <option value="{$obj.id}">{$obj.name}</option>
                                {/foreach}
                            </select>
                        </div>

						<div class="col-sm-6">
							<label>Патрул турини танланг</label>
							<select class="form-control" id="patrul_type">
								<option value="">Танланг...</option>
								{foreach from=$patrul_types item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>


						<div class="col-sm-6 mt-3">
							<label for="responsible_person_date">Ҳарбий хизматчиларни танланг</label>
							<select required id="staff_id" class="select2 form-select" multiple name="staff_id">
								{foreach from=$duties item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-sm-6">
							<label for="select2Multiple" class="form-label">Эпикировкани танланг</label>
							<select id="epikirofka_id" class="select2 form-select" multiple name="epikirofka_id">
								{foreach from=$epic item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-sm-6">
							<label>Автомобилни танланг</label>
							<select id="car_id" class="form-control" name="car_id">
								<option value="">Танланг...</option>
								{foreach from=$cars item=obj}
									<option value="{$obj.id}">{$obj.name}</option>
								{/foreach}
							</select>
						</div>

						<div class="col-sm-6">
							<label>Otlar soni</label>
							<input type="number" class="form-control" name="horse_count" id="horse_count">
						</div>

						<div class="col-sm-6">
							<label>Itni танланг</label>
							<select id="dog_id" class="form-control">
								<option value="">Танланг...</option>
								{foreach from=$dog_types item=obj}
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

		$(document).ready(function() {
			$('#new').click(function() {
				$('#localForm')[0].reset();
				$('#id').val('');
				$('.select2').val(null).trigger('change');
				$('#submitModal').modal('show');
			});
			const urlParams = new URLSearchParams(window.location.search);
			const obyekt_id = urlParams.get('mid');

			$('.datatables-projects tbody').on('click', '.editAction', function() {
				$('#submitModal').modal('toggle');
				const RowId = $(this).attr('rel');

				$.get('hrajax.php?act=get_event_duty&rowid=' + RowId, function(html) {
					const sInfo = jQuery.parseJSON(html);
					console.log('Edit data:', sInfo);
					$('#id').val(sInfo.id);				
					$('#region_id').val(sInfo.regions).trigger('change');
					$('#structure_id').val(sInfo.structure_id).trigger('change');
					if (sInfo.epikirofka_id) {
						const epik = sInfo.epikirofka_id.replace(/[{}]/g, '').split(',').map(x => x
							.trim());
						$('#epikirofka_id').val(epik).trigger('change');
					}
					$('#car_id').val(sInfo.car_id).trigger('change');
					$('#patrul_type').val(sInfo.patrul_type).trigger('change');
					$('#horse_count').val(sInfo.horse_count);
					$('#dog_id').val(sInfo.dog_id).trigger('change');
					$('#staff_id').val(sInfo.staff_id).trigger('change');
					
				});
			});

			        // Filtering
				$('#region_id').change(function(event) {
					$.get("ajax.php?act=get_event_duty&structure_id=" + this.value, function(html) {
						var sInfo = jQuery.parseJSON(html);
						$('#structure_id').empty();
						$('#structure_id').append(`<option value="">${dict_choose}</option>`);
						sInfo.forEach((item, index) => {
							$('#structure_id').append(`<option value="${item.id}">${item.name}</option>`);
						});
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
				form_data.append('public_event1_id', obyekt_id);
				form_data.append('structure_id', $('#structure_id').val());
				form_data.append('structure_id', $('#region_id').val());
				form_data.append('epikirofka_id', $('#epikirofka_id').val());
				form_data.append('staff_id', $('#staff_id').val());
				form_data.append('car_id', $('#car_id').val());
				form_data.append('patrul_type', $('#patrul_type').val());
				form_data.append('horse_count', $('#horse_count').val());
				form_data.append('dog_id', $('#dog_id').val());
				const actUrl = id ? 'hrajax.php?act=act_event_duty' :
					'hrajax.php?act=act_event_duty';

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
						$.get('hrajax.php?act=del_event_duty&rowid=' + RowId, function(res) {
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