{include file="header.tpl"}

<style>
    {literal}
        body::-webkit-scrollbar {
          width: 10px;
        }

        #map-rounded .map-tiles {
            filter: brightness(0.65) invert(.8) contrast(4) hue-rotate(200deg) saturate(0.3) brightness(0.7);
        }

        .c-scrollbar::-webkit-scrollbar {
            width: 5px;
        }

        /* Track */
        .c-scrollbar::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        .c-scrollbar::-webkit-scrollbar-thumb {
            background: #696969;
            border-radius: 10px;
        }

        /* Handle on hover */
        .c-scrollbar::-webkit-scrollbar-thumb:hover {
            background: #4d4c4c;
        }

        .leaflet-popup, .leaflet-popup-content-wrapper {
            background-color: #2F3349 !important;
            border-radius: 10px !important;
        }

        .leaflet-popup-content-wrapper {
            width: 330px;
            background-color: #21263afa;
            background-clip: border-box;
            border: 1px solid transparent;
            border-radius: 10px !important;
        }

        .marker-cluster span {
            color: white !important;
        }

        .leaflet-routing-container {
            color: #2F3349 !important;
        }

        .leaflet-routing-alt div:first-child {
            color: #26293D !important;
            font-weight: bold !important;
            font-size: 16px !important;
        }

        .leaflet-routing-alt {
            max-height: 180px !important;
        }

        #offline_bg {
            background-color: #000;
            color: #fff;
            font-size: 72px;
            font-weight: 670;
            text-align: center;
            width: 640px;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .parent-wnd {
            border-radius: 10px;
        }

        .parent-wnd > div:nth-child(3) {
            width: 100% !important;
        }

        /* .parent-wnd > div:nth-child(1), .parent-wnd > div:nth-child(1) canvas {
            width: 100% !important;
        }
        .parent-wnd > div:nth-child(2), .parent-wnd > div:nth-child(3) {
            display: none  !important; 
        }

        .parent-wnd > div:nth-child(4), .parent-wnd > div:nth-child(4) canvas {
            width: 100% !important;
        }
        .parent-wnd > div:nth-child(5), .parent-wnd > div:nth-child(6) {
            display: none  !important; 
        }

        .parent-wnd > div:nth-child(7), .parent-wnd > div:nth-child(7) canvas {
            width: 100% !important;
        } */

        #carCameraModal .btn-close {
            right: 0 !important;
            top: 0 !important;
        }

        .card {
            background-color: #26293D !important;
        }

        .close-camera {
            position: absolute;
            top: -10px;
            right: -10px;
            font-size: 20px;
        }

        #carCameraModal {
            position: absolute;
            width: 690px;
            height: 520px;
            right: 1.2vw;
            bottom: 0.7vh;
            z-index: 55555 !important;
        }

        #staffInfoModal {
            position: absolute;
            width: 820px;
            height:500px;
            right: 1.2vw;
            top: 0.7vh;
            z-index: 55555 !important;
        }

        #stopwatch {
            display: none;
            position: absolute;
            width: 1200px;
            top: 3.3%;
            left: 27%;
            z-index: 1300;
        }

        .toast-title {
            font-weight: 100 !important;
        }

        @keyframes borderAnimation {
            0%, 100% {
                border-color: red;
                border-width: 2px;
            }
            50% {
                border-color: transparent;
                border-width: 0;
            }
        }
        .toast.toast-warning {
            border: 2px solid red;
            animation: borderAnimation .2s infinite;
        }

        .history-modal-dialog{
            max-width: 80% !important;
        }

        .history-filter-section{
            display: flex;
            align-items: flex-end;
            font-size: 18px;
        }

        .telemetryCard{
            position: absolute;
            top: 110px;
            right: 30px;
            width: 350px;
            background-color: #fdfdfd;
            color: #2F3349;
            padding: 10px 30px 10px 30px;
            border-radius: 10px;
            z-index: 9999;
            font-family: sans-serif;
        }

        .telemetryCard .telementary-card-head{
            display: flex;
            justify-content:space-around;
            align-items: center;
            padding-left: 25px;
            height: 70px;
            font-size: 18px;
        }

        .telemetryCard .telementary-card-head img{
            transform: rotate(90deg);
            width: 50px;
            height: 100px;
        }

        .telemetryCard .telementary-card-head p{
            margin: 0%;
        }
         .telemetryCard .telemetry-card-body .col-12{
            border: 1px solid #ece9e9;
            border-radius: 6px;
            font-size: 18px;
            margin-bottom: 10px;
            padding: 7px 10px;
            margin-right: 5px;
            background-color: #fff;
            box-shadow: 2px 4px 20px 0px rgba(34, 60, 80, 0.34);
         }

         .car-title {
  font-size: 22px;
  font-weight: 600;
  color: #00ff88;
  margin-bottom: 14px;
}

.car-region {
  color: #d1ffd1;
  font-size: 20px;
}

.car-plate {
  color: #00c8ff;
  font-weight: 600;
  font-size: 20px;
}

.car-speed {
  color: #ff4d4d;
  font-size: 20px;
  font-weight: 600;
}

.car-time {
  color: #ffd34d;
  font-size: 20px;
}

/* HR LINE */
.hr-line {
  border-color: rgba(255, 255, 255, 0.1);
  margin-top: 10px !important;
}

/* ICON BUTTONS */
.icon-btn {
  background: rgba(0, 0, 0, 0.4);
  border: 1px solid rgba(0, 255, 136, 0.2);
  padding: 12px;
  border-radius: 14px;
  cursor: pointer;
  transition: 0.25s ease;
  color: #00ff88;
  backdrop-filter: blur(4px);
}

