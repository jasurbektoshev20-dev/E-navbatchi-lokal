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

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

       <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-body text-center">
          <h4>O'zbekiston Respublikasi Milliy Gvardiyasi jamoat tartibini saqlash va jamoat xavfsizligini ta'minlashga <br> jalb etilgan kuch va vositalar to'g'risida ma'lumot</h4>
        </div>
      </div>
    </div>
  </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top">
                        <thead>
                            <tr>
                                <th>No̱</th>
                                <th>Viloyatlar</th>
                                <th>Bozor</th>
                                <th>Istirohat bog'i</th>
                                <th>Sayilgohlar</th>
                                <th>Boshqa joylar</th>
                                <th>Jami</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                                <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">1</td>
                                    <td>
                                        <a
                                            href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=''">Toshkent shahar</a>
                                    </td>
                                    <td>48</td>
                                    <td>24</td>
                                    <td>14</td>
                                    <td>15</td>
                                    <td>100</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$Table.id|crypt}" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="{$Table.id|crypt}" class="dropdown-item delete"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                  <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">2</td>
                                    <td>
                                        <a
                                            href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=''">Toshkent viloyati</a>
                                    </td>
                                    <td>48</td>
                                    <td>24</td>
                                    <td>14</td>
                                    <td>15</td>
                                    <td>100</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$Table.id|crypt}" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="{$Table.id|crypt}" class="dropdown-item delete"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                  <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">3</td>
                                    <td>
                                        <a
                                            href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=''">Navoiy</a>
                                    </td>
                                    <td>48</td>
                                    <td>24</td>
                                    <td>14</td>
                                    <td>15</td>
                                    <td>100</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$Table.id|crypt}" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="{$Table.id|crypt}" class="dropdown-item delete"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                   <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">4</td>
                                    <td>
                                        <a
                                           href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=''">Buxoro</a>
                                    </td>
                                    <td>48</td>
                                    <td>24</td>
                                    <td>14</td>
                                    <td>15</td>
                                    <td>100</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$Table.id|crypt}" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="{$Table.id|crypt}" class="dropdown-item delete"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                   <tr class="lb" id="row_{$Table.id|crypt}">
                                    <td class="text-right">5</td>
                                    <td>
                                        <a
                                            href="hr.php?act=region_objects&mid={$smarty.get.mid}&date=''">Jizzax</a>
                                    </td>
                                    <td>48</td>
                                    <td>24</td>
                                    <td>14</td>
                                    <td>15</td>
                                    <td>100</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$Table.id|crypt}" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="{$Table.id|crypt}" class="dropdown-item delete"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--/ Projects table -->
    </div>
</div>

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