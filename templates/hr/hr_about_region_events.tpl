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
                    <h4><strong>{$regionName[0].name1}</strong> бўйича ўтказиладиган оммавий тадбирлар ва уларга жалб этиладиган куч ва воситалари тўғрисида <br> <span>МАЪЛУМОТ</span> </h4>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="date-box">
                  <h5 class="pt-2 pb-2 p-4 m-0" id="date_h5"></h5>
                   <div class="date-box-select">
                       {* <input class="form-control" type="date" placeholder="Boshlang'ich vaqtni tanlang">
                       <input class="form-control" type="date" placeholder="Oxirgi vaqtni tanlang"> *}
                       <select class="form-select">
                           <option>Ҳамма тадбирлар</option>
                           <option>Халқаро</option>
                           <option>Республика</option>
                       </select>
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
                            <tr>
                                <th style="white-space: nowrap;">т/р</th>
                                <th class="text-center">Ҳудуд</th>
                                <th class="text-center">Жойи</th>
                                <th class="text-center">Тури</th>
                                <th class="text-center">Тоифаси</th>
                                <th class="text-center">Номи</th>
                                <th class="text-center">Йўналиши</th>
                                <th class="text-center">Кўриниши</th>
                                <th class="text-center">Бошланиш вақти</th>
                                <th class="text-center">Тугаш вақти</th>
                                <th class="text-center">Фуқаролар сони</th>
                                <th class="text-center">Тадбирга масъул ташкилот</th>
                                <th class="text-center">Масъул ФИШ</th>
                                <th class="text-center">Телефон</th>
                                <th class="text-center">МГ жавобгар</th>
                                <th class="text-center">МГ сони</th>
                                <th class="text-center">ИИВ масъул ФИШ</th>
                                <th class="text-center">ИИВ ҲХ сони</th>
                                <th class="text-center">ФВВ масъул ФИШ</th>
                                <th class="text-center">ФВВ ҲХ сони</th>
                                <th class="text-center">МГ МСГр масъул ФИШ</th>
                                <th class="text-center">МГ МСГр сони</th>
                                <th class="text-center">ИИВ Спринг масъул ФИШ</th>
                                <th class="text-center">ИИВ Спринг сони</th>
                                <th class="text-center">Захирага масъул</th>
                                <th class="text-center">Захира сони</th>
                                <th class="text-center">Тадбирни ўтказувчи ташаббускор</th>
                           
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$events item=item key=tkey name=name}
                                <tr class="lb" id="row_{$item.id|crypt}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td class="text-center">
                                         {$regionName[0].name1}
                                    </td>
                                    <td class="text-center">{$item.object_name}</td>
                                    <td class="text-center">{$item.event_type}</td>     
                                    <td class="text-center">{$item.event_category}</td>     
                                    <td class="text-center">{$item.event_name}</td>
                                    <td class="text-center">{$item.event_direction}</td>
                                    <td class="text-center">{$item.event_view}</td>
                                    <td class="text-center">{$item.start_event}</td>
                                    <td class="text-center">{$item.finish_event}</td>
                                    <td class="text-center">{$item.people_count}</td>
                                    <td class="text-center">{$item.event_responsible_organization}</td>
                                    <td class="text-center">{$item.responsible_name}</td>
                                    <td class="text-center">{$item.responsible_phone}</td>
                                    <td class="text-center">{$item.responsible_mg_name}</td>
                                    <td class="text-center">{$item.mg_counts}</td>
                                    <td class="text-center">{$item.responsible_iiv_name}</td>
                                    <td class="text-center">{$item.iiv_count}</td>
                                    <td class="text-center">{$item.responsible_fvv_name}</td>
                                    <td class="text-center">{$item.fvv_count}</td>
                                    <td class="text-center">{$item.responsible_msgr_name}</td>
                                    <td class="text-center">{$item.sapyor_count}</td>
                                    <td class="text-center">{$item.responsible_spring_name}</td>
                                    <td class="text-center">{$item.spring_count}</td>
                                    <td class="text-center">{$item.reserve_name} </td>
                                    <td class="text-center">{$item.reserve_count}</td>
                                    <td class="text-center">{$item.organizer}</td>
                                </tr>
                            {/foreach}
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
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"

 {literal}


 const region = "{/literal}{$smarty.get.date}{literal}";     

{/literal}

</script>

{include file="footer.tpl"}