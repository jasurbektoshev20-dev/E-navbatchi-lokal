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
                                <th>{$Dict.id}</th>
                                <th>{$Dict.parent}</th>
                                <th>{$Dict.name1}</th>
                                <th>{$Dict.page_url}</th>
                                <th>{$Dict.turn}</th>
                                <th>{$Dict.menu_icon}</th>
                                <th>{$Dict.has_children}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Menus item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td>{$Table.id}</td>
                                    <td>{$Table.parent}</td>
                                    <td>{$Table.name1}</td>
                                    <td>{$Table.url}</td>
                                    <td>{$Table.turn}</td>
                                    <td>{$Table.menu_icon}</td>
                                    <td>{$Table.has_children}</td>
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
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="needs-validation" novalidate>
                    <div class="row">
                        <div class="col-6">
                            <label>{$Dict.parent}</label>
                            <select class="form-control" name="parent" id="parent">
                                <option value="0">{$Dict.choose}</option>
                                {foreach from=$Menus item=Item4 key=ikey4}
                                    <option value="{$Item4.id}">{$Item4.name1}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-6">
                            <label>{$Dict.name1}</label>
                            <input required type="text" class="form-control" name="name1" id="name1" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.name2}</label>
                            <input type="text" class="form-control" name="name2" id="name2" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.name3}</label>
                            <input type="text" class="form-control" name="name3" id="name3" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.page_url}</label>
                            <input type="text" class="form-control" name="page_url" id="page_url" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.turn}</label>
                            <input required type="number" class="form-control" name="turn" id="turn" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.menu_icon}</label>
                            <input type="text" class="form-control" name="menu_icon" id="menu_icon" value="">
                        </div>
                        <div class="col-6">
                            <label>{$Dict.status}</label>
                            <select required class="form-control" name="status" id="status">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$BcmsStatus item=Item4 key=ikey4}
                                    <option value="{$Item4.id}">{$Item4.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        
                        <div class="col-6">
                            <label>{$Dict.has_children}</label>
                            <select class="form-control" name="has_children" id="has_children">
                                <option value="">{$Dict.choose}</option>
                                <option value="0">{$Dict.no}</option>
                                <option value="1">{$Dict.yes}</option>
                            </select>
                        </div>
                        <div class="col-12 text-center mt-3">
                            <input type="hidden" name="id" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
                                {$Dict.cancel}
                            </button>
                            <button type="submit" id="submit" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
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

<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"

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

    // Delete Record
    $('.datatables-projects tbody').on('click', '.delete', function() {
        var RowId = $(this).attr('rel');
        $.get("hrajax.php?act=del_menus&rowid=" + RowId, function(html) {
            if (html == 0) {
                $("#row_" + RowId).remove();
            }
        });
    });

    $('#new').click(function() {
        $('#submitModal').modal('toggle');

        $('#parent').val(0);
        $('#parent').trigger("change");
        $('#name1').val("");
        $('#name2').val("");
        $('#name3').val("");
        $('#page_url').val("");
        $('#turn').val("");
        $('#menu_icon').val("");
        $('#status').val(0);
        $('#status').trigger("change");
        $('#has_children').val(0);
        $('#has_children').trigger("change");
    });

    $('.datatables-projects tbody').on('click', '.editAction', function() {
        $('#submitModal').modal('toggle');

        var RowId = $(this).attr('rel');
        $.get("hrajax.php?act=get_menus&rowid=" + RowId, function(html) {
            var sInfo = jQuery.parseJSON(html);

            $('#id').val(sInfo.id);
            $('#parent').val(sInfo.parent);
            $('#parent').trigger("change");
            $('#name1').val(sInfo.name1);
            $('#name2').val(sInfo.name2);
            $('#name3').val(sInfo.name3);
            $('#page_url').val(sInfo.url);
            $('#turn').val(sInfo.turn);
            $('#menu_icon').val(sInfo.menu_icon);
            $('#status').val(sInfo.status_id);
            $('#status').trigger("change");
            $('#has_children').val(sInfo.children);
            $('#has_children').trigger("change");

        });
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
                form_data.append('parent', $('#parent').val());
                form_data.append('name1', $('#name1').val());
                form_data.append('name2', $('#name2').val());
                form_data.append('name3', $('#name3').val());
                form_data.append('page_url', $('#page_url').val());
                form_data.append('turn', $('#turn').val());
                form_data.append('menu_icon', $('#menu_icon').val());
                form_data.append('status', $('#status').val());
                form_data.append('has_children', $('#has_children').val());

                $.ajax({
                    url: 'hrajax.php?act=act_menus',
                    dataType: 'text',
                    cache: false,
                    contentType: false,
                    processData: false,
                    data: form_data,
                    type: 'post',
                    success: function(resdata) {
                        //console.log(resdata);
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

    {/literal}
</script>

{include file="footer.tpl"}