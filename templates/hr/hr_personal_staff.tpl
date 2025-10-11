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
                    <table class="datatables-projects table border-top">
                        <thead>
                            <tr>
                                <th>No̱</th>
                                <th class="text-center">{$Dict.region}</th>
                                <th class="text-center">{$Dict.date}</th>
                                <th class="text-center">{$Dict.object_type}</th>
                                <th class="text-center">{$Dict.object}</th>

                                <th class="text-center">{$Dict.mg_staff}</th>
                                <th class="text-center">{$Dict.qb_staff}</th>
                                <th class="text-center">{$Dict.direction}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Tables item=Table key=tkey}
                            <tr class="lb" id="row_{$Table.id|crypt}">
                                <td class="text-right">{$tkey+1}</td>
                                <td class="text-center">{$Table.region}</td>
                                <td class="text-center">{$Table.date}</td>
                                <td class="text-center">{$Table.object_type}</td>
                                <td class="text-center">{$Table.object}</td>

                                <td class="text-center">{$Table.mg_staff}</td>
                                <td class="text-center">{$Table.qb_staff}</td>
                                <td class="text-center">{$Table.direction_count}</td>
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
                            <select required class="select form-control" name="structure" id="structure">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Structures item=Structure key=mkey}
                                    <option value="{$Structure.id}">{$Structure.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="date" class="form-label">{$Dict.date}</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="date" />
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.object_type}</label>
                            <select required class="select form-control" name="object_type" id="object_type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$ObjectTypes item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.object}</label>
                            <select required class="select form-control" name="object" id="object">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Objects item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        {* <div id="add_patrul" class="mt-3">
                        </div>
                        <div style="margin-left: 12px;" class="col-12" >
                            <div  class="addRow btn btn-primary px-2 "> <i class="ti ti-plus"> </i> </div>
                        </div> *}







                        <div class="row mt-3 p-0 m-0">
                           <div class="col-1" style="position: relative;">
                                <div style="position: absolute; bottom: 0;"  class="activeRow btn btn-danger px-2"> <i class="ti ti-x"> </i> </div>
                            </div>
                           <div class="col-1" style="position: relative; display: none">
                                <div style="position: absolute; bottom: 0;"  class="disactiveRow btn btn-success  px-2"> <i class="ti ti-check"> </i> </div>
                            </div>
                            <div class="col-sm-3" style="padding-left: 8px;">
                                <label>{$Dict.patrul_types}</label>
                                <input readonly class="form-control direction" id="" name="direction"  value="{$PatrulTypes[0].name}">
                                {* <select class="select se1 form-control" name="patrul_types" id="patrul_types">
                                    <option value="">{$Dict.choose}</option>
                                    {foreach from=$PatrulTypes item=Item3 key=ikey3}
                                        <option value="{$Item3.id}">{$Item3.name}</option>
                                    {/foreach}
                                </select> *}
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.direction}</label>
                                <input disabled type="text" class="form-control direction" id="pp_direction" name="direction"  value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.mg_staff}</label>
                                <input disabled type="text" class="form-control mg_staff" id="pp_mg" name="mg_staff" value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.qb_staff}</label>
                                <input disabled type="text" class="form-control qb_staff" id="pp_qb" name="qb_staff" value="">
                            </div>
                        </div>
                        

                        <div class="row mt-3 p-0 m-0">
                        <div class="col-1" style="position: relative;">
                            <div style="position: absolute; bottom: 0;"  class="activeRow btn btn-danger px-2"> <i class="ti ti-x"> </i> </div>
                        </div>
                        <div class="col-1" style="position: relative; display: none">
                                <div style="position: absolute; bottom: 0;"  class="disactiveRow btn btn-success  px-2"> <i class="ti ti-check"> </i> </div>
                            </div>
                         <div class="col-sm-3" style="padding-left: 8px;">
                            <label>{$Dict.patrul_types}</label>
                             <input readonly  class="form-control direction" id="" name="direction"  value="{$PatrulTypes[1].name}">
                                {* <select class="select se1 form-control" name="patrul_types" id="patrul_types">
                                    <option value="">{$Dict.choose}</option>
                                    {foreach from=$PatrulTypes item=Item3 key=ikey3}
                                        <option value="{$Item3.id}">{$Item3.name}</option>
                                    {/foreach}
                                </select> *}
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.direction}</label>
                                <input disabled type="text" class="form-control direction" id="ap_direction" name="direction"  value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.mg_staff}</label>
                                <input disabled type="text" class="form-control mg_staff" id="ap_mg" name="mg_staff" value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.qb_staff}</label>
                                <input disabled type="text" class="form-control qb_staff" id="ap_qb" name="qb_staff" value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.vehicle_count}</label>
                                <input disabled type="text" class="form-control vehicle_count" id="ap_vehicle" name="vehicle_count" value="">
                            </div>
                        </div>

                        <div class="row mt-3 p-0 m-0">
                        <div class="col-1" style="position: relative;">
                            <div style="position: absolute; bottom: 0;"  class="activeRow btn btn-danger px-2"> <i class="ti ti-x"> </i> </div>
                        </div>
                        <div class="col-1" style="position: relative; display: none">
                            <div style="position: absolute; bottom: 0;"  class="disactiveRow btn btn-success  px-2"> <i class="ti ti-check"> </i> </div>
                        </div>
                         <div class="col-sm-3" style="padding-left: 8px;">
                         <label>{$Dict.patrul_types}</label>
                             <input readonly class="form-control direction" id="" name="direction"  value="{$PatrulTypes[2].name}">
                                {* <select class="select se1 form-control" name="patrul_types" id="patrul_types">
                                    <option value="">{$Dict.choose}</option>
                                    {foreach from=$PatrulTypes item=Item3 key=ikey3}
                                        <option value="{$Item3.id}">{$Item3.name}</option>
                                    {/foreach}
                                </select> *}
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.direction}</label>
                                <input disabled type="text" class="form-control direction" id="mp_direction" name="direction"  value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.mg_staff}</label>
                                <input disabled type="text" class="form-control mg_staff" id="mp_mg" name="mg_staff" value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.qb_staff}</label>
                                <input disabled type="text" class="form-control qb_staff" id="mp_qb" name="qb_staff" value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.vehicle_count}</label>
                                <input disabled type="text" class="form-control vehicle_count" id="mp_vehicle" name="vehicle_count" value="">
                            </div>
                        </div>

                        <div class="row mt-3 p-0 m-0">
                        <div class="col-1" style="position: relative;">
                        <div style="position: absolute; bottom: 0;"  class="activeRow btn btn-danger px-2"> <i class="ti ti-x"> </i> </div>
                    </div>
                   <div class="col-1" style="position: relative; display: none">
                        <div style="position: absolute; bottom: 0;"  class="disactiveRow btn btn-success  px-2"> <i class="ti ti-check"> </i> </div>
                    </div>
                         <div class="col-sm-3" style="padding-left: 8px;">
                            <label>{$Dict.patrul_types}</label>
                             <input readonly class="form-control direction" id="" name="direction"  value="{$PatrulTypes[3].name}">
                                {* <select class="select se1 form-control" name="patrul_types" id="patrul_types">
                                    <option value="">{$Dict.choose}</option>
                                    {foreach from=$PatrulTypes item=Item3 key=ikey3}
                                        <option value="{$Item3.id}">{$Item3.name}</option>
                                    {/foreach}
                                </select> *}
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.direction}</label>
                                <input disabled type="text" class="form-control direction" id="op_direction" name="direction"  value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.mg_staff}</label>
                                <input disabled type="text" class="form-control mg_staff" id="op_mg" name="mg_staff" value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.qb_staff}</label>
                                <input disabled type="text" class="form-control qb_staff" id="op_qb" name="qb_staff" value="">
                            </div>
                            <div class="col-sm-2">
                                <label>{$Dict.vehicle_count}</label>
                                <input disabled type="text" class="form-control vehicle_count" id="op_vehicle" name="vehicle_count" value="">
                            </div>
                        </div>

                        <div class="col-12 text-center mt-3">
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

    var dict_choose = "{$Dict.choose}"
    var dict_patrul_types = "{$Dict.patrul_types}"
    var dict_direction = "{$Dict.direction}"
    var dict_mg_staff = "{$Dict.mg_staff}"
    var dict_qb_staff = "{$Dict.qb_staff}"
    var dict_vehicle_count = "{$Dict.vehicle_count}"

    var Var_comment1	= "{$Dict.comment1}";
    var Var_comment2	= "{$Dict.comment2}";
    var Var_comment3	= "{$Dict.comment3}";
    var Var_main_photo	= "{$Dict.main_photo}";
    var Var_ObjectId	= "{$Organization.id}";



    var AJAXPHP = "ajax{$AddURL}.php";


    {literal}
    const flatpickrDate = document.querySelector('#date');
    if (flatpickrDate) {
        flatpickrDate.flatpickr({
            monthSelectorType: 'static'
        });
    }

    let date;
    $('#date').on('change', function() {
        var dateComponents = this.value.split('-');
        date = dateComponents[2] + '-' + dateComponents[1] + '-' + dateComponents[0];
    })

    function getCurrentDate() {
        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0'); // Months are 0-indexed
        const day = String(now.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }

    $('#object_type').change(function(event) {
        if($(this).val() == 0){
            $("#object").empty();
            $("#object").append(`<option value="">${dict_choose}</option>`);
        }else{
            $.ajax({
                type: "GET",
                url: `ajax.php?act=get_object_by_id&id=${this.value}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    $("#object").empty();
                    data.forEach(item => { 
                        $("#object").append(`<option value="${item.id}">${item.name}</option>`);
                    });
                }
            })
        }

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

        $.get("hrajax.php?act=get_personal_staff&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);

            $('#object_type').val(sInfo.object_type);
            $('#object_type').trigger("change");
            $('#object_type').change(function(event) {
                $.ajax({
                    type: "GET",
                    url: `ajax.php?act=get_object_by_id&id=${this.value}`,
                    dataType: "json",
                    encode: true,
                    success: function(data) {
                        $("#object").empty();
                        data.forEach(item => { 
                            $("#object").append(`<option value="${item.id}">${item.name}</option>`);
                        });
                    }
                })
            })
            
            $('#structure').val(sInfo.structure);
            $('#structure').trigger("change");
            $('#date').val(sInfo.date);
            $('#object_type').val(sInfo.object_type);
            $('#object_type').trigger("change");
            $('#object').val(sInfo.object);
            $('#object').trigger("change");

            $('#pp_mg').val(sInfo.pp_mg);
            $('#pp_qb').val(sInfo.pp_qb);
            $('#pp_direction').val(sInfo.pp_direction);
            $('#ap_mg').val(sInfo.ap_mg);
            $('#ap_qb').val(sInfo.ap_qb);
            $('#ap_direction').val(sInfo.ap_direction);
            $('#ap_vehicle').val(sInfo.ap_vehicle);
            $('#mp_mg').val(sInfo.mp_mg);
            $('#mp_qb').val(sInfo.mp_qb);
            $('#mp_direction').val(sInfo.mp_direction);
            $('#mp_vehicle').val(sInfo.mp_vehicle);
            $('#op_mg').val(sInfo.op_mg);
            $('#op_qb').val(sInfo.op_qb);
            $('#op_direction').val(sInfo.op_direction);
            $('#op_vehicle').val(sInfo.op_vehicle);
            $('#id').val(sInfo.id);
        });
    })

    $('#new').click(function() {
        $('#submitModal').modal('toggle');

        $('#date').val(getCurrentDate());
        $('#structure').val("");
        $('#structure').trigger("change");
        $('#object_type').val("");
        $('#object_type').trigger("change");
        $('#object').val("");
        $('#object').trigger("change");

        $('#pp_mg').val("");
        $('#pp_qb').val("");
        $('#pp_direction').val("");
        $('#ap_mg').val("");
        $('#ap_qb').val("");
        $('#ap_direction').val("");
        $('#ap_vehicle').val("");
        $('#mp_mg').val("");
        $('#mp_qb').val("");
        $('#mp_direction').val("");
        $('#mp_vehicle').val("");
        $('#op_mg').val("");
        $('#op_qb').val("");
        $('#op_direction').val("");
        $('#op_vehicle').val("");
        $('#id').val(0);
    });




    $(document).on('click', '.activeRow', function(e) {
        $(this).parent().css({
            'display': 'none'
        })
        $(this).parent().parent().find('.disactiveRow').parent().css({
            'display': 'block'
        })
        
        $(this).parent().parent().find('input').attr('required', true)
        $(this).parent().parent().find('input').removeAttr('disabled');
    })
    $(document).on('click', '.disactiveRow', function(e) {
        $(this).parent().css({
            'display': 'none'
        })
        $(this).parent().parent().find('.activeRow').parent().css({
            'display': 'block'
        })
        $(this).parent().parent().find('input[type]').attr('disabled', true)
        $(this).parent().parent().find('input[type]').removeAttr('required');
        $(this).parent().parent().find('input[type]').val('')
    })



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

                form_data.append('id', $('#id').val());
                form_data.append('structure', $('#structure').val());
                form_data.append('date', $('#date').val());
                form_data.append('object', $('#object').val());
                form_data.append('pp_mg', $('#pp_mg').val());
                form_data.append('pp_qb', $('#pp_qb').val());
                form_data.append('pp_direction', $('#pp_direction').val());
                form_data.append('ap_mg', $('#ap_mg').val());
                form_data.append('ap_qb', $('#ap_qb').val());
                form_data.append('ap_direction', $('#ap_direction').val());
                form_data.append('ap_vehicle', $('#ap_vehicle').val());
                form_data.append('mp_mg', $('#mp_mg').val());
                form_data.append('mp_qb', $('#mp_qb').val());
                form_data.append('mp_direction', $('#mp_direction').val());
                form_data.append('mp_vehicle', $('#mp_vehicle').val());
                form_data.append('op_mg', $('#op_mg').val());
                form_data.append('op_qb', $('#op_qb').val());
                form_data.append('op_direction', $('#op_direction').val());
                form_data.append('op_vehicle', $('#op_vehicle').val());

                $.ajax({
                    url: 'hrajax.php?act=act_personal_staff',
                    dataType: 'text',
                    cache: false,
                    contentType: false,
                    processData: false,
                    data: form_data,
                    type: 'post',
                    success: function(resdata) {
                        console.log(resdata);
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
        $.get("hrajax.php?act=del_personal_staff&rowid=" + RowId, function(html) {
            if (html == 0) {
                $("#row_" + RowId).remove();
            }
        });
    });












    

    // let PatrulTypes = {}
    // $.ajax({
    //     url: `${AJAXPHP}?act=get_patrul_types`,
    //     type: 'get',
    //     dataType: "json",
    //     encode: true,
    //     success: function(resdata) {
    //         PatrulTypes = resdata
    //         patrulRowFun()

    //     }
    // });

    // $(document).on('click', '.removeRow', function(){
    //     $(this).parent().parent().remove();
    // })

    // $(document).on('click', '.addRow', patrulRowFun)

    // function patrulRowFun(){
    //     if($('#add_patrul .row').length < PatrulTypes.length) {
    //         // $('.addRow').parent().css({
    //         //     'display': 'none'
    //         // })

    //         // $('.removeRow').parent().css({
    //         //     'display': 'block'
    //         // })
        
    //         $('#add_patrul').append(`
    //             <div style="margin: 0; padding-right: 0;" class="row mt-3">

    //                 <div class="col-1" style="position: relative;">
    //                     <div style="position: absolute; bottom: 0;"  class="removeRow btn btn-danger px-2"> <i class="ti ti-minus"> </i> </div>
    //                 </div>
    //                 <div class="col-sm-3">
    //                     <label>${dict_patrul_types}</label>
    //                     <select required class="select se1 form-control" name="patrul_types" id="patrul_types">
    //                         <option value="">${dict_choose}</option>
    //                     </select>
    //                 </div>
    //                 <div class="col-sm-2">
    //                     <label>${dict_direction}</label>
    //                     <input disabled type="text" class="form-control direction" name="direction" value="">
    //                 </div>
    //                 <div class="col-sm-2">
    //                     <label>${dict_mg_staff}</label>
    //                     <input disabled type="text" class="form-control mg_staff" name="mg_staff" value="">
    //                 </div>
    //                 <div class="col-sm-2">
    //                     <label>${dict_qb_staff}</label>
    //                     <input disabled type="text" class="form-control qb_staff" name="qb_staff" value="">
    //                 </div>
    //                 <div class="col-sm-2">
    //                     <label>${dict_vehicle_count}</label>
    //                     <input disabled type="text" class="form-control vehicle_count" name="vehicle_count" value="">
    //                 </div>
    //             </div>
    //         `)
    //     }

    //     let items = $('#add_patrul:last #patrul_types').last();
    //     PatrulTypes.forEach( Item3 => {
    //         items.append(`
    //             <option value="${Item3.id}">${Item3.name}</option>
    //         `)
    //     })

    //     let selectedItems = []
            
    //     $('.se1').change(function(){
    //         if(!selectedItems.includes($(this).val())){
    //             if($(this).val() == 1){
    //                 $(this).parent().parent().find('.direction').attr('id', 'pp_direction')
    //                 $(this).parent().parent().find('.mg_staff').attr('id', 'pp_msg')                
    //                 $(this).parent().parent().find('.qb_staff').attr('id', 'pp_qb')
    //                 $(this).parent().parent().find('.vehicle_count').parent().remove()
    //                 selectedItems.push($(this).val())

    //                 $(this).parent().parent().find('input').attr('required', true)
    //                 $(this).parent().parent().find('input').removeAttr('disabled');
    //                 $(this).attr('disabled', true);
    //             }else if($(this).val() == 2 ){
    //                 $(this).parent().parent().find('.direction').attr('id', 'ap_direction')
    //                 $(this).parent().parent().find('.mg_staff').attr('id', 'ap_msg')                
    //                 $(this).parent().parent().find('.qb_staff').attr('id', 'ap_qb')
    //                 $(this).parent().parent().find('.vehicle_count').attr('id', 'ap_vehicle')
    //                 selectedItems.push($(this).val())

    //                 $(this).parent().parent().find('input').attr('required', true)
    //                 $(this).parent().parent().find('input').removeAttr('disabled');
    //                 $(this).attr('disabled', true);

    //             }else if($(this).val() == 3 ){
    //                 $(this).parent().parent().find('.direction').attr('id', 'mp_direction')
    //                 $(this).parent().parent().find('.mg_staff').attr('id', 'mp_msg')                
    //                 $(this).parent().parent().find('.qb_staff').attr('id', 'mp_qb')
    //                 $(this).parent().parent().find('.vehicle_count').attr('id', 'mp_vehicle')
    //                 selectedItems.push($(this).val())

    //                 $(this).parent().parent().find('input').attr('required', true)
    //                 $(this).parent().parent().find('input').removeAttr('disabled');
    //                 $(this).attr('disabled', true);

    //             }else if($(this).val() == 4 ){
    //                 $(this).parent().parent().find('.direction').attr('id', 'op_direction')
    //                 $(this).parent().parent().find('.mg_staff').attr('id', 'op_msg')                
    //                 $(this).parent().parent().find('.qb_staff').attr('id', 'op_qb')
    //                 $(this).parent().parent().find('.vehicle_count').attr('id', 'op_vehicle')
    //                 selectedItems.push($(this).val())

    //                 $(this).parent().parent().find('input').attr('required', true)
    //                 $(this).parent().parent().find('input').removeAttr('disabled');
    //                 $(this).attr('disabled', true);

    //             }
    //         }else{
    //             $(this).val('')
    //         }
    //     })
    // }






    {/literal}
</script>

{include file="footer.tpl"}