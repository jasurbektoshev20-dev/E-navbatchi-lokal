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

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h4>Milliy gvardiyaning hududiy boshqarmalari javobgarlik obyektlari to‘g‘risida <br>
                      <p class="m-0">MA'LUMOT</p>
                   </h4>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top table-hover table-striped table-bordered">
                        <thead>
                        <tr class="text-center">
                            <th>T/r</th>
                            <th>Obyekt nomi</th>
                            <th>Toshkent shahar</th>
                            <th>Andijon</th>
                            <th>Buxoro</th>
                            <th>Farg'ona</th>
                            <th>Jizzax</th>
                            <th>Qashqadaryo</th>
                            <th>Xorazm</th>
                            <th>Namangan</th>
                            <th>Navoiy</th>
                            <th>Samarqand</th>                           
                            <th>Sirdaryo</th>
                            <th>Surxandaryo</th>
                            <th>Toshkent viloyati</th>
                            <th>Qoraqalpog'iston</th>
                            <th>Jami</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=about_markets&mid={$smarty.get.mid}&date=">Bozorlar</a>
                            </td>
                            <td>48</td>
                            <td>24</td>
                            <td>14</td>
                            <td>15</td>
                            <td>18</td>
                            <td>24</td>
                            <td>30</td>
                            <td>21</td>
                            <td>24</td>
                            <td>25</td>
                            <td>15</td>
                            <td>28</td>
                            <td>12</td>
                            <td>34</td>
                            <td>300</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">2</td>
                            <td>
                                <a
                                        href="hr.php?act=''&mid={$smarty.get.mid}&date=Toshkent shahar">Istirohat bog'lari</a>
                            </td>
                            <td>55</td>
                            <td>34</td>
                            <td>23</td>
                            <td>25</td>
                            <td>30</td>
                            <td>24</td>
                            <td>31</td>
                            <td>29</td>
                            <td>24</td>
                            <td>35</td>
                            <td>19</td>
                            <td>20</td>
                            <td>34</td>
                            <td>38</td>
                            <td>420</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">3</td>
                            <td>
                                <a
                                        href="hr.php?act=''&mid={$smarty.get.mid}&date=Toshkent shahar">Sayilgohlar</a>
                            </td>
                            <td>41</td>
                            <td>25</td>
                            <td>16</td>
                            <td>21</td>
                            <td>19</td>
                            <td>24</td>
                            <td>32</td>
                            <td>23</td>
                            <td>20</td>
                            <td>33</td>
                            <td>18</td>
                            <td>27</td>
                            <td>18</td>
                            <td>39</td>
                            <td>398</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">4</td>
                            <td>
                                <a
                                        href="hr.php?act=''&mid={$smarty.get.mid}&date=Toshkent shahar">Boshqa joylar</a>
                            </td>
                            <td>30</td>
                            <td>19</td>
                            <td>16</td>
                            <td>15</td>
                            <td>21</td>
                            <td>27</td>
                            <td>22</td>
                            <td>21</td>
                            <td>26</td>
                            <td>20</td>
                            <td>15</td>
                            <td>18</td>
                            <td>12</td>
                            <td>24</td>
                            <td>232</td>
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