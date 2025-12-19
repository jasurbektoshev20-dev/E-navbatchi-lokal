{include file="header.tpl"}

<style>
    {literal}
        body::-webkit-scrollbar {
          width: 10px;
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
            background: rgba(20, 28, 52, 0.85) !important;
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

 .filter-toggle-btn {
  position: absolute;
  top: 15px;
  left: 70px;
  background: rgba(0,0,0,0.6);
  color: #38BDF8;
  border: 1px solid rgba(56,189,248,0.4);
  padding: 8px 16px;
  font-size: 15px;
  border-radius: 8px;
  backdrop-filter: blur(6px);
  cursor: pointer;
  z-index: 9999999 !important;
  transition: all .3s ease;
}

.filter-toggle-btn:hover {
  background: rgba(56,189,248,0.15);
  color: #fff;
}

/* FILTER PANEL — yashirin holat */
.filter-mpg {
  position: absolute;
  top: 75px;
  left: 70px;
  width: 400px;
  transition: right .35s ease;
  z-index: 1500;
    transition: all .35s ease;
}
.hidden-panel {
    opacity: 0;
    pointer-events: none;
}

.filter-mpg .card {
  background: linear-gradient(
    135deg,
    rgba(12,17,43,0.85),
    rgba(5,8,20,0.9)
  );
  border-radius: 20px;
  border: 1px solid rgba(0,240,255,0.25);

  /* Glass effect */
  backdrop-filter: blur(14px) saturate(160%);
  -webkit-backdrop-filter: blur(14px) saturate(160%);

  /* Premium shadow */
  box-shadow:
    0 0 20px rgba(0,0,0,0.7),
    inset 0 0 12px rgba(0,240,255,0.08);

  transition: all 0.35s ease-in-out;
}

.img-popup{
    width: 300px;
    height: 200px;
    display: flex;
    justify-content: center;
}

.img-popup img{
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.popup-container-box{
    display: flex;
    flex-direction: column;
    align-items: center;
}

.popup-text h3{
    /* font-size: 20px; */
    margin: 0;
    color: #38BDF8;
    padding-top: 10px;
    /* font-weight: 600; */
}

#staffInfoModal {
    position: absolute;
    width: 320px;
    height:450px;
    right: 1.2vw;
    top: 0.7vh;
    z-index: 55555 !important;
}

#staffInfoModal .card-body{

}

.card-body .staff-photo-box {
  width: 100%;
  height: 240px;
  overflow: hidden;
  border-radius: 14px;
  border: 1px solid rgba(0, 255, 136, 0.3);
}

.card-body .staff-photo2 {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
  border-radius: 14px;
}

/* Name */
.card-body .staff-name2 {
  font-size: 1.35rem;
  color: #eaffea;
  font-weight: 600;
}

