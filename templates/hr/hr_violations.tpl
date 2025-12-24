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

        .chart-container {
            position: relative;
            height: 72vh;
            overflow: visible;
        }

        .chart-container2 {
            position: relative;
            height: 32.2vh;
            overflow: visible;
        }

        .flatpickr-wrapper {
            display: block !important;
        }

        .legend-text {
            white-space: pre-wrap;
            /* Allow wrapping */
            word-break: break-word;
            /* Break words if necessary */
        }
        .form-select{
            font-size: 18px;
        }

        .nav-item button{
            font-size: 20px;
        }

        .chart-btn-box button{
            margin-right: 5px;
            font-size: 18px;
        }
        .administrative-card input{
            font-size: 17px;
        }

        .tab-content{
            padding: 0;
        }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
  
            <div class="tab-content p-0">

                    <div class="tab-pane fade show active" id="charts" role="tabpanel">

                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="pills-home-tab"
                                            data-bs-toggle="pill"
                                            data-bs-target="#pills-home"
                                            type="button">
                                            Хуқуқий статистика
                                        </button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pills-profile-tab"
                                            data-bs-toggle="pill"
                                            data-bs-target="#pills-profile"
                                            type="button">
                                            Ҳудудлар кесимида
                                        </button>
                                    </li>
                                </ul>

                          
                                <div class="tab-content" id="pills-tabContent">

                                    <!-- TAB 1 -->
                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel">
                                        <div class="row">
                                               <div class="col-6">

                            <div class="card">

                                <div class="mx-1 my-2 row administrative-card">
                                    <div class="col-6">
                                        <h4 class="card-title">Мамурий ҳуқуқбузарликлар</h4>
                                    </div>
                                       <div class="col-3">
                                        <input type="date" id="start_date" class="form-control">
                                    </div>

                                    <div class="col-3">
                                        <input type="date" id="end_date" class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 d-flex align-items-center justify-content-end chart-btn-box">
                                          <button id="total_button" class="btn btn-primary mb-2">Жами жиноятлар</button>
                                          <button id="compare_button" class="btn btn-warning mb-2">Солиштириш</button>
                                    </div>
                                     <div class="chart-container2" id="administrative_offenses"  style="height: 600px;"></div>
                                </div>
                            </div>

                        </div>

                       <div class="col-6 ">

                            <div class="card">

                                <div class="mx-1 my-2 row administrative-card">
                                    <div class="col-6">
                                        <h4 class="card-title">Жиноятлар</h4>
                                    </div>
                                       <div class="col-3">
                                        <input type="date" id="criminal_start_date" class="form-control">
                                    </div>

                                    <div class="col-3">
                                        <input type="date" id="criminal_end_date" class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 d-flex align-items-center justify-content-end chart-btn-box">
                                          <button id="criminal_total_button" class="btn btn-primary mb-2">Жами жиноятлар</button>
                                          <button id="criminal_compare_button" class="btn btn-warning mb-2">Солиштириш</button>
                                    </div>
                                     <div class="chart-container2" id="criminal_offenses"  style="height: 600px;"></div>
                                </div>
                            </div>

                        </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-profile" role="tabpanel">
                                        <div class="row">

                                            <div class="col-md-6 col-lg-6">
                                                <div class="card p-3">
                                                    <div class="row">
                                                    <div class="col-8">
                                                        <h4 class="card-title">
                                                        Маъмурий ҳуқуқбузарликлар ҳудудлар кесимида
                                                        <span id="mamuriy_huquq_chart_total"></span>
                                                        </h4>
                                                    </div>
                                                
                                                    </div>
                                                    <div class="chart-container" id="mamuriy_huquq_chart" style="height: 600px;"></div>
                                                </div>
                                            </div>


                       <div class="col-md-6 col-lg-6">
                            <div class="card p-3">
                                <div class="row mb-3">
                                <div class="col-8">
                                    <h4 class="card-title">
                                    Жиноятлар ҳудудлар кесимида
                                    <span id="jinoiy_huquq_chart_total"></span>
                                    </h4>
                                </div>
                            
                                </div>
                                <div class="chart-container" id="jinoiy_huquq_chart" style="height: 600px;"></div>
                            </div>
                        </div>

                                         </div>
                                    </div>

                                </div>

                    </div>
       </div>
</div>


<!-- Edit Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-simple modal-edit-user">
        <div class="modal-content p-3 p-md-5">
            <div class="modal-body">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label>{$Dict.region}</label>
                            <select required class="select form-control" name="region_id" id="region_id">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Regions item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    
                        <div class="col-sm-6">
                            <label>{$Dict.crime_type}</label>
                            <select required class="select form-control" name="violation_type" id="violation_type">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$ViolationTypes item=Item3 key=ikey3}
                                    <option value="{$Item3.id}">{$Item3.name}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.comitted_crime}</label>
                            <select required class="select form-control" name="type" id="type">
                                <option value="">{$Dict.choose}</option>
                                <option value="1">{$Dict.crime}</option>
                                <option value="2">{$Dict.notable_crime}</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <label for="flatpickr-date" class="form-label">{$Dict.comitted_date}</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="date" />
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.incident_place}</label>
                            <input required type="text" class="form-control" name="incident_place" id="incident_place"
                                value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.latitude}</label>
                            <input required type="text" class="form-control" name="lat" id="lat" value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.longtitude}</label>
                            <input required type="text" class="form-control" name="lon" id="lon" value="">
                        </div>
                        <hr class="text-primary">
                        <div class="col-sm-6">
                            <label>{$Dict.citizen}</label>
                            <input required type="text" class="form-control" name="citizen" id="citizen" value="">
                        </div>
                        <div class="col-sm-6">
                            <label for="flatpickr-date" class="form-label">{$Dict.birthdate}</label>
                            <input type="text" class="form-control" placeholder="DD-MM-YYYY" id="birthdate" />
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.live_adress}</label>
                            <input required type="text" class="form-control" name="live_adress" id="live_adress"
                                value="">
                        </div>
                        <div class="col-sm-6">
                            <label>{$Dict.work_place}</label>
                            <input required type="text" class="form-control" name="work_place" id="work_place" value="">
                        </div>
                        <div class="col-sm-12">
                            <label>{$Dict.case_summary}</label>
                            <textarea required class="form-control" rows=4 name="text" id="text"></textarea>
                        </div>
                        <div class="col-12 text-center">
                            <input type="hidden" name="id" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"
                                aria-label="Close">
                                {$Dict.cancel}
                            </button>
                            <button id="SubButtonHrSetMarker" class="btn btn-primary me-sm-3 me-1">{$Dict.save}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--/ Edit Modal -->


{* charts *}
<script src="/assets/js/echarts.min.js"></script>
{* charts *}

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
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

    var Var_comment1	= "{$Dict.comment1}";
    var Var_comment2	= "{$Dict.comment2}";
    var Var_comment3	= "{$Dict.comment3}";
    var Var_main_photo	= "{$Dict.main_photo}";
    var Var_ObjectId	= "{$Organization.id}";
    var dict_all = "{$Dict.all}";
    var dict_by_day = "{$Dict.one_day}";
    var dict_by_month = "{$Dict.begin_month}";
    var dict_by_year = "{$Dict.one_year}";
    var AJAXPHP = "ajax{$AddURL}.php";

    {literal}

