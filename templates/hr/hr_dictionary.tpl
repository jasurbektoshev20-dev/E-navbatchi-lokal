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
                                <th>т/р</th>
                                <th>{$Dict.infraction}</th>
                                <th>{$Dict.action_taken}</th>
                                <th>{$Dict.person_drafted}</th>
                                <th>{$Dict.old_photo}</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$Dictionary item=Table key=key}
                            <tr id="row_{$Table.id|crypt}">
                                <td>{$key+1}</td>
                                <td>{$Table.name1}</td>
                                <td>{$Table.name2}</td>
                                <td>{$Table.name3}</td>
                                <td>{$Table.keyword}</td>
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
                <div class="row g-3">
                    <div class="col-12">
                        <label class="form-label">{$Dict.name1}</label>
                        <input type="text" id="name1" class="form-control" />
                    </div>
                    <div class="col-12">
                        <label class="form-label">{$Dict.name2}</label>
                        <input type="text" id="name2" class="form-control" />
                    </div>
                    <div class="col-12">
                        <label class="form-label">{$Dict.name3}</label>
                        <input type="text" id="name3" class="form-control" />
                    </div>
                    <div class="col-12">
                        <label class="form-label">{$Dict.keyword}</label>
                        <input type="text" id="keyword" class="form-control" />
                    </div>
                    <div class="col-12 text-center">
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
        $.get("refajax.php?act=del_bcms_s_dictionary&rowid=" + RowId, function(html) {
            if (html == 0) {
                $("#row_" + RowId).remove();
                // dt_basic.row($(this).parents('tr')).remove().draw();
            }
        });
    });

    $('#new').click(function() {
        $('#submitModal').modal('toggle');

        $('#name1').val("");
        $('#name2').val("");
        $('#name3').val("");
        $('#keyword').val("");
        $('#id').val(0);
    });

    $('.datatables-projects tbody').on('click', '.editAction', function() {
        $('#submitModal').modal('toggle');

        var RowId = $(this).attr('rel');
        $.get("refajax.php?act=get_bcms_s_dictionary&rowid=" + RowId, function(html) {
            console.log(html);

            var sInfo = jQuery.parseJSON(html);

            $('#name1').val(sInfo.name1);
            $('#name2').val(sInfo.name2);
            $('#name3').val(sInfo.name3);
            $('#keyword').val(sInfo.keyword);
            $('#id').val(sInfo.id);

        });
    })

    $('#submit').on('click', function() {
        var form_data = new FormData();

        form_data.append('id', $('#id').val());
        form_data.append('name1', $('#name1').val());
        form_data.append('name2', $('#name2').val());
        form_data.append('name3', $('#name3').val());
        form_data.append('keyword', $('#keyword').val());

        $.ajax({
            url: 'refajax.php?act=act_bcms_s_dictionary',
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
    });

    {/literal}
</script>

{include file="footer.tpl"}