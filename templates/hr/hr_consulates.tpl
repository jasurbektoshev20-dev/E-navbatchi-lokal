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
                                  <option value="">Elchixonalar</option>
                                  <option value="">Banklar</option>
                                  <option value="">Vazirlik</option>
                                  <option value="">Toifalangan obyektlar</option>
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
            <div class="card">
                <div class="card-body px-3 py-1" style="height: 88vh;">
                     <h3 style="color: #38BDF8;" class="pt-2 text-center">Elchixona Malumotlari</h3>
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


        document.getElementById("filterToggleBtn").addEventListener("click", function () {
            const panel = document.querySelector(".filter-mpg");
            // panel.classList.toggle("active");
            $(".filter-mpg").toggleClass("hidden-panel");
        });

        let cluster = L.markerClusterGroup({ chunkedLoading: true });
        let gps_url = 'uzgps.php';
        let isOnOffTime = 60;
        let isOnOffSpeed = 5;
        let region_id = 0;
        let in_service = 0;
        let lastCarsPositions;
        let allEmbassy = [];

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
            const unixtime = marker.unixtime;
             let myIcon = L.icon({
            iconUrl: `/assets/images/german_flag.png`,
            iconSize:  [50, 50]
            });
           return myIcon;
        }

        $(document).ready(function() {
            callEmbassy(UserStructure, in_service);
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
                        const car = allEmbassy.find(car => car.options.id == marker.id);
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
                    </div>`;
        }
        // --- Pop up element maker

        // --- Find functions

        function callEmbassy(region, in_service) {
            allEmbassy.forEach(item => { item.remove(); });
            allEmbassy = [];
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
                                </td>
                            </tr>`
                        );
                        const LamMarker = new L.marker([marker.lat ? marker.lat : 0 , marker.lon ? marker.lon : 0], {
                            icon: myIcon(marker),
                            id: marker.id,
                            type: 'car'
                        });
                        // LamMarker.setRotationAngle(marker.angle).bindPopup(carPopUp(marker));
                      LamMarker
                            .setRotationAngle(marker.angle)
                            .bindPopup(carPopUp(marker))
                            .on("click", function () {

                                console.log("Marker bosildi. ID:", marker.id);

                                // Faqat marker id yuboramiz
                                let form_data = new FormData();
                                form_data.append('id', marker.id);

                                $.ajax({
                                    url: 'hrajax.php?act=act_coop_staff',
                                    dataType: 'text',
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    data: form_data,
                                    type: 'post',
                                    success: function(resdata) {
                                        var NewArray = resdata.split("<&sep&>");
                                        if (NewArray[0] == 0) {
                                            location.reload();
                                        } else {
                                            alert(resdata);
                                        }
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