// // 1. STATIC DATA (BAZA)
// // =====================================
// document.getElementById('pills-profile-tab')
// .addEventListener('shown.bs.tab', function () {
//     echarts.getInstanceByDom(document.getElementById('mamuriy_huquq_chart')).resize();
//     echarts.getInstanceByDom(document.getElementById('jinoiy_huquq_chart')).resize();
// });


// const offenses = ["183-модда","187-модда", "223-модда","56°-модда", "194°-модда","195°-модда","185°-модда","196-модда","61-модда", "210°-модда","185²-модда","185³-модда"]

// const regions = [
//     "Қорақалпоғистон", "Тошкент ш", "Андижон", "Бухоро", "Фарғона", "Жиззах", "Наманган", "Navoiy", "Қашқадарё","Самарқанд","Сурхандарё", "Сирдарё", "Тошкент в", "Хоразм", 
// ];

// // Modda → sana → son
// const offenseData = {
//     "2025-11-01": {
//         "183-модда": 50,  "187-модда": 61,  "223-модда": 81,  "56°-модда": 61,
//         "194°-модда": 71, "195°-модда": 68, "185°-модда": 65, "196-модда": 88,
//         "61-модда": 55,  "210°-модда": 46, "185²-модда": 30, "185³-модда": 48
//     },
//     "2025-11-02": {
//         "183-модда": 70,  "187-модда": 84,  "223-модда": 60,  "56°-модда": 43,
//         "194°-модда": 59, "195°-модда": 60, "185°-модда": 41, "196-модда": 76,
//         "61-модда": 62,  "210°-модда": 44, "185²-модда": 30, "185³-модда": 48
//     },
//     "2025-11-03": {
//         "183-модда": 82,  "187-модда": 60,  "223-модда": 75,  "56°-модда": 69,
//         "194°-модда": 78, "195°-модда": 64, "185°-модда": 63, "196-модда": 41,
//         "61-модда": 72,  "210°-модда": 84, "185²-модда": 30, "185³-модда": 48
//     },
//     "2025-11-04": {
//         "183-модда": 55,  "187-модда": 65,  "223-модда": 81,  "56°-модда": 50,
//         "194°-модда": 63, "195°-модда": 65, "185°-модда": 59, "196-модда": 34,
//         "61-модда": 79,  "210°-модда": 90, "185²-модда": 30, "185³-модда": 48
//     },
//       "2025-11-23": {
//         "183-модда": 34,  "187-модда": 26,  "223-модда": 25,  "56°-модда": 29,
//         "194°-модда": 38, "195°-модда": 34, "185°-модда": 33, "196-модда": 31,
//         "61-модда": 32,  "210°-модда": 34, "185²-модда": 30, "185³-модда": 28
//     },
//     "2025-11-24": {
//         "183-модда": 25,  "187-модда": 35,  "223-модда": 31,  "56°-модда": 30,
//         "194°-модда": 33, "195°-модда": 35, "185°-модда": 29, "196-модда": 34,
//         "61-модда": 29,  "210°-модда": 30, "185²-модда": 30, "185³-модда": 28
//     }
// };

// // Tasodifiy region ma’lumotlari
// // const offenseRegionData = {};
// // regions.forEach(region => {
// //     offenseRegionData[region] = {
// //         "2025-11-01": offenses.map(() => Math.floor(Math.random() * 10)),
// //         "2025-11-02": offenses.map(() => Math.floor(Math.random() * 10)),
// //         "2025-11-03": offenses.map(() => Math.floor(Math.random() * 10)),
// //         "2025-11-04": offenses.map(() => Math.floor(Math.random() * 10))
// //     };
// // });
// const offenseRegionData = {
//      "Қорақалпоғистон": {
//         "2025-11-01": [0, 5, 9, 1, 6, 3, 1, 8, 3, 7, 3, 5],
//         "2025-11-02": [5, 2, 2, 8, 3, 6, 6, 4, 9, 3, 3, 5],
//         "2025-11-03": [8, 7, 4, 7, 9, 9, 9, 2, 9, 4, 3, 5],
//         "2025-11-04": [1, 4, 9, 3, 7, 1, 5, 1, 8, 4, 3, 5],
//         "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//      "Тошкент ш": {
//         "2025-11-01": [4, 9, 9, 0, 4, 4, 8, 7, 0, 3, 0, 4],
//         "2025-11-02": [9, 8, 0, 2, 4, 0, 1, 5, 0, 9, 0, 4],
//         "2025-11-03": [9, 3, 7, 8, 8, 0, 4, 4, 8, 9, 0, 4],
//         "2025-11-04": [2, 0, 3, 9, 9, 6, 4, 2, 3, 5, 0, 4],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Андижон": {
//         "2025-11-01": [0, 5, 9, 1, 6, 3, 1, 8, 3, 7, 1, 3],
//         "2025-11-02": [5, 2, 2, 8, 3, 6, 6, 4, 9, 3, 1, 3],
//         "2025-11-03": [8, 7, 4, 7, 9, 9, 9, 2, 9, 4, 1, 3],
//         "2025-11-04": [1, 4, 9, 3, 7, 1, 5, 1, 8, 4, 1, 3],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Бухоро": {
//         "2025-11-01": [3, 7, 2, 5, 3, 7, 7, 5, 5, 4, 2, 3],
//         "2025-11-02": [1, 8, 2, 3, 3, 0, 1, 7, 2, 2, 2, 3],
//         "2025-11-03": [2, 2, 6, 6, 8, 7, 5, 2, 5, 1, 2, 3],
//         "2025-11-04": [4, 6, 4, 0, 3, 0, 2, 0, 1, 8, 2, 3],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Фарғона": {
//         "2025-11-01": [4, 6, 6, 2, 3, 9, 0, 1, 6, 0, 3, 1],
//         "2025-11-02": [5, 8, 7, 1, 2, 6, 7, 8, 2, 1, 3, 1],
//         "2025-11-03": [1, 9, 3, 6, 4, 2, 9, 1, 2, 8, 3, 1],
//         "2025-11-04": [2, 8, 3, 0, 0, 6, 3, 1, 3, 9, 3, 1],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Жиззах":  {
//         "2025-11-01": [2, 6, 5, 3, 9, 8, 2, 3, 6, 1, 0, 4],
//         "2025-11-02": [7, 7, 8, 7, 2, 3, 1, 1, 6, 0, 0, 4],
//         "2025-11-03": [1, 4, 7, 8, 3, 8, 2, 3, 4, 2, 0, 4],
//         "2025-11-04": [1, 7, 5, 0, 7, 1, 5, 0, 9, 5, 0, 4],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Наманган": {
//         "2025-11-01": [8, 9, 0, 6, 3, 5, 1, 7, 6, 9, 5, 1],
//         "2025-11-02": [2, 5, 3, 1, 8, 8, 5, 3, 7, 3, 5, 1],
//         "2025-11-03": [4, 8, 7, 1, 7, 7, 8, 2, 3, 5, 5, 1],
//         "2025-11-04": [4, 1, 8, 7, 2, 7, 3, 6, 6, 7, 5, 1],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Navoiy": {
//         "2025-11-01": [7, 0, 8, 5, 7, 0, 5, 9, 8, 8, 2, 4],
//         "2025-11-02": [1, 4, 8, 0, 4, 0, 2, 1, 9, 0, 2, 4],
//         "2025-11-03": [0, 9, 9, 3, 7, 2, 1, 6, 4, 4, 2, 4],
//         "2025-11-04": [9, 9, 8, 2, 5, 5, 6, 8, 8, 7, 2, 4],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Қашқадарё": {
//         "2025-11-01": [9, 2, 9, 7, 5, 2, 4, 9, 4, 0, 1, 5],
//         "2025-11-02": [5, 7, 7, 4, 4, 1, 8, 6, 8, 5, 1, 5],
//         "2025-11-03": [8, 0, 9, 0, 5, 0, 8, 7, 3, 6, 1, 5],
//         "2025-11-04": [0, 8, 8, 5, 2, 5, 6, 8, 3, 4, 1, 5],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Самарқанд": {
//         "2025-11-01": [1, 0, 3, 8, 5, 5, 8, 6, 3, 0, 0, 5],
//         "2025-11-02": [6, 7, 4, 2, 5, 9, 0, 8, 2, 1, 0, 5],
//         "2025-11-03": [9, 1, 4, 2, 2, 4, 0, 1, 5, 9, 0, 5],
//         "2025-11-04": [9, 6, 6, 1, 1, 7, 4, 1, 8, 9, 0, 5],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//      "Сурхандарё": {
//         "2025-11-01": [1, 0, 3, 8, 5, 5, 8, 6, 3, 0, 7, 1],
//         "2025-11-02": [6, 7, 4, 2, 5, 9, 0, 8, 2, 1, 7, 1],
//         "2025-11-03": [9, 1, 4, 2, 2, 4, 0, 1, 5, 9, 7, 1],
//         "2025-11-04": [9, 6, 6, 1, 1, 7, 4, 1, 8, 9, 7, 1],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//      "Сирдарё": {
//         "2025-11-01": [1, 0, 3, 8, 5, 5, 8, 6, 3, 0, 1, 4],
//         "2025-11-02": [6, 7, 4, 2, 5, 9, 0, 8, 2, 1, 1, 4],
//         "2025-11-03": [9, 1, 4, 2, 2, 4, 0, 1, 5, 9, 1, 4],
//         "2025-11-04": [9, 6, 6, 1, 1, 7, 4, 1, 8, 9, 1, 4],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Тошкент в": {
//         "2025-11-01": [4, 9, 9, 0, 4, 4, 8, 7, 0, 3, 3, 3],
//         "2025-11-02": [9, 8, 0, 2, 4, 0, 1, 5, 0, 9, 3, 3],
//         "2025-11-03": [9, 3, 7, 8, 8, 0, 4, 4, 8, 9, 3, 3],
//         "2025-11-04": [2, 0, 3, 9, 9, 6, 4, 2, 3, 5, 3, 3],
//           "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     },
//     "Хоразм": {
//         "2025-11-01": [6, 3, 6, 7, 6, 8, 4, 6, 5, 4, 2, 5],
//         "2025-11-02": [3, 4, 9, 1, 7, 3, 3, 8, 4, 6, 2, 5],
//         "2025-11-03": [5, 5, 0, 9, 4, 8, 4, 5, 2, 5, 2, 5],
//         "2025-11-04": [2, 0, 3, 9, 9, 6, 4, 2, 3, 5, 2, 5],
//          "2025-23-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//         "2025-24-04": [1, 2, 3, 1, 2, 1, 3, 1, 4, 1, 1, 2],
//     }
// };

