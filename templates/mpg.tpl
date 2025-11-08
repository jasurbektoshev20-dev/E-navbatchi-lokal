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
            height:430px;
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
                        <label class="form-label text-warning fs-5">{$Dict.regions}</label>
                        <select class="form-select" id="select_region">
                            <option value="0">{$Dict.all}</option>
                            {foreach from=$Regions item=Item key=key name=name}
                                <option value="{$Item.id}" data-lat="{$Item.latitude}" data-lon="{$Item.longtitude}" data-zoom="{$Item.zoom}">{$Item.name}</option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="col-12 mt-3">
                        <label class="form-label text-success fs-5">{$Dict.cars}<span style="color: #ddd;" id="total_thg"></span></label>
                        <select id="searchCars" class="select2 form-select">
                            <option value="0">{$Dict.search}</option>
                        </select>
                        <table class="table border-top" style="color: #dddddd;">
                            <tbody id="carList"></tbody>
                        </table>
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
                <span>Kamera offline!</span>
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
        <div class="card-header pb-0 pt-2" ></div>
        <button type="button" class="btn close-staff-info" data-bs-dismiss="modal" aria-label="Close">x</button>

        <div class="card-body text-center row justify-content-center">
            
        </div>
    </div>

</div>

<audio id="alertSound" src="/assets/images/alert.mp3"></audio>

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
        let cluster = L.markerClusterGroup({ chunkedLoading: true });
        let gps_url = 'uzgps.php';
        let isOnOffTime = 60;
        let isOnOffSpeed = 3;
        let region_id = 0;
        let lastCarsPositions;
        let allCars = [];

        //Initialize map 
        map = L.map("map", {
            center: [41.6384327, 64.0202744],
            zoom: 6,
            // layers: L.tileLayer(`http://10.19.7.4:8080/tile/{z}/{x}/{y}.png`, {
            layers: L.tileLayer(`http://10.100.9.145:8080/tile/{z}/{x}/{y}.png`, {
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
            if (marker.speed > isOnOffSpeed) {
                let myIcon = L.icon({
                    iconUrl: `/pictures/cars/${marker.car_photo}`,
                    iconSize: [marker.car_width, marker.car_height],
                });
                return myIcon;
            } else {
                let myIcon = L.icon({
                    iconUrl: `/pictures/cars/${marker.car_photo}`,
                    iconSize: [marker.car_width, marker.car_height],
                });
                return myIcon;
            }
        }

        $(document).ready(function() {
            callCars(UserStructure);
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
            callCars(region_id);
        })

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
            return `<div class="row text-center">
                        <div class="col-12">
                            <h6 class="mt-3">${marker.car_name}</h6>
                        </div>
                        <div class="col-6">
                            <h6 class="mt-3">${marker.region}</h6>
                        </div>
                        <div class="col-6">
                            <h6 class="mt-3 text-info">${marker.plate_number}</h6>
                        </div>
                        <div class="col-6">
                            <h6 class="mt-3 text-danger" id="popSpeed_${marker.id}">${marker.speed} km/s</h6>
                        </div>
                        <div class="col-6">
                            <h6 class="mt-3 text-warning" id="time_${marker.id}">${marker.time}</h6>
                        </div>
                        <hr class="my-0"/>
                        <div class="col mt-2">
                            <h6 class="badge rounded bg-label-white cursor-pointer" onclick='openBodyCam(${marker.car_id}, ${marker?.og_id})'>
                                <i class="ti ti-camera-selfie me-1" id="bodycam_${marker.car_id}"></i>
                            </h6>
                        </div>
                        <div class="col mt-2">
                            <h6 class="badge rounded bg-label-white cursor-pointer" onclick='openStaffInfo(${markerString})'>
                                <i class="ti ti-users me-1" ></i>
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

        function callCars(region) {
            allCars.forEach(item => { item.remove(); });
            allCars = [];
            $.ajax({
                type: "POST",
                url: `${gps_url}?region=${region}`,
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
                                        <div style="width: 100%;">
                                            <img style="height: 240px; object-fit: cover; width: 100%; object-position:top" class="rounded" src="/pictures/staffs/${item.photo}" alt="">
                                        </div>
                                        <div class="text-info" style="font-size:1rem">
                                            <span class="text-white">${item.staff_name}</span>
                                        </div>
                                        <div class="text-info" style="font-size:1rem">
                                            <span class="text-white">${item.phone}</span>
                                        </div>
                                    </div>
                            `);
                        })
                    }else{
                        $("#staffInfoModal .card-body").append(`
                                <div class="col-xl-12 text-center">
                                    ${dict_no_data}
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