.icon-btn i {
  font-size: 22px;
}

.icon-btn:hover {
  background: rgba(0, 255, 136, 0.12);
  border-color: #00ff88;
  transform: translateY(-3px);
}

.leaflet-popup-content {
    width: 360px !important;
}

.leaflet-popup-content-wrapper {
    width: 400px !important;
}

.staff-info-card {
  border-radius: 18px;
  border: 1px solid rgba(0, 255, 136, 0.25);
  backdrop-filter: blur(10px);
  padding: 20px 25px 30px;
  box-shadow: 0 0 25px rgba(0, 255, 136, 0.15);
}

/* Close button */
.close-staff-info {
  position: absolute;
  top: 12px;
  right: 14px;
  background: rgba(0, 0, 0, 0.4);
  border: 1px solid rgba(0, 255, 136, 0.3);
  color: #00ff88;
  font-size: 20px;
  padding: 2px 10px;
  border-radius: 8px;
  transition: 0.25s ease;
}

.close-staff-info:hover {
  background: rgba(0, 255, 136, 0.15);
  border-color: #00ff88;
  transform: scale(1.1);
}

/* Image box */
.staff-photo-box {
  width: 100%;
  height: 240px;
  overflow: hidden;
  border-radius: 14px;
  border: 1px solid rgba(0, 255, 136, 0.3);
}

.staff-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
  border-radius: 14px;
}

/* Name */
.staff-name {
  font-size: 1.35rem;
  color: #eaffea;
  font-weight: 600;
}

/* Phone — clickable */
.staff-phone {
  font-size: 1.2rem;
  color: #00ff88;
  text-decoration: none;
  display: inline-block;
  padding: 6px 14px;
  border: 1px solid rgba(0, 255, 136, 0.3);
  border-radius: 12px;
  background: rgba(0, 0, 0, 0.35);
  transition: 0.25s ease;
}

.staff-phone:hover {
  border-color: #00ff88;
  background: rgba(0, 255, 136, 0.1);
  transform: translateY(-2px);
}



    {/literal}
</style>

<script src="/assets/map/leaflet/leaflet.js"></script>
<link rel="stylesheet" href="/assets/map/leaflet/leaflet.css" />
<script src="/assets/map/library/rotater.js"></script>
<script src="/assets/hls.js"></script>

<script src="/assets/map/library/leaflet.polylineDecorator.js"></script>

<script src="/assets/map/library/leaflet-draw-line.js"></script>
<link rel="stylesheet" href="/assets/map/library/leaflet-draw-line.css" />


<link rel="stylesheet" href="/assets/map/library/Geocoder.css" />
<link rel="stylesheet" href="/assets/map/library/MarkerCluster.css" />
<script src="/assets/map/library/Control.Geocoder.js"></script>
<script src="/assets/map/library/leaflet.markercluster.js"></script>

<!-- Leaflet Draw -->
<link rel="stylesheet" href="/assets/map/library/leaflet-draw-line.css" />
<script src="/assets/map/library/leaflet-draw-line.js"></script>
<!-- Leaflet Draw -->

<!-- Leaflet Routing Machine -->
<link rel="stylesheet" href="/assets/map/library/routing-machine.css" />
<script src="/assets/map/library/routing-machine.js"></script>
<!-- Leaflet Routing Machine -->

<!-- Leaflet Map Rotator -->
{* <script src="/assets/map/library/leaflet-rotate-src.js"></script> *}
<!-- Leaflet Map Rotator -->


<script src="/assets/js/socketio.js"></script>
{* <script src="/assets/js/socket.js"></script> *}

<link rel="stylesheet" href="/assets/assets/vendor/libs/toastr/toastr.css" />
<link rel="stylesheet" href="/assets/assets/vendor/libs/animate-css/animate.css" />
<link rel="stylesheet" href="/assets/assets/vendor/libs/spinkit/spinkit.css" />

<!-- New Jquery -->
<link rel="stylesheet" href="/assets/map/jquery-ui.css">
<script src="/assets/map/jquery-3.6.0.min.js"></script>
<script src="/assets/map/jquery-ui.js"></script>
<!-- New Jquery -->

