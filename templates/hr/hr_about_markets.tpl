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
                    <h3>Бозорларга жамоат тартибини сақлаш ва жамоат хавфсизлигини таъминлашга жалб этилган куч ва воситалар тўғрисида <br> <span>МАЪЛУМОТ</span> </h3>
                </div>
            </div>
        </div>
    </div>



    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="date-box">
                   <h4 class="pt-2 pb-2 p-4 m-0" id="date_h5"></h4>
                   <div class="date-box-select">
                       <input class="form-control" type="date" placeholder="Бошланғич вақтни танланг">
                       <input class="form-control" type="date" placeholder="Охирги вақтни танланг">
                      <a href="#" class="date-box-sel-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-file-earmark-text" viewBox="0 0 16 16">
  <path d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"/>
  <path d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1z"/>
</svg>  Юклаб олиш
                      </a>
                   </div>
               
                </div>
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top table-hover table-striped table-bordered">
                        <thead>
                        <tr class="text-center">
                            <th style="white-space: nowrap;">Т/р</th>
                            <th>Ҳудудлар</th>
                            <th>Бозорлар сони</th>
                            <th>Савдо объектлари</th>
                            <th>Йўналишлар</th>
                            <th>Кириш-чиқиш эшиклар сони</th>
                            <th>Камералар сони</th>
                            <th>Ташвиш тугмалар</th>
                            <th>Шахий таркиб сони</th>
                            <th>Автотранспортлар сони</th>
                            {* <th>Қурол бириктирилган ҳарбий хизматчилар сони</th> *}
                            <th>Хизмат ҳайвонлари</th>
                            <th>Махсус воситалар сони</th>
                        </tr>
                        </thead>
                        <tbody>
                           
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">1</td>
                            <td>
                                <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Тошкент шаҳри">Тошкент шаҳри</a>
                            </td>
                            <td>19</td>
                            <td>212</td>
                            <td>345</td>
                            <td>100</td>
                            <td>236</td>
                            <td>128</td>
                            <td>141</td>
                            <td>35</td>
                            {* <td>107</td> *}
                            <td>22</td>
                            <td>100</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">2</td>
                            <td>
                             <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Андижон вилояти">Андижон вилояти</a>
                               
                            </td>
                            <td>4</td>
                            <td>157</td>
                            <td>123</td>
                            <td>98</td>
                            <td>111</td>
                            <td>76</td>
                            <td>67</td>
                            <td>30</td>
                            {* <td>78</td> *}
                            <td>18</td>
                            <td>21</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">3</td>
                            <td>
                             <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Бухоро вилояти">Бухоро вилояти</a>
                               
                            </td>
                            <td>3</td>
                            <td>130</td>
                            <td>113</td>
                            <td>88</td>
                            <td>115</td>
                            <td>76</td>
                            <td>45</td>
                            <td>25</td>
                            {* <td>70</td> *}
                            <td>24</td>
                            <td>20</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">4</td>
                            <td>
                               <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Фарғона вилояти">Фарғона вилояти</a>
                              
                            </td>
                            <td>2</td>
                            <td>145</td>
                            <td>178</td>
                            <td>88</td>
                            <td>137</td>
                            <td>90</td>
                            <td>58</td>
                            <td>29</td>
                            {* <td>52</td> *}
                            <td>22</td>
                            <td>17</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">5</td>
                            <td>
                              <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Жиззах вилояти">Жиззах вилояти</a>
                              
                            </td>
                            <td>3</td>
                            <td>175</td>
                            <td>208</td>
                            <td>100</td>
                            <td>206</td>
                            <td>99</td>
                            <td>67</td>
                            <td>28</td>
                            {* <td>32</td> *}
                            <td>42</td>
                            <td>38</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">6</td>
                            <td>
                               <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Қашқадарё вилояти">Қашқадарё вилояти</a>
                              
                            </td>
                            <td>4</td>
                            <td>125</td>
                            <td>118</td>
                            <td>78</td>
                            <td>186</td>
                            <td>75</td>
                            <td>60</td>
                            <td>26</td>
                            {* <td>74</td> *}
                            <td>29</td>
                            <td>24</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">7</td>
                            <td>
                              <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Хоразм вилояти">Хоразм вилояти</a>
                              
                              
                            </td>
                            <td>2</td>
                            <td>134</td>
                            <td>119</td>
                            <td>76</td>
                            <td>192</td>
                            <td>79</td>
                            <td>68</td>
                            <td>25</td>
                            {* <td>69</td> *}
                            <td>26</td>
                            <td>20</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">8</td>
                            <td>
                             <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Наманган вилояти">Наманган вилояти</a>
                                
                            </td>
                            <td>5</td>
                            <td>175</td>
                            <td>190</td>
                            <td>95</td>
                            <td>205</td>
                            <td>85</td>
                            <td>78</td>
                            <td>21</td>
                            {* <td>65</td> *}
                            <td>30</td>
                            <td>31</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">9</td>
                            <td>
                             <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Навоий вилояти">Навоий вилояти</a>
                              
                            </td>
                            <td>1</td>
                            <td>155</td>
                            <td>170</td>
                            <td>85</td>
                            <td>175</td>
                            <td>78</td>
                            <td>70</td>
                            <td>33</td>
                            {* <td>89</td> *}
                            <td>17</td>
                            <td>23</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">10</td>
                            <td>
                               <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Самарқанд вилояти">Самарқанд вилояти</a>
                            
                            </td>
                            <td>5</td>
                            <td>165</td>
                            <td>180</td>
                            <td>88</td>
                            <td>169</td>
                            <td>73</td>
                            <td>67</td>
                            <td>31</td>
                            {* <td>55</td> *}
                            <td>23</td>
                            <td>21</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">11</td>
                            <td>
                              <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Сирдарё вилояти">Сирдарё вилояти</a>
                              
                            </td>
                            <td>1</td>
                            <td>155</td>
                            <td>170</td>
                            <td>82</td>
                            <td>162</td>
                            <td>65</td>
                            <td>60</td>
                            <td>27</td>
                            {* <td>62</td> *}
                            <td>21</td>
                            <td>20</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">12</td>
                            <td>
                                <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Сурхандарё вилояти">Сурхандарё вилояти</a>
                            </td>
                            <td>2</td>
                            <td>150</td>
                            <td>165</td>
                            <td>78</td>
                            <td>152</td>
                            <td>61</td>
                            <td>57</td>
                            <td>30</td>
                            {* <td>43</td> *}
                            <td>16</td>
                            <td>23</td>
                        </tr>
                        <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">13</td>
                            <td>
                              Тошкент вилояти
                            </td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            <td>0</td>
                            {* <td>47</td> *}
                            <td>0</td>
                            <td>0</td>
                        </tr>
                          <tr class="lb text-center" id="row_{$Table.id|crypt}">
                            <td class="text-right">14</td>
                            <td>
                                <a
                                        href="hr.php?act=market_by_region&mid={$smarty.get.mid}&date=Қорақалпоғистон Республикаси">Қорақалпоғистон Республикаси</a>
                            </td>
                            <td>1</td>
                            <td>19</td>
                            <td>4</td>
                            <td>3</td>
                            <td>242</td>
                            <td>112</td>
                            <td>80</td>
                            <td>38</td>
                            {* <td>107</td> *}
                            <td>44</td>
                            <td>51</td>
                        </tr>
                   
                        <tr class="lb text-center table-success" id="row_{$Table.id|crypt}">
                            <td class="text-right">15</td>
                            <td>
                              Жами
                            </td>
                            <td>41</td>
                            <td>4780</td>
                            <td>2232</td>
                            <td>3188</td>
                            <td>4242</td>
                            <td>1112</td>
                            <td>580</td>
                            <td>467</td>
                            {* <td>978</td> *}
                            <td>448</td>
                            <td>578</td>
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



  const today = new Date();

  // kun, oy, yilni olish
  const day = String(today.getDate()).padStart(2, '0');      // 01–31
  const month = String(today.getMonth() + 1).padStart(2, '0'); // 0 dan boshlanadi, shuning uchun +1
  const year = today.getFullYear();

  // format: 11.11.2025
  const formattedDate = `${day}.${month}.${year}`;

  document.getElementById('date_h5').textContent =`Сана: ${formattedDate}-йил`;


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