//   const colors = [
//         "#6EB5FF", // ko‘k
//         "#5CC97B", // yashil
//         "#A472FF", // to‘q binafsha
//         "#FFB84D", // och sariq
//         "#99CCFF", // och ko‘k
//         "#FFD24C", // sariq (eng katta bo‘lak)
//         "#4BA3C7", // havorang
//         "#7AD67A", // och yashil
//         "#FF884C", // to‘q sariq
//         "#B266FF", // binafsha
//         "#FF6666", // qizil
// ];

// function sumAllRegionsByDate(offenseRegionData) {
//     const numElements = 12;
//     let dates = Object.keys(offenseRegionData[Object.keys(offenseRegionData)[0]]); 
//     // birinchi viloyat sanalarini olamiz

//     let result = {}; // sana: array

//     dates.forEach(date => {
//         result[date] = new Array(numElements).fill(0);

//         Object.keys(offenseRegionData).forEach(region => {
//             const arr = offenseRegionData[region][date];
//             for (let i = 0; i < numElements; i++) {
//                 result[date][i] += arr[i];
//             }
//         });
//     });

//     return result;
// }

// // Misol
// let totalByDate = sumAllRegionsByDate(offenseRegionData);


// // =====================================
// // 2. INIT CHARTS
// // =====================================

// let pieChart = echarts.init(document.getElementById("administrative_offenses"));
// let barChart = echarts.init(document.getElementById("mamuriy_huquq_chart"));

// // =====================================
// // 3. LOAD DEFAULT
// // =====================================

// loadDefaultCharts();

// function loadDefaultCharts() {
//     // Avval barcha sanalarni yig‘amiz
//     let sum = {};
//     offenses.forEach(m => sum[m] = 0);

//     Object.keys(offenseData).forEach(date => {
//         offenses.forEach(m => sum[m] += offenseData[date][m]);
//     });

//     updatePie(sum);                // pie chart → Жами sonlar
//     renderModdaList(sum);

//     // viloyatlar bo‘yicha Жами
//     let regionTotals = regions.map(r => offenses.map(() => 0));

//     regions.forEach((region, ri) => {
//         Object.keys(offenseRegionData[region]).forEach(date => {
//             offenseRegionData[region][date].forEach((val, mi) => {
//                 regionTotals[ri][mi] += val;
//             });
//         });
//     });

//     updateBar(regionTotals);       // bar chart → Жами sonlar
// }



// // =====================================
// // 4. PIE CHART (DUMALOQ)
// // =====================================

// function updatePie(values) {

//     let total = Object.values(values).reduce((a, b) => a + b, 0);

//     pieChart.setOption({
//       graphic: {
//     type: "text",
//     left: "center",
//     top: "center",
//     style: {
//         text: total + "\nЖами",
//         textAlign: "center",
//         fontSize: 24,
//         fontWeight: "bold",
//         fill: "#b7b7b7",   // ✔ eng to‘g‘ri ishlaydi
//     }
// },
//            tooltip: {
//         trigger: 'item',
//         formatter: p => `${p.name} <br> Жами: <b>${p.value}</b>`,
//           textStyle: {
//                   fontSize: 20,     // 🔥 shu yerda o'zgartirasan
//                   color: '#000'
//         }// Hoverda nom va qiymat chiqadi
//         },

//         series: [{
//             type: "pie",
//             radius: ['40%', '80%'],
//             center: ['50%', '50%'],
//             avoidLabelOverlap: true,

//             label: {
//             show: true,
//             position: 'outside',
//             formatter: '{c}', // faqat raqam
//             fontSize: 20,
//             fontWeight: 'bold',
//             color: '#b7b7b7'
//             },
//             labelLine: {
//                 show: true,
//                 length: 15
//             },

//             itemStyle: {
//                 borderWidth: 2,
//                  borderRadius: 10
//             },

//             data: offenses.map((m, index )=> ({
//                 name: m,
//                 value: values[m],
//                   itemStyle: {
//                   color: colors[index],
//                  shadowColor: colors[index],
//                 shadowBlur:2,
//                 borderRadius: 10,
//                  borderColor: colors[index]

//             }
//             }))
//         }]
//     });
// }


// // =====================================
// // 5. PASTIGA MODDALAR RO‘YXATI TUGMASI
// // =====================================

