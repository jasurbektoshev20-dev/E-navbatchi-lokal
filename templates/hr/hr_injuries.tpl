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
    .date-box-sel-link{
        display: flex;
        align-items: center;
        gap: 5px;
        text-decoration: none;
        box-sizing: border-box;
        white-space: nowrap;
        border: 1px solid #cfcece;
        border-radius: 7px;
        padding: 7px 20px;
        color: #6f6b7d;
        background-color: green;
        color: #fff;
    }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h4>ЎТГАН ДАВРДА МИЛЛИЙ ГВАРДИЯ БЎЛИНМАЛАРИДА ҚАЙД ЭТИЛГАН ЖАРОҲАТЛАР TO‘G‘RISIDA<br>
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

                         <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
                            <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
                            <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
                            </svg>  Юклаб олиш
                        </a>
                     </div>   
            </div>
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top table-hover table-striped table-bordered">
                        <thead>
                        <tr class="text-center">
                            <th style="white-space: nowrap;">Т/р</th>
                            <th>Жароҳат турлари</th>
                            <th>Марказий девон</th>
                            <th>Жамоат хавфсизлиги университети</th>
                            <th>65921 ҳ.қ.</th>
                            <th>98244 ҳ.қ.</th>
                            <th>98162 ҳ.қ.</th>
                            <th>Моддий ТТМ базаси</th>
                            <th>МаЪнавият маркази</th>
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
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Фуқаролар билан можарода</a>
                            </td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>30</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Жанговар тайёргарликда</a>
                            </td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>1</td>
                            <td>2</td>
                            <td>4</td>
                            <td>1</td>
                            <td>3</td>
                            <td>1</td>
                            <td>3</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>35</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Жисмоний тайёргарликда</a>
                            </td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>30</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">ЙТХ</a>
                            </td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>23</td>
                        </tr>
                       
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Маиший</a>
                            </td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>30</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Ҳўжалик ишларида</a>
                            </td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>25</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Хизмат олиб боришда (ҳ/қ ҳудудидан ташқарида)</a>
                            </td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>0</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>27</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Қоровул ва ички хизмат ўташда</a>
                            </td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>34</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_region_events&mid={$smarty.get.mid}&date=Сиёсий тадбирлар">Жисмоний тайёргарликда</a>
                            </td>
                            <td>0</td>
                            <td>2</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>2</td>
                            <td>2</td>
                            <td>2</td>
                            <td>1</td>
                            <td>2</td>
                            <td>1</td>
                            <td>3</td>
                            <td>39</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a  href="">Jami</a>
                                   
                            </td>
                            <td>5</td>
                            <td>21</td>
                            <td>11</td>
                            <td>11</td>
                            <td>11</td>
                            <td>21</td>
                            <td>31</td>
                            <td>21</td>
                            <td>21</td>
                            <td>21</td>
                            <td>11</td>
                            <td>21</td>
                            <td>11</td>
                            <td>31</td>
                            <td>21</td>
                            <td>21</td>
                            <td>21</td>
                            <td>11</td>
                            <td>21</td>
                            <td>11</td>
                            <td>31</td>
                            <td>234</td>
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