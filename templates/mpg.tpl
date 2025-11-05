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
            height: 470px;
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
                        {* <table class="table border-top" style="color: #dddddd;">
                            <tbody id="carList"></tbody>
                        </table> *}
                    </div>
                </div>
            </div>
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
        function getInterTime(timestamp) {
            // Get the current time in milliseconds
            const currentTime = new Date().getTime();

            // Calculate the time difference in milliseconds
            const timeDifference = currentTime - timestamp;

            // Convert milliseconds to seconds, minutes, hours, and days
            const seconds = Math.floor(timeDifference / 1000);
            const minutes = Math.floor(seconds / 60);
            const hours = Math.floor(minutes / 60);
            const days = Math.floor(hours / 24);

            // Log the appropriate message based on the time difference
            if (seconds < 60) {
                return `${seconds} sek`;
            } else if (minutes < 60) {
                return `${minutes} min`;
            } else if (hours < 24) {
                return `${hours} soat`;
            } else {
                return `${days} kun`;
            }
        }
        // --- Util functions 

    {/literal}
</script>

{include file="footer.tpl"}