// function renderModdaList(values) {
//     let existing = document.getElementById("moddalar_box_2");
//     if (existing) existing.remove();

//     // popup box yaratamiz
//     let box = document.createElement("div");
//     box.id = "moddalar_box_2";
//     box.style.position = "absolute";
//     box.style.left = "20px";
//     box.style.top = "0px";
//     box.style.width = "230px";
//     box.style.fontSize="20px"
//     box.style.background = "rgba(20, 20, 20, 0.85)";
//     box.style.backdropFilter = "blur(6px)";
//     box.style.border = "1px solid rgba(255,255,255,0.15)";
//     box.style.borderRadius = "12px";
//     box.style.padding = "12px";
//     box.style.color = "#fff";
//     box.style.zIndex = 1000;
//     box.style.display = "none";
//     box.innerHTML = `
//         <div id="moddalar_list_content">
//             ${offenses.map(m => `<div>${m} — ${values[m]} та</div>`).join("")}
//         </div>
//     `;
//     document.getElementById("administrative_offenses").appendChild(box);

//     // Tugma yaratamiz
//     let btn = document.createElement("button");
//     btn.className = "btn btn-info";
//     btn.style.position = "absolute";
//     btn.style.top = "-50px";
//     btn.style.left = "20px";   
//     btn.innerText = "Моддаларни кўриш";
//     btn.style.fontSize = "18px";

//     document.getElementById("administrative_offenses").appendChild(btn);

//     btn.onclick = () => {
//         box.style.display = box.style.display === "none" ? "block" : "none";
//     };
// }



// // =====================================
// // 6. BAR CHART (DIAGRAMMA) — GRADIENT
// // =====================================
// function updateBar(regionValues) {

//     // 1. Viloyatlarni jami bilan juftlab olamiz
//     let totals = regions.map((region, index) => ({
//         name: region,
//         value: regionValues[index].reduce((a, b) => a + b, 0)
//     }));

//     // 2. 🔥 O‘sish tartibida sort qilamiz
//     totals.sort((a, b) => a.value - b.value);

//     // 3. Sortdan keyin nom va qiymatlarni ajratamiz
//     let sortedRegions = totals.map(t => t.name);
//     let sortedValues = totals.map(t => t.value);

//     // 4. Echarts update
//     barChart.setOption({
//         textStyle: { fontFamily: "Arial, sans-serif" },
//         grid: { bottom: 80, right: 30, left: 60 },

//         tooltip: {
//             trigger: "axis",
//             backgroundColor: 'white',
//             textStyle: { fontSize: 20, color: '#000' }
//         },

//         xAxis: {
//             type: "category",
//             data: sortedRegions,
//             axisLabel: { interval: 0, rotate: 40, color: '#b7b7b7', fontSize: 14 }
//         },

//         yAxis: {
//             type: "value",
//             axisLabel: { color: '#b7b7b7', fontSize: 18 },
//             axisLine: { show: false },
//             splitLine: { show: false }
//         },

//         series: [{
//             type: "bar",
//             barMaxWidth: 60,
//             data: sortedValues,
//             itemStyle: {
//                 color: p => colors[p.dataIndex % colors.length],
//                 borderRadius: [8, 8, 0, 0]
//             },
//             label: {
//                 show: true,
//                 position: "top",
//                 fontWeight: "bold",
//                 fontSize: 20,
//                 color: '#b7b7b7'
//             },
//             barWidth: "55%"
//         }]
//     });
// }



// // =====================================
// // HELPERS
// // =====================================

// function sumRegions(date) {
//     return regions.map(r => offenseRegionData[r][date]);
// }


// // =====================================
// // 7. FILTER (Жами)
// // =====================================

// document.getElementById("total_button").onclick = function () {

//     let s = document.getElementById("start_date").value;
//     let e = document.getElementById("end_date").value;

//     if (!s || !e) return alert("Иккала санани танланг!");

//     let sum = {};
//     offenses.forEach(m => sum[m] = 0);

//     Object.keys(offenseData).forEach(date => {
//         if (date >= s && date <= e) {
//             offenses.forEach(m => sum[m] += offenseData[date][m]);
//         }
//     });

//     updatePie(sum);
//     renderModdaList(sum);

//     let regionTotals = regions.map(r => offenses.map(() => 0));

//     regions.forEach((region, ri) => {
//         Object.keys(offenseRegionData[region]).forEach(date => {
//             if (date >= s && date <= e) {
//                 offenseRegionData[region][date].forEach((val, mi) => {
//                     regionTotals[ri][mi] += val;
//                 });
//             }
//         });
//     });

//     updateBar(regionTotals);
// };


// // =====================================
// // 8. Солиштириш
// // =====================================
// document.getElementById("compare_button").onclick = function () {
//     let s = document.getElementById("start_date").value;
//     let e = document.getElementById("end_date").value;

//     if (!s || !e) return alert("Иккала санани танланг!");

//     // O‘zgarish + Жами
//     let diff = {};
//     let absValues = {};

//     offenses.forEach(m => {
//         let change = offenseData[e][m] - offenseData[s][m];
//         diff[m] = change;
//         absValues[m] = offenseData[e][m]; // end date asosiy qiymat
//     });

//     // DUMALOQ CHART
//     pieChart.setOption({
//             textStyle: {
//         fontFamily: "Arial, sans-serif",
//     },
//     color:colors,
//         tooltip: {
//             trigger: 'item',
//             show: true,
//             formatter: p => {
//                 let modda = p.name;
//                 let value = absValues[modda];
//                 let change = diff[modda];
//                 let sign = change > 0 ? "+" : "";
//                 return `${modda}<br/>${value} та (${sign}${change})`;
//             },
//               textStyle: {
//                   fontSize: 20,     
//                   color: '#000'
//         }
//         },
//         series: [{
//             type: "pie",
//             radius: ["50%", "75%"],
//             animation: true,
//             animationDuration: 1100,
//             avoidLabelOverlap: true,
//              itemStyle: {
//             borderRadius: 10,
//             borderWidth: 2
//         },
//             data: offenses.map((m, index )=> ({
//                 name: m,
//                 value: absValues[m], // end date qiymati asosiy
//                   itemStyle: {
//                         shadowColor: colors[index],
//                         shadowBlur: 2,
//                         borderRadius: 10,
//                         borderColor: colors[index]
//                     }
//             })),
//             label: {
//                 show: true,
//                  position: 'outside',
//                 formatter: p => {
//                     let modda = p.name;
//                     let value = absValues[modda];
//                     let change = diff[modda];
//                     let sign = change > 0 ? "+" : "";
//                     return `${value} та (${sign}${change})`;
//                 },
            
//                 fontSize: 20,
//                 fontWeight: 'bold',
//                 color: '#b7b7b7'
//             },
//                labelLine: {
//                     show: true,
//                     length: 15
//                 },
//         }]
//     });

//     // BAR CHART
//     barChart.setOption({
//         series: [{
//             type: "bar",
//              barMaxWidth: 60,
//             data: regions.map(region => {
//                 let startSum = offenseRegionData[region][s].reduce((a, b) => a + b, 0);
//                 let endSum = offenseRegionData[region][e].reduce((a, b) => a + b, 0);
//                 return endSum - startSum;
//             }),
//             animation: true,
//             animationDuration: 1000,
//             itemStyle: {
//                color: function(params) {
//                 return colors[params.dataIndex % colors.length];
//                 },
//                 borderRadius: [8, 8, 0, 0]

