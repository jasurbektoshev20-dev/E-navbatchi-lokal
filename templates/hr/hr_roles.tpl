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
                                <th>{$Dict.name}</th>
                                <th>{$Dict.menu}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Roles item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td>{$Table.name}</td>
                                    <td>{$Table.menu}</td>
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
                <div class="row">
                    <div class="col-12">
                        <label>{$Dict.name}</label>
                        <input type="text" class="form-control" name="name" id="name" value="">
                    </div>
                    <div class="col-12 mt-3">
                        <label>{$Dict.dashboard_menu}</label>
                        <select id="menu_id" class="select2 form-select" multiple>
                            {foreach from=$Menus item=Item key=key name=name}
                                <option value="{$Item.id}">{$Item.name}</option>
                            {/foreach}
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
            </div>
        </div>
    </div>
</div>
<!--/ Edit Modal -->

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/select2/select2.js"></script>

<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"
    var dict_select = "{$Dict.select}"

    {literal}
        var selectedMenus = [];
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
            $.get("hrajax.php?act=del_roles&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });

        $('#new').click(function() {
            $('#submitModal').modal('toggle');

            $('#name').val("");
            $('#menu_id').find('option').prop('selected', false);
        });

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');

            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=get_roles&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);
                
                $('#menu_id').find('option').each(function(index, element) {
                    sInfo.menu.split(',').map(Number).forEach(item => {
                        let exist = $(element).attr('value');
                        if (exist == item) {
                            $(element).attr('selected', true);
                            selectedMenus.push(item);
                        }
                    });
                });
                $('#menu_id').trigger("change");
                $('#name').val(sInfo.name);
                $('#id').val(sInfo.id);
            });
        });

        $('#submit').on('click', function() {
            var form_data = new FormData();
            form_data.append('id', $('#id').val());
            form_data.append('name', $('#name').val());
            form_data.append('menus', selectedMenus.join(','));

            $.ajax({
                url: 'hrajax.php?act=act_roles',
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
        });

        $(document).ready(function() {
            $('#menu_id').wrap('<div class="position-relative"></div>').select2({
                placeholder: dict_select,
                dropdownParent: $('#menu_id').parent()
            });

            $('#menu_id').on('select2:select', function (e) {
                var selectedValue = e.params.data.id;
                selectedMenus.push(selectedValue);
            });

            $('#menu_id').on('select2:unselect', function (e) {
                var unselectedValue = e.params.data.id;
                let indexToRemove = selectedMenus.indexOf(unselectedValue);
                if (indexToRemove !== -1)  selectedMenus.splice(indexToRemove, 1);
            });
        });
    {/literal}
</script>

{include file="footer.tpl"}