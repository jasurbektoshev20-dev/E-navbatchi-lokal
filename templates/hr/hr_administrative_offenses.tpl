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
                    <table class="datatables-projects table border-top">
                        <thead>
                            <tr>
                                <th>No̱</th>
                                <th class="text-center">Ҳудуд</th>  
                                <th class="text-center">{$Dict.date}</th>
                                <th class="text-center">Модда</th>
                                <th class="text-center">Soni</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$violations item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td>{$Table.structure_name}</td>
                                     <td>{$Table.date}</td> 
                                    <td>{$Table.type_name}</td> 
                                    <td>{$Table.count}</td>                       
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
                        <div class="col-sm-6">
                            <label>{$Dict.region}</label>
                            <select required class="select form-control" name="region_id" id="region_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=Item6 key=ikey6}
                                    <option value="{$Item6.id}">{$Item6.name}</option>
                                {/foreach}
                            </select>
                        </div>
                          <div class="col-sm-6">
                            <label>Моддаси</label>
                            <select required class="select form-control" name="substance" id="substance">
                                <option value="">{$Dict.choose}</option>
                                    {foreach from=$Regions item=Item6 key=ikey6}
                                    <option value="{$Item6.id}">{$Item6.name}</option>
                                {/foreach}
                            </select>
                        </div> 
                         <div class="col-sm-6">
                            <label>Soni</label>
                            <input required type="number" class="form-control" name="crime_count" id="crime_count" value="">
                        </div>

                        <div class="col-sm-6">
                            <label for="event_date" class="form-label">Sana</label>
                            <input type="datetime" class="form-control" placeholder="DD-MM-YYYY" id="event_date"
                                name="event_date" />
                         </div>
                     
                        <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <input type="hidden" name="photo" id="photo" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"
                                aria-label="Close">
                                {$Dict.cancel}
                            </button>
                            <button type="button" id="submit" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
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

<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="https://unpkg.com/imask"></script>

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
    var dict_choose = "{$Dict.choose}";
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

           const flatpickrDate = document.querySelector('#event_date');
        if (flatpickrDate) {
            flatpickrDate.flatpickr({
            enableTime: true,
            dateFormat: "d-m-Y",
            // time_24hr: true,
            monthSelectorType: 'static'
            });
        }

        let event_date;
        $('#event_date').on('change', function() {
            let [day, month, year] = datePart.split('-');
            event_date = `${year}-${month}-${day}`;
        })


        $('#new').click(function() {
            $('#submitModal').modal('toggle');
            $('#region_id').val(0);
            $('#region_id').trigger("change");
            $('#substance').val(0);
            $('#substance').trigger("change");
            $('#crime_count').val("");
            $('#event_date').val("");
        });

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');

            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=get_administrative_offenses&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);
               $('#id').val(sInfo.id);
                $('#region_id').val(sInfo.region_id);
                $('#substance').val(sInfo.violation_id);
                $('#crime_count').val(sInfo.count);
                $('#event_date').val(sInfo.date);
            });
        })


        // Form validation and submit
        const bsValidationForms = $('.needs-validation');
        Array.prototype.slice.call(bsValidationForms).forEach(function(form) {
            $('#submit').click(function(event) {
                 console.log('clicked')
                    event.preventDefault();
                    event.stopPropagation();

                    var form_data = new FormData();
                   form_data.append('id', $('#id').val());
                    form_data.append('region_id', $('#region_id').val());
                    form_data.append('violation_id', $('#substance').val());
                    form_data.append('count', $('#crime_count').val());
                    form_data.append('date', $('#event_date').val());
                    $.ajax({
                        url: 'hrajax.php?act=act_administrative_offenses',
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
          

                form.classList.add('was-validated');
            });
        });

        // Delete Record
        $('.datatables-projects tbody').on('click', '.delete', function() {
            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=del_staffs&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });

    {/literal}
</script>

{include file="footer.tpl"}