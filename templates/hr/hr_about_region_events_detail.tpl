{include file="header.tpl"}

<style>
    {literal}
    .table thead th,
    .table tbody td {
        text-transform: none !important;
        font-size: 18px;
    }

    .dt-buttons {
        gap: 10px;
        margin-left: 20px;
    }

    /* .date-box{
      display: flex;
      justify-content: flex-end;
      padding: 10px 0px;
      width: 83%;
      position: absolute;
      margin: 0 auto;
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
    } */

      .date-box{
      display: flex;
      justify-content: space-between;
      padding: 10px 20px;
      align-items: center;
    }

    .date-box .date-box-select{
        display: flex;
        gap: 15px;
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

    }

  .vertical-header th {
  writing-mode: vertical-rl; 
  transform: rotate(180deg); 
  text-align: center !important;
  vertical-align: bottom;
  white-space: normal;
  height: 150px; 
  
}

.vertical-header .horizon-th{
  writing-mode: horizontal-tb ; 
  transform: rotate(0deg) ;    
  white-space: normal ;        
  text-align: left ;          
  vertical-align: middle ;    
}

.vertical-header thead .group-row th {
  color: #fff;
  font-weight: bold;
  border: 2px solid #555;
  padding: 8px;
  writing-mode: horizontal-tb; 
  transform: rotate(0deg);    
  white-space: normal;        
  text-align: center;          
  vertical-align: middle;  
  height: 40px;  
  font-size: 16px;
}

.card{
    position: relative;
}



    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h4>{$smarty.get.date} марказида ўтказиладиган <span class="text-lowercase">{$smarty.get.dataTadbir}</span>  ва уларга жалб этиладиган куч ва воситалар тўғрисида  <br> <span>МАЪЛУМОТ</span> </h4>
                </div>
            </div>
        </div>
    </div>
   


    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                  {* <div class="date-box">
                   <div class="date-box-select">
                      <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
                          <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
                          <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
                        </svg>  Yuklab olish
                      </a>
                   </div>
               
                </div>    *}
                 <div class="date-box">
                   <h5 class="pt-2 pb-2 p-4 m-0" id="date_h5"></h5>
                   <div class="date-box-select">
                     
                      <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
</svg>  Юклаб олиш
                      </a>
                   </div>
                </div>
                <div class="card-datatable table-responsive">
                
                    <table class="datatables-projects table table-hover vertical-header table-bordered">
                        <thead>
                        <tr class="text-center card-datatable-tr">
                            <th class="horizon-th" style="white-space: nowrap;">Т/р</th>
                            <th class="horizon-th">Номи</th>
                             <th class="horizon-th">Тури</th>
                             <th class="horizon-th">Тоифаси</th>
                            <th class="horizon-th">Ўтказиладиган жой номи</th>                         
                            <th>Бошланиш вақти</th>
                            <th>Тугаш вақти</th>
                            <th>Қатнашадиган фуқораларнинг тахминий сони</th>
                            <th>Шахсий таркиб</th>
                            <th>МГ ҲХ сони</th>                         
                            <th>ИИВ ҲХ сони</th>
                            <th>ФВВ ҲХ сони</th>
                            <th>МГ МСГр сони</th>
                            <th>ИИВ Спринг сони</th>
                            <th>МҲХлар сони</th>
                            <th>Транспорт воситалари</th>
                            <th>Махсус воситалар</th>
                            <th class="horizon-th">Тадбирга масъул</th>
                            <th class="horizon-th">Тадбирни ўтказувчи ташаббускор</th>
                        </tr>
                        </thead>
                        <tbody id="event-tbody">
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


