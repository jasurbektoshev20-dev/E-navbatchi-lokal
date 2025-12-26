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
        justify-content: center;
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

    .clickable-cell{
        cursor: pointer;
    }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h4>МИЛЛИЙ ГВАРДИЯ БЎЛИНМАЛАРИДА ҚАЙД ЭТИЛГАН ЖАРОҲАТЛАР ТЎҒРИСИДАГИ<br>
                      <p class="m-0">МАЪЛУМОТЛАР</p>
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
                        <button class="btn btn-primary" id="shaxsiytarkib">Малумот</button>
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
                        <table class="table table-bordered text-center">
                           <table class="table table-bordered" id="injuryTable">
                                <thead></thead>
                                <tbody></tbody>
                           </table>
                        </table>
                </div>
            </div>
        </div>
        <!--/ Projects table -->
    </div>


    
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-simple modal-edit-user">
    <div class="modal-content">
      <div class="modal-body p-0" id="modalContent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         <table class="datatables-projects table border-top">
                        <thead>
                            <tr>
                                <th>т/р</th>
                                <th class="text-center">ҳ/қ</th>
                                <th class="text-center">Унвон</th>
                                <th class="text-center">ФИШ</th>
                                <th class="text-center">Сана</th>
                                <th class="text-center">Холат ҳақида</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                98244 ҳ.қ.
                            </td>
                            <td>Оддий аскар</td>
                            <td>Қаҳрамонов Рустам Бегали ўғли</td>
                            <td>10.12.2025</td>
                            <td>Жисмоний тайёргарлик вақтида оёғидан жароҳат олган.</td> 
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">2</td>
                            <td>
                                98244 ҳ.қ.
                            </td>
                            <td>Оддий аскар</td>
                            <td>Шералиев Абдулазиз Эргаш ўғли</td>
                            <td>05.12.2025</td>
                            <td>Жисмоний тайёргарлик вақтида қўли синган.</td> 
                        </tr>
                        </tbody>
                    </table>
            
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="showDetail" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-simple modal-edit-user">
    <div class="modal-content">
      <div class="modal-body p-0">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             <h4>Жами: 52 нафар шундан:</h4>
             <div class="alert alert-dark" role="alert">
                  Офицерлар: 12 нафар
            </div>
            <div class="alert alert-dark" role="alert">
                 Курсантлар : 10 нафар
            </div>
             <div class="alert alert-dark" role="alert">
               Сержантлар: 20 нафар
            </div>
             <div class="alert alert-dark" role="alert">
                Муддатли ҳарбий хизматчилар : 10 нафар
            </div> 
      </div>
    </div>
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

{/literal}
<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"
     var AJAXPHP = "ajax.php";
   
{literal}

// document.addEventListener('click', function (e) {
//   const cell = e.target.closest('.clickable-cell');
//   if (!cell) return;

//   const value = cell.dataset.value;
//   const col = cell.dataset.col;

  // modalni ochish
  /*const modal = new bootstrap.Modal(
    document.getElementById('submitModal')
    $.ajax({
        url:'ajax.php?act=get_injuries',
        type:'POST',
        data:fd,
        contentType:false,
        processData:false,
        success:r=>{
            if(r.split('<&sep&>')[0]==0){
                $('#submitModal').modal('hide');
                loadEvents();
            } else alert(r);
        }
    });
  );
  modal.show();
});


let hisobot = document.getElementById('shaxsiytarkib');
hisobot.addEventListener('click', ()=>{
   console.log('clicked')
  
     const modal = new bootstrap.Modal(
            document.getElementById('showDetail')
        );
        modal.show();
})*/


        function getInjury() {
        $.ajax({
            url: `${AJAXPHP}?act=get_injuries`,
            type: 'GET',
            dataType: 'json',
            success: function (res) {
            console.log("res:", res);
            if (res.success) {
                renderInjuryTable(res.data);
                }
            },
            error: function (xhr, status, error) {
            console.error('get_injuries AJAX error:', error);
            console.log(xhr.responseText); // 🔥 MUHIM
            }
        });
        }

        getInjury();


        function renderInjuryTable(data) {
            const thead = document.querySelector('#injuryTable thead');
            const tbody = document.querySelector('#injuryTable tbody');

            thead.innerHTML = '';
            tbody.innerHTML = '';

            /* 1️⃣ HUDUDLAR (COLUMN) */
            const regions = data.map(d => ({
                id: d.region_id,
                name: d.hudud
            }));

            /* 2️⃣ JAROHAT TURLARI (ROW) */
            const injuryMap = new Map();

            data.forEach(region => {
                region.injury_type_counts.forEach(it => {
                if (!injuryMap.has(it.injury_type_id)) {
                    injuryMap.set(it.injury_type_id, {
                    id: it.injury_type_id,
                    name: it.injury_type_name,
                    counts: {}
                    });
                }
                injuryMap.get(it.injury_type_id).counts[region.region_id] = it.count;
                });
            });

            const injuryTypes = Array.from(injuryMap.values());

            /* 3️⃣ THEAD */
            let headHtml = `<tr><th>т/р</th><th>Jarohat turlari</th>`;
            regions.forEach(r => {
                headHtml += `<th>${r.name}</th>`;
            });
            headHtml += `</tr>`;
            thead.innerHTML = headHtml;

            /* 4️⃣ TBODY */
            injuryTypes.forEach((injury, index) => {
                let row = `<tr>
                <td>${index + 1}</td>
                <td>${injury.name}</td>
                `;

                regions.forEach(r => {
                const val = injury.counts[r.id] ?? 0;
                row += `<td class="text-center">${val}</td>`;
                });

                row += `</tr>`;
                tbody.innerHTML += row;
            });
        }



{/literal}
</script>

{include file="footer.tpl"}