<div class="flex-grow-1 container-p-y container-fluid">
    <!--/ Card Border Shadow -->
    <div class="row">
        <div class="col-9" style="padding-right: 0;">
            <div class="card">
                <div class="card-body p-1" style="height: 88vh;">
                    <div class="rounded" id="map" style="width: 100%; height: 100%;"></div>
                    <div id="map-rounded" style="width: 200px; height: 200px; position: absolute; border-radius: 50%; bottom: 30px; left: 30px;"></div>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div class="card">
                <div class="card-body px-3 py-1" style="height: 88vh;">
                    <div class="mb-1 col-12">
                        <label class="form-label text-warning fs-5">{$Dict.in_service}</label>
                        <select id="in_service" class="select2 form-select">
                            <option value="0">{$Dict.today_serviced}</option>
                            <option value="1">{$Dict.all}</option>
                        </select>
                    </div>

                    <div class="mb-1 col-12">
                        <label class="form-label text-warning fs-5">{$Dict.regions}</label>
                        <select class="form-select" id="select_region">
                            <option value="0">{$Dict.all}</option>
                          {foreach from=$Regions item=Item key=key name=regionsLoop}
                            {if $smarty.foreach.regionsLoop.iteration <= 14}
                                <option value="{$Item.id}" data-lat="{$Item.latitude}" data-lon="{$Item.longtitude}" data-zoom="{$Item.zoom}">
                                    {$Item.name}
                                </option>
                            {/if}
                        {/foreach}
                        </select>
                    </div>

                    <div class="col-12 mt-3">
                        <label class="form-label text-success fs-5">{$Dict.cars}<span style="color: #ddd;" id="total_thg"></span></label>
                        <select id="searchCars" class="select2 form-select">
                            <option value="0">{$Dict.search}</option>
                        </select>
                      <div style="max-height:60vh; overflow-y:auto;">
                        <table class="table border-top mb-0" style="color: #dddddd;">
                            <tbody id="carList"></tbody>
                        </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card" style="background-color: #26293D !important;" id="carCameraModal">
        <div class="card-header pb-0 pt-2" ></div>
        <button type="button" class="btn close-camera" data-bs-dismiss="modal" aria-label="Close">x</button>

        <div class="card-body text-center">
            <div id="playWind" style="width: 640px; height: 400px;"></div>
            <div class="rounded" id="offline_bg">
                <span>Камера оффлине!</span>
            </div>
            <div class="items">
                <div class="row w-100 mt-3">
                    <div class="col-1">
                        <button class="px-2 py-1 btn btn-danger" type="button" onClick="fullSreen()">
                            <i class="tf-icons ti ti-maximize"></i>
                        </button>
                    </div>
                    <div class="col-1 unmute">
                        <button class="px-2 py-1 btn btn-warning ml-2" type="button">
                            <i class="tf-icons ti ti-volume"></i>
                        </button>
                    </div>
                    <div class="col-1 mute">
                        <button class="px-2 py-1 btn btn-info ml-2" type="button">
                            <i class="tf-icons ti ti-volume-off"></i>
                        </button>
                    </div>
                    <div class="col-1">
                        <button class="px-2 py-1 btn btn-warning ml-2" type="button" onClick="CapturePicture('JPEG')">
                            <i class="tf-icons ti ti-camera"></i>
                        </button>
                    </div>
                    <div class="col-1">
                        <button class="px-2 py-1 btn btn-success ml-2" type="button" onClick="takeScreenshot()">
                            <i class="tf-icons ti ti-screenshot"></i>
                        </button>
                    </div>
                    <div class="col radio_call text-danger" style="text-align: right; font-size: 20px">
                        
                    </div>
                    <div class="col now_date" style="text-align: right;">
                        <i class="tf-icons ti ti-clock" style="margin-bottom: 4px;"></i> <span></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card" style="background-color: #26293D !important;" id="staffInfoModal">
       
      <button type="button" class="btn close-staff-info" data-bs-dismiss="modal" aria-label="Close">×</button>

        <div class="card-body text-center row justify-content-center">
            
        </div>
    </div>



    {* mashina yurgan yo'llar tarixini chiqaruvchi modal oyna *}
     <div class="modal fade history-modal" id="historyModal">
        <div class="modal-dialog history-modal-dialog">
            <div class="modal-content">

            <div class="modal-header">
                <h3 class="modal-title">Босиб ўтилган масофа</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <div class="row mb-3 history-filter-section">
                <div class="col-4">
                    <label>{$Dict.bdate}</label>
                    <input type="date" id="fromDate" class="form-control">
                </div>
                <div class="col-4">
                    <label>{$Dict.tdate}</label>
                    <input type="date" id="toDate" class="form-control">
                </div>
                <div class="col-4">
                      <button id="searchHistory" class="btn btn-primary w-100">{$Dict.search}</button>
                </div>
                </div>

             

                <div id="telemetryCard" class="telemetryCard">
                     <div class="telementary-card-head">
                          <img src="/pictures/cars/matiz.gif">
                          <p class="telement-date-now" id="telement_date_now"></p>
                     </div>
                     <div class="row telemetry-card-body">
                        <div class="col-12"><strong> <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                <path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z"/>
                                <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0"/>
                                </svg> {$Dict.time}:</strong> <span id="telemetryTime">--:--:--</span></div>
                                                        <div class="col-12"><strong>  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-speedometer" viewBox="0 0 16 16">
                                <path d="M8 2a.5.5 0 0 1 .5.5V4a.5.5 0 0 1-1 0V2.5A.5.5 0 0 1 8 2M3.732 3.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707M2 8a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8m9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5m.754-4.246a.39.39 0 0 0-.527-.02L7.547 7.31A.91.91 0 1 0 8.85 8.569l3.434-4.297a.39.39 0 0 0-.029-.518z"/>
                                <path fill-rule="evenodd" d="M6.664 15.889A8 8 0 1 1 9.336.11a8 8 0 0 1-2.672 15.78zm-4.665-4.283A11.95 11.95 0 0 1 8 10c2.186 0 4.236.585 6.001 1.606a7 7 0 1 0-12.002 0"/>
                                </svg>  {$Dict.speed}:</strong> <span id="telemetrySpeed">0 km/h</span></div>
                                                        <div class="col-12"><strong>  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
                                </svg>  {$Dict.distance}:</strong> <span id="telemetryDistance">0 km</span></div>
                                                        <div class="col-12"><strong><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                <path d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3z"/>
                                </svg>  {$Dict.region}:</strong> <span id="telemetryRegion">Ташкент</span></div>
                                                    </div>

                                                    <hr style="border-color: white;">

                    <div class="d-flex justify-content-between" style="padding-bottom: 10px; gap:5px; font-size:16px;">
                        <button id="btnPause" class="btn btn-warning btn">⏸ Тўхтатмоқ</button>
                        <button id="btnPlay" class="btn btn-success btn">▶ Давом этмоқ</button>
                        <button id="btnRestart" class="btn btn-danger btn">⟲ Қайта бошлаш</button>
                    </div>
                                
                </div>


                <!-- Tarix xaritasi -->
                <div id="historyMap" style="height: 650px; width: 100%; border-radius: 10px;"></div>

            </div>

            </div>
        </div>
     </div>








</div>

<audio id="alertSound" src="/assets/images/alert.mp3"></audio>
<script src="https://rawgit.com/bbecquet/Leaflet.RotatedMarker/master/leaflet.rotatedMarker.js"></script>

<script src="/assets/assets/vendor/libs/select2/select2.js"></script>
<script src="/assets/assets/vendor/libs/toastr/toastr.js"></script>

<script>

    var AJAXPHP = "ajax{$AddURL}.php";
    var text_more = "{$Dict.more}";
    var dict_select = "{$Dict.select}";
    var dict_search = "{$Dict.search}";
    var dict_alarm_msg = "{$Dict.alarm_msg}";
    var dict_alarm_calls = "{$Dict.alarm_calls}";
    var dict_total_time = "{$Dict.total_time}";
    var dict_distance = "{$Dict.distance}";
    var dict_watch = "{$Dict.watch}";
    var UserStructure = "{$UserStructure}";
    
    var $jq2 = jQuery.noConflict(true);
    $jq2('#camera_modal').draggable();

    {literal}
  
        function pad2(n) {
            return n < 10 ? '0' + n : String(n);
        }

        function getFormattedNow() {
            const now = new Date();
            const year = now.getFullYear();
            const month = pad2(now.getMonth() + 1); 
            const day = pad2(now.getDate());
            const hours = pad2(now.getHours());
            const minutes = pad2(now.getMinutes());
            const seconds = pad2(now.getSeconds());
            return `${day}-${month}-${year} ${hours}:${minutes}:${seconds}`;
        }

        document.getElementById('telement_date_now').innerText = getFormattedNow();


      // mashinani vaqtlar bo'yicha filter qilishimiz uchun statik baza 
        const carHistory = {
            "01-226-PSF": [
                {lat:  41.29929539100351, lng: 69.26026328418045, time: "2025-11-01 09:00", speed: 40},
                {lat: 41.30029201645182, lng: 69.26159494206286, time: "2025-11-02 10:10", speed: 45},
                {lat: 41.30061154208356, lng: 69.26196962893377, time: "2025-11-03 11:20", speed: 50},
                {lat: 41.30094247769464, lng: 69.26153418202972, time: "2025-11-04 12:30", speed: 47},
                {lat: 41.30166520479998, lng: 69.2624962158875, time: "2025-11-05 13:40", speed: 34},
                {lat: 41.30209883724476, lng: 69.26168101876353, time: "2025-11-06 14:40", speed: 41},
                {lat: 41.30262375684117, lng: 69.26073923825014, time: "2025-11-07 15:40", speed: 50},
                {lat: 41.30363935017743, lng: 69.26094683502515, time: "2025-11-08 11:40", speed: 60},
                {lat: 41.30445713853788, lng: 69.26101265839436, time: "2025-11-09 08:40", speed: 55},
                {lat: 41.30399309245029, lng: 69.25930631407961, time: "2025-11-10 07:40", speed: 46},
                {lat: 41.303673583380416, lng: 69.25821769674299, time: "2025-11-11 18:40", speed: 39},
                {lat: 41.302452587879706, lng: 69.25888099377529, time: "2025-11-12 19:40", speed: 41},
                {lat: 41.30188202140375, lng: 69.25694173605149, time: "2025-11-13 20:40", speed: 0},
            ],
            "01-303-PSF": [
                {lat: 41.3102, lng: 69.2408, time: "2025-11-01 09:00"},
                {lat: 41.3111, lng: 69.2420, time: "2025-11-01 09:10"},
                {lat: 41.3124, lng: 69.2450, time: "2025-11-01 09:20"}
            ],
            "01-555-PSF": [
                {lat: 41.3202, lng: 69.2308, time: "2025-11-01 09:00"},
                {lat: 41.3221, lng: 69.2310, time: "2025-11-01 09:10"},
                {lat: 41.3234, lng: 69.2340, time: "2025-11-01 09:20"}
            ]
        };

         let totalDistance = 0; // masofa km da
         let prevPoint = null; // oldingi nuqta replay davomida




     // modal ochilgandagi xarita chiqish joyi
        let historyMap;
        let historyPolyline;
        let selectedCarId = null;
        let currentMarker;
        let replayMarker; // replay animatsiya uchun

        let isPaused = false;
        let replayIndex = 0;

        let replayLatLngs = [];
        let replayTimeArray = [];
        let replaySpeedArray = [];
        let replayDuration = 1000;
        let currentTimer = null;



        $(document).ready(function() {
            $('#historyModal').on('shown.bs.modal', function () {
                      setTimeout(() => {
                if (!historyMap) {
                    historyMap = L.map('historyMap').setView([41.31, 69.25], 13);
                    // L.tileLayer('http://10.100.9.145:8080/tile/{z}/{x}/{y}.png', {
                     L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        className: 'dark' == 'dark' ? 'map-tiles' : 'map-tiles-light',
                        maxZoom: 19
                    }).addTo(historyMap);
                }

                historyMap.invalidateSize();

                  // Hozirgi mashina pozitsiyasi (statik misol)
            const currentCarPos = carHistory[selectedCarId][carHistory[selectedCarId].length - 1];
         
            if(currentMarker) historyMap.removeLayer(currentMarker);
             currentMarker = L.marker([currentCarPos.lat, currentCarPos.lng]).addTo(historyMap)
                .bindPopup('<span style="color: white;">Ҳозирги машина позицияси</span>')
            .openPopup();

               historyMap.setView([currentCarPos.lat, currentCarPos.lng], 15);


                  // Faqat HUDUDNI chizish
                 const geofenceCoords = [
                    [41.323238002671104, 69.23698976904528],  // yaqin nuqta
                    [41.28888775241128, 69.23362138773061],
                    [41.28596223874519, 69.30989438509913],
                    [41.33838705993267, 69.30770949258125],
                    ];


                    L.polygon(geofenceCoords, {
                        color: 'blue',
                        fillColor: 'blue',
                        fillOpacity: 0.2
                    }).addTo(historyMap);

            }, 200);
            });
        });



        // tugma bosilganda modal oyna ochilishi
        $(document).on('click', '#show_car_history', function () {

            selectedCarId = "01-226-PSF";
            $('#historyModal').modal('show');
        });

                // Qidirish tugmasi bosilganda
        $(document).on('click','#searchHistory', function () {
            if (!selectedCarId || !carHistory[selectedCarId]) return;

            // Sanalarni olish
            const fromDate = $('#fromDate').val();
            const toDate = $('#toDate').val();
            if (!fromDate || !toDate) {
                alert("Iltimos, ikkala sanani ham kiriting");
                return;
            }

            // Filtrlash
            const filtered = carHistory[selectedCarId].filter(item => {
                const itemDate = item.time.split(" ")[0]; // "2025-11-01"
                return itemDate >= fromDate && itemDate <= toDate;
            });

            if (filtered.length === 0) {
                alert("Bu davrda mashina ma'lumotlari topilmadi");
                return;
            }

            // Agar oldingi polyline bo'lsa, o'chirish
            if (historyPolyline) {
                historyMap.removeLayer(historyPolyline);
            }

             if(historyPolyline) historyMap.removeLayer(historyPolyline);
            const latlngs = filtered.map(item => [item.lat, item.lng]);
            historyPolyline = L.polyline(latlngs, {color: 'red', weight: 5, smoothFactor: 1}).addTo(historyMap);


            // Xarita markazini polyline markaziga qo'yish
            const bounds = historyPolyline.getBounds();
            historyMap.fitBounds(bounds);


                    // Replay marker yaratish (birinchi nuqtada)

            //  latlngs = filtered.map(item => [item.lat, item.lng]);
                 const timeArray = filtered.map(item => item.time);
                 const speedArray = filtered.map(item => item.speed);


            if(replayMarker) historyMap.removeLayer(replayMarker);
            const startPos = filtered[0];
            replayMarker = L.marker([startPos.lat, startPos.lng], {icon: L.icon({iconUrl: '/pictures/cars/matiz.png', iconSize: [25,50]}),
             rotationAngle: 0, 
             rotationOrigin: 'center center'
            }).addTo(historyMap);

            // Replay animatsiyasi smooth harakat bilan
            smoothReplay(latlngs, replayMarker, 1000, timeArray, speedArray); // 1000ms = 1 soniya har nuqta

        });

      function getAngle(start, end) {
        const dy = end[0] - start[0];
        const dx = end[1] - start[1];
        return Math.atan2(dy, dx) * 180 / Math.PI;
      }


          function smoothReplay(latlngs, marker, durationPerSegment, timeArray, speedArray) {
                replayLatLngs = latlngs;
                replayTimeArray = timeArray;
                replaySpeedArray = speedArray;
                replayDuration = durationPerSegment;

                replayIndex = 0;
                isPaused = false;
                prevPoint = null;

                function move(i) {
                    if (i >= latlngs.length - 1) return;

                    replayIndex = i;

                    const start = latlngs[i];
                    const end = latlngs[i + 1];
                    const steps = 20;
                    let step = 0;

                    const angle = getAngle(start, end);
                    marker.setRotationAngle(angle);

                    function animate() {

                        // PAUSE holati
                        if (isPaused) {
                            setTimeout(animate, 100);
                            return;
                        }

                        if (step > steps) {
                            prevPoint = {
                                lat: end[0],
                                lng: end[1],
                                time: timeArray[i],
                                speed: speedArray[i]
                            };

                            move(i + 1);
                            return;
                        }

                        const lat = start[0] + (end[0] - start[0]) * (step / steps);
                        const lng = start[1] + (end[1] - start[1]) * (step / steps);

                        marker.setLatLng([lat, lng]);
                        historyMap.panTo([lat, lng], { animate: false });

                        // index
                        const tIndex = i + (step / steps);
                        const t = timeArray[Math.min(Math.floor(tIndex), timeArray.length - 1)];
                        const s = speedArray[Math.min(Math.floor(tIndex), speedArray.length - 1)];

                        updateTelemetry({
                            lat,
                            lng,
                            time: t,
                            speed: s
                        });

                        step++;
                        // setTimeout(animate, durationPerSegment / steps);
                        currentTimer = setTimeout(animate, durationPerSegment/steps);

                    }

                    animate();
                }

                move(0);
            }


        function updateTelemetry(currPoint) {
            // Masofa
            if(prevPoint) {
                const prevLatLng = L.latLng(prevPoint.lat, prevPoint.lng);
                const currLatLng = L.latLng(currPoint.lat, currPoint.lng);

                const dist = prevLatLng.distanceTo(currLatLng)/1000; // km
                totalDistance += dist;

                $('#telemetryDistance').text(totalDistance.toFixed(2) + " km");            
            }

            // Vaqt va sana
            $('#telemetryTime').text(currPoint.time);

            $('#telemetrySpeed').text(currPoint.speed + " km/h");

            // Hudud chiqarish
            // fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${currPoint.lat}&lon=${currPoint.lng}`)
            //     .then(res => res.json())
            //     .then(data => {
            //         console.log("Address: ", data)
            //         $('#telemetryRegion').text(data.address.city || data.address.town || data.address.state || "-");
            //     })
            //     .catch(err => console.log(err));

            // Keyingi update uchun oldingi nuqta sifatida saqlash
            prevPoint = currPoint;
        }



      // PAUSE
      $("#btnPause").on("click", function () {
    isPaused = true;

    if (currentTimer) clearTimeout(currentTimer);
});

        // PLAY
        $("#btnPlay").on("click", function () {
            if (isPaused) {
                resumeReplay();
            }
        });

        $("#btnRestart").on("click", function () {
    isPaused = false;

    // Replay indeksini boshidan boshlash
    replayIndex = 0;
    prevPoint = null;
    totalDistance = 0;

    // eski animatsiyani o‘chirib tashlash
    if (currentTimer) clearTimeout(currentTimer);

    // Replay markerini boshidagi nuqtaga qo‘yish
    const start = replayLatLngs[0];
    replayMarker.setLatLng([start[0], start[1]]);
    historyMap.panTo([start[0], start[1]], {animate: false});

    // Smooth replay boshidan boshlash
    smoothReplay(
        replayLatLngs,
        replayMarker,
        replayDuration,
        replayTimeArray,
        replaySpeedArray
    );
});




      function resumeReplay() {
                isPaused = false;

                // eski animatsiyani o‘chirib yuboramiz
                if (currentTimer) clearTimeout(currentTimer);

                smoothReplay(
                    replayLatLngs.slice(replayIndex),
                    replayMarker,
                    replayDuration,
                    replayTimeArray.slice(replayIndex),
                    replaySpeedArray.slice(replayIndex)
                );
            }







    


        let cluster = L.markerClusterGroup({ chunkedLoading: true });
        let gps_url = 'uzgps.php';
        let isOnOffTime = 60;
        let isOnOffSpeed = 5;
        let region_id = 0;
        let in_service = 0;
        let lastCarsPositions;
        let allCars = [];

        //Initialize map 
        map = L.map("map", {
            center: [41.6384327, 64.0202744],
            zoom: 6,
            // layers: L.tileLayer(`http://10.19.7.4:8080/tile/{z}/{x}/{y}.png`, {
            layers: L.tileLayer(`https://tile.openstreetmap.org/{z}/{x}/{y}.png`, {
                className: 'dark' == 'dark' ? 'map-tiles' : 'map-tiles-light',
                maxZoom: 20
            }),
            notify: true,
        });

        const fg = L.featureGroup();
        fg.addTo(map);

        // Create custom icons for markers
        function myIcon(marker) {
            console.log("marker", marker.car_width)
            const unixtime = marker.unixtime;
            if (marker.speed > isOnOffSpeed) {
                let myIcon = L.icon({
                    iconUrl: `/pictures/cars/matiz.gif`,
                  iconSize: [parseInt(marker.car_width) || 25, parseInt(marker.car_height) || 50],
                });
                return myIcon;
            } else {
                let myIcon = L.icon({
                    // iconUrl: `/pictures/cars/${marker.car_photo}`,
                    iconUrl: `/pictures/cars/matiz.png`,
               iconSize: [parseInt(marker.car_width) || 25, parseInt(marker.car_height) || 50],
                });
                return myIcon;
            }
        }

        $(document).ready(function() {
            callCars(UserStructure, in_service);
        });

        // Create interval for repositioning a car in map
        let moveCarMarkerInterval = setInterval(() => {
            $.ajax({
                type: "POST",
                url: `ajax.php?act=get_cars&region=${region_id}`,
                dataType: "json",
                encode: true,
                success: async function(data) {
                    lastCarsPositions = data;
                    data.forEach((marker, index) => {
                        const car = allCars.find(car => car.options.id == marker.id);
                        if (car) {
                            car.setIcon(myIcon(marker));
                            car.setLatLng([marker.lat ? marker.lat : 0 , marker.lon ? marker.lon : 0]).setRotationAngle(marker.angle);
                        }

                        $(`#speed_${marker.id}`).html(marker.speed);
                        
                        $(`#popSpeed_${marker.id}`).html(marker.speed + " km/s");
                    })
                }
            })
        }, 5000);

        // Filtering regions
        $('#select_region').change(function(event) {
            region_id = this.value;
            callCars(region_id, in_service);
        });

        // Filtering in service
        $('#in_service').change(function(event) {
            in_service = this.value;
            callCars(region_id, in_service);
        });

        // Finding cars
        $(document).ready(function() {
            $('#searchCars').wrap('<div class="position-relative my-2"></div>').select2({
                placeholder: dict_select,
                dropdownParent: $('#searchCars').parent()
            });

            $('#searchCars').on('select2:select', function (e) {
                findCarOnMap(e.params.data.id)
            });
        });

        // Function to fly to the bounds of all markers
        function flyToMarkers(data) {
            var bounds = new L.LatLngBounds();
            data.forEach(function (marker) {
                bounds.extend([marker.lat, marker.lon]);
            });
            map.flyToBounds(bounds, { duration: 2, maxZoom: 14 });
        }
        
        // Pop up element maker
        function carPopUp(marker) {
            console.log(marker);
            let markerString = JSON.stringify(marker)
            return ` <div class="row text-center">
                        <div class="col-12">
                        <h6 class="car-title">${marker.car_name}</h6>
                        </div>
                        <div class="col-6">
                        <h6 class="car-region">${marker.region}</h6>
                        </div>
                        <div class="col-6">
                        <h6 class="car-plate">${marker.plate_number}</h6>
                        </div>
                        <div class="col-6">
                        <h6 class="car-speed" id="popSpeed_${marker.id}">
                            ${marker.speed} km/s
                        </h6>
                        </div>
                        <div class="col-6">
                        <h6 class="car-time" id="time_${marker.id}">
                            ${marker.time}
                        </h6>
                        </div>

                        <hr class="my-0 hr-line" />

                        <div class="col-4 mt-3">
                        <h6 class="icon-btn" onclick="openBodyCam(${marker.car_id}, ${marker?.og_id})">
                            <i class="ti ti-camera-selfie"></i>
                        </h6>
                        </div>
                        <div class="col-4 mt-3">
                        <h6 class="icon-btn" onclick='openStaffInfo(${markerString})'>
                            <i class="ti ti-users"></i>
                        </h6>
                        </div>
                        <div class="col-4 mt-3">
                        <h6 class="icon-btn" id="show_car_history">
                            <i class="ti ti-map"></i>
                        </h6>
                        </div>
                    </div>`;
        }
        // --- Pop up element maker

        // Find functions
        function findCarOnMap(id) {
            let marker = allCars.find(item => item.options.id == id);
            map.flyTo(marker.getLatLng(), 18, { duration: 3 })
            setTimeout(() => { map.panTo(marker.getLatLng(), { animate: true, duration: 3000 }); marker.openPopup(); }, 3100)
        }
        // --- Find functions

        function callCars(region, in_service) {
            allCars.forEach(item => { item.remove(); });
            allCars = [];
            $.ajax({
                type: "POST",
                url: `${gps_url}?region=${region}&isAll=${in_service}`,
                dataType: "json",
                encode: true,
                success: function(data) {                    
                    $("#total_thg").html(`(${data.length})`);
                    lastCarsPositions = data;
                    $('#carList').empty();
                    $('#searchCars').empty();
                    $('#searchCars').append(`<option value="0">${dict_search}</option>`);
                    data.forEach((marker, index) => {
                        $('#searchCars').append(`<option value="${marker.id}">${marker.plate_number}</option>`);
                        $('#carList').append(`
                            <tr class="cursor-pointer">
                                <td style="width: 33%;" class="text-left" onclick="findCarOnMap(${marker.id})">${marker.plate_number}</td>
                                <td style="width: 33%;">
                                    <span class="badge rounded-pill bg-label-info text-warning" id="speed_${marker.id}">${marker.speed?marker.speed:0}</span> km/s
                                </td>
                                <td style="width: 33%;" id="status_${marker.car_id}">
                                    <i class="text-${marker.speed > isOnOffSpeed ? 'success' : 'danger'} ti ti-video-plus"></i>
                                    <span id="time_${marker.car_id}">${getInterTime(marker.time)}</span>
                                </td>
                            </tr>`
                        );
                        const LamMarker = new L.marker([marker.lat ? marker.lat : 0 , marker.lon ? marker.lon : 0], {
                            icon: myIcon(marker),
                            id: marker.id,
                            type: 'car'
                        });
                        LamMarker.setRotationAngle(marker.angle).bindPopup(carPopUp(marker));
                        map.addLayer(LamMarker);
                        allCars.push(LamMarker);
                    });

                    flyToMarkers(data);
                }
            })
        }
        
        // --- Util functions
        // function getInterTime(time) {
        //     // Get the current time in milliseconds
        //     const currentTime = new Date().getTime();
        //     const timestamp = new Date(time).getTime();

        //     // Calculate the time difference in milliseconds
        //     const timeDifference = currentTime - timestamp;

        //     // Convert milliseconds to seconds, minutes, hours, and days
        //     const seconds = Math.floor(timeDifference / 1000);
        //     const minutes = Math.floor(seconds / 60);
        //     const hours = Math.floor(minutes / 60);
        //     const days = Math.floor(hours / 24);

        //     // Log the appropriate message based on the time difference
        //     if (seconds < 60) {
        //         return `${seconds} sek`;
        //     } else if (minutes < 60) {
        //         return `${minutes} min`;
        //     } else if (hours < 24) {
        //         return `${hours} soat`;
        //     } else {
        //         return `${days} kun`;
        //     }
        // }
        function getInterTime(timeStr) {
            // Agar format "DD.MM.YYYY HH:mm" bo‘lsa, uni ISO formatga o‘zgartiramiz
            const [datePart, timePart] = timeStr.split(' ');
            const [day, month, year] = datePart.split('.');
            const isoString = `${year}-${month}-${day}T${timePart}:00`;

            const timestamp = new Date(isoString).getTime();
            const currentTime = new Date().getTime();

            const diff = currentTime - timestamp;

            if (isNaN(timestamp)) return "Noto‘g‘ri sana formati";

            const seconds = Math.floor(diff / 1000);
            const minutes = Math.floor(seconds / 60);
            const hours = Math.floor(minutes / 60);
            const days = Math.floor(hours / 24);

            if (seconds < 60) return `${seconds} sek`;
            else if (minutes < 60) return `${minutes} min`;
            else if (hours < 24) return `${hours} soat`;
            else return `${days} kun`;
        }


        // --- Util functions 

    {/literal}