//             },
//             label: {
//                 show: true,
//                 position: "top",
//                 formatter: v => (v.value > 0 ? "+" : "") + v.value,
//                color: '#b7b7b7',
//             fontSize: 20,
//             fontWeight: 'bold'

//             },
//             barWidth: "55%"
//         }]
//     });
// };


// // Jinoiy huquqbuzarliklar







// const offenses_criminal = ["97-модда", "104-модда", "105-модда","109-модда","164-модда","166-модда","277-модда","169-модда","118-модда","267-модда"];

// // Modda → sana → son
// const offenseDataCriminal = {
//     "2025-11-01": {
//         "97-модда": 50,  "104-модда": 61,  "105-модда": 81,  "109-модда": 61,
//         "164-модда": 71, "166-модда": 68, "277-модда": 65, "169-модда": 88,
//         "118-модда": 55,  "267-модда": 46,
//     },
//     "2025-11-02": {
//         "97-модда": 70,  "104-модда": 84,  "105-модда": 60,  "109-модда": 43,
//         "164-модда": 59, "166-модда": 60, "277-модда": 41, "169-модда": 76,
//         "118-модда": 62,  "267-модда": 44,
//     },
//     "2025-11-03": {
//         "97-модда": 82,  "104-модда": 60,  "105-модда": 75,  "109-модда": 69,
//         "164-модда": 78, "166-модда": 64, "277-модда": 63, "169-модда": 41,
//         "118-модда": 72,  "267-модда": 84,
//     },
//     "2025-11-04": {
//         "97-модда": 55,  "104-модда": 65,  "105-модда": 81,  "109-модда": 50,
//         "164-модда": 63, "166-модда": 65, "277-модда": 59, "169-модда": 34,
//         "118-модда": 79,  "267-модда": 90, 
//     },
//     "2025-11-23": {
//         "97-модда": 22,  "104-модда": 20,  "105-модда": 25,  "109-модда": 29,
//         "164-модда": 28, "166-модда": 24, "277-модда": 23, "169-модда": 31,
//         "118-модда": 22,  "267-модда": 24,
//     },
//     "2025-11-24": {
//         "97-модда": 25,  "104-модда": 25,  "105-модда": 21,  "109-модда": 30,
//         "164-модда": 23, "166-модда": 25, "277-модда": 29, "169-модда": 24,
//         "118-модда": 29,  "267-модда": 30, 
//     },
// };


// const offenseRegionDataCriminal = {
//      "Қорақалпоғистон": {
//         "2025-11-01": [0, 5, 9, 1, 6, 3, 1, 8, 3, 7],
//         "2025-11-02": [5, 2, 2, 8, 3, 6, 6, 4, 9, 3],
//         "2025-11-03": [8, 7, 4, 7, 9, 9, 9, 2, 9, 4],
//         "2025-11-04": [1, 4, 9, 3, 7, 1, 5, 1, 8, 4],
//         "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//      "Тошкент ш": {
//         "2025-11-01": [4, 9, 9, 0, 4, 4, 8, 7, 0, 3],
//         "2025-11-02": [9, 8, 0, 2, 4, 0, 1, 5, 0, 9],
//         "2025-11-03": [9, 3, 7, 8, 8, 0, 4, 4, 8, 9],
//         "2025-11-04": [2, 0, 3, 9, 9, 6, 4, 2, 3, 5],
//         "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Андижон": {
//         "2025-11-01": [0, 5, 9, 1, 6, 3, 1, 8, 3, 7],
//         "2025-11-02": [5, 2, 2, 8, 3, 6, 6, 4, 9, 3],
//         "2025-11-03": [8, 7, 4, 7, 9, 9, 9, 2, 9, 4],
//         "2025-11-04": [1, 4, 9, 3, 7, 1, 5, 1, 8, 4],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Бухоро": {
//         "2025-11-01": [3, 7, 2, 5, 3, 7, 7, 5, 5, 4],
//         "2025-11-02": [1, 8, 2, 3, 3, 0, 1, 7, 2, 2],
//         "2025-11-03": [2, 2, 6, 6, 8, 7, 5, 2, 5, 1],
//         "2025-11-04": [4, 6, 4, 0, 3, 0, 2, 0, 1, 8],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Фарғона": {
//         "2025-11-01": [4, 6, 6, 2, 3, 9, 0, 1, 6, 0],
//         "2025-11-02": [5, 8, 7, 1, 2, 6, 7, 8, 2, 1],
//         "2025-11-03": [1, 9, 3, 6, 4, 2, 9, 1, 2, 8],
//         "2025-11-04": [2, 8, 3, 0, 0, 6, 3, 1, 3, 9],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Жиззах":  {
//         "2025-11-01": [2, 6, 5, 3, 9, 8, 2, 3, 6, 1],
//         "2025-11-02": [7, 7, 8, 7, 2, 3, 1, 1, 6, 0],
//         "2025-11-03": [1, 4, 7, 8, 3, 8, 2, 3, 4, 2],
//         "2025-11-04": [1, 7, 5, 0, 7, 1, 5, 0, 9, 5],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Наманган": {
//         "2025-11-01": [8, 9, 0, 6, 3, 5, 1, 7, 6, 9],
//         "2025-11-02": [2, 5, 3, 1, 8, 8, 5, 3, 7, 3],
//         "2025-11-03": [4, 8, 7, 1, 7, 7, 8, 2, 3, 5],
//         "2025-11-04": [4, 1, 8, 7, 2, 7, 3, 6, 6, 7],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Navoiy": {
//         "2025-11-01": [7, 0, 8, 5, 7, 0, 5, 9, 8, 8],
//         "2025-11-02": [1, 4, 8, 0, 4, 0, 2, 1, 9, 0],
//         "2025-11-03": [0, 9, 9, 3, 7, 2, 1, 6, 4, 4],
//         "2025-11-04": [9, 9, 8, 2, 5, 5, 6, 8, 8, 7],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Қашқадарё": {
//         "2025-11-01": [9, 2, 9, 7, 5, 2, 4, 9, 4, 0],
//         "2025-11-02": [5, 7, 7, 4, 4, 1, 8, 6, 8, 5],
//         "2025-11-03": [8, 0, 9, 0, 5, 0, 8, 7, 3, 6],
//         "2025-11-04": [0, 8, 8, 5, 2, 5, 6, 8, 3, 4],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Самарқанд": {
//         "2025-11-01": [1, 0, 3, 8, 5, 5, 8, 6, 3, 0],
//         "2025-11-02": [6, 7, 4, 2, 5, 9, 0, 8, 2, 1],
//         "2025-11-03": [9, 1, 4, 2, 2, 4, 0, 1, 5, 9],
//         "2025-11-04": [9, 6, 6, 1, 1, 7, 4, 1, 8, 9],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//      "Сурхандарё": {
//         "2025-11-01": [1, 0, 3, 8, 5, 5, 8, 6, 3, 0],
//         "2025-11-02": [6, 7, 4, 2, 5, 9, 0, 8, 2, 1],
//         "2025-11-03": [9, 1, 4, 2, 2, 4, 0, 1, 5, 9],
//         "2025-11-04": [9, 6, 6, 1, 1, 7, 4, 1, 8, 9],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//      "Сирдарё": {
//         "2025-11-01": [1, 0, 3, 8, 5, 5, 8, 6, 3, 0],
//         "2025-11-02": [6, 7, 4, 2, 5, 9, 0, 8, 2, 1],
//         "2025-11-03": [9, 1, 4, 2, 2, 4, 0, 1, 5, 9],
//         "2025-11-04": [9, 6, 6, 1, 1, 7, 4, 1, 8, 9],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Тошкент в": {
//         "2025-11-01": [4, 9, 9, 0, 4, 4, 8, 7, 0, 3],
//         "2025-11-02": [9, 8, 0, 2, 4, 0, 1, 5, 0, 9],
//         "2025-11-03": [9, 3, 7, 8, 8, 0, 4, 4, 8, 9],
//         "2025-11-04": [2, 0, 3, 9, 9, 6, 4, 2, 3, 5],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     },
//     "Хоразм": {
//         "2025-11-01": [6, 3, 6, 7, 6, 8, 4, 6, 5, 4],
//         "2025-11-02": [3, 4, 9, 1, 7, 3, 3, 8, 4, 6],
//         "2025-11-03": [5, 5, 0, 9, 4, 8, 4, 5, 2, 5],
//         "2025-11-04": [2, 0, 3, 9, 9, 6, 4, 2, 3, 5],
//            "2025-11-23": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//         "2025-11-24": [1, 2, 3, 2, 6, 1, 4, 1, 4, 2],
//     }
// };


