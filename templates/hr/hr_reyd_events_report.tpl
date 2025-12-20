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
        font-size: 16px !important;
    }

    .date-filter-box{
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-bottom: 10px;
    }

    .date-filter-box div{
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .date-filter-box div button{
        width: 250px;     
    }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h4>Миллий гвардия жавобгарлик ҳудудларида режалаштирилган сиёсий, маданий, спорт ва бошқа оммавий тадбирлар тўғрисида <br>
                      <p class="m-0">МАЪЛУМОТ</p>
                   </h4>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="date-filter-box">
                 <h5 class="pt-2 pb-2 p-4 m-0" id="date_h5"></h5>
                     <div class="col-sm-4">
                        <input class="form-control" type="date" placeholder="Boshlang'ich vaqtni tanlang">
                        <input class="form-control" type="date" placeholder="Oxirgi vaqtni tanlang">
                    
                        <button class="btn btn-primary">Кўриш</button>
                     </div>   
            </div>
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top table-hover table-striped table-bordered">
                        <table class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th>T/r</th>
                                    <th>Tadbirlar</th>

                                    {foreach from=$regions key=regionId item=regionName}
                                        <th>
                                           
                                            <a href="hr.php?act=about_reyd_events&mid={$smarty.get.mid}&region_id={$regionId}">
                                                {$regionName}
                                            </a>
                                        </th>
                                    {/foreach}

                                    <th>Жами</th>
                                </tr>
                            </thead>

                            <tbody>
                                {assign var=i value=1}

                                {foreach from=$eventTypes key=typeId item=typeName}
                                    {assign var=rowTotal value=0}

                                    <tr>
                                        <td>{$i}</td>
                                        <td>{$typeName}</td>

                                        {foreach from=$regions key=regionId item=regionName}
                                            {assign var=val value=$table[$typeId][$regionId]|default:0}
                                            {assign var=rowTotal value=$rowTotal+$val}
                                            <td>{$val}</td>
                                        {/foreach}

                                        <td><strong>{$rowTotal}</strong></td>
                                    </tr>

                                    {assign var=i value=$i+1}
                                {/foreach}
                            </tbody>
                            <tfoot>
                                <tr class="table-dark">
                                    <th colspan="2">Жами</th>

                                    {foreach from=$regions key=regionId item=regionName}
                                        <th>{$regionTotals[$regionId]|default:0}</th>
                                    {/foreach}

                                    <th>{$grandTotal}</th>
                                </tr>
                            </tfoot>
                        </table>

                </div>
            </div>
        </div>
        <!--/ Projects table -->
    </div>
</div>

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>
{literal}
<script>
// window.addEventListener('load', function() {
//   Swal.fire({
//     title: 'Sahifa yuklanmoqda...',
//     text: 'Iltimos, kuting',
//     timer: 1000,
//     timerProgressBar: true,
//     allowOutsideClick: false,
//     background: '#f7f9fc',
//     color: '#333',
//     showConfirmButton: false,
//     showCancelButton: false,
//     showCloseButton: false,
//     didOpen: function(popup) {
//       // ✅ loading spinnerni faqat o‘zi chiqsin
//       Swal.showLoading();
//       // default button joyini yo‘qotamiz
//       const actions = popup.querySelector('.swal2-actions');
//       if (actions) actions.style.display = 'none';
//     },
//     willClose: function() {
//       document.body.style.opacity = '1';
//     }
//   });

//   document.body.style.opacity = '0.5';

//     const today = new Date();

//   // kun, oy, yilni olish
//   const day = String(today.getDate()).padStart(2, '0');      // 01–31
//   const month = String(today.getMonth() + 1).padStart(2, '0'); // 0 dan boshlanadi, shuning uchun +1
//   const year = today.getFullYear();

//   // format: 11.11.2025
//   const formattedDate = `${day}.${month}.${year}`;

//   document.getElementById('date_h5').textContent =`Сана: ${formattedDate}-йил`;

// });
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
   
{literal}
 /*
    var dt_basic_table = $('.datatables-projects'),
        dt_basic;

    // DataTable with buttons
    if (dt_basic_table.length) {
        dt_basic = dt_basic_table.DataTable({
            displayLength: 15,
            lengthMenu: [5, 10, 25, 50, 75, 100, 1000]
        });
    }*/
    {/literal}
</script>

{include file="footer.tpl"}