<script>
{literal}
document.addEventListener('DOMContentLoaded', function() {

         const today = new Date();


  const day = String(today.getDate()).padStart(2, '0');     
  const month = String(today.getMonth() + 1).padStart(2, '0'); 
  const year = today.getFullYear();

  // format: 11.11.2025
  const formattedDate = `${day}.${month}.${year}`;

  document.getElementById('date_h5').textContent =`Сана: ${formattedDate}-йил`;
 
        const urlParams = new URLSearchParams(window.location.search);

        // dataTadbir parametrini olamiz
        const dateTadbir = urlParams.get("dataTadbir");
        const region = urlParams.get("date");

        let selectedData;
    const dataSiyosiy1 = [
        {
            eventName: "ЮНЕСКО Бош конференциясининг 43 сессияси",
            eventType:"Халқаро",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "“Силк Роад” туризм маркази",
            evetDate:"05.11.2025-й 10:00",
            evetFinishDate:"07.11.2025-й 16:00",
            evetPersonCount:500,
            evetDutyCount:831,
            evetMGCount:345,
            evetIIVCount:255,
            evetFVVCount:45,
            evetMSGrCount:6,
            evetSpringCount:6,
            evetMHXCount:6,
            evetTransportCount:12,
            evetSpecialTools:312,
            evetResponsible:"84007 ҳ/қ майор А.Набиев",
            evetorganizer:"Вилоят ҳокимлиги",
        },
        {
            eventName: "АҚШ президентининг Самарқандга ташрифи",
            eventType:"Халқаро",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Регистон Майдони",
            evetDate:"07.11.2025-й 08:00",
            evetFinishDate:"08.11.2025-й 12:00",
            evetPersonCount:100,
            evetDutyCount:40,
            evetMGCount:25,
            evetIIVCount:10,
            evetFVVCount:5,
            evetMSGrCount:3,
            evetSpringCount:3,
            evetMHXCount:3,
            evetTransportCount:6,
            evetSpecialTools:30,
            evetResponsible:"81140 ҳ/қ п/п-к Х.Хомидов",
            evetorganizer:"Вилоят ҳокимлиги",
        }
    ]     

     const dataSiyosiy2 = [
        {
            eventName: "Давлат раҳбарининг Навоий вилоятига ташрифи",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Навоий вилояти Навоий шаҳар",
            evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ НВББ лейтенант И.Эсонбоев",
            evetorganizer:"Вилоят ҳокимлиги",
        }
    ]     

     const dataSiyosiy3 = [
        {
            eventName: "Ўзбекистон–Покистон сиёсий маслаҳатлашувлари",
              eventType:"Халқаро",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "“Дўстлик саройи” (Халқлар дўстлиги саройи)",
             evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,

            evetResponsible:"84007 ҳ/қ майор Б.Облақулов",
            evetorganizer:"Шаҳар ҳокимлиги",
        },
          {
            eventName: "Халқаро конференция: Турк давлатлари фикр марказлари",
            eventType:"Халқаро",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Ўзбекистон Республикаси Ташқи ишлар вазирлиги",          
            evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"81109 ҳ/қ капитан Х.Деҳқонов",
            evetorganizer:"Шаҳар ҳокимлиги",
        },
          {
            eventName: "V Тошкент Антикоррупция Форуми",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Олий Мажлис Қонунчилик палатаси мажлислар зали",
            evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"84007 ҳ/қ майор Ш.Ибрагимов",
            evetorganizer:"Шаҳар ҳокимлиги",
        },
    ]     

    // madaniy uchun 
      const dataSiyosiy4 = [
        {
            eventName: "Хазина номли театр томошоси",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Санъат саройи биносида",
            evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ СВББ  к-н Х.Холмирзаев",
            evetorganizer:"“Арена цирк шапито” МЧЖ",
        },
    ]     

      const dataSiyosiy5 = [
        {
            eventName: "Аҳолини театрга ташрифини тизимли йўлга қўйиш ҳамда “Театр-ибодатхонадир” давлат дастурини амалга ошириш мақсадида “Ҳоким ва маҳалла раислари” учрашуви",
              eventType:"Республика",
            eventCategory: "Пулли хизмат асосида тадбир",
            eventPlace: "Санъат саройи биносида",
           evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ 88926 ҳ/қ кт л-нт A.Poълатов",
            evetorganizer:"Вилоят ҳокимлиги",
        },
         {
            eventName: "Халқаро zamonaviy san’at Biyennalesi tadbiri",
              eventType:"Халқаро",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Санъат саройи биносида",
              evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ 88926 ҳ/қ кт л-нт  Ш.Боллиев",
            evetorganizer:"Вилоят ҳокимлиги",
        },
    ]     

      const dataSiyosiy6 = [
        {
            eventName: "Кино намойишлари янги премъера",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "А.Навоий номидаги киночилар уйи",
             evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ 84007 ҳ/қ кт л-нт А.Набиев",
            evetorganizer:"Вилоят ҳокимлиги",
        },
         {
            eventName: "“ОБЖ” спектакли",
              eventType:"Республика",
            eventCategory: "Пулли хизмат асосида тадбир",
            eventPlace: "Шайхонтоҳур т. Ёш томошабинлар театри",
             evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ 88926 ҳ/қ кт л-нт  Ш.Боллиев",
            evetorganizer:"Давлат ёш томошабинлар театри",
        },
    ]     

      const dataSiyosiy7 = [
        {
            eventName: "“Майсаранинг иши” номланган спектақл намойиши",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Вилоят мусиқали драма театри",
             evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ ХВББ майор А.Мадреймов",
            evetorganizer:"Вилоят мусиқали драма театри",
        },
    ]   
    
      const dataSiyosiy8 = [
        {
            eventName: "Спортнинг Гандбол тури бўйича ёшлар ўртасида Ўзбекистон чемпионати",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Навоий ш. Гандбол спорт залида",
            evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ НВББ лейтенант И.Эсонбоев",
            evetorganizer:"Спорт бошқармаси",
        },
    ]   

      const dataSiyosiy9 = [
        {
            eventName: "Камондан ўқ отиш бўйича QR кубоги.",
              eventType:"Халқаро",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Олимрия ва паралимпия спорт турларига ихтисослаштирилган спорт мактаби",
           evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ 81416 ҳ/қ кт л-нт Э.Хасанов",
            evetorganizer:"QR Спорт вазирлиги",
        },
    ]   

      const dataSiyosiy10 = [
        {
            eventName: "Спортнинг юнон-рум тури бўйича Ўзбекистон чемпионати",
              eventType:"Республика",
            eventCategory: "Пулли хизмат асосида тадбир",
            eventPlace: "Яшнобод т.Олимпия шахарчаси",
             evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"84007 ҳ/қ майор Ш.Ибрагимов",
            evetorganizer:"Олий талим, фан ва иновациялар вазирлиги",
        },
    ]   


      const dataSiyosiy11 = [
        {
            eventName: "Ўқитувчиларга касбий сертификатлаш малака синовлврини ўтказиш",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Олмазор т.Беруний к. 83А-уй (“ИМЗО” фирмаси эски биноси)",
             evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"84007 ҳ/қ майор Ш.Ибрагимов",
            evetorganizer:"Мактабгача ва мактаб талими бошқармаси",
        },
    ]   

      const dataSiyosiy12 = [
        {
            eventName: "Ўқитувчиларга касбий сертификатлаш малака синовлврини ўтказиш",
              eventType:"Республика",
            eventCategory: "Ҳукумат қарори асосидаги тадбир",
            eventPlace: "Жиззах шахар  4-сонли умумий ўрта таълим мактаби биноси",
           evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ ЖВББ майор С.Маматқулов",
            evetorganizer:"Таълим вазирлиги",
        },
    ]   

     const dataSiyosiy13 = [
        {
            eventName: "Профессионал ва мактабдан ташқари талим ташкилотлари педагогик кадрларни аттестацияси",
              eventType:"Республика",
            eventCategory: "Пулли хизмат асосида тадбир",
            eventPlace: "Наманган шахар 15-сонли мактаб",
            evetDate:"08.11.2025-й 09:00",
            evetFinishDate:"08.11.2025-й 17:00",
            evetPersonCount:120,
            evetDutyCount:40,
            evetMGCount:35,
            evetIIVCount:25,
            evetFVVCount:10,
            evetMSGrCount:4,
            evetSpringCount:4,
            evetMHXCount:5,
            evetTransportCount:10,
            evetSpecialTools:35,
            evetResponsible:"МГ НВББ капитан Ш.Хуррамов",
            evetorganizer:"М ва мт бошқармаси",
        },
    ]   

    
        if (region === "Тошкент шаҳри" && dateTadbir === "Сиёсий тадбирлар") {
            selectedData = dataSiyosiy3;
        } else if (region === "Самарқанд вилояти" && dateTadbir === "Сиёсий тадбирлар") {
            selectedData = dataSiyosiy1;
        } else if (region === "Навоий вилояти" && dateTadbir === "Сиёсий тадбирлар") {
            selectedData = dataSiyosiy2;
        } else if (region === "Сурхандарё вилояти" && dateTadbir === "Маданий тадбирлар") {
            selectedData = dataSiyosiy4;
        } else if (region === "Бухоро вилояти" && dateTadbir === "Маданий тадбирлар") {
            selectedData = dataSiyosiy5;
        } else if (region === "Тошкент вилояти" && dateTadbir === "Маданий тадбирлар") {
            selectedData = dataSiyosiy6;
        } else if (region === "Хоразм вилояти" && dateTadbir === "Маданий тадбирлар") {
            selectedData = dataSiyosiy7;
        } else if (region === "Навоий вилояти" && dateTadbir === "Спорт тадбирлар") {
            selectedData = dataSiyosiy8;
        } else if (region === "Қорақалпоғистон Республикаси" && dateTadbir === "Спорт тадбирлар") {
            selectedData = dataSiyosiy9;
        }else if (region === "Тошкент шаҳри" && dateTadbir === "Спорт тадбирлар") {
            selectedData = dataSiyosiy10;
        }else if (region === "Тошкент вилояти" && dateTadbir === "Бошқа тадбирлар") {
            selectedData = dataSiyosiy11;
        }else if (region === "Жиззах вилояти" && dateTadbir === "Бошқа тадбирлар") {
            selectedData = dataSiyosiy12;
        }else if (region === "Наманган вилояти" && dateTadbir === "Бошқа тадбирлар") {
            selectedData = dataSiyosiy13;
        }
        else{
            selectedData = []; // noma'lum hudud bo'lsa bo'sh array
        }

const tbody = document.getElementById("event-tbody");
        selectedData.forEach((event, index) => {
    tbody.innerHTML += `
        <tr class="lb text-center">
            <td class="text-right">${index + 1}</td>
            <td>
                <a href="hr.php?act=event_according_duty&date=${encodeURIComponent(event.eventName)}">
                    ${event.eventName}
                </a>
            </td>
            <td>${event.eventType}</td>
            <td>${event.eventCategory}</td>
            <td>${event.eventPlace}</td>
            <td>${event.evetDate}</td>
            <td>${event.evetFinishDate}</td>
            <td>${event.evetPersonCount}</td>
            <td>${event.evetDutyCount}</td>
            <td>${event.evetMGCount}</td>
            <td>${event.evetIIVCount}</td>
            <td>${event.evetFVVCount}</td>
            <td>${event.evetMSGrCount}</td>
            <td>${event.evetSpringCount}</td>
            <td>${event.evetMHXCount}</td>
            <td>${event.evetTransportCount}</td>
            <td>${event.evetSpecialTools}</td>
            <td>${event.evetResponsible}</td>
            <td>${event.evetorganizer}</td>
        </tr>
    `;
});
    

});
{/literal} 
</script>




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

//DataTable sozlamalari
// if (dt_basic_table.length) {
//   dt_basic = dt_basic_table.DataTable({
//     pageLength: 15,
//     lengthMenu: [5, 10, 25, 50, 75, 100, 1000],
//     ordering: false, 
//     language: {
//       lengthMenu: "Ko‘rsatish _MENU_ ta yozuv",
//       zeroRecords: "Hech narsa topilmadi",
//       info: "_TOTAL_ tadan _START_ dan _END_ gacha ko‘rsatilmoqda",
//       infoEmpty: "Ma’lumot yo‘q",
//       infoFiltered: "(jami _MAX_ yozuvdan filtrlandi)",
//       search: "Qidirish:",
//       paginate: {
//         previous: "Oldingi",
//         next: "Keyingi"
//       }
//     },
//   });
// }

    {/literal}

</script>

{include file="footer.tpl"}