// function sumAllRegionsByDateCriminal(offenseRegionDataCriminal) {
//     const numElements = 12;
//     let dates = Object.keys(offenseRegionDataCriminal[Object.keys(offenseRegionDataCriminal)[0]]); 
//     // birinchi viloyat sanalarini olamiz

//     let result = {}; // sana: array

//     dates.forEach(date => {
//         result[date] = new Array(numElements).fill(0);

//         Object.keys(offenseRegionDataCriminal).forEach(region => {
//             const arr = offenseRegionDataCriminal[region][date];
//             for (let i = 0; i < numElements; i++) {
//                 result[date][i] += arr[i];
//             }
//         });
//     });

//     return result;
// }

// // Misol
// let totalByDateCriminal = sumAllRegionsByDateCriminal(offenseRegionDataCriminal);


// // =====================================
// // 2. INIT CHARTS
// // =====================================

// let pieChartCriminal = echarts.init(document.getElementById("criminal_offenses"));
// let barChartCriminal = echarts.init(document.getElementById("jinoiy_huquq_chart"));

// // =====================================
// // 3. LOAD DEFAULT
// // =====================================

// loadDefaultChartsCriminal();

// function loadDefaultChartsCriminal() {
//     // Avval barcha sanalarni yig‘amiz
//     let sum = {};
//     offenses_criminal.forEach(m => sum[m] = 0);

//     Object.keys(offenseDataCriminal).forEach(date => {
//         offenses_criminal.forEach(m => sum[m] += offenseDataCriminal[date][m]);
//     });

//     updatePieCriminal(sum);                // pie chart → Жами sonlar
//     renderModdaListCriminal(sum);

//     // viloyatlar bo‘yicha Жами
//     let regionTotals = regions.map(r => offenses_criminal.map(() => 0));

//     regions.forEach((region, ri) => {
//         Object.keys(offenseRegionDataCriminal[region]).forEach(date => {
//             offenseRegionDataCriminal[region][date].forEach((val, mi) => {
//                 regionTotals[ri][mi] += val;
//             });
//         });
//     });

//     updateBarCriminal(regionTotals);       // bar chart → Жами sonlar
// }



// // =====================================
// // 4. PIE CHART (DUMALOQ)
// // =====================================

// function updatePieCriminal(values) {

//     let total = Object.values(values).reduce((a, b) => a + b, 0);

//     pieChartCriminal.setOption({
//       graphic: {
//     type: "text",
//     left: "center",
//     top: "center",
//     style: {
//         text: total + "\nЖами",
//         textAlign: "center",
//         fontSize: 24,
//         fontWeight: "bold",
//         fill: "#b7b7b7",   // ✔ eng to‘g‘ri ishlaydi
//     }
// },
//            tooltip: {
//         trigger: 'item',
//         formatter: p => `${p.name} <br> Жами: <b>${p.value}</b>`,
//           textStyle: {
//                   fontSize: 20,     // 🔥 shu yerda o'zgartirasan
//                   color: '#000'
//         }// Hoverda nom va qiymat chiqadi
//         },

//         series: [{
//             type: "pie",
//             radius: ['40%', '80%'],
//             center: ['50%', '50%'],
//             avoidLabelOverlap: true,

//             label: {
//             show: true,
//             position: 'outside',
//             formatter: '{c}', // faqat raqam
//             fontSize: 20,
//             fontWeight: 'bold',
//             color: '#b7b7b7'
//             },
//             labelLine: {
//                 show: true,
//                 length: 15
//             },

//             itemStyle: {
//                 borderWidth: 2,
//                  borderRadius: 10
//             },

//             data: offenses_criminal.map((m, index )=> ({
//                 name: m,
//                 value: values[m],
//                   itemStyle: {
//                   color: colors[index],
//                  shadowColor: colors[index],
//                 shadowBlur:2,
//                 borderRadius: 10,
//                  borderColor: colors[index]

//             }
//             }))
//         }]
//     });
// }


// // =====================================
// // 5. PASTIGA MODDALAR RO‘YXATI TUGMASI
// // =====================================

// function renderModdaListCriminal(values) {
//     let existing = document.getElementById("moddalar_box");
//     if (existing) existing.remove();

//     // popup box yaratamiz
//     let box = document.createElement("div");
//     box.id = "moddalar_box";
//     box.style.position = "absolute";
//     box.style.left = "20px";
//     box.style.top = "0px";
//     box.style.width = "230px";
//     box.style.fontSize="20px"
//     box.style.background = "rgba(20, 20, 20, 0.85)";
//     box.style.backdropFilter = "blur(6px)";
//     box.style.border = "1px solid rgba(255,255,255,0.15)";
//     box.style.borderRadius = "12px";
//     box.style.padding = "12px";
//     box.style.color = "#fff";
//     box.style.zIndex = 1000;
//     box.style.display = "none";
//     box.innerHTML = `
//         <div id="moddalar_list_content">
//             ${offenses_criminal.map(m => `<div>${m} — ${values[m]} та</div>`).join("")}
//         </div>
//     `;
//     document.getElementById("criminal_offenses").appendChild(box);

//     // Tugma yaratamiz
//     let btn = document.createElement("button");
//     btn.className = "btn btn-info";
//     btn.style.position = "absolute";
//     btn.style.top = "-50px";
//     btn.style.left = "20px";   
//     btn.innerText = "Моддаларни кўриш";
//     btn.style.fontSize = "18px";

//     document.getElementById("criminal_offenses").appendChild(btn);

//     btn.onclick = () => {
//         box.style.display = box.style.display === "none" ? "block" : "none";
//     };
// }



// // =====================================
// // 6. BAR CHART (DIAGRAMMA) — GRADIENT
// // =====================================
// function updateBarCriminal(regionValues) {

//     // 1️⃣ Har bir hududning umumiy qiymatini hisoblaymiz
//     const totals = regionValues.map(arr => arr.reduce((a, b) => a + b, 0));

//     // 2️⃣ regions, totals va regionValues ni birga sort qilamiz
//     const combined = regions.map((name, i) => ({
//         name: name,
//         total: totals[i],
//         values: regionValues[i]
//     }));