/* Phone — clickable */
.card-body .staff-phone2 {
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

.card-body .staff-phone2:hover {
  border-color: #00ff88;
  background: rgba(0, 255, 136, 0.1);
  transform: translateY(-2px);
}
 
/* .embassy-card {
  background: rgba(0, 0, 0, 0.55);
  backdrop-filter: blur(14px);
  border: 1px solid rgba(56, 189, 248, 0.25);
  border-radius: 18px;
  box-shadow: 0 0 25px rgba(0,0,0,0.7);
} */

.embassy-title {
  color: #38BDF8;
  font-weight: 600;
}

.embassy-item {
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(56, 189, 248, 0.18);
  border-radius: 14px;
  padding: 10px 12px;
  margin-bottom: 10px;
}

.embassy-label {
  font-size: 16px;
  color: #7dd3fc;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.embassy-value {
  font-size: 18px;
  color: #e5e7eb;
  font-weight: 500;
  word-break: break-word;
}
.circle-marker {
    border-radius: 50%;
    overflow: hidden;
    border: 2px solid #fff; /* ixtiyoriy */
    object-fit: cover;
}

 .flag-wrapper{
    position: relative;
 }

 .flag-wrapper img {
    width: 50px !important;
    height: 50px !important;
    border-radius: 50%;
    object-fit: cover;
} 

.badge {
    position: absolute;
    bottom: 2px;
    right: 2px;
    background: #fff;
    border-radius: 50%;
    font-size: 16px;
    padding: 2px;
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
                </div>   
                
            <button id="filterToggleBtn" class="filter-toggle-btn">
                <i class="bi bi-funnel-fill"></i> Фильтр
            </button>

          <div class="row filter-mpg hidden-panel">
              <div class="col-12">
                  <div class="card">
                      <div class="card-body px-3 py-1" style="height: fit-content;">
                              <div class="mb-1 col-12">
                                <label for="viloyatSelect" class="form-label text-warning fs-5">{$Dict.regions}</label>
                                <select id="viloyatSelect" class="form-select">
                                  <option value="">Танланг</option>
                                  {foreach from=$Regions item=Item1 key=ikey1}
                                  <option value="{$Item1.id}">{$Item1.name}</option>
                                  {/foreach}
                                </select>
                              </div>

                              <div class="mb-1 col-12">
                                <label for="objectTypeSelect" class="form-label text-warning fs-5">Тури</label>
                                <select id="objectTypeSelect" class="form-select">
                                  <option value="">Танланг</option>
                                  {foreach from=$ObjectTypes item=Item1 key=ikey1}
                                  <option value="{$Item1.id}">{$Item1.name}</option>
                                  {/foreach}
                                </select>
                              </div>

                              <div class="mb-1 col-12">
                                <label for="objectSelect" id="objectLabelLabel" class="form-label text-warning fs-5">Объект номи</label>
                                <select id="objectSelect" class="form-select">
                                  <option value="">Танланг</option>
                                  {foreach from=$Objects item=Item1 key=ikey1}
                                  <option value="{$Item1.id}">{$Item1.name}</option>
                                  {/foreach}
                                </select>
                              </div>
                      </div>
                  </div>
              </div>
           </div>
      </div>
             
        </div>
       <div class="col-3">
            <div class="card embassy-card">
                <div class="card-body px-3 py-2" style="height: 88vh; overflow-y:auto;" id="about_embassy">
                    <h3 class="pt-2 text-center embassy-title">🏛 Объект малумотлари</h3>

                    <!-- JS shu yerga to‘ldiradi -->
                    <div id="embassy_content" class="mt-3"></div>
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
                        <button class="px-2 py-1 btn btn-success ml-2" type="button">
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

      let urlParams = new URLSearchParams(window.location.search);



        document.getElementById("filterToggleBtn").addEventListener("click", function () {
            const panel = document.querySelector(".filter-mpg");
            // panel.classList.toggle("active");
            $(".filter-mpg").toggleClass("hidden-panel");
        });

        let cluster = L.markerClusterGroup({ chunkedLoading: true });
        let gps_url = 'ajax.php?act=get_embassy_object_by_id&id=6';
        let isOnOffTime = 60;
        let isOnOffSpeed = 5;
        let region_id = 0;
        let in_service = 0;
        let lastCarsPositions;
        let allEmbassy = [];

      let object_id = '' ;
      let object_type = '';


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
        // function myIcon(marker) {
        //     console.log('fleg icon : ', marker)
        //     const unixtime = marker.unixtime;
        //      let myIcon = L.icon({
        //     iconUrl: `/pictures/embassy/${marker.photo}`,
        //     iconSize:  [50, 30]
        //     });
        //    return myIcon;
        // }

        // function myIcon(marker) {
        //         const myIcon = L.icon({
        //             iconUrl: `/pictures/embassy/${marker.photo}`,
        //             iconSize: [50, 50],          // dumaloq bo‘lishi uchun teng
        //             className: 'circle-marker'   // CSS class
        //         });
        //         return myIcon;
        //     }

        function myIcon(marker) {
                return L.divIcon({
                    html: `
                        <div class="flag-wrapper">
                            <img src="/pictures/embassy/${marker.photo}">
                            <span class="badge">
                              ${Number(marker.type_id) === 3 ? '🏢' : '🏠'}
                            </span>
                        </div>
                    `,
                     className: '',
                    // iconSize: [60, 60]
                });
            }


        $(document).ready(function() {
            callEmbassy(UserStructure, in_service);
        });


       function getElchixonalar() {
    $.ajax({
        type: "GET",
        url: "ajax.php",
        data: {
            act: 'get_embassy_map',
            region: region_id || '',
            object_type: object_type || '',
            object_id: object_id || ''
        },
        dataType: "json",
        success: function (data) {
            console.log("data elchi :", data);
            lastCarsPositions = data;

            // AVVAL eski markerlarni olib tashlaymiz
            allEmbassy.forEach(m => m.remove());
            allEmbassy = [];

            // Keyin yangilarini qo‘shamiz
            data.forEach((marker) => {
                console.log('data markar: ', marker)
                const LamMarker = new L.marker([
                    marker.lat ? marker.lat : 0,
                    marker.long ? marker.long : 0
                ], {
                    icon: myIcon(marker),
                    id: marker.id,
                    type: 'car'
                });

                LamMarker
                    .setRotationAngle(marker.angle)
                    .bindPopup(carPopUp(marker));

                map.addLayer(LamMarker);
                allEmbassy.push(LamMarker);
            });
        }
    });
}



        getElchixonalar()


        // Function to fly to the bounds of all markers
        function flyToMarkers(data) {
            var bounds = new L.LatLngBounds();
            data.forEach(function (marker) {
                bounds.extend([marker.lat, marker.long]);
            });
            map.flyToBounds(bounds, { duration: 2, maxZoom: 14 });
        }
        
        // Pop up element maker
        function carPopUp(marker) {
            console.log("carpopup", marker);
            let markerString = JSON.stringify(marker)
            return ` <div class="row text-center popup-container-box">
                        <div class="col-12 img-popup">
                           <img src='/pictures/embassy/${marker.photo}'>
                        </div>
                         <div class="col-12 popup-text">
                            <h3>${marker.object_name}</h3>
                        </div>
                        <hr class="my-0 hr-line" />
                        <div class="col-4 mt-3 popup-btn d-flex gap-2">
                        <h6 class="icon-btn" onclick="openBodyCam(${marker.id})">
                            <i class="ti ti-camera"></i>
                        </h6>
                        <h6 class="icon-btn" onclick='openStaffInfo(${marker.id})'>
                            <i class="ti ti-users"></i>
                        </h6>
                        </div>
                    </div>`;
        }
        // --- Pop up element maker

        // --- Find functions


        function callEmbassy(region, in_service) {
            allEmbassy.forEach(item => { item.remove(); });
            allEmbassy = [];
            $.ajax({
                type: "POST",
                url: `ajax.php?act=get_embassy_map`,
                dataType: "json",
                encode: true,
                success: function(data) {                    
                    $("#total_thg").html(`(${data.length})`);
                    lastCarsPositions = data;
                    data.forEach((marker, index) => {
                        const LamMarker = new L.marker([marker.lat ? marker.lat : 0 , marker.long ? marker.long : 0], {
                            icon: myIcon(marker),
                            id: marker.id,
                            type: 'car'
                        });              
                            LamMarker.setRotationAngle(marker.angle)
                            .bindPopup(carPopUp(marker))
                            .on("click", function () {

                                $.ajax({
                                    url: `${AJAXPHP}?act=get_embassy_object_by_id&id=${ marker.id}`,
                                    type: 'GET',
                                    dataType: 'json',
                                    success: function(resdata) {
                                        console.log("id bo'yicha: ", resdata);

                                        const obj = resdata.data.objects;
                                        if (!obj) return;

                                        let html = `
                                            <div class="embassy-item">
                                                <div class="embassy-label">Номи</div>
                                                <div class="embassy-value">${obj.name ?? '-'}</div>
                                            </div>

                                            <div class="embassy-item">
                                                <div class="embassy-label">Манзил</div>
                                                <div class="embassy-value">${obj.address ?? '-'}</div>
                                            </div>

                                            <div class="embassy-item">
                                                <div class="embassy-label">Туман</div>
                                                <div class="embassy-value">${obj.district ?? '-'}</div>
                                            </div>

                                             <div class="embassy-item">
                                                 <div class="embassy-label">Худудий ИИБ</div>
                                                 <div class="embassy-value">${obj.iiv_unit ?? '-'}</div>
                                                 <div class="embassy-value">${obj.iiv_unit_phone ?? '-'}</div>
                                            </div>

                                            <div class="embassy-item">
                                                <div class="embassy-label">Пост телефон рақами</div>
                                                <div class="embassy-value">${obj.post_phone ?? '-'}</div>
                                            </div>

                                            <div class="embassy-item">
                                                <div class="embassy-label">Профилактика инспектори</div>
                                                <div class="embassy-value">${obj.iiv_inspector ?? '-'}</div>
                                                 <div class="embassy-value">${obj.iiv_inspector_phone ?? '-'}</div>
                                            </div>

                                            <div class="embassy-item">
                                                <div class="embassy-label">Координаталар</div>
                                                <div class="embassy-value">
                                                    📍 ${obj.lat}, ${obj.long}
                                                </div>
                                            </div>
                                        `;

                                        $('#embassy_content').html(html);
                                    }

                                });
                            });

                        map.addLayer(LamMarker);
                        allEmbassy.push(LamMarker);
                    });

                    flyToMarkers(data);
                }
            })
        }

         function openStaffInfo(car_id) {
                $("#staffInfoModal").show();
                arrangeWindow(1);

                const $body = $("#staffInfoModal .card-body");

                // OLDINGI MA'LUMOTNI TOZALASH
                $body.html('');

                $.ajax({
                    type: "GET",
                    url: `ajax.php?act=get_embassy_object_by_id&id=${car_id}`,
                    dataType: "json",
                    success: function(data) {

                        $body.append(`
                            <div class="col-12 text-center">
                                <div class="staff-photo-box">
                                    <img class="staff-photo2" src="/pictures/staffs/${data.data.objects?.responsible_photo}" alt="">
                                </div>

                                <div class="staff-name2 mt-3">
                                    ${data.data.objects?.responsible_name}
                                </div>

                                <a href="tel:${data.data.objects?.responsible_phone}" class="staff-phone2 mt-2">
                                    📞 ${data.data.objects?.responsible_phone}
                                </a>
                            </div>
                        `); 
                    }
                });
            }


         $('.close-staff-info').click(function(e) {
            $("#staffInfoModal").hide();
   
        })

         if (urlParams.get('object_type')) {
        if (urlParams.get('region_id')) {
          $('#viloyatSelect')
            .val(urlParams.get('region_id'))

            $('#objectTypeSelect')
            .val(urlParams.get('object_type'))

          region_id = urlParams.get('region_id')
          object_type = urlParams.get('object_type')
          
        }else{
          $('#objectTypeSelect')
          .val(urlParams.get('object_type'))

          object_type = urlParams.get('object_type')
        }

        setTimeout(() => {
          urlParams.set('region_id', '');
          urlParams.set('object_type', '');
          let newUrl = window.location.pathname + '?' + urlParams.toString();
          window.history.replaceState({}, '', newUrl);
        }, 2000);
        getElchixonalar()
      }else{
        getElchixonalar()
      }

        $('#viloyatSelect').on('change', function() {
            region_id = this.value;
            getElchixonalar();
            callEmbassy(region_id, in_service); // kerak bo‘lsa
        });

        $('#objectTypeSelect').on('change', function() {
            object_type = this.value;
            getElchixonalar();
        });

        $('#objectSelect').on('change', function() {
            object_id = this.value;
            getElchixonalar();
        });

                

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


        function openBodyCam(car_id) {
            $("#carCameraModal").show();
            arrangeWindow(1);

            $.ajax({
                type: "GET",
                url: `ajax.php?act=get_embassy_object_by_id&id=${car_id}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    const isOnCam = data.data.cameras.find(cam => cam.status == 1);
                    if (isOnCam) {
                        $("#offline_bg").hide();
                        $("#playWind").show();
                        play_camera(data.data.cameras[0].url, 0);

                    } else {
                        $("#offline_bg").show();
                        $("#playWind").hide();
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