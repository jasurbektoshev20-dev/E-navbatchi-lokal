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

    .table tr th, .table tr td{
        font-size: 20px !important;
    }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h3>Ҳудудий бошқармалар жавобгарлик объектлари тўғрисида <br>
                      <p class="m-0">МАЪЛУМОТ</p>
                   </h3>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top table-hover table-striped table-bordered">
                        <thead>
                        <tr class="text-center">
                            <th style="white-space: nowrap;">т/р</th>
                            <th>Объект турлари</th>

                            {foreach from=$Regions item=R}
                                <th>{$R.name}</th>
                            {/foreach}

                            <th>Жами</th>
                        </tr>
                        </thead>
                        <tbody>
                        {assign var=idx value=1}
                        {foreach from=$tableData item=row}
                            <tr class="lb text-center" id="row_{$idx}">
                                <td class="text-right">{$idx}</td>
                                <td>
                                    <a href="hr.php?act=about_markets&mid={$smarty.get.mid}&date=">{$row.object_type_name}</a>
                                </td>

                                {foreach from=$Regions item=R}
                                    {assign var=val value=$row.regions[$R.id]}
                                    <td>{$val}</td>
                                {/foreach}

                                <td><b>{$row.total}</b></td>
                            </tr>
                            {assign var=idx value=$idx+1}
                        {/foreach}

                        <!-- JAMI qatori -->
                        <tr class="lb text-center" id="row_total">
                            <td class="text-right"></td>
                            <td><b>Жами</b></td>

                            {foreach from=$Regions item=R}
                                <td><b>{$footer_sum[$R.id]|default:0}</b></td>
                            {/foreach}

                            <td><b>{$footer_total|default:0}</b></td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--/ Projects table -->
    </div>
</div>

{literal}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
{/literal}

{literal}
<script>
// window.addEventListener('load', function() {
//   Swal.fire({
//     title: 'Саҳифа юкланмоқда...',
//     text: 'Илтимос, кутинг',
//     timer: 1000,
//     timerProgressBar: true,
//     allowOutsideClick: false,
//     background: '#f7f9fc',
//     color: '#333',
//     showConfirmButton: false,
//     showCancelButton: false,
//     showCloseButton: false,
//     didOpen: function(popup) {
//       Swal.showLoading();
//       const actions = popup.querySelector('.swal2-actions');
//       if (actions) actions.style.display = 'none';
//     },
//     willClose: function() {
//       document.body.style.opacity = '1';
//     }
//   });

//   document.body.style.opacity = '0.5';
//});
</script>
{/literal}

<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"
</script>

{include file="footer.tpl"}