</script>





<script src="/dist/jsPlugin-1.2.0.min.js"></script>
<script src="/dist/polyfill2.js"></script>
<script src="/dist/cryptico.min.js"></script>
<script src="/dist/uuid.js"></script>
<script src="/dist/jquery.cookie.js"></script>

<script>
    {literal}
        //外部回调
        var iWind = 0;
        function GetSelectWndInfo (xml) {
            console.log(xml);
            iWind = xml;
        }
        
        $("#offline_bg").hide();
        $("#carCameraModal").hide();
        $jq2('#carCameraModal').draggable();
        $("#staffInfoModal").hide();
        $jq2('#staffInfoModal').draggable();
        $("#fixedModal").hide();
        // $jq2('#fixedModal').draggable();
        
        //初始化插件
        var jsDecoder = new JSPlugin({
            szId: "playWind",
            iType: 2,
            iWidth: 640,
            iHeight: 400,
            iMaxSplit: 4,
            iCurrentSplit: 2,
            szBasePath: "./dist",
            oStyle: {
                border: "#343434",
                borderSelect: "transparent",
                background: "#000 url('/assets/online.svg') no-repeat center center;"
            }
        });
        
        $('.close-camera').click(function(e) {
            // console.log("closed all camera");
            StopRealPlayAll();
            $("#carCameraModal").hide();
            $("#offline_bg").hide();
            $("#playWind").show();
        })
        $('.close-staff-info').click(function(e) {
            $("#staffInfoModal").hide();
   
        })

        function openBodyCam(car_id, og_id) {
            $("#carCameraModal").show();
            arrangeWindow(1);

            $.ajax({
                type: "POST",
                url: `ajax.php?act=get_mpg_by_id&car_id=${car_id}&og_id=${og_id}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    const isOnCam = data.cams.find(cam => cam.status == 1);
                    $("#carCameraModal .card-header").empty();
                    $("#carCameraModal .card-header").html(data.car.plate_number);
                    $("#carCameraModal .radio_call").empty();
                    $("#carCameraModal .radio_call").html(data.cams[0]?.comment);
                    if (isOnCam) {
                        $("#offline_bg").hide();
                        $("#playWind").show();
                        play_camera(data.cams[0].url, 0);
                    } else {
                        $("#offline_bg").show();
                        $("#playWind").hide();
                    }
                }
            })
        }

        
        function openStaffInfo(params) {
            $("#staffInfoModal").show();
            $.ajax({
                type: "POST",
                url: `ajax.php?act=get_mpg_by_id&car_id=${params.car_id}&og_id=${params.og_id}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    console.log(data);
                    $("#staffInfoModal .card-body").empty();
                    if (data.staffs.length) {
                        data.staffs.forEach(item => {
                            $("#staffInfoModal .card-body").append(`
                                <div class="col-3 text-center">
                                    <div class="staff-photo-box">
                                        <img class="staff-photo" src="/pictures/staffs/${item.photo}" alt="">
                                    </div>

                                    <div class="staff-name mt-3">
                                        ${item.staff_name}
                                    </div>

                                    <a href="tel:${item.phone}" class="staff-phone mt-2">
                                        📞 ${item.phone}
                                    </a>
                                    </div>
                            `);
                        })
                    }else{
                      $("#staffInfoModal .card-body").append(`
                        <div class="col-xl-12 text-center d-flex align-items-center justify-content-center">
                             <h3 style="color: white;">Транспортга навбатчилар бириктирилмаган !!!</h3>
                        </div>
                    `)

                    }
                }
            })
        }



        function play_camera(url, iWindee) {
            jsDecoder.JS_Play(url, { playURL: url }, iWindee).then(
                function() { console.log("realplay success") },
                function() { console.log("realplay failed") });
        }

        $('.unmute').hide();
        $('.mute').click(function(e) {
            var iRet = jsDecoder.JS_OpenSound(iWind);
            if(iRet == 0) {
                console.log("Ушбу камерада овоз бор, уни ёқишни тасдиқлайсизми?");
                $('.mute').hide();
                $('.unmute').show();
            } else {
                alert("Ушбу камерада овоз йўқ");
                return;
            };
        })
        $('.unmute').click(function(e) {
            $('.mute').show();
            $('.unmute').hide();
            CloseSound();
        })

        function stop () {
            jsDecoder.JS_Stop(iWind).then(function () {
                console.log("stop success");
            }, function () {
                var html = "stop failed";
                document.getElementById("error").innerHTML = "<div>" + html + "</div>";
                console.log("stop failed");
            });
        }

        function arrangeWindow (i) {
            jsDecoder.JS_ArrangeWindow(i);
        }

        function Stop () {
            jsDecoder.JS_Stop(iWind);
        }
        
        function CapturePicture(szType) {
            jsDecoder.JS_CapturePicture (iWind, "img", szType).then(function () {
                console.log("CapturePicture success");
            }, function () {
                var html = "CapturePicture failed";
                document.getElementById("error").innerHTML = "<div>" + html + "</div>";
                console.log("CapturePicture failed");
            });
        }

        function OpenSound () {
            var iRet = jsDecoder.JS_OpenSound (iWind);
            if(iRet == 0) alert("Ушбу камерада овоз бор, уни ёқишни тасдиқлайсизми?"); 
            else {
                alert("Ушбу камерада овоз йўқ");
                return;
            }   
        }

        function CloseSound () {
            jsDecoder.JS_CloseSound (iWind)
        }
        
        function StopRealPlayAll () {
            jsDecoder.JS_StopRealPlayAll()
        }

        function fullSreen() {
            jsDecoder.JS_FullScreenDisplay(true);
        }
        
        function fullScreenSingle () {
            jsDecoder.JS_FullScreenSingle(iWind);
        }
        window.onresize = function () {
            jsDecoder.JS_Resize(640, 400);
        }
    {/literal}
</script>


{include file="footer.tpl"}