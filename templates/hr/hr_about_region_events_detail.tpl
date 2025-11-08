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
                    <h4>{$smarty.get.date} markazida o'tkaziladigan {$smarty.get.dataTadbir} va ularga jalb etiladigan kuch va vositalar to'g'risida  <br> <span>MA'LUMOT</span> </h4>
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
                   <h5 class="pt-2 pb-2 p-4 m-0">Sana: 08.11.2025-yil</h5>
                   <div class="date-box-select">
                     
                      <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
</svg>  Yuklab olish
                      </a>
                   </div>
               
                </div>
                <div class="card-datatable table-responsive">
                
                    <table class="datatables-projects table table-hover vertical-header table-bordered">
                        <thead>
                        <tr class="text-center card-datatable-tr">
                            <th class="horizon-th">T/r</th>
                            <th class="horizon-th">Tadbir nomi</th>
                             <th class="horizon-th">Tadbir turi</th>
                             <th class="horizon-th">Tadbir toifasi</th>
                            <th class="horizon-th">Tadbir o'tkaziladigan joy nomi</th>                         
                            <th>Tadbir boshlanish vaqti</th>
                            <th>Tadbir tugash vaqti</th>
                            <th>Qatnashadigan fuqoralarning taxminiy soni</th>
                            <th>Shaxsiy tarkib</th>
                            <th>MG HX soni</th>                         
                            <th>IIV HX soni</th>
                            <th>FVV HX soni</th>
                            <th>MG MSGr soni</th>
                            <th>IIV Spring soni</th>
                            <th>MHXlar soni</th>
                            <th>Transport vositalari</th>
                            <th>Maxsus vositalar</th>
                            <th class="horizon-th">Tadbirga mas'ul</th>
                            <th class="horizon-th">Tadbirni o'tkazuvchi tashabbuskor</th>
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
                Ortga
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

        const urlParams = new URLSearchParams(window.location.search);

        // dataTadbir parametrini olamiz
        const dateTadbir = urlParams.get("dataTadbir");
        const region = urlParams.get("date");
        console.log("data tadbir: ", dateTadbir, region);

        let selectedData;
    const dataSiyosiy1 = [
        {
            eventName: "YUNЕSKO Bosh konferensiyasining 43 sessiyasi",
            eventType:"Xalqaro",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "“Silk Road” turizm markazi",
            evetDate:"05.11.2025-y 10:00",
            evetFinishDate:"07.11.2025-y 16:00",
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
            evetResponsible:"84007 h/q mayor A.Nabiyev",
            evetorganizer:"Viloyat hokimligi",
        },
        {
            eventName: "AQSh prezidentining Samarqandga tashrifi",
            eventType:"Xalqaro",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Registon Maydoni",
            evetDate:"07.11.2025-y 08:00",
            evetFinishDate:"08.11.2025-y 12:00",
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
            evetResponsible:"81140 h/q p/p-k X.Xomidov",
            evetorganizer:"Viloyat hokimligi",
        }
    ]     

     const dataSiyosiy2 = [
        {
            eventName: "Davlat rahbarining Navoiy viloyatiga tashrifi",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Navoiy viloyati Navoiy shahar",
            evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG NVBB leytenant I.Esonboyev",
            evetorganizer:"Viloyat hokimligi",
        }
    ]     

     const dataSiyosiy3 = [
        {
            eventName: "O‘zbekiston–Pokiston siyosiy maslahatlashuvlari",
              eventType:"Xalqaro",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "“Do‘stlik saroyi” (Xalqlar do‘stligi saroyi)",
             evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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

            evetResponsible:"84007 h/q mayor B.Oblaqulov",
            evetorganizer:"Shahar hokimligi",
        },
          {
            eventName: "Xalqaro konferensiya: Turk davlatlari fikr markazlari",
            eventType:"Xalqaro",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "O‘zbekiston Respublikasi Tashqi ishlar vazirligi",          
            evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"81109 h/q kapitan X.Dehqonov",
            evetorganizer:"Shahar hokimligi",
        },
          {
            eventName: "V Toshkent Antikorrupsiya Forumi",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Oliy Majlis Qonunchilik palatasi majlislar zali",
            evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"84007 h/q mayor Sh.Ibragimov",
            evetorganizer:"Shahar hokimligi",
        },
    ]     

    // madaniy uchun 
      const dataSiyosiy4 = [
        {
            eventName: "Xazina nomli teatr tomoshosi",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "San’at saroyi binosida",
            evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG SVBB  k-n X.Xolmirzayev",
            evetorganizer:"“Arena sirk shapito” MCHJ",
        },
    ]     

      const dataSiyosiy5 = [
        {
            eventName: "Aholini teatrga tashrifini tizimli yo‘lga qo‘yish hamda “Teatr-ibodatxonadir” davlat dasturini amalga oshirish maqsadida “Hokim va mahalla raislari” uchrashuvi",
              eventType:"Respublika",
            eventCategory: "Pulli xizmat asosida tadbir",
            eventPlace: "San’at saroyi binosida",
           evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG 88926 h/q kt l-nt A.Po‘latov",
            evetorganizer:"Viloyat hokimligi",
        },
         {
            eventName: "Xalqaro zamonaviy san’at Biyennalesi tadbiri",
              eventType:"Xalqaro",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "San’at saroyi binosida",
              evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG 88926 h/q kt l-nt  Sh.Bolliyev",
            evetorganizer:"Viloyat hokimligi",
        },
    ]     

      const dataSiyosiy6 = [
        {
            eventName: "Kino namoyishlari yangi prem’era",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "A.Navoiy nomidagi kinochilar uyi",
             evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG 84007 h/q kt l-nt A.Nabiyev",
            evetorganizer:"Viloyat hokimligi",
        },
         {
            eventName: "“OBJ” spektakli",
              eventType:"Respublika",
            eventCategory: "Pulli xizmat asosida tadbir",
            eventPlace: "SShayxontohur t. Yosh tomoshabinlar teatri",
             evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG 88926 h/q kt l-nt  Sh.Bolliyev",
            evetorganizer:"Davlat yosh tomoshabinlar teatri",
        },
    ]     

      const dataSiyosiy7 = [
        {
            eventName: "“Maysaraning ishi” nomlangan spektaql namoyishi",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Viloyat musiqali drama teatri",
             evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG XVBB mayor A.Madreymov",
            evetorganizer:"Viloyat musiqali drama teatri",
        },
    ]   
    
      const dataSiyosiy8 = [
        {
            eventName: "Sportning Gandbol turi bo‘yicha yoshlar o‘rtasida O‘zbekiston chempionati",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Navoiy sh. Gandbol sport zalida",
            evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG NVBB leytenant I.Esonboyev",
            evetorganizer:"Sport boshqarmasi",
        },
    ]   

      const dataSiyosiy9 = [
        {
            eventName: "Kamondan o‘q otish bo‘yicha QR kubogi.",
              eventType:"Xalqaro",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Olimriya va paralimpiya sport turlariga ixtisoslashtirilgan sport maktabi",
           evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG 81416 h/q kt l-nt E.Xasanov",
            evetorganizer:"QR Sport vazirligi",
        },
    ]   

      const dataSiyosiy10 = [
        {
            eventName: "Sportning yunon-rum turi bo‘yicha O‘zbekiston chempionati",
              eventType:"Respublika",
            eventCategory: "Pulli xizmat asosida tadbir",
            eventPlace: "Yashnobod t.Olimpiya shaxarchasi",
             evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"84007 h/q mayor Sh.Ibragimov",
            evetorganizer:"Oliy talim, fan va inovatsiyalar vazirligi",
        },
    ]   


      const dataSiyosiy11 = [
        {
            eventName: "O‘qituvchilarga kasbiy sertifikatlash malaka sinovlvrini o‘tkazish",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Olmazor t.Beruniy k. 83A-uy (“IMZO” firmasi eski binosi)",
             evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"84007 h/q mayor Sh.Ibragimov",
            evetorganizer:"Maktabgacha va maktab talimi boshqarmasi",
        },
    ]   

      const dataSiyosiy12 = [
        {
            eventName: "O‘qituvchilarga kasbiy sertifikatlash malaka sinovlvrini o‘tkazish",
              eventType:"Respublika",
            eventCategory: "Hukumat qarori asosidagi tadbir",
            eventPlace: "Jizzax shaxar  4-sonli umumiy o‘rta ta’lim maktabi binosi",
           evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG JVBB mayor S.Mamatqulov",
            evetorganizer:"Ta’lim vazirligi",
        },
    ]   

     const dataSiyosiy13 = [
        {
            eventName: "Professional va maktabdan tashqari talim tashkilotlari pedagogik kadrlarni attestatsiyasi",
              eventType:"Respublika",
            eventCategory: "Pulli xizmat asosida tadbir",
            eventPlace: "Namangan shaxar 15-sonli maktab",
            evetDate:"08.11.2025-y 09:00",
            evetFinishDate:"08.11.2025-y 17:00",
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
            evetResponsible:"MG NVBB kapitan Sh.Xurramov",
            evetorganizer:"M va mt boshqarmasi",
        },
    ]   

    
        if (region === "Toshkent shahar" && dateTadbir === "Siyosiy tadbirlar") {
            selectedData = dataSiyosiy3;
        } else if (region === "Samarqand viloyati" && dateTadbir === "Siyosiy tadbirlar") {
            selectedData = dataSiyosiy1;
        } else if (region === "Navoiy viloyati" && dateTadbir === "Siyosiy tadbirlar") {
            selectedData = dataSiyosiy2;
        } else if (region === "Surxandaryo viloyati" && dateTadbir === "Madaniy tadbirlar") {
            selectedData = dataSiyosiy4;
        } else if (region === "Buxoro viloyati" && dateTadbir === "Madaniy tadbirlar") {
            selectedData = dataSiyosiy5;
        } else if (region === "Toshkent viloyati" && dateTadbir === "Madaniy tadbirlar") {
            selectedData = dataSiyosiy6;
        } else if (region === "Xorazm viloyati" && dateTadbir === "Madaniy tadbirlar") {
            selectedData = dataSiyosiy7;
        } else if (region === "Navoiy viloyati" && dateTadbir === "Sport tadbirlar") {
            selectedData = dataSiyosiy8;
        } else if (region === "Qoraqalpog'iston Respublikasi" && dateTadbir === "Sport tadbirlar") {
            selectedData = dataSiyosiy9;
        }else if (region === "Toshkent shahar" && dateTadbir === "Sport tadbirlar") {
            selectedData = dataSiyosiy10;
        }else if (region === "Toshkent viloyati" && dateTadbir === "Boshqa tadbirlar") {
            selectedData = dataSiyosiy11;
        }else if (region === "Jizzax viloyati" && dateTadbir === "Boshqa tadbirlar") {
            selectedData = dataSiyosiy12;
        }else if (region === "Namangan viloyati" && dateTadbir === "Boshqa tadbirlar") {
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
    title: 'Sahifa yuklanmoqda...',
    text: 'Iltimos, kuting',
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