//     combined.sort((a, b) => a.total - b.total); // ⬅️ o‘sish tartibi

//     // 3️⃣ Sort qilib bo'lingan qiymatlar
//     const sortedRegions = combined.map(i => i.name);
//     const sortedTotals  = combined.map(i => i.total);

//     barChartCriminal.setOption({
//         textStyle: { fontFamily: "Arial, sans-serif" },
//         grid: { bottom: 80, right: 30, left: 60 },

//         tooltip: { 
//             trigger: "axis", 
//             backgroundColor: 'white',
//             textStyle: { fontSize: 20, color: "#000" }
//         },

//         xAxis: {
//             type: "category",
//             data: sortedRegions,
//             axisLabel: { interval: 0, rotate: 40, color: '#b7b7b7', fontSize: 14 },
//             axisLine: { show: false },
//             splitLine: { show: false }
//         },

//         yAxis: {
//             type: "value",
//             axisLabel: { color: '#b7b7b7', fontSize: 18 },
//             axisLine: { show: false },
//             splitLine: { show: false }
//         },

//         series: [{
//             type: "bar",
//             barMaxWidth: 60,
//             data: sortedTotals,

//             animation: true,
//             animationDuration: 1300,
//             animationEasing: "elasticOut",

//             itemStyle: {
//                 color: function(params) {
//                     return colors[params.dataIndex % colors.length];
//                 },
//                 borderRadius: [8, 8, 0, 0]
//             },

//             label: {
//                 show: true,
//                 position: "top",
//                 fontWeight: "bold",
//                 color: '#b7b7b7',
//                 fontSize: 20,
//             },

//             barWidth: "55%"
//         }]
//     });
// }



// // =====================================
// // HELPERS
// // =====================================

// function sumRegionsCriminal(date) {
//     return regions.map(r => offenseRegionDataCriminal[r][date]);
// }


// // =====================================
// // 7. FILTER (Жами)
// // =====================================

// document.getElementById("criminal_total_button").onclick = function () {

//     let s = document.getElementById("criminal_start_date").value;
//     let e = document.getElementById("criminal_end_date").value;

//     if (!s || !e) return alert("Иккала санани танланг!");

//     let sum = {};
//     offenses_criminal.forEach(m => sum[m] = 0);

//     Object.keys(offenseDataCriminal).forEach(date => {
//         if (date >= s && date <= e) {
//             offenses_criminal.forEach(m => sum[m] += offenseDataCriminal[date][m]);
//         }
//     });

//     updatePieCriminal(sum);
//     renderModdaListCriminal(sum);

//     let regionTotals = regions.map(r => offenses_criminal.map(() => 0));

//     regions.forEach((region, ri) => {
//         Object.keys(offenseRegionDataCriminal[region]).forEach(date => {
//             if (date >= s && date <= e) {
//                 offenseRegionDataCriminal[region][date].forEach((val, mi) => {
//                     regionTotals[ri][mi] += val;
//                 });
//             }
//         });
//     });

//     updateBarCriminal(regionTotals);
// };


// // =====================================
// // 8. Солиштириш
// // =====================================
// document.getElementById("criminal_compare_button").onclick = function () {
//     let s = document.getElementById("criminal_start_date").value;
//     let e = document.getElementById("criminal_end_date").value;

//     if (!s || !e) return alert("Иккала санани танланг!");

//     // O‘zgarish + Жами
//     let diff = {};
//     let absValues = {};

//     offenses_criminal.forEach(m => {
//         let change = offenseDataCriminal[e][m] - offenseDataCriminal[s][m];
//         diff[m] = change;
//         absValues[m] = offenseDataCriminal[e][m]; // end date asosiy qiymat
//     });

//     // DUMALOQ CHART
//     pieChartCriminal.setOption({
//             textStyle: {
//         fontFamily: "Arial, sans-serif",
//     },
//     color:colors,
//         tooltip: {
//             trigger: 'item',
//             show: true,
//             formatter: p => {
//                 let modda = p.name;
//                 let value = absValues[modda];
//                 let change = diff[modda];
//                 let sign = change > 0 ? "+" : "";
//                 return `${modda}<br/>${value} та (${sign}${change})`;
//             },
//               textStyle: {
//                   fontSize: 20,     
//                   color: '#000'
//         }
//         },
//         series: [{
//             type: "pie",
//             radius: ["50%", "75%"],
//             animation: true,
//             animationDuration: 1100,
//             avoidLabelOverlap: true,
//              itemStyle: {
//             borderRadius: 10,
//             borderWidth: 2
//         },
//             data: offenses_criminal.map((m, index )=> ({
//                 name: m,
//                 value: absValues[m], // end date qiymati asosiy
//                   itemStyle: {
//                         shadowColor: colors[index],
//                         shadowBlur: 2,
//                         borderRadius: 10,
//                         borderColor: colors[index]
//                     }
//             })),
//             label: {
//                 show: true,
//                  position: 'outside',
//                 formatter: p => {
//                     let modda = p.name;
//                     let value = absValues[modda];
//                     let change = diff[modda];
//                     let sign = change > 0 ? "+" : "";
//                     return `${value} та (${sign}${change})`;
//                 },
            
//                 fontSize: 20,
//                 fontWeight: 'bold',
//                 color: '#b7b7b7'
//             },
//                labelLine: {
//                     show: true,
//                     length: 15
//                 },
//         }]
//     });

//     // BAR CHART
//     barChartCriminal.setOption({
//         series: [{
//             type: "bar",
//              barMaxWidth: 60,
//             data: regions.map(region => {
//                 let startSum = offenseRegionDataCriminal[region][s].reduce((a, b) => a + b, 0);
//                 let endSum = offenseRegionDataCriminal[region][e].reduce((a, b) => a + b, 0);
//                 return endSum - startSum;
//             }),
//             animation: true,
//             animationDuration: 1000,
//             itemStyle: {
//                color: function(params) {
//                 return colors[params.dataIndex % colors.length];
//                 },
//                 borderRadius: [8, 8, 0, 0]

//             },
//             label: {
//                 show: true,
//                 position: "top",
//                 formatter: v => (v.value > 0 ? "+" : "") + v.value,
//                color: '#b7b7b7',
//             fontSize: 20,
//             fontWeight: 'bold'

//             },
//             barWidth: "55%"
//         }]
//     });
// };




let adminRegionChartInstance = null;
let adminRegionChartData = [];
let adminRegionChartRendered = false;

  const colors1 = [
        "#6EB5FF", // ko‘k
        "#5CC97B", // yashil
        "#A472FF", // to‘q binafsha
        "#FFB84D", // och sariq
        "#99CCFF", // och ko‘k
        "#FFD24C", // sariq (eng katta bo‘lak)
        "#4BA3C7", // havorang
        "#7AD67A", // och yashil
        "#FF884C", // to‘q sariq
        "#B266FF", // binafsha
        "#FF6666", // qizil
];

  const colors = [
        "#6EB5FF", // ko‘k
        "#5CC97B", // yashil
        "#A472FF", // to‘q binafsha
        "#FFB84D", // och sariq
        "#99CCFF", // och ko‘k
        "#FFD24C", // sariq (eng katta bo‘lak)
        "#4BA3C7", // havorang
        "#7AD67A", // och yashil
        "#FF884C", // to‘q sariq
        "#B266FF", // binafsha
        "#FF6666", // qizil
];


