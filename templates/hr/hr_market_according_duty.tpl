{include file="header.tpl"}

<style>
    {literal}


    .dt-buttons {
        gap: 10px;
        margin-left: 20px;
    }

    .date-box .date-box-select .date-box-sel-link{
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

    @media (max-width: 1900px) {
  .card-datatable {
    overflow-x: auto;
  }

  .card-datatable table {
    min-width: 1900px; 
  }


}

    .date-box{
      position: absolute;
      display: flex;
      justify-content: center;
      padding: 10px 60px 20px 0px;
      width: 100%;
    }
    .date-box-container{
        display: flex;
        justify-content:space-between;
      width: 80%;
    }
    .date-box .date-box-select{
        display: flex;
        gap: 15px;
        justify-content: flex-end;
    }

     @media (max-width: 2500px) {
       .date-box-container{
          width: 70%;
        }
    }

       @media (max-width: 1900px) {
       .date-box-container{
          width: 60%;
        }
    }

          @media (max-width: 1500px) {
       .date-box-container{
          width: 40%;
        }
    }

              @media (max-width: 1000px) {
       .date-box{
          position: relative;
        }
         .date-box-container{
          width: 100%;
        }
    }
           .table thead th,
    .table tbody td {
        /* text-transform: none !important; */
        vertical-align: middle;
      text-align: center;
    }

    .table th {
     text-transform:none;
     font-size: 16px;
    }



    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                   <h4>{$smarty.get.shahar} буйича бошкармаси {$smarty.get.market}га жамоат тартибини сақлаш ва <br> жамоат хавфсизлигини таъминлашга жалб этилган куч ва воситалар тўғрисида <br> <span>МАЪЛУМОТ</span> </h4>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="date-box">
                 <div class="date-box-container">
                    <h5 class="pt-2 pb-2 p-4 m-0">Сана: 10.11.2025-йил</h5>
                   <div class="date-box-select col-3">
                     
                      <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
</svg>  Юклаб олиш
                      </a>
                   </div>
                 </div>
                   
               
                </div>
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top table-hover table-striped table-bordered">
                        <thead>
                        <tr class="text-center">
                            <th style="white-space: nowrap;">Т/р</th>
                            <th>Унвони</th>
                            <th>Ф.И.Ш</th>
                            <th>Бўлинма номи</th>
                            <th >Тел рақами</th>
                            <th>Сменаси</th>
                            <th>Йўналиши</th>
                            {* <th>Қурол тури</th> *}
                            <th>Планшет</th>
                            <th>Бодикамера</th>
                            <th>Алоқа воситаси</th>
                            <th>Металлодетектор</th>
                            <th>Мегафон</th>
                            <th>Резина таёқ</th>
                            <th>Қўл кишани</th>
                            <th>Чўнтак фонари</th>
                            <th>Хуштак</th>
                             <th>Тиббий ҳимоя воситалари</th>
                            <th >Индивидуал боғлов пакети</th>
                           <th >Аэрозол</th>                      
                            <th >Хизмат ити</th>
                            <th>Хизмат оти</th>
                            <th>Автотранспорт</th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td> майор </td>
                            <td style="white-space: nowrap;">
                               Сатторов А.Н
                            </td>
                            <td>Барс1</td>
                            <td style="white-space: nowrap;">90-123-45-67</td>
                            <td style="white-space: nowrap;">1-босқич (08:00-16:00)</td>
                            <td style="white-space: nowrap;">ПП 2-йўналиш</td>
                             {* <td>Глок</td> *}
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                           
                            <td>Гиёхванд модда қидирувчи</td>
                            <td>0</td>
                            <td>Патриот</td>
                        </tr>
                               <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">2</td>
                             <td>сержант</td>
                            <td>
                               Бўриев С.Н
                            </td>
                            <td>Барс2</td>
                            <td>91-234-47-77</td>
                           
                            <td>1-босқич (08:00-16:00)</td>
                            <td>ПП 2-йўналиш</td>
                             {* <td>Глок</td> *}
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>1</td>
                           
                            <td>Мина қидирувчи</td>
                             <td>0</td>
                            <td>0</td>
                        </tr>
                               <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">3</td>
                              <td style="white-space: nowrap;">оддий аскар</td>
                            <td>
                               Толипов A.Sh
                            </td>
                            <td>Барс2</td>
                            <td>88-223-55-69</td>
                          
                            <td>2-босқич (16:00-24:00)</td>
                            <td>АП 2-йўналиш</td>
                                {* <td>ПМ</td> *}
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                        
                            <td>0</td>
                             <td>1</td>
                            <td>БЙД</td>
                           </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">4</td>
                              <td>оддий аскар</td>
                            <td>
                             Ражабов Т.Д
                            </td>
                            <td>Ўрикзор</td>
                            <td>93-312-65-67</td>
                            <td>2-босқич (16:00-24:00)</td>
                            <td>ПП 2-йўналиш</td>
                               {* <td>ПМ</td> *}
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                             <td>1</td>
                            <td>0</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">5</td>
                             <td>сержант</td>
                            <td>
                               Шерматов А.Ж
                            </td>
                            <td>Барс1</td>
                            <td>99-923-95-97</td>
                            <td>1-босқич (08:00-16:00)</td>
                            <td>ПП 1-йўналиш</td>
                             {* <td>0</td> *}
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                           
                            <td>0</td>
                             <td>1</td>
                            <td>0</td>
                        </tr>
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">6</td>
                            <td>лейтенант</td>
                             <td>
                              Умрзоқов Ж.О
                            </td>
                            <td>Ўрикзор</td>
                            <td>55-123-45-90</td>
                            <td>1-босқич (08:00-16:00)</td>
                            <td>ПП 1-йўналиш</td>
                              {* <td>Бошқа</td> *}
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>0</td>
                            <td>0</td>
                            <td>Қоровул</td>
                             <td>0</td>
                            <td>0</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--/ Projects table -->
    </div>


    <div class="row">
        <div class="col-12 mt-3">
            <button type="button" class="btn btn-primary waves-effect waves-light" onclick="window.history.back()"
            >
                Ортга
            </button>
        </div>
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
    
{literal}

  var dt_basic_table = $('.datatables-projects'),
    dt_basic;

// DataTable sozlamalari
if (dt_basic_table.length) {
  dt_basic = dt_basic_table.DataTable({
    pageLength: 15,
    lengthMenu: [5, 10, 25, 50, 75, 100, 1000],
    ordering: false, 
    language: {
      lengthMenu: "Кўрсатиш _MENU_",
      zeroRecords: "Ҳеч нарса топилмади",
      info: "_TOTAL_ тадан _START_ дан _END_ гача кўрсатилмоқда",
      infoEmpty: "Маълумот йўқ",
      infoFiltered: "(Жами _MAX_ ёзувдан фильтрланди)",
      search: "Қидириш:",
      paginate: {
        previous: "Олдинги",
        next: "Кейинги"
      }
    },
  });
}

    {/literal}
</script>

{include file="footer.tpl"}