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
                    <h4>Миллий гвардия {$smarty.get.date} бўйича бошқармаси жавобгарлик ҳудудидаги бозорларга  жамоат тартибини <br> сақлаш ва жамоат хавфсизлигини таъминлашга жалб этилган куч  ва воситалар тўғрисида <br> <span>МАЪЛУМОТ</span> </h4>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                 <div class="date-box">
                   <h5 class="pt-2 pb-2 m-0">Сана: 29.10.2025-йил</h5>
                   <div class="date-box-select">
                     <select class="form-select" aria-label="Default select example">
                            <option selected>Умумий смена</option>
                            <option value="1">1-смена</option>
                            <option value="2">2-смена</option>
                            <option value="3">3-смена</option>
                      </select>
                       <input class="form-control" type="date" placeholder="Vaqtni tanlang">
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
                            <tr class="group-row text-center">
      <th colspan="2"></th>  
      <th colspan="5">Умумий</th>
      <th colspan="7">Йўналишлар ва уларга жалб этилган шахсий таркиб  
      </th>
      <th colspan="10">Қуроллар</th>
      <th colspan="12">Махсус воситалар</th>
      <th colspan="6">Хизмат ҳайвонлари</th>
      <th colspan="9">Авто транспортлар</th>
     
    </tr>
                        <tr class="text-center card-datatable-tr">
                            <th class="horizon-th">Т/р</th>
                            <th class="horizon-th">Бозорлар</th>
                            <th>Майдони</th>
                            <th>Секторлар сони</th>
                            <th>Сменалар сони</th>
                            <th>Кириш чиқиш эшиклар сони</th>
                            <th>Камералар сони</th>
                            <th>АП йўналишлар сони</th>
                            <th>ПП йўналишлар сони</th>
                            <th>Жами йўналишлар сони</th>
                            <th>Офицерлар сони</th>
                            <th>Сержантлар сони</th>
                            <th>МҲХлар сони</th>
                            <th>Жами</th>
                            <th>ПМ</th>
                            <th>Глок</th>
                            <th>Автоматик қурол</th>
                            <th>Бошқа</th>
                            <th>Жами</th>
                            <th>ПМ</th>
                            <th>Глок</th>
                            <th>Автоматик қурол</th>
                            <th>Бошқа</th>
                            <th>Жами</th>
                            <th>Планшет</th>
                            <th>Бодй камера</th>
                            <th>Алоқа воситаси</th>
                            <th>Металлодетектор</th>
                            <th>Мегафон</th>
                            <th>Резина таёқ</th>
                            <th>Қўл кишани</th>
                            <th>Чўнтак фонари</th>
                            <th>Хуштак</th>
                            <th>Тиббий ҳимоя воситалари</th>
                            <th>Аэрозол</th>
                            <th>Жами</th>
                            <th>Гиёхванд модда қидирувчи итлар</th>
                            <th>Мина қидирувчи итлар</th>
                            <th>Антитеррор итлар</th>
                            <th>Қоровул итлар</th>
                            <th>Отлар</th>
                            <th>Жами</th>
                            <th>Патриот</th>
                            <th>Исузу Д-мах</th>
                            <th>ТИГР</th>
                            <th>Қалқон</th>
                            <th>БЙД</th>
                            <th>Автобус</th>
                            <th>Бошқа енгил транспорт</th>
                            <th>Жами</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=Тошкент шаҳар">Аския бозори</a>
                            </td>
                            <td>1.4 ga</td>
                            <td>4</td>
                            <td>3</td>
                            <td>3</td>
                            <td>15</td>
                            <td>10</td>
                            <td>12</td>
                            <td>5</td>
                            <td>10</td>
                            <td>7</td>
                            <td>22</td>
                            <td>8</td>
                            <td>15</td>
                            <td>12</td>
                            <td>12</td>
                            <td>4</td>
                            <td>6</td>
                            <td>10</td>
                            <td>10</td>
                            <td>22</td>
                            <td>8</td>
                            <td>15</td>
                            <td>12</td>
                            <td>4</td>
                            <td>6</td>
                            <td>10</td>
                            <td>10</td>
                             <td>5</td>
                            <td>10</td>
                            <td>7</td>
                            <td>22</td>
                            <td>8</td>
                            <td>15</td>
                            <td>12</td>
                            <td>4</td>
                            <td>4</td>
                            <td>6</td>
                            <td>10</td>
                            <td>10</td>
                            <td>7</td>
                            <td>22</td>
                            <td>8</td>
                            <td>15</td>
                            <td>12</td>
                            <td>4</td>
                            <td>6</td>
                            <td>10</td>
                            <td>45</td>
                        </tr>
                       <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">2</td>
                            <td>
                                <a
                                        href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=Тошкент шаҳар">Миробод деҳқон бозори</a>
                            </td>
                            <td>1.9 ga</td>
                            <td>5</td>
                            <td>4</td>
                            <td>4</td>
                            <td>16</td>
                            <td>11</td>
                            <td>11</td>
                            <td>6</td>
                            <td>9</td>
                            <td>6</td>
                            <td>21</td>
                            <td>7</td>
                            <td>16</td>
                            <td>11</td>
                            <td>5</td>
                            <td>7</td>
                            <td>11</td>
                            <td>9</td>
                            <td>20</td>
                            <td>9</td>
                            <td>14</td>
                            <td>13</td>
                            <td>5</td>
                            <td>50</td>
                            <td>5</td>
                            <td>9</td>
                            <td>9</td>
                            <td>4</td>
                            <td>11</td>
                            <td>6</td>
                            <td>20</td>
                            <td>7</td>
                            <td>17</td>
                            <td>13</td>
                            <td>5</td>
                            <td>5</td>
                            <td>5</td>
                            <td>9</td>
                            <td>9</td>
                            <td>7</td>
                            <td>23</td>
                            <td>9</td>
                            <td>14</td>
                            <td>11</td>
                            <td>5</td>
                            <td>5</td>
                            <td>9</td>
                            <td>56</td>
                        </tr>
                      
                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">3</td>
                            <td>
                                <a
                                        href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=Тошкент шаҳар">Қўйлик деҳқон бозори</a>
                            </td>
                            <td>2.2 ga</td>
                            <td>5</td>
                            <td>4</td>
                            <td>4</td>
                            <td>14</td>
                            <td>11</td>
                            <td>11</td>
                            <td>6</td>
                            <td>11</td>
                            <td>8</td>
                            <td>21</td>
                            <td>9</td>
                            <td>14</td>
                            <td>12</td>
                            <td>4</td>
                            <td>12</td>
                            <td>11</td>
                            <td>11</td>
                            <td>8</td>
                            <td>21</td>
                            <td>9</td>
                            <td>15</td>
                            <td>12</td>
                            <td>4</td>
                            <td>6</td>
                            <td>10</td>
                            <td>10</td>
                             <td>5</td>
                            <td>10</td>
                            <td>7</td>
                            <td>22</td>
                            <td>8</td>
                            <td>15</td>
                            <td>12</td>
                            <td>4</td>
                            <td>6</td>
                            <td>10</td>
                            <td>10</td>
                            <td>7</td>
                            <td>7</td>
                            <td>22</td>
                            <td>8</td>
                            <td>15</td>
                            <td>12</td>
                            <td>4</td>
                            <td>6</td>
                            <td>10</td>
                            <td>45</td>
                        </tr>

                         <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">4</td>
                            <td>
                                <a
                                        href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=Тошкент шаҳар">Наврўз деҳқон бозори</a>
                            </td>
                            <td>1.6 ga</td>
                            <td>3</td>
                            <td>4</td>
                            <td>4</td>
                            <td>14</td>
                            <td>12</td>
                            <td>14</td>
                            <td>7</td>
                            <td>11</td>
                            <td>7</td>
                            <td>24</td>
                            <td>9</td>
                            <td>18</td>
                            <td>11</td>
                            <td>6</td>
                            <td>11</td>
                            <td>11</td>
                            <td>8</td>
                            <td>20</td>
                            <td>10</td>
                            <td>13</td>
                            <td>15</td>
                            <td>5</td>
                            <td>8</td>
                            <td>12</td>
                            <td>12</td>
                             <td>5</td>
                            <td>10</td>
                            <td>7</td>
                            <td>24</td>
                            <td>9</td>
                            <td>13</td>
                            <td>11</td>
                            <td>5</td>
                            <td>5</td>
                            <td>11</td>
                            <td>11</td>
                            <td>8</td>
                            <td>8</td>
                            <td>22</td>
                            <td>8</td>
                            <td>16</td>
                            <td>13</td>
                            <td>5</td>
                            <td>7</td>
                            <td>11</td>
                            <td>11</td>
                            <td>34</td>
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
document.addEventListener('DOMContentLoaded', function() {
    const region = "{/literal}{$smarty.get.date}{literal}"; // PHP dan kelgan viloyat nomi
    
  if (region === 'Тошкент шаҳар') {
      document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Аския бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския бозори&shahar=Тошкент шаҳар' },
              { name: 'Миробод деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод деҳқон бозори&shahar=Тошкент шаҳар' },
              { name: 'Қойлиқ деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қойлиқ деҳқон бозориi&shahar=Тошкент шаҳар' },
              { name: 'Наврўз деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз деҳқон бозориi&shahar=Тошкент шаҳар' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
  }

    else if (region === 'Тошкент вилояти') {
         document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Эски жува бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Эски жува бозори&shahar=Тошкент вилояти' },
              { name: 'Бек топи бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Бек топи бозори&shahar=Тошкент вилояти' },
              { name: 'Чилонзор деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Чилонзор деҳқон бозори&shahar=Тошкент вилояти' },
              { name: 'Орикзор буюм бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Орикзор буюм бозори&shahar=Тошкент вилояти' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

        else if (region === 'Сирдарё вилояти') {
           document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Сирдарё бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Сирдарё бозори&shahar=Сирдарё вилояти' },
              { name: 'Сирдарё савдо комплекси', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Сирдарё савдо комплекси&shahar=Сирдарё вилояти' },
              { name: 'Гулистон савдо комплекси', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Гулистон савдо комплекси&shahar=Сирдарё вилояти' },
              { name: 'Эски шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Эски шаҳар бозори&shahar=Сирдарё вилояти' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

        else if (region === 'Жиззах вилояти') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Эски шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Эски шаҳар бозори&shahar=Жиззах вилояти' },
              { name: 'Жиззах буюм бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Жиззах буюм бозори&shahar=Жиззах вилояти' },
              { name: 'Марказий деҳқон буюм бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Марказий деҳқон буюм бозори&shahar=Жиззах вилояти' },
              { name: 'Жиззах шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Жиззах шаҳар бозори&shahar=Жиззах вилояти' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

        else if (region === 'Самарқанд вилояти') {
          const names = [
              { name: 'Сиёб деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Темир ёл деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Самарқанд шодиёнаси', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Ипак ёли СМ', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
    }

        else if (region === 'Navoiy viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Саховат деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Эски шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Зарафшон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Нурота бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Buxoro viloyati') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Марказий деҳқон бозор', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Карвон буюм бозор', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Ситора автомобил бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Эски шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Андижон вилояти') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Жаҳон савдо комплекси', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Хунармандчилик буюим бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Марказий деҳқон бозорi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Богишамол бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Наманган вилояти') {  
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Жаҳон ихтисослаштирилган аралаш моллар комплекси', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Чорсу деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Яшил деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Ёшлик барака бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
        else if (region === 'Фарғона вилояти') {
              document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Марказий деҳқон бозорi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Марказий буюм бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Фаргона шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Эски шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

    else if (region === 'Қашқадарё вилояти') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Ерқоргон  деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Қарши деҳқон бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Қарши марказий бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Насаф бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }

    else if (region === 'Сурхандарё вилояти') {
      document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
      const names = [
          { name: 'Яшил дунё бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
          { name: 'Марказий деҳқон бозорi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
          { name: 'Сурхандарё шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
          { name: 'Эски шаҳар бозири', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
      ];
      if (names[index]) {
          td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
      }
  });
}
    else if (region === 'Хоразм вилояти') {
          document.querySelectorAll('table tr td:nth-child(2)').forEach((td, index) => {
          const names = [
              { name: 'Марказий деҳқон бозорi', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Аския' },
              { name: 'Урганч Марказий буюм бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Миробод' },
              { name: 'Хоразм шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Қўйлиқ' },
              { name: 'Эски шаҳар бозори', link: 'hr.php?act=market_according_duty&mid={$smarty.get.mid}&market=Наврўз' }
          ];

          if (names[index]) {
              td.innerHTML = `<a href="${names[index].link}">${names[index].name}</a>`;
          }
      });
    }
});
</script>
{/literal} 



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
      lengthMenu: "Кўрсатиш _MENU_ та ёзув",
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