// real ajax bo'yicha
let structure_id = null;
function loadAdministrativeCharts() {
  $.ajax({
    url: 'ajax.php',
    type: 'GET',
    dataType: 'json',
    data: { act: 'get_administrative_stats' },
    success: function (res) {
      console.log('ADMIN DATA:', res);

      renderAdministrativePie(res.stats || []);

      // 🔥 MUHIM: faqat data saqlaymiz
      adminRegionChartData = res.stat_region || [];

      // agar tab allaqachon ochiq bo‘lsa — chizamiz
      if ($('#pills-profile').hasClass('show')) {
        renderAdministrativeRegionBar(adminRegionChartData);
        adminRegionChartRendered = true;
      }
    }
  });
}


function renderAdministrativePie(data) {
  const dom = document.getElementById('administrative_offenses');
  if (!dom) return;

  // eski chartni o‘chiramiz
  echarts.dispose(dom);
  const chart = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);

  const option = {
    color: colors1,
    title: {
      text: total + '\nЖами',
      left: 'center',
      top: '40%',
      textStyle: {
        color: '#b7b7b7',
        fontSize: 18,
        fontWeight: 'bold'
      }
    },
    tooltip: {
      trigger: 'item',
      backgroundColor: '#fff',
      textStyle: { color: '#000', fontSize: 16 }
    },
    legend: {
      bottom: 0,
      textStyle: { color: '#b7b7b7', fontSize: 16 }
    },
    series: [{
      type: 'pie',
      radius: ['30%', '65%'],
      center: ['50%', '45%'],
      label: {
        formatter: '{c}',
        color: '#b7b7b7',
        fontSize: 16
      },
      data: data.map(i => ({
        name: i.name,
        value: Number(i.value)
      }))
    }]
  };

  chart.setOption(option);
  window.addEventListener('resize', () => chart.resize());
}

function renderAdministrativeRegionBar(data) {
  const dom = document.getElementById('mamuriy_huquq_chart');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  adminRegionChartInstance = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);
  $('#mamuriy_huquq_chart_total').text(`(${total})`);

  const option = {
    tooltip: {
      backgroundColor: '#fff',
      textStyle: { color: '#000', fontSize: 16 }
    },
    grid: { left: 60, right: 30, bottom: 120 },
    xAxis: {
      type: 'category',
      data: data.map(i => i.name || '—'),
      axisLabel: { rotate: 45, color: '#b7b7b7', fontSize: 14 }
    },
    yAxis: {
      type: 'value',
      axisLabel: { color: '#b7b7b7' }
    },
    series: [{
      type: 'bar',
      data: data.map(i => Number(i.value) || 0),
      barMaxWidth: 50,
      itemStyle: {
        color: (p) => colors[p.dataIndex % colors.length],
        borderRadius: [6, 6, 0, 0]
      },
      label: {
        show: true,
        position: 'top',
        color: '#b7b7b7',
        fontSize: 14
      }
    }]
  };

  adminRegionChartInstance.setOption(option);
}


let criminalRegionChartInstance = null;
let criminalRegionChartData = [];
let criminalRegionChartRendered = false;


function loadCriminalCharts() {
  $.ajax({
    url: 'ajax.php',
    type: 'GET',
    dataType: 'json',
    data: {
      act: 'get_criminal_stats'
    },
    success: function (res) {
      console.log('CRIMINAL DATA:', res);

      renderCriminalPie(res.stats || []);
      criminalRegionChartData = res.stat_region || [];

      // agar tab ochiq bo‘lsa — darrov chizamiz
      if (document.getElementById('pills-profile').classList.contains('show')) {
        renderCriminalRegionBar(criminalRegionChartData);
        criminalRegionChartRendered = true;
      }
    },
    error: function (err) {
      console.error('CRIMINAL AJAX ERROR:', err);
    }
  });
}


function renderCriminalPie(data) {
  const dom = document.getElementById('criminal_offenses');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  const chart = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);

  const option = {
    color: colors1,
    title: {
      text: total.toString(),
      left: 'center',
      top: '40%',
      textStyle: { fontSize: 20, fontWeight: 'bold', color: '#b7b7b7' }
    },
    tooltip: {
      backgroundColor: '#fff',
      textStyle: { color: '#000', fontSize: 16 }
    },
    legend: {
      bottom: 0,
      textStyle: { color: '#b7b7b7', fontSize: 14 }
    },
    series: [{
      type: 'pie',
      radius: ['25%', '60%'],
      center: ['50%', '45%'],
      label: {
        formatter: '{c}',
        color: '#b7b7b7',
        fontSize: 14
      },
      data: data.map(i => ({
        name: i.name,
        value: Number(i.value)
      }))
    }]
  };

  chart.setOption(option);
  window.addEventListener('resize', () => chart.resize());
}

function renderCriminalRegionBar(data) {
  const dom = document.getElementById('jinoiy_huquq_chart');
  if (!dom) return;

  if (echarts.getInstanceByDom(dom)) {
    echarts.dispose(dom);
  }

  criminalRegionChartInstance = echarts.init(dom);

  const total = data.reduce((s, i) => s + Number(i.value || 0), 0);
  $('#jinoiy_huquq_chart_total').text(`(${total})`);

  const option = {
    tooltip: {
      backgroundColor: '#fff',
      textStyle: { color: '#000', fontSize: 16 }
    },
    xAxis: {
      type: 'category',
      data: data.map(i => i.name),
      axisLabel: {
        rotate: 45,
        color: '#b7b7b7',
        fontSize: 14
      }
    },
    yAxis: {
      type: 'value',
      axisLabel: { color: '#b7b7b7' }
    },
    grid: {
      left: 60,
      right: 30,
      bottom: 120
    },
    series: [{
      type: 'bar',
      data: data.map(i => Number(i.value)),
      barMaxWidth: 50,
      itemStyle: {
        color: p => colors[p.dataIndex % colors.length],
        borderRadius: [6, 6, 0, 0]
      },
      label: {
        show: true,
        position: 'top',
        color: '#b7b7b7',
        fontSize: 14
      }
    }]
  };

  criminalRegionChartInstance.setOption(option);
}


document.addEventListener('shown.bs.tab', function (event) {

  // ADMINISTRATIV
  if (event.target.id === 'pills-profile-tab') {

    if (!adminRegionChartRendered) {
      renderAdministrativeRegionBar(adminRegionChartData);
      adminRegionChartRendered = true;
    } else if (adminRegionChartInstance) {
      adminRegionChartInstance.resize();
    }

    if (!criminalRegionChartRendered) {
      renderCriminalRegionBar(criminalRegionChartData);
      criminalRegionChartRendered = true;
    } else if (criminalRegionChartInstance) {
      criminalRegionChartInstance.resize();
    }
  }
});


$(document).ready(function () {
  loadAdministrativeCharts();
  loadCriminalCharts();
});



// document.addEventListener('shown.bs.tab', function (event) {
//   console.log('TAB CHIQDI:', event.target.id);

//   if (event.target.id === 'pills-profile-tab') {

//     if (!adminRegionChartRendered) {
//       renderAdministrativeRegionBar(adminRegionChartData);
//       adminRegionChartRendered = true;
//     } else if (adminRegionChartInstance) {
//       adminRegionChartInstance.resize();
//     }

//   }
// });

// $(document).ready(function () {
//   loadAdministrativeCharts();
// });




    {/literal}
</script>

{include file="footer.tpl"}