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
  .card-datatable {
    overflow-x: auto;
  }

  .card-datatable table {
    min-width: 1900px; 
  }
}

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h4> O‘zbekiston Respublikasi Toshkent, Nukus shaharlari va viloyatlar markazlarida o‘tkaziladigan <strong>{$smarty.get.date}</strong>  davrida Milliy gvardiya hududiy bo‘linmalari tomonidan jalb etiladigan kuch va vositalari to‘g‘risida <br> <span>MA'LUMOT</span> </h4>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="date-box">
                   <h5 class="pt-2 pb-2 p-4 m-0">Sana: 06.11.2025-yil</h5>
                   <div class="date-box-select">
                       {* <input class="form-control" type="date" placeholder="Boshlang'ich vaqtni tanlang">
                       <input class="form-control" type="date" placeholder="Oxirgi vaqtni tanlang"> *}
                      <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
</svg>  Yuklab olish
                      </a>
                   </div>
               
                </div>
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top table-hover table-striped table-bordered">
                        <thead>
                        <tr class="text-center">
                            <th>T/r</th>
                            <th>Viloyatlar kesimida̱</th>
                            <th>Tadbir soni̱</th>
                            <th>Hukumat qarori asosidagi tadbir</th>
                            <th>Pulli xizmat asosida tadbir</th>
                            <th>Qatnashadigan fuqarolar soni</th>
                            <th>Shaxsiy tarkib</th>
                            <th>Texnikalar</th>
                            <th>Maxsus vositalar</th>
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
{/literal}
</script>


<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"
    
    
 
  

    {literal}
       
       const region = "{/literal}{$smarty.get.date}{literal}"; 

         let selectedData;
         const siyosiyTadbir = [
         {
            eventRegion: "Samarqand shahar",
            eventCount:2,
            hukumatqarori:1,
            pullixizmat:1,
            evetPersonCount:1000,
            evetDutyCount:320,
            evetTransportCount:12,
            evetVositaCount:100,
        },
              {
            eventRegion: "Navoiy shahar",
            eventCount:1,
            hukumatqarori:1,
            pullixizmat:0,
            evetPersonCount:500,
            evetDutyCount:120,
            evetTransportCount:9,
            evetVositaCount:70,
        },
              {
            eventRegion: "Toshkent shahar",
            eventCount:3,
            hukumatqarori:2,
            pullixizmat:1,
            evetPersonCount:900,
            evetDutyCount:220,
            evetTransportCount:30,
            evetVositaCount:170,
        },
    ]     
    

      const madaniyTadbir = [
         {
            eventRegion: "Surxandaryo shahar",
            eventCount:1,
            hukumatqarori:1,
            pullixizmat:0,
            evetPersonCount:200,
            evetDutyCount:18,
            evetTransportCount:2,
            evetVositaCount:20,
        },
              {
            eventRegion: "Buxoro shahar",
            eventCount:2,
            hukumatqarori:1,
            pullixizmat:1,
            evetPersonCount:300,
            evetDutyCount:20,
            evetTransportCount:3,
            evetVositaCount:20,
        },
       {
            eventRegion: "Toshkent shahar",
            eventCount:3,
            hukumatqarori:2,
            pullixizmat:1,
            evetPersonCount:900,
            evetDutyCount:16,
            evetTransportCount:4,
            evetVositaCount:16,
        },
          {
            eventRegion: "Xorazm shahar",
            eventCount:1,
            hukumatqarori:0,
            pullixizmat:1,
            evetPersonCount:500,
            evetDutyCount:25,
            evetTransportCount:4,
            evetVositaCount:30,
        },
    ]     

    const sportTadbir = [
         {
            eventRegion: "Navoiy shahar",
            eventCount:1,
            hukumatqarori:1,
            pullixizmat:0,
            evetPersonCount:100,
            evetDutyCount:10,
            evetTransportCount:2,
            evetVositaCount:8,
        },
              {
            eventRegion: "Qoraqalpog'iston ",
            eventCount:1,
            hukumatqarori:1,
            pullixizmat:0,
            evetPersonCount:100,
            evetDutyCount:20,
            evetTransportCount:3,
            evetVositaCount:20,
        },
          {
            eventRegion: "Toshkent shahar",
            eventCount:4,
            hukumatqarori:3,
            pullixizmat:1,
            evetPersonCount:1000,
            evetDutyCount:50,
            evetTransportCount:12,
            evetVositaCount:50,
        },
    ]     

      const boshqaTadbir = [
         {
            eventRegion: "Toshkent shahar",
            eventCount:1,
            hukumatqarori:1,
            pullixizmat:0,
            evetPersonCount:100,
            evetDutyCount:10,
            evetTransportCount:2,
            evetVositaCount:8,
        },
              {
            eventRegion: "Jizzax shahar",
            eventCount:1,
            hukumatqarori:1,
            pullixizmat:0,
            evetPersonCount:100,
            evetDutyCount:20,
            evetTransportCount:3,
            evetVositaCount:20,
        },
          {
            eventRegion: "Namangan shahar",
            eventCount:4,
            hukumatqarori:3,
            pullixizmat:1,
            evetPersonCount:1000,
            evetDutyCount:50,
            evetTransportCount:12,
            evetVositaCount:50,
        },
    ]     
    

    
        if (region === "Siyosiy tadbirlar") {
            selectedData = siyosiyTadbir;
        } else if (region === "Madaniy tadbirlar") {
            selectedData = madaniyTadbir;
        } else if (region === "Sport tadbirlar") {
            selectedData = sportTadbir;
        } else if (region === "Boshqa tadbirlar") {
            selectedData = boshqaTadbir;
        } else {
            selectedData = []; // noma'lum hudud bo'lsa bo'sh array
        }


const tbody = document.getElementById("event-tbody");
tbody.innerHTML = ""; // avval tozalaymiz

selectedData.forEach((event, index) => {
    tbody.innerHTML += `
        <tr class="lb text-center">
            <td class="text-right">${index + 1}</td>
            <td>
                <a href="hr.php?act=about_region_events_detail&mid=&date=${encodeURIComponent(event.eventRegion)}&dataTadbir=${encodeURIComponent(region)}">
                    ${event.eventRegion}
                </a>
            </td>
            <td>${event.eventCount}</td>
            <td>${event.hukumatqarori}</td>
            <td>${event.pullixizmat}</td>
            <td>${event.evetPersonCount}</td>
            <td>${event.evetDutyCount}</td>
            <td>${event.evetTransportCount}</td>
            <td>${event.evetVositaCount}</td>
        </tr>
    `;
});

   

       

    {/literal}

</script>

{include file="footer.tpl"}