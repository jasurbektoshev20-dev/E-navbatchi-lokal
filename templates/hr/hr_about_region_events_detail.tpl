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
      padding: 10px 0px;
      align-items: center;
      width: 83%;
      position: absolute;
      margin: 0 auto;
      left: 8%;
    }

      @media (max-width: 2800px){
     .date-box{
      width: 75%;
      left: 12%;
    }
      }

           @media (max-width: 2200px){
     .date-box{
      width: 65%;
      left: 15%;
    }
      }

             @media (max-width: 1900px){
     .date-box{
       width: 35%; 
     left:20%; 
    }
      .date-box{
        position: relative;
        left:0%;
        width: 100%;
        justify-content: space-around;
        margin: 0;
    }
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

 /* Oq fon uchun */
/*
.table.vertical-header .card-datatable-tr th:nth-child(n+3):nth-child(-n+7),
.table.vertical-header td:nth-child(n+3):nth-child(-n+7) {
  background-color: #f9f9f9; 
}

.table.vertical-header th:nth-child(n+8):nth-child(-n+14),
.table.vertical-header td:nth-child(n+8):nth-child(-n+14) {
  background-color: #f3f7ff; 
}

.table.vertical-header th:nth-child(n+15):nth-child(-n+27),
.table.vertical-header td:nth-child(n+15):nth-child(-n+27) {
  background-color: #fef6e4; 
}


.table.vertical-header th:nth-child(n+28):nth-child(-n+32),
.table.vertical-header td:nth-child(n+28):nth-child(-n+32) {
  background-color: #f3fff3; 
}

.table.vertical-header th:nth-child(n+33):nth-child(-n+37),
.table.vertical-header td:nth-child(n+33):nth-child(-n+37) {
  background-color: #fff5f8; 
}

.table.vertical-header th:nth-child(n+38):nth-child(-n+43),
.table.vertical-header td:nth-child(n+38):nth-child(-n+43) {
  background-color: #f5f5ff; 
}

.table.vertical-header th:nth-child(n+44):nth-child(-n+51),
.table.vertical-header td:nth-child(n+44):nth-child(-n+51) {
  background-color: #f8f8f0; 
}*/


.table.vertical-header td:nth-child(2) {
  border-right: 1px solid #000 !important; /* orqa fon rangiga mos chiziq */
}
/* Guruh 1 */
.table.vertical-header td:nth-child(7) {
  border-right: 1px solid #000 !important; /* orqa fon rangiga mos chiziq */
}

/* Guruh 2 */
.table.vertical-header td:nth-child(14) {
 border-right: 1px solid #000 !important;
}

/* Guruh 3 */
.table.vertical-header td:nth-child(19) {
  border-right: 1px solid #000 !important;
}

/* Guruh 4 */
.table.vertical-header td:nth-child(24) {
   border-right: 1px solid #000 !important;
}

.table.vertical-header td:nth-child(36) {
  border-right: 1px solid #000 !important;
}

.table.vertical-header td:nth-child(42) {
    border-right: 1px solid #000 !important;
}

.table.vertical-header td:nth-child(50) {
    border-right: 1px solid #000 !important;
}




    /* Qora fon uchun */

.table.vertical-header .card-datatable-tr th:nth-child(n+3):nth-child(-n+7),
.table.vertical-header td:nth-child(n+3):nth-child(-n+7) {
  background-color: #1e1e1e; 
}

.table.vertical-header th:nth-child(n+8):nth-child(-n+14),
.table.vertical-header td:nth-child(n+8):nth-child(-n+14) {
  background-color: #23262b; 
}

.table.vertical-header th:nth-child(n+15):nth-child(-n+19),
.table.vertical-header td:nth-child(n+15):nth-child(-n+19) {
  background-color: #2b2f33; 
}

.table.vertical-header th:nth-child(n+20):nth-child(-n+24),
.table.vertical-header td:nth-child(n+20):nth-child(-n+24) {
  /* background-color: #272a2f;  */
  background-color: #30343a; 
}

.table.vertical-header th:nth-child(n+25):nth-child(-n+36),
.table.vertical-header td:nth-child(n+25):nth-child(-n+36) {
  /*   */
  background-color: #272a2f
}

.table.vertical-header th:nth-child(n+37):nth-child(-n+42),
.table.vertical-header td:nth-child(n+37):nth-child(-n+42) {
 background-color: #35393f; 
}

.table.vertical-header th:nth-child(n+43):nth-child(-n+50),
.table.vertical-header td:nth-child(n+43):nth-child(-n+50) {
  background-color: #3a3e44; 
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
                    <h4>Milliy gvardiya {$smarty.get.date} bo'yicha boshqarmasi javobgarlik hududidagi bozorlarga  jamoat tartibini <br> saqlash va jamoat xavfsizligini ta’minlashga jalb etilgan kuch  va vositalar to‘g‘risida <br> <span>MA'LUMOT</span> </h4>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                 {* <div class="date-box">
                   <h5 class="pt-2 pb-2 m-0">Sana: 29.10.2025-yil</h5>
                   <div class="date-box-select">
                     <select class="form-select" aria-label="Default select example">
                            <option selected>Umumiy smena</option>
                            <option value="1">1-smena</option>
                            <option value="2">2-smena</option>
                            <option value="3">3-smena</option>
                      </select>
                       <input class="form-control" type="date" placeholder="Vaqtni tanlang">
                      <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
</svg>  Yuklab olish
                      </a>
                   </div>
               
                </div>   *}
                <div class="card-datatable table-responsive">
                
                    <table class="datatables-projects table table-hover vertical-header table-bordered">
                        <thead>
                            {* <tr class="group-row text-center">
      <th colspan="2"></th>  
      <th colspan="5">Umumiy</th>
      <th colspan="7">Yo'nalishlar va ularga jalb etilgan shaxsiy tarkib  
      </th>
      <th colspan="10">Qurollar</th>
      <th colspan="12">Maxsus vositalar</th>
      <th colspan="6">Xizmat hayvonlari</th>
      <th colspan="9">Avto transportlar</th>
     
    </tr> *}
                        <tr class="text-center card-datatable-tr">
                            <th class="horizon-th">T/r</th>
                            <th class="horizon-th">Tadbir nomi</th>
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
                            <th>Aloqa vositalari</th>
                            <th>Metalodetektor</th>
                            <th class="horizon-th">Tadbirga mas'ul</th>
                            <th class="horizon-th">Tadbirni o'tkazuvchi tashabbuskor</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="lb text-center">
                            <td class="text-right">1</td>
                            <td>
                                <a href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=Toshkent shahar">YUNЕSKO Bosh konferensiyasining 43 sessiyasi </a>    
                            </td>
                            <td>“Silk Road” turizm markazi</td>

                            <td>10:00</td>
                            <td>16:00</td>
                            <td>1000</td>
                            <td>833</td>
                            <td>451</td>
                            <td>320</td>
                            <td>50</td>
                            <td>6</td>
                            <td>6</td>
                            <td>6</td>
                            <td>12</td>
                            <td>500</td>
                            <td>40</td>
                            <td>84007 h/q mayor A.Nabiyev</td>
                            <td>Viloyat hokimligi</td>
                          
                        </tr>
                       <tr class="lb text-center" >
                            <td class="text-right">1</td>
                            <td>
                                <a href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=Toshkent shahar">YUNЕSKO Bosh konferensiyasining 43 sessiyasi </a>    
                            </td>
                            <td>“Silk Road” turizm markazi</td>

                            <td>10:00</td>
                            <td>16:00</td>
                            <td>1000</td>
                            <td>833</td>
                            <td>451</td>
                            <td>320</td>
                            <td>50</td>
                            <td>6</td>
                            <td>6</td>
                            <td>6</td>
                            <td>12</td>
                            <td>500</td>
                            <td>40</td>
                            <td>84007 h/q mayor A.Nabiyev</td>
                            <td>Viloyat hokimligi</td>
                          
                        </tr>
                      
                         <tr class="lb text-center">
                            <td class="text-right">1</td>
                            <td>
                                <a href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=Toshkent shahar">YUNЕSKO Bosh konferensiyasining 43 sessiyasi </a>    
                            </td>
                            <td>“Silk Road” turizm markazi</td>

                            <td>10:00</td>
                            <td>16:00</td>
                            <td>1000</td>
                            <td>833</td>
                            <td>451</td>
                            <td>320</td>
                            <td>50</td>
                            <td>6</td>
                            <td>6</td>
                            <td>6</td>
                            <td>12</td>
                            <td>500</td>
                            <td>40</td>
                            <td>84007 h/q mayor A.Nabiyev</td>
                            <td>Viloyat hokimligi</td>
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

{literal}
<script>
/*
document.addEventListener('DOMContentLoaded', function() {
    const region = "{/literal}{$smarty.get.date}{literal}"; // PHP dan kelgan viloyat nomi
    
  if (region === 'Toshkent shahar') {
      document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Askiya bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya bozori&shahar=Toshkent shahar' },
              { name: 'Mirobod dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod dehqon bozori&shahar=Toshkent shahar' },
              { name: 'Qoyliq dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq dehqon bozori&shahar=Toshkent shahar' },
              { name: 'Navruz dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz dehqon bozori&shahar=Toshkent shahar' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
  }

    else if (region === 'Toshkent viloyati') {
         document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Eski juva bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Eski juva bozori&shahar=Toshkent viloyati' },
              { name: 'Bek topi bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Bek topi bozori&shahar=Toshkent viloyati' },
              { name: 'Chilonzor dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Chilonzor dehqon bozori&shahar=Toshkent viloyati' },
              { name: 'Orikzor buyum bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Orikzor buyum bozori&shahar=Toshkent viloyati' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

        else if (region === 'Sirdaryo viloyati') {
           document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Sirdaryo bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Sirdaryo bozori&shahar=Sirdaryo viloyati' },
              { name: 'Sirdaryo savdo kompleksi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Sirdaryo savdo kompleksi&shahar=Sirdaryo viloyati' },
              { name: 'Guliston savdo kompleksi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Guliston savdo kompleksi&shahar=Sirdaryo viloyati' },
              { name: 'Eski shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Eski shahar bozori&shahar=Sirdaryo viloyati' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

        else if (region === 'Jizzax viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Eski shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Eski shahar bozori&shahar=Jizzax viloyati' },
              { name: 'Jizzax buyum bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Jizzax buyum bozori&shahar=Jizzax viloyati' },
              { name: 'Markaziy dehqon buyum bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Markaziy dehqon buyum bozori&shahar=Jizzax viloyati' },
              { name: 'Jizzax shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Jizzax shahar bozori&shahar=Jizzax viloyati' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

        else if (region === 'Samarqand viloyati') {
          const names = [
              { name: 'Siyob dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Temir yol dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Samarqand shodiyonasi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Ipak yoli SM', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
    }

        else if (region === 'Navoiy viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Saxovat dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Eski shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Zarafshon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Nurota bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Buxoro viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Markaziy dehqon bozor', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Karvon buyum bozor', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Sitora avtomobil bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Eski shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Andijon viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Jahon savdo kompleksi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Xunarmandchilik buyuim bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Markaziy dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Bogishamol bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Namangan viloyati') {  
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Jahon ixtisoslashtirilgan aralash mollar kompleksi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Chorsu dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Yashil dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Yoshlik baraka bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Fargona viloyati') {
              document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Markaziy dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Markaziy buyum bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Fargona shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Eski shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

    else if (region === 'Qashqadaryo viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Yerqorgon  dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Qarshi dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Qarshi markaziy bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Nasaf bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

    else if (region === 'Surxandaryo viloyati') {
      document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
      const names = [
          { name: 'Yashil dunyo bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
          { name: 'Markaziy dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
          { name: 'Surxandaryo shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
          { name: 'Eski shahar boziri', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
      ];
      if (names[index]) {
          td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
      }
  });
}
    else if (region === 'Xorazm viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Markaziy dehqon bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Askiya' },
              { name: 'Urganch amarkaziy buyum bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Mirobod' },
              { name: 'Xorazm shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Qoyliq' },
              { name: 'Eski shahar bozori', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Navruz' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
});
*/
</script>
{/literal} 



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

// DataTable sozlamalari
if (dt_basic_table.length) {
  dt_basic = dt_basic_table.DataTable({
    pageLength: 15,
    lengthMenu: [5, 10, 25, 50, 75, 100, 1000],
    ordering: false, 
    language: {
      lengthMenu: "Ko‘rsatish _MENU_ ta yozuv",
      zeroRecords: "Hech narsa topilmadi",
      info: "_TOTAL_ tadan _START_ dan _END_ gacha ko‘rsatilmoqda",
      infoEmpty: "Ma’lumot yo‘q",
      infoFiltered: "(jami _MAX_ yozuvdan filtrlandi)",
      search: "Qidirish:",
      paginate: {
        previous: "Oldingi",
        next: "Keyingi"
      }
    },
  });
}

    {/literal}

</script>

{include file="footer.tpl"}