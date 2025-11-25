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
                            <th>Қорақалпоғистон Республикаси</th>
                            <th>Тошкент шаҳри</th>
                            <th>Андижон вилояти</th>
                            <th>Бухоро вилояти</th>
                            <th>Фарғона вилояти</th>
                            <th>Жиззах вилояти</th>
                            <th>Қашқадарё вилояти</th>
                            <th>Хоразм вилояти</th>
                            <th>Наманган вилояти</th>
                            <th>Навоий вилояти</th>
                            <th>Самарқанд вилояти</th>                           
                            <th>Сирдарё вилояти</th>
                            <th>Сурхандарё вилояти</th>
                            <th>Тошкент вилояти</th>   
                            <th>Жами</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_markets&mid={$smarty.get.mid}&date=">Бозорлар</a>
                            </td>
                            <td>1</td>
                            <td>19</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>2</td>
                            <td>5</td>
                            <td>1</td>
                            <td>5</td>
                            <td>1</td>
                            <td>2</td>
                            <td>0</td>
                            <td>52</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">2</td>
                            <td>
                                <a
                                        href="hr.php?act=''&mid={$smarty.get.mid}&date=Toshkent shahar">Истироҳат боғлари</a>
                            </td>
                            <td>2</td>
                            <td>15</td>
                            <td>4</td>
                            <td>3</td>
                            <td>2</td>
                            <td>3</td>
                            <td>3</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>0</td>
                            <td>41</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">3</td>
                            <td>
                                <a
                                        href="hr.php?act=''&mid={$smarty.get.mid}&date=Toshkent shahar">Хиёбонлар</a>
                            </td>
                            <td>3</td>
                            <td>7</td>
                            <td>3</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>4</td>
                            <td>6</td>
                            <td>1</td>
                            <td>0</td>
                            <td>3</td>
                            <td>2</td>
                            <td>1</td>
                            <td>0</td>
                            <td>34</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">4</td>
                            <td>
                                <a
                                        href="hr.php?act=''&mid={$smarty.get.mid}&date=Toshkent shahar">Бошқа жойлар</a>
                            </td>
                            <td>3</td>
                            <td>9</td>
                            <td>6</td>
                            <td>5</td>
                            <td>2</td>
                            <td>7</td>
                            <td>2</td>
                            <td>2</td>
                            <td>6</td>
                            <td>2</td>
                            <td>5</td>
                            <td>2</td>
                            <td>1</td>
                            <td>0</td>
                            <td>22</td>
                        </tr>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">5</td>
                            <td>
                               Жами
                            </td>
                            <td>9</td>
                            <td>50</td>
                            <td>17</td>
                            <td>12</td>
                            <td>7</td>
                            <td>15</td>
                            <td>13</td>
                            <td>11</td>
                            <td>14</td>
                            <td>11</td>
                            <td>15</td>
                            <td>6</td>
                            <td>6</td>
                            <td>0</td>
                            <td>127</td>
                        </tr>
                        </tbody>
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
window.addEventListener('load', function() {
  Swal.fire({
    title: 'Саҳифа юкланмоқда...',
    text: 'Илтимос, кутинг',
    timer: 1000,
    timerProgressBar: true,
    allowOutsideClick: false,
    background: '#f7f9fc',
    color: '#333',
    showConfirmButton: false,
    showCancelButton: false,
    showCloseButton: false,
    didOpen: function(popup) {
      // ✅ loading spinnerni faqat o‘zi chiqsin
      Swal.showLoading();
      // default button joyini yo‘qotamiz
      const actions = popup.querySelector('.swal2-actions');
      if (actions) actions.style.display = 'none';
    },
    willClose: function() {
      document.body.style.opacity = '1';
    }
  });

  document.body.style.opacity = '0.5';
});
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
    /*
{literal}

    var dt_basic_table = $('.datatables-projects'),
        dt_basic;

    // DataTable with buttons
    if (dt_basic_table.length) {
        dt_basic = dt_basic_table.DataTable({
            displayLength: 15,
            lengthMenu: [5, 10, 25, 50, 75, 100, 1000]
        });
    }
    {/literal}*/
</script>

{include file="footer.tpl"}