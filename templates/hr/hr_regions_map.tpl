{include file="header.tpl"}

<link href="/assets/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
<link href="/assets/global_assets/css/icons/material/styles.min.css" rel="stylesheet" type="text/css">

<link href="/assets/global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">


<style>
  {literal}


    .map-container {
      border: 1px solid red;
      height: 100%;
    }

    .uzb-map {
      width: 100%;
      height: 87vh;
      border-radius: 12px;
      opacity: 0;
      transform: scale(0.95);
      transition: opacity 1s ease, transform 1s ease;
    }

    .uzb-map.visible {
      opacity: 1;
      transform: scale(1);
    }

    .map-icon-about {
      position: absolute;
      right: 50px;
      bottom: 50px;
      z-index: 111;
    }

    .map-icon-about .map-about-box {
      display: flex;
      gap: 5px;
      align-items: center;
      font-size: 18px;
      font-weight: bold;
    }

    .map-icon-about-container {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .map-icon-about .map-about-box img {
      width: 40px;
      height: 40px;
      object-fit: cover;
    }

    .map-icon-about .map-about-box-xiyobon img {
      width: 25px;
      height: 40px;
      object-fit: cover;
    }


    .filters {
      position: absolute;
      left: 100px;
      top: 34px;
      display: flex;
      gap: 10px;
      padding: 10px;
    }

    .filters label {
      font-size: 18px;
      color: #000;
    }

    .filters select {
      font-size: 18px;
    }

    .space-main-body-img img {
      width: 100%;
      height: 350px;
      object-fit: cover;
    }


    .space-main-modal-box ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
    }

    .space-main-modal-box ul li p,
    .space-main-modal-box ul li h6 {
      margin: 0;
      font-size: 18px;
      padding-top: 10px;
    }

    .space-main-modal-box ul li h6 span {
      margin-right: 10px;
    }

    .modal-header .modal-title {
      color: rgb(149, 219, 149);
    }

    .modal-dialog {
      max-width: 60%;
      transition: all 0.3s ease;
    }

    @media (max-width:2260px) {
      .modal-dialog {
        max-width: 80%;
      }
    }

    @media (max-width:1800px) {
      .modal-dialog {
        max-width: 90%;
      }
    }

    /* 
.space-main-head{
  display: flex;
  gap: 7px;
} */
    #dialogMap {
      width: 100%;
      height: 77vh;
      border-radius: 10px;
    }

    #map3DModal {
      z-index: 999999 !important;
    }



    #playWind {
      float: left;
      display: inline-block;
      text-align: center !important;
    }

    #playWind .parent-wnd {
      text-align: center !important;
    }

    #controller {
      display: flex;
      border-radius: 20px;
      justify-content: space-around;
      align-items: center;
      position: fixed;
      top: 80%;
      left: 89%;
      padding: 10px;
      background: #254063e3;
      width: 200px;
      height: 200px;
      z-index: 999999999;
    }

    .zoom_opt {
      background-color: #0a1522ea;
      border-radius: 10px;
      padding: 10px 0;
    }

    .zoom_opt i {
      color: #e7b343;
    }


    .close_dog {
      position: absolute;
      top: 7px;
      left: 96%;
    }

    .r_status:before {
      content: "";
      display: inline-block;
      width: 10px;
      height: 10px;
      margin-right: 10px;
      border-radius: 50%;
      background-color: #ec3838;
    }

    .g_status:before {
      content: "";
      display: inline-block;
      width: 10px;
      height: 10px;
      margin-right: 10px;
      border-radius: 50%;
      background-color: #09d43c;
    }

    #current_camera {
      color: white;
      font-size: 18px;
      margin-left: 30px;
    }
    #body_current_camera {
      color: white;
      font-size: 18px;
      margin-left: 30px;
    }

    .door-marker:hover {
      transform: scale(1.2);
      transition: 0.2s;
    }

    .custom-marker {
      width: 20px;
      height: 20px;

    }
    .camera-marker {
      width: 20px;
      height: 20px;
      box-shadow: -2px 15px 16px rgba(0, 0, 0, 0.5);
      border-radius: 50%;

    }
    .body-marker {
      width: 20px;
      height: 20px;

    }
    .car-marker {
      border-radius: 50%;
      box-shadow: 0 0 4px rgba(0, 0, 0, 0.5);
    }

    .sos-marker {
      /* animation: pulse 1s infinite alternate; */
    }

    @keyframes pulse {
      from {
        transform: scale(1);
        opacity: 1;
      }

      to {
        transform: scale(1.3);
        opacity: 0.6;
      }
    }

    .my-tooltip {
  font-size: 18px !important;
  font-weight: 600;
  color: yellow;
  transition: all 0.3s ease;
}

.mapboxgl-popup-content {
    width: fit-content;
    padding: 0;
}

.passport-card ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.passport-card li {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  padding: 10px;
  background: rgba(0, 0, 0, 0.3);
   backdrop-filter: blur(6px);
    border: 1px solid rgba(56, 189, 248, 0.4);
    border-radius: 6px;
    margin-bottom: 2px;
    transition: all 0.3s ease;
    cursor: pointer;
}

.passport-card li:hover {
  background: rgba(56, 189, 248, 0.08);
  border-color: #38BDF8;
  transform: translateX(6px);
}

.passport-card li:last-child {
  border-bottom: none;
}

.passport-card h6 {
  font-size: 17px;
  font-weight: 600;
  margin: 0;
  color: #E2E8F0; /* oqga yaqin */
}

.passport-card p,
.passport-card a {
  margin: 0;
  font-size: 16px;
  color: #94A3B8; /* kulrang-oq */
  text-decoration: none;
}

.passport-icon {
  width: 38px;
  height: 38px;
  background: rgba(56, 189, 248, 0.1); /* cyan glow */
  border: 1px solid rgba(56, 189, 248, 0.4);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 19px;
  color: #38BDF8; /* neon cyan */
  backdrop-filter: blur(3px);
}

.space-main-head h4 {
  color: #fff;
  border-bottom: 3px solid #38BDF8;
  padding-bottom: 4px;
}

/* Ichki scroll berish */
.space-main-body-passport {
  max-height: 320px;      /* xohlagan balandlik */
  overflow-y: auto;
  padding-right: 6px;     /* scroll tegmasligi uchun */
}

.space-main-body-passport .passport-li-about{
  display: flex;
  gap: 7px;
}
.space-main-body-passport .passport-li-about h6, .space-main-body-passport .passport-li-about p{
    padding: 0;
}
/* Scrollbar style (dark mode) */
.space-main-body-passport::-webkit-scrollbar {
  width: 6px;
}

.space-main-body-passport ul li{
  align-items: center;
}

.space-main-body-passport::-webkit-scrollbar-track {
  background: rgba(255, 255, 255, 0.05);
  border-radius: 10px;
}

.space-main-body-passport::-webkit-scrollbar-thumb {
  background: rgba(56, 189, 248, 0.45); /* cyan */
  border-radius: 10px;
}

.space-main-body-passport::-webkit-scrollbar-thumb:hover {
  background: rgba(56, 189, 248, 0.7);
}
/* Scroll konteyner */
.space-main-body-duty {
  max-height: 320px;
  overflow-y: auto;
  padding-right: 8px;
}

/* Scroll dizayni */
.space-main-body-duty::-webkit-scrollbar {
  width: 6px;
}
.space-main-body-duty::-webkit-scrollbar-thumb {
  background: #38BDF8;
  border-radius: 10px;
}
.space-main-body-duty::-webkit-scrollbar-track {
  background: rgba(0, 0, 0, 0.4);
}

/* List umumiy */
.space-main-body-duty ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

/* Har bir element — UDAR neon cyan */
.space-main-body-duty li {
  background: rgba(0, 0, 0, 0.3); 
  border: 1px solid rgba(56, 189, 248, 0.35);
  color: #E2E8F0;
  padding: 14px 18px;
  border-radius: 12px;
  font-size: 17px;
  margin-bottom: 12px;
  display: flex;
  align-items: center;
  gap: 12px;
  backdrop-filter: blur(6px);
  transition: 0.25s ease;
}

/* Hover effekti */
.space-main-body-duty li:hover {
  background: rgba(56, 189, 248, 0.08);
  border-color: #38BDF8;
  transform: translateX(6px);
}

/* Icon — cyan glow */
.duty-icon {
  width: 38px;
  height: 38px;
  background: rgba(56, 189, 248, 0.12);
  border: 1px solid rgba(56, 189, 248, 0.4);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #38BDF8;
  font-size: 19px;
  backdrop-filter: blur(4px);
}

/* Qiymatlar ranglari */
.space-main-body-duty span {
  color: #38BDF8;
  font-weight: 600;
}

/* Title */
.space-main-head h4 {
  color: #fff;
  border-bottom: 3px solid #38BDF8;
  padding-bottom: 4px;
}

.button_box{
  color: #000;
  position: absolute;
  bottom: 0px;
}

.tab-content{
  padding: 0;
}

.text-yellow{
  color: #fff;
  font-size: 18px;
  font-weight: bold;
}

.modal-body .nav-item button{
  font-size: 20px;
}

.is-accordion{
  margin-bottom: 0 !important;
}

.is-accordion summary {
  display: flex;
  align-items: center;
  gap: 12px;
  cursor: pointer;
}

.is-accordion .inner-list {
  margin-top: 12px;
  padding-left: 45px; /* ichkariga kiradi */
  border-left: 1px solid rgba(255,255,255,0.08);
}

.summary-span{
  font-size: 18px;
  color: #fff;
}


  {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid position-relative">
  <section class="map-section">
    <div id="uzbMap" class="uzb-map"></div>
    <div class="map-overlay"></div>
  </section>

  <div class="map-icon-about">
    <div class="map-icon-about-container">
      <div class="map-about-box map-about-box-bozor">
        <img src="https://icons.iconarchive.com/icons/paomedia/small-n-flat/512/map-marker-icon.png"
          alt="Бозор учун маркер">
        <p>Бозорлар-<span>0</span> та</p>
      </div>
      <div class="map-about-box map-about-box-xiyobon">
        <img src="https://www.nicepng.com/png/full/15-159490_small-google-maps-marker-blue.png"
          alt="Xiyobon uchun marker">
        <p>Хиёбонлар-<span>0</span> та</p>
      </div>
      <div class="map-about-box map-about-box-bog">
        <img src="https://images.freeimages.com/fic/images/icons/2463/glossy/512/location.png"
          alt="Isritohat bog'i uchun marker">
        <p>Исритоҳат боғлари-<span>0</span> та</p>
      </div>
      <div class="map-about-box map-about-box-boshqa">
        <img src="https://cdn-icons-png.flaticon.com/512/6284/6284577.png" alt="Boshqa joy uchun marker">
        <p>Бошқа жойлар-<span>0</span> та</p>
      </div>
    </div>
  </div>

  <div class="filters bg-white rounded shadow" style="z-index: 200;">
    <div>
      <label for="viloyatSelect" class="form-label">Объектлар</label>
      <select id="viloyatSelect" class="form-select">
        <option value="">Танланг</option>
        {foreach from=$Regions item=Item1 key=ikey1}
        <option value="{$Item1.id}">{$Item1.name}</option>
        {/foreach}
      </select>
    </div>

    <div>
      <label for="objectTypeSelect" class="form-label">Объект тури</label>
      <select id="objectTypeSelect" class="form-select">
        <option value="">Танланг</option>
        {foreach from=$ObjectTypes item=Item1 key=ikey1}
        <option value="{$Item1.id}">{$Item1.name}</option>
        {/foreach}
      </select>
    </div>

    <div>
      <label for="objectSelect" id="objectLabelLabel" class="form-label">Объект номи</label>
      <select id="objectSelect" class="form-select">
        <option value="">Танланг</option>
        {foreach from=$Objects item=Item1 key=ikey1}
        <option value="{$Item1.id}">{$Item1.name}</option>
        {/foreach}
      </select>
    </div>
  </div>


  <!-- Modal -->

  <div class="modal show fade bd-example-modal-xl" id="markerModal" tabindex="-1" aria-hidden="true"
    style="z-index: 99999 !important;">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header position-relative">
          <h2 class="modal-title position-absolute start-50 translate-middle-x" id="markerModalTitle" style="color: #fff;">
            Маркер номи
          </h2>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

<div class="modal-body">
  <div class="space-main-modal-box">
    <div class="row">

      <!-- LEFT SIDE — MAP -->
      <div class="col-7">
        <div class="space-main-head">
          <h4 class="m-0">Харита</h4>
        </div>

        <div id="dialogMap" class="mt-1" ></div>
      </div>

      <!-- RIGHT SIDE -->
      <div class="col-5 d-flex flex-column">

        <!-- CAMERA BLOCK -->
        <div>
          <div class="space-main-head">
            <h4 class="m-0">Камералар</h4>
          </div>

          <div class="camera-box position-relative" style="background: rgba(0,0,0,0.25); border-radius: 12px;">
            <div id="playWind" style="width: 100%; height: 280px; border-radius: 12px;"></div>

            <!-- BUTTONS (fixed) -->
            <div class="button_box w-100 mt-2" style="position: static !important;">
              <div class="d-flex gap-1 px-2" style="align-items:center;">

                <button class="btn btn-warning unmute" type="button">
                  <i class="icon-volume-medium"></i>
                </button>

                <button class="btn btn-info mute" type="button">
                  <i class="icon-volume-mute5"></i>
                </button>

                <div style="padding-left: 10px; width: 100%;">
                  
                  <div class="d-flex justify-content-between border-bottom mb-1" style="border-color:#555;">
                    <span class="text-yellow">Жами камералар:
                      <span class="text-white camera_length"></span>
                    </span>

                    <ul class="nav nav-pills mb-0">
                      <li class="nav-item dropdown dropup">
                        <a href="#" id="current_camera" class="dropdown-toggle" data-toggle="dropdown"></a>
                        <div class="dropdown-menu" id="change_camera"></div>
                      </li>
                    </ul>
                  </div>

                  <div class="d-flex justify-content-between mt-1">
                    <span class="text-yellow">Жами бодикамералар:
                      <span class="text-white body_camera_length"></span>
                    </span>
                    <ul class="nav nav-pills mb-0">
                      <li class="nav-item dropdown dropup">
                        <a href="#" id="body_current_camera" class="dropdown-toggle" data-toggle="dropdown"></a>
                        <div class="dropdown-menu" id="body_change_camera"></div>
                      </li>
                    </ul>
                  </div>

                </div>
              </div>
            </div>

          </div>
        </div>

        <!-- TABS -->
        <ul class="nav nav-tabs mt-3" id="myTab">
          <li class="nav-item">
            <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab_passport">Объект маълумотлари</button>
          </li>
          <li class="nav-item">
            <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab_duty">Куч воситалар</button>
          </li>
        </ul>

        <!-- TAB CONTENT -->
        <div class="tab-content flex-grow-1">

          <!-- TAB 1 -->
          <div class="tab-pane fade show active" id="tab_passport">
            <div class="space-main-body-passport passport-card"></div>
          </div>

          <!-- TAB 2 -->
          <div class="tab-pane fade" id="tab_duty">
            <div class="space-main-body-duty"></div>
          </div>

        </div>

      </div>

    </div>
  </div>
</div>

      </div>
    </div>
  </div>

  <div id="controller" class="row text-center modal fade show" tabindex="-1" aria-modal="true" role="dialog"
    style="display: none;">
    <div class="col-4 cursor-pointer ptz_up_left">
      <i class="icon-arrow-up-left32 icon-2x"></i>
    </div>
    <div class="col-4 cursor-pointer ptz_up">
      <i class="icon-circle-up2 icon-2x"></i>
    </div>
    <div class="col-4 cursor-pointer ptz_up_right">
      <i class="icon-arrow-up-right32 icon-2x"></i>
    </div>
    <div class="col-4 cursor-pointer ptz_left">
      <i class="icon-circle-left2 icon-2x"></i>
    </div>

    <div class="col-4 cursor-pointer ">
      <i class="icon-cog5 icon-2x"></i>
    </div>

    <div class="col-4 cursor-pointer ptz_right">
      <i class="icon-circle-right2 icon-2x"></i>
    </div>
    <div class="col-4 cursor-pointer ptz_down_left">
      <i class="icon-arrow-down-left32 icon-2x"></i>
    </div>
    <div class="col-4 cursor-pointer ptz_down">
      <i class="icon-circle-down2 icon-2x"></i>
    </div>
    <div class="col-4 cursor-pointer ptz_down_right">
      <i class="icon-arrow-down-right32 icon-2x"></i>
    </div>
    <div class="col-12">
      <div class="zoom_opt text-center">
        <i class="icon-zoomin3 mr-3 icon-2x cursor-pointer ptz_zoom_in"></i>
        <i class="icon-zoomout3 icon-2x cursor-pointer ptz_zoom_out"></i>
      </div>
    </div>
  </div>


</div>


{* 3d karta uchun urllar *}
<script src="https://cesium.com/downloads/cesiumjs/releases/1.104/Build/Cesium/Cesium.js"></script>
<link href="https://cesium.com/downloads/cesiumjs/releases/1.104/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
<script src="/assets/global_assets/js/main/bootstrap.bundle.min.js"></script>


<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

<!-- Mapbox GL JS -->
<script src="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.js"></script>
<link href="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.css" rel="stylesheet" />

<!-- Mapbox GL Geocoder -->
<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.min.js"></script>
<link rel="stylesheet"
  href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css" type="text/css" />




<script src="/assets/hls.js"></script>

<script src="/dist/jsPlugin-1.2.0.min.js"></script>
<script src="/dist/polyfill2.js"></script>
<script src="/dist/cryptico.min.js"></script>
<script src="/dist/uuid.js"></script>
<script src="/dist/jquery.cookie.js"></script>





<script>
  var AJAXPHP = "ajax{$AddURL}.php";
  var HRAJAXPHP = "hrajax{$AddURL}.php";
  {literal}


    document.addEventListener("DOMContentLoaded", function() {
      var urlParams = new URLSearchParams(window.location.search);


      let region_id, object_id, object_type

      let fetched_camera, fetched_body;

      let bodyCameraMarkers = {};
      // O‘zbekiston markazi koordinatalari
      const uzbekistanCenter = [41.2995, 69.2401]; // Toshkent markazi

      // Xaritani yaratish
      const map = L.map("uzbMap", {
        center: [41.6384, 64.0202],
        zoom: 7,
        // layers: L.tileLayer(`http://10.19.7.4:8080/tile/{z}/{x}/{y}.png`, { maxZoom: 19 }),
        layers: L.tileLayer(`http://10.100.9.145:8080/tile/{z}/{x}/{y}.png`, { 
          className: 'dark' == 'dark' ? 'map-tiles' : 'map-tiles-light',
          maxZoom: 20
        }),
        // layers: L.tileLayer(`https://tile.openstreetmap.org/{z}/{x}/{y}.png`, { maxZoom: 19 }),
      });
      // Marker ikonkalari
      const markerIcons = {
        '1': L.icon({
          iconUrl: 'https://icons.iconarchive.com/icons/paomedia/small-n-flat/512/map-marker-icon.png',
          iconSize: [30, 30]
        }),
        '3': L.icon({
          iconUrl: 'https://images.freeimages.com/fic/images/icons/2463/glossy/512/location.png',
          iconSize: [35, 35]
        }),
        '2': L.icon({
          iconUrl: 'https://www.nicepng.com/png/full/15-159490_small-google-maps-marker-blue.png',
          iconSize: [20, 35],
        }),
        '4': L.icon({
          iconUrl: 'https://cdn-icons-png.flaticon.com/512/6284/6284577.png',
          iconSize: [30, 30],
        })
      };

      // GeoJSONni yuklash
      fetch("/templates/hr/json/uz_regions.geojson")
        .then((res) => res.json())
        .then((data) => {
          const regionsLayer = L.geoJSON(data, {
            style: (feature) => ({
              color: "#e9e9e9", // chegara
              weight: 1.5,
              fillColor: getColor(feature.properties.shapeName),
              fillOpacity: 0,
            }),
            onEachFeature: (feature, layer) => {
              const name = feature.properties.shapeName;
              layer.bindPopup(`<b>${name}</b>`);

              // Faqat bosilganda ishlaydi
              layer.on("click", (e) => {
                const selected = feature.properties.shapeName;
                map.fitBounds(e.target.getBounds());
              //  console.log(`Tanlangan viloyat: ${selected}`);
                // showMarkersByRegion(selected);
              });
            },
          }).addTo(map);

          map.fitBounds(regionsLayer.getBounds());
        })
        .catch((err) => console.error("GeoJSON yuklashda xato:", err));



      // sahifa ochilganda karta chiroyli ochilishi
      setTimeout(() => {
        document.getElementById('uzbMap').classList.add('visible');
      }, 500);



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
          var newUrl = window.location.pathname + '?' + urlParams.toString();
          window.history.replaceState({}, '', newUrl);
        }, 2000);
        getObjects()
      }else{
        getObjects()
      }




      const allMarkers = L.layerGroup()

      function getObjects() {

        let url = `${AJAXPHP}?act=get_jts_map`;
        let params = [];
        if (region_id) params.push(`region_id=${region_id}`);
        if (object_id) params.push(`object_id=${object_id}`);
        if (object_type) params.push(`object_type=${object_type}`);


        if (params.length > 0) url += '&' + params.join('&');

        $.ajax({
          url: url,
          type: 'GET',
          dataType: 'json',
          success: function(response) {
            console.log(response);
            allMarkers.clearLayers();
            if (!response && !response.length) return

            const bozor = response.filter(item => item.object_type == 1)
            const bog = response.filter(item => item.object_type == 3)
            const xiyobon = response.filter(item => item.object_type == 2)
            const boshqa = response.filter(item => item.object_type == 4)

            $('.map-about-box-bozor span').html(bozor.length)
            $('.map-about-box-bog span').html(bog.length)
            $('.map-about-box-xiyobon span').html(xiyobon.length)
            $('.map-about-box-boshqa span').html(boshqa.length)


            // LayerGroup

            // Markerlarni LayerGroup ga qo'shamiz
            response.forEach(m => {
              const marker = L.marker([m.lat, m.long], { icon: markerIcons[m.object_type] })
                .bindTooltip(m.object_name, { direction: 'top', offset: [0, -10],  className: 'my-tooltip' });

              marker.id = m.id;
              marker.type = m.object_type;
              allMarkers.addLayer(marker);

              marker.on('click', function() {
                document.getElementById('markerModalTitle').innerText = m.object_name;

                $.ajax({
                  url: `${AJAXPHP}?act=get_jts_object_by_id&id=${m.id}`,
                  type: 'GET',
                  dataType: 'json',
                  success: function(response) {
                    console.log(response);
                    if (!response) return

                    $("#markerModal").modal("show");

                    renderDialogMap(response?.data, response?.cameras)
                    renderPassportDetails(response?.data)
                    renderDutyDetails(response?.data?.routine)


                    $('#change_camera').empty();
                    if (response?.cameras && response?.cameras?.length) {
                      fetched_camera = response.cameras;

                      get_camera()

                    }
                    if (response?.data?.body_cameras && response?.data?.body_cameras.length) {
                      fetched_body = response.data.body_cameras;

                      get_camera()

                    }

                  },
                  error: function(xhr, status, error) {
                    console.error('AJAX error:', error);
                  }
                })
              });
            });

            // Markerlarni xaritaga qo‘shamiz
            allMarkers.addTo(map);

            // Hamma marker koordinatalarini olish
            const markerCoords = response.map(m => [m.lat, m.long]);

            if (markerCoords.length > 0) {
              // Hamma markerlarni qamrab oladigan bounds
              const bounds = L.latLngBounds(markerCoords);

              // Xarita markazlash + zoomni avtomatik o‘rnatish
              map.flyToBounds(bounds, { padding: [50, 50], duration: 1 }); // padding – biroz chet bo‘shliq
            }

        },
        error: function(xhr, status, error) {
          console.error('AJAX error:', error);
        }
      })



    }




    $('#viloyatSelect').on('change', function() {
      var id = this.value;
      region_id = id
      getObjects()
    })
    
    $('#objectTypeSelect').on('change', function() {
      var id = this.value;
      object_type = id

      getObjects()
    })
    $('#objectSelect').on('change', function() {
      var id = this.value;
      object_id = id
      getObjects()
    })






    function renderDialogMap(params, cameras) {
      const mapContainer = document.querySelector('#dialogMap')
      if (!mapContainer || !params) return
      // Eski xarita mavjud bo‘lsa, tozalaymiz
      if (mapContainer._mapbox_instance) {
        mapContainer._mapbox_instance.remove();
      }

      const MAPBOX_ACCESS_TOKEN =
        'pk.eyJ1Ijoic2hhdmthdDAxIiwiYSI6ImNsOHJjcmo2azA2dWEzb254amM0dHlzcjEifQ.HNCCG0V7PLGSnAKUBZWzuw';

      mapboxgl.accessToken = MAPBOX_ACCESS_TOKEN;
      const map_center = [
        parseFloat(params.long) || 69.276138,
        parseFloat(params.lat) || 41.312123,
      ];

      // Xarita yaratish
      const map = new mapboxgl.Map({
        container: 'dialogMap',
        style: `mapbox://styles/mapbox/standard`,
        center: map_center,
        zoom: 6,
        pitch: 0,
        antialias: true,
      });

      mapContainer._mapbox_instance = map;
      map.addControl(new mapboxgl.NavigationControl());

      setTimeout(() => map.resize(), 300);

      // --- Dastlab yuklanganda chizish ---
      map.on('load', ()=>{
        drawPolygon()

        // ✅ 2. DOOR markerlar (eshiklar)
        if (Array.isArray(params.door)) {
          params.door.forEach(door => {
            const lat = parseFloat(door.lat);
            const lon = parseFloat(door.long);
            if (isNaN(lat) || isNaN(lon)) return;

            const el = document.createElement('div');
            el.className = 'door-marker';
            el.style.width = '30px';
            el.style.height = '30px';
            el.style.backgroundImage = `url('/assets/images/open-door2.png')`;
            el.style.backgroundSize = 'cover';
            el.title = door.name;

            new mapboxgl.Marker(el)
              .setLngLat([lon, lat])
              .setPopup(new mapboxgl.Popup()
                .setHTML(
                  `<div style="color: #000; font-size:18px;">${door.name}</div>`
                ))
              .addTo(map);
          });
        }

        // ✅ 3. TRACK marker (mashina)
        if (Array.isArray(params.tracks)) {
          params.tracks.forEach(track => {
            const lat = parseFloat(track.lat);
            const lon = parseFloat(track.lon);
            if (isNaN(lat) || isNaN(lon)) return;
            const el = document.createElement('div');
            el.className = 'car-marker';
            el.style.width = track.car_width + 'px';
            el.style.height = track.car_height + 'px';
            // el.style.backgroundImage = `url('/pictures/cars/${track.car_photo || 'car.png'}')`;
            el.style.backgroundImage = `url('/pictures/cars/${track.car_photo || 'car.png'}')`;
            el.style.backgroundSize = 'cover';
            el.style.transform = `rotate(${track.angle || 0}deg)`;
            el.title = track.car_name;

            new mapboxgl.Marker(el)
              .setLngLat([lon, lat])
              .setPopup(
                new mapboxgl.Popup().setHTML(
                  `<div style="color: #000; font-size:20px;"> <b>${track.car_name}</b><br>Tezlik: ${track.speed} km/h<br>${track.date} </div>`
                )
              )
              .addTo(map);
          });
        }

        // ✅ 4. Camera marker
        if (Array.isArray(cameras)) {
          cameras.forEach(camera => {
            const lat = parseFloat(camera.lat);
            const lon = parseFloat(camera.long);
            if (isNaN(lat) || isNaN(lon)) return;

            const el = document.createElement('div');
            el.className = 'camera-marker';
            // el.style.backgroundImage = `url('/assets/images/video-camera-recording-yellow.png')`;
            el.style.backgroundImage = `url('/assets/images/image.png')`;
            el.style.backgroundSize = 'cover';
            el.title = camera.comment;
             el.style.width = '25px';
            el.style.height = '25px';
            const popupHTML = `
              <div style="color: #000; text-align:center">
                <b style="font-size: 18px">${camera.comment}</b><br>
                <button 
                  class="btn btn-primary popup-camera-btn" 
                  style="padding: 6px 12px; margin-top:6px;"
                  data-id="${camera.id}">
                  <span class="btn-text">Tanlash</span>
                </button>
              </div>
            `;

            const popup = new mapboxgl.Popup().setHTML(popupHTML);

            new mapboxgl.Marker(el)
              .setLngLat([lon, lat])
              .setPopup(popup)
              .addTo(map);
          });
        }
        if (Array.isArray(params.body_cameras)) {
          params.body_cameras.forEach(camera => {
            const lat = parseFloat(camera.lat);
            const lon = parseFloat(camera.long);
            if (isNaN(lat) || isNaN(lon)) return;

            const el = document.createElement('div');
            el.className = 'body-marker';
            el.style.backgroundImage = `url('/assets/images/policeman.png')`;
            el.style.backgroundSize = 'cover';
            el.title = camera.comment;
                 el.style.width = '25px';
            el.style.height = '25px';
            // Xodim rasmi
            const photoUrl = camera.staff_photo
              ? `/pictures/staffs/${camera.staff_photo}`
              : '/assets/images/nophoto2.png';

            // Popup HTML
            const popupHTML = `
                <div
      class="user-card-about d-flex align-items-center gap-3 rounded-4 p-2"
      style=" width: 450px; border: 1px solid #e5e7eb"
    >
      <div class="user-about-card-img">
        <img
          src="${photoUrl}"
          alt="расм юкланмаган"
          style="
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 6px;
          "
        />
      </div>
      <div class="user-card-about-text text-center flex-grow-1">
       
        <div style="font-weight: 700; font-size: 24px; color: #334155;  margin-bottom:10px;">
      
          ${camera.staff_name || 'Xodim nomi yo‘q'}
        </div>
        <div class="mt-2" style="font-size: 17px; color: #334155">
          <i class="bi bi-telephone-fill text-success me-1"></i>
          <a
            href="tel:${camera.staff_phone || ''}"
            style="
              text-decoration: none;
              color: #334155;
              font-weight: 500;
              font-size: 22px;
            "
          >
           ${camera.staff_phone || ''}
          </a>
        </div>

        <!-- BUTTON (beautiful camera icon) -->
        <div class="d-flex align-items-center justify-content-center gap-2">
          <button
            class="btn mt-3 px-4 py-2 popup-body-camera-btn"
            data-id="${camera.id}"
            style="
              background: #0ea5e9;
              color: white;
              font-size: 18px;
              border-radius: 10px;
              border: none;
            "
          >
            <i class="bi bi-camera-video-fill" style="font-size: 18px; margin-right:5px;"></i>
            Камерани кўриш
          </button>
        </div>
      </div>
    </div>
            `;

            const popup = new mapboxgl.Popup({ offset: 15 }).setHTML(popupHTML);

            const marker = new mapboxgl.Marker(el)
              .setLngLat([lon, lat])
              .setPopup(popup)
              .addTo(map);
              
              
              
              // Marker va pozitsiyani saqlaymiz
              bodyCameraMarkers[camera.id] = {
                marker,
                current: { lat, lon },
                target: { lat, lon }
              };
          });

        }

        // ✅ 5. SOS markerlar
        if (Array.isArray(params.sos)) {
          params.sos.forEach(sos => {
            const lat = parseFloat(sos.lat);
            const lon = parseFloat(sos.long);
            if (isNaN(lat) || isNaN(lon)) return;

            const el = document.createElement('div');
            el.className = 'sos-marker';
            el.style.width = '18px';
            el.style.height = '18px';
            el.style.background = 'red';
            el.style.borderRadius = '50%';
            el.style.border = '2px solid white';
            el.title = sos.name;

            new mapboxgl.Marker(el)
              .setLngLat([lon, lat])
              .setPopup(new mapboxgl.Popup().setHTML(
                `<div style="color: #000; font-size:18px;">${sos.name}</div>`
              ))
              .addTo(map);
          });
        }
      });

      map.on('style.load', () => {
        drawPolygon(); // markerlar va polygonlarni qayta chizish
      });
      // ✅ Layer style switcher (Standard / Satellite / Dark)
      const layerSwitcher = document.createElement('div');
      layerSwitcher.className = 'mapbox-style-switcher';
      layerSwitcher.style.cssText = `
        position: absolute;
        top: 10px;
        right: 10px;
        background: rgba(255,255,255,0.9);
        border-radius: 6px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        padding: 4px;
        font-family: sans-serif;
        z-index: 999;
      `;

      const styles = [
        { id: 'standard', label: '🗺', url: 'mapbox://styles/mapbox/standard' },
        { id: 'satellite', label: '🌍', url: 'mapbox://styles/mapbox/satellite-streets-v12' },
        { id: 'dark', label: '🌑', url: 'mapbox://styles/mapbox/dark-v11' },
      ];

      // Tugmalarni yaratish
      styles.forEach(style => {
        const btn = document.createElement('button');
        btn.textContent = style.label;
        btn.style.cssText = `
          display: block;
          border: 1px solid #ccc;
          border-radius: 4px;
          margin: 3px 0;
          padding: 4px 8px;
          cursor: pointer;
          text-align: left;
        `;
        btn.onclick = () => {
          map.setStyle(style.url);
        };
        layerSwitcher.appendChild(btn);
      });

      // DOMga joylash
      map.getContainer().appendChild(layerSwitcher);


      function drawPolygon() {
        if (params.geom_geojson) {
          try {
            // eski polygonni tozalash
            if (map.getSource('object-polygon')) {
              if (map.getLayer('object-polygon-fill')) map.removeLayer('object-polygon-fill');
              if (map.getLayer('object-polygon-outline')) map.removeLayer('object-polygon-outline');
              map.removeSource('object-polygon');
            }


            const geom = JSON.parse(params.geom_geojson);
            map.addSource('object-polygon', {
              type: 'geojson',
              data: geom,
            });

            map.addLayer({
              id: 'object-polygon-fill',
              type: 'fill',
              source: 'object-polygon',
              paint: {
                'fill-color': '#3b82f6',
                'fill-opacity': 0,
              },
            });

            map.addLayer({
              id: 'object-polygon-outline',
              type: 'line',
              source: 'object-polygon',
              paint: {
                'line-color': '#481566',
                'line-width': 4,
              },
            });

            // Polygon chegarasiga yumshoq zoom
            const bounds = new mapboxgl.LngLatBounds();
            geom.coordinates[0].forEach(coord => bounds.extend(coord));
            map.fitBounds(bounds, { padding: 80, duration: 1500 });
          } catch (err) {
            console.warn('Polygon parse xatolik:', err);
          }
        }
        
      }


      setInterval(() => {
        if(document.querySelector('#dialogMap')){
          $.ajax({
            url: `${AJAXPHP}?act=get_bodycam_location&id=${params?.id}`,
            type: 'GET',
            dataType: 'json',
            success: function(response) {
              response.forEach(item=>{
                updateCameraPosition(item.id, item.lat, item.lon)
              })
            }
          })
        }
      }, 1000);
    }





    // Funksiya: yangi koordinatalarni yangilash (socket orqali)
    function updateCameraPosition(id, newLat, newLon) {
      const camera = bodyCameraMarkers[id];
      if (!camera) return;

      // Yangi target koordinatalarni o‘rnatamiz
      camera.target = { lat: newLat, lon: newLon };

      camera.setLngLat([newLon, newLat]);
    }


    function renderPassportDetails(params) {
      const container = document.querySelector('.space-main-body-passport')
      if (!container || !params) return

      container.innerHTML = `
    
            <ul>
  
        <li class="is-accordion">
            <details>
              <summary>
                <div class="passport-icon">  <i class="duty-icon bi bi-person-fill"></i></div>
                <span class="summary-span"> <span style="color:#fff; font-weight:bold;">Объект раҳбари:</span> <span> ${params.object_head}</span>
              </summary>
              <ul class="inner-list">
                  <li>
                    <div class="passport-icon">
                      <i class="bi bi-telephone-fill"></i>
                    </div>
                    <div class="passport-li-about">
                      <h6>Раҳбар телефони:</h6>
                      <p>
                        <a href="tel:${params.head_phone}">${params.head_phone}</a>
                      </p>
                    </div>
                  </li>
              </ul>
            </details>
          </li>
    <li>
      <div class="passport-icon">
        <i class="bi bi-geo-alt-fill"></i>
      </div>
      <div class="passport-li-about">
        <h6>Манзили:</h6>
        <p>${params.address}</p>
      </div>
    </li>

    <li>
      <div class="passport-icon">
        <i class="bi bi-telephone-fill"></i>
      </div>
      <div class="passport-li-about">
        <h6>Администратор телефон рақами:</h6>
        <p><a href="tel:${params.admin_phone}">${params.admin_phone}</a></p>
      </div>
    </li>

    <li>
      <div class="passport-icon">
        <i class="bi bi-border-all"></i>
      </div>
      <div class="passport-li-about">
        <h6>Майдони:</h6>
        <p>${params.area} га</p>
      </div>
    </li>

     <li>
  <div class="passport-icon">
    <i class="bi bi-shop"></i>
  </div>
  <div class="passport-li-about">
    <h6>Савдо дўконлари:</h6>
    <p>${params?.markets_count ?? '12'} ta</p>
  </div>
</li>

<li>
  <div class="passport-icon">
    <i class="bi bi-cup-hot"></i>
  </div>
  <div class="passport-li-about">
    <h6>Овқатланиш шаҳобчалари:</h6>
    <p>${params?.eating_place_count ?? '6'} ta</p>
  </div>
</li>

    <li>
      <div class="passport-icon">
        <i class="bi bi-door-open-fill"></i>
      </div>
      <div class="passport-li-about">
        <h6>Кириш чиқиш эшиклар сони:</h6>
        <p>${params.count_doors} та</p>
      </div>
    </li>

    <li class="is-accordion">
        <details>
          <summary>
            <div class="passport-icon">  <i class="duty-icon bi bi-person-fill"></i></div>
            <span class="summary-span"> <span style="color:#fff; font-weight:bold;">Объект профилактика инспектори:</span> <span> ${params.police_name}</span>
          </summary>
          <ul class="inner-list">
              <li>
                <div class="passport-icon">
                  <i class="bi bi-telephone-fill"></i>
                </div>
                <div class="passport-li-about">
                  <h6>Телефон рақами:</h6>
                  <p>
                    <a href="tel:${params.police_phone}">${params.police_phone}</a>
                  </p>
                </div>
              </li>
          </ul>
        </details>
      </li>


      <li class="is-accordion">
        <details>
          <summary>
            <div class="passport-icon">  <i class="duty-icon bi bi-person-fill"></i></div>
            <span class="summary-span"> <span style="color:#fff; font-weight:bold;">Ҳамкор ташкилотлар</span>
          </summary>
          <ul class="inner-list">
              <li>
                <div class="passport-icon">
                  <i class="bi bi-telephone-fill"></i>
                </div>
                <div class="passport-li-about">
                  <h6>ИИВ</h6>
                  <p>
                    <a href="tel:71-252-70-01">71-252-70-01</a>
                  </p>
                </div>
              </li>
               <li>
                <div class="passport-icon">
                  <i class="bi bi-telephone-fill"></i>
                </div>
                <div class="passport-li-about">
                  <h6>ФВВ</h6>
                  <p>
                    <a href="tel:71-234-87-20">71-234-87-20</a>
                  </p>
                </div>
              </li>
          </ul>
        </details>
      </li>
<li class="is-accordion">
  <details>
    <summary>
      <div class="passport-icon"><i class="bi bi-people-fill"></i></div>
      <span class="summary-span">МФЙ</span>
    </summary>

    <ul class="inner-list">
           <li>
            <div class="passport-icon">
              <i class="bi bi-geo"></i>
            </div>
            <div class="passport-li-about">
              <h6>Номи:</h6>
              <p>${params?.neighborhood_name ?? 'Бинокор маҳалласи'}</p>
            </div>
          </li>
          
      <li class="is-accordion">
        <details>
          <summary>
            <div class="passport-icon">  <i class="duty-icon bi bi-person-badge"></i></div>
            <span class="summary-span"> <span style="color:#fff; font-weight:bold;">МФЙ раиси:</span> <span> ${params?.neighborhood_head ?? 'Исмоилов И.Н'}</span>
          </summary>
          <ul class="inner-list">
              <li>
                <div class="passport-icon">
                  <i class="bi bi-telephone-fill"></i>
                </div>
                <div class="passport-li-about">
                  <h6>Телефон рақами:</h6>
                  <p>
                    <a href="tel:${params?.neighborhood_head_phone}">${params?.neighborhood_head_phone}</a>
                  </p>
                </div>
              </li>
          </ul>
        </details>
      </li>


   <li class="is-accordion">
        <details>
          <summary>
            <div class="passport-icon">  <i class="duty-icon bi bi-building"></i></div>
            <span class="summary-span"> <span style="color:#fff; font-weight:bold;">Хоким ёрдамчиси:</span> <span> ${params?.assistant_governor ?? 'Аҳмадов А.Й'}</span>
          </summary>
          <ul class="inner-list">
              <li>
                <div class="passport-icon">
                  <i class="bi bi-telephone-fill"></i>
                </div>
                <div class="passport-li-about">
                  <h6>Телефон рақами:</h6>
                  <p>
                    <a href="tel:${params?.assistant_governor_phone}">${params?.assistant_governor_phone}</a>
                  </p>
                </div>
              </li>
          </ul>
        </details>
      </li>

      <li class="is-accordion">
              <details>
                <summary>
                  <div class="passport-icon">  <i class="duty-icon bi bi-people"></i></div>
                  <span class="summary-span"> <span style="color:#fff; font-weight:bold;">Ёшлар етакчиси:</span> <span> ${params?.youth_leader ?? 'Жумаев А.Д'}</span>
                </summary>
                <ul class="inner-list">
                    <li>
                      <div class="passport-icon">
                        <i class="bi bi-telephone-fill"></i>
                      </div>
                      <div class="passport-li-about">
                        <h6>Телефон рақами:</h6>
                        <p>
                          <a href="tel:${params?.youth_leader_phone}">${params?.youth_leader_phone}</a>
                        </p>
                      </div>
                    </li>
                </ul>
              </details>
            </li>

         <li class="is-accordion">
              <details>
                <summary>
                  <div class="passport-icon">  <i class="duty-icon bi bi-gender-female"></i></div>
                  <span class="summary-span"> <span style="color:#fff; font-weight:bold;">Хотин-қизлар фаоли:</span> <span> ${params?.womens_activist ?? 'Икромова Ш.Н'}</span>
                </summary>
                <ul class="inner-list">
                    <li>
                      <div class="passport-icon">
                        <i class="bi bi-telephone-fill"></i>
                      </div>
                      <div class="passport-li-about">
                        <h6>Телефон рақами:</h6>
                        <p>
                          <a href="tel:${params?.womens_activist_phone}">${params?.womens_activist_phone}</a>
                        </p>
                      </div>
                    </li>
                </ul>
              </details>
            </li>

          <li class="is-accordion">
              <details>
                <summary>
                  <div class="passport-icon">  <i class="duty-icon bi bi-receipt"></i></div>
                  <span class="summary-span"> <span style="color:#fff; font-weight:bold;">МФЙ солиқ инспектори:</span> <span> ${params?.tax_inspector ?? 'Холлиев О.Р'}</span>
                </summary>
                <ul class="inner-list">
                    <li>
                      <div class="passport-icon">
                        <i class="bi bi-telephone-fill"></i>
                      </div>
                      <div class="passport-li-about">
                        <h6>Телефон рақами:</h6>
                        <p>
                          <a href="tel:${params?.tax_inspector_phone}">${params?.tax_inspector_phone}</a>
                        </p>
                      </div>
                    </li>
                </ul>
              </details>
            </li>
            <li class="is-accordion">
              <details>
                <summary>
                  <div class="passport-icon">  <i class="duty-icon bi bi-person-heart"></i></div>
                  <span class="summary-span"> <span style="color:#fff; font-weight:bold;">Ижтмоий ходими:</span> <span> ${params?.social_employe ?? 'Сулаймонова И.М'}</span>
                </summary>
                <ul class="inner-list">
                    <li>
                      <div class="passport-icon">
                        <i class="bi bi-telephone-fill"></i>
                      </div>
                      <div class="passport-li-about">
                        <h6>Телефон рақами:</h6>
                        <p>
                          <a href="tel:${params?.social_employe_phone}">${params?.social_employe_phone}</a>
                        </p>
                      </div>
                    </li>
                </ul>
              </details>
            </li>


    </ul>
  </details>
</li>




  </ul>
 
       
       `

    }

    function renderDutyDetails(params) {
      const container = document.querySelector('.space-main-body-duty')
      if (!container || !params) return

      // <li class="alert alert-dark" role="alert">Sektorlar soni: <span>4 ${params.responsible_name} ta</span> </li>
      container.innerHTML = `
           <ul class="">
        <li class="alert alert-dark m-0" role="alert">
          <i class="duty-icon bi bi-person-badge"></i>
          МГ жавобгар: <span>${params.responsible_name}</span>
        </li>

          <li class="is-accordion">
              <details>
                <summary>
                  <div class="passport-icon">  <i class="duty-icon bi bi-person-badge"></i></div>
                  <span class="summary-span"> <span style="color:#fff; font-weight:bold;">МГ жавобгар:</span> <span> ${params?.responsible_name ?? 'Холлиев О.Р'}</span>
                </summary>
                <ul class="inner-list">
                    <li>
                      <div class="passport-icon">
                        <i class="bi bi-telephone-fill"></i>
                      </div>
                      <div class="passport-li-about">
                        <h6>Телефон рақами:</h6>
                        <p>
                          <a href="tel:${params?.responsible_phone}">${params?.responsible_phone}</a>
                        </p>
                      </div>
                    </li>
                </ul>
              </details>
            </li>



        <li class="is-accordion">
            <details>
              <summary>
                <div class="passport-icon">  <i class="duty-icon bi bi-people-fill"></i></div>
                <span class="summary-span"> <span style="color:#fff;">Шахсий таркиб:</span> <span>${params.all_staff} нафар</span>
              </summary>

              <ul class="inner-list">
                        <li class="alert alert-dark m-0" role="alert">
                      <i class="duty-icon bi bi bi-person-fill"></i>
                      Пиёда патруллар: <span>${params.walker_patrul} нафар</span>
                    </li>

                    <li class="alert alert-dark m-0" role="alert">
                      <i class="duty-icon bi bi-car-front-fill"></i>
                      Авто патруллар: <span>${params.avto_patrul} нафар</span>
                    </li>
              </ul>
            </details>
          </li>



        <li class="alert alert-dark m-0" role="alert">
          <i class="duty-icon bi bi-signpost-split"></i>
          Йўналишлар: <span>${params.patrul_types_count} та</span>
        </li>

          <li class="is-accordion">
  <details>
    <summary>
      <div class="passport-icon">
        <i class="bi bi-camera-video-fill"></i>
      </div>
      <span class="summary-span">
        <span style="color:#fff; font-weight:bold;">Камералар:</span>
        <span>${params?.count_cameras}</span>
      </span>
    </summary>

    <ul class="inner-list">
      <li>
        <div class="passport-icon">
          <i class="bi bi-camera-reels"></i>
        </div>
        <div class="passport-li-about">
          <h6>PTZ kameralar: ${params?.count_cameras}</h6>
        </div>
      </li>

      <li>
        <div class="passport-icon">
          <i class="bi bi-camera-video"></i>
        </div>
        <div class="passport-li-about">
          <h6>Panoramik kameralar (360°): 0</h6>
        </div>
      </li>

    </ul>
  </details>
</li>

        <li class="alert alert-dark m-0" role="alert">
          <i class="duty-icon bi bi-bell-fill"></i>
          Ташвиш тугмалар: <span>${params.count_sos} та</span>
        </li>

        <li class="alert alert-dark m-0" role="alert">
          <i class="duty-icon bi bi-shield-fill-check"></i>
          Хизмат ҳайвонлари: <span>${params.horse_patrul} та</span>
        </li>

        <li class="alert alert-dark m-0" role="alert">
          <i class="duty-icon bi bi-lightning-charge-fill"></i>
          Махсус воситалар: <span>${params.epikirofka_count} та</span>
        </li>

        <li class="alert alert-dark m-0" role="alert">
          <i class="duty-icon bi bi-truck-front-fill"></i>
          Техникалар: <span>${params.car_count} та</span>
        </li>
      </ul>
        `


    }



    // Viloyatlar uchun rang funksiyasi
    function getColor(shapeName) {
      const colors = {
        "Andijan Region": "#4CAF50",
        "Bukhara Region": "#FF9800",
        "Fergana Region": "#9C27B0",
        "Jizzakh Region": "#03A9F4",
        "Namangan Region": "#E91E63",
        "Navoiy Region": "#8BC34A",
        "Kashkadarya Region": "#FF5722",
        "Karakalpakstan Republic": "#795548",
        "Samarkand Region": "#2196F3",
        "Sirdaryo Region": "#607D8B",
        "Surxondaryo Region": "#00BCD4",
        "Tashkent Region": "#FFC107",
        "Khorezm Region": "#673AB7",
        "Tashkent City": "#f44336",
      };

      return colors[shapeName] || "#999";
    }




    function getMarkerImage(type) {
      switch (type) {
        case 'bozor':
          return 'https://icon-library.com/images/map-marker-icon-png/map-marker-icon-png-6.jpg';
        case 'bog':
          return 'https://cdn2.iconfinder.com/data/icons/IconsLandVistaMapMarkersIconsDemo/256/MapMarker_Marker_Outside_Chartreuse.png';
        case 'xiyobon':
          return 'https://freesvg.org/img/ts-map-pin.png';
        case 'boshqa':
          return 'https://cdn-icons-png.flaticon.com/512/6284/6284577.png';
        default:
          return '';
      }
    }






    // === POPUP ICHIDAGI TUGMA TRIGGER ===
    $(document).on('click', '.popup-camera-btn', function() {
      const btn = $(this);
      const id = String(btn.data('id')).trim();
      const popup = btn.closest('.mapboxgl-popup');

      // 🔒 1. 2 marta bosishni bloklash
      if (btn.prop('disabled')) return;

      // 🔁 2. Spinner qo‘shish va disable qilish
      btn.prop('disabled', true);
      const originalText = btn.find('.btn-text').text();
      btn.find('.btn-text').html(`
        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Юкланмоқда...
      `);

      // ⏳ 3. 1 soniyadan keyin yana aktiv holatga keltirish
      setTimeout(() => {
        btn.prop('disabled', false);
        btn.find('.btn-text').text(originalText);
      }, 3000);

      // 🚀 4. Popupni yopish
      if (popup.length) {
        const popupInstance = popup[0].parentNode.__mapboxgl_popup;
        if (popupInstance) popupInstance.remove();
      }

      // 🧠 5. Kamera tanlandi – asosiy ro‘yxatdan mosini topib, click trigger
      const target = $(`#change_camera a[data-id="${id}"]`);
      if (target.length) {
        
        target.trigger('click');
      } else {
        console.warn(`Камера ИД ${id} учун элемент топилмади`);
      }
    });

    $(document).on('click', '.popup-body-camera-btn', function() {
      const btn = $(this);
      const id = String(btn.data('id')).trim();
      const popup = btn.closest('.mapboxgl-popup');

      // 🔒 1. 2 marta bosishni bloklash
      if (btn.prop('disabled')) return;

      // 🔁 2. Spinner qo‘shish va disable qilish
      btn.prop('disabled', true);
      const originalText = btn.find('.btn-text').text();
      btn.find('.btn-text').html(`
        <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Юкланмоқда...
      `);

      // ⏳ 3. 1 soniyadan keyin yana aktiv holatga keltirish
      setTimeout(() => {
        btn.prop('disabled', false);
        btn.find('.btn-text').text(originalText);
      }, 3000);

      // 🚀 4. Popupni yopish
      if (popup.length) {
        const popupInstance = popup[0].parentNode.__mapboxgl_popup;
        if (popupInstance) popupInstance.remove();
      }

      // 🧠 5. Kamera tanlandi – asosiy ro‘yxatdan mosini topib, click trigger
      const target = $(`#body_change_camera a[data-id="${id}"]`);
      if (target.length) {
        target.trigger('click');
      } else {
        console.warn(`Камера ИД ${id} учун элемент топилмади`);
      }
    });

      // camera

      var iWind = 0;
      let camera_status_interval_id;
      let camera_status_interval_time = 60000;

      //PTZ CONTROLLER FUNCTIONS
      $("#controller").hide();

      function control_ptz(cam_code, command) {
          $.ajax({
              type: "GET",
              url: `ptz.php?cam_code=${cam_code}&command=${command}`,
              dataType: "json",
              encode: true,
              success: function(data) {
                  console.log("up");
              }
          })
      }

      $(document).on('keydown', function(e) {
          if (e.key === '1') control_ptz(cam_idx_code, 4);
          if (e.key === '2') control_ptz(cam_idx_code, 3);
          if (e.key === '3') control_ptz(cam_idx_code, 2);
          if (e.key === '4') control_ptz(cam_idx_code, 5);

          if (e.key === '6') control_ptz(cam_idx_code, 1);
          if (e.key === '7') control_ptz(cam_idx_code, 6)
          if (e.key === '8') control_ptz(cam_idx_code, 7);
          if (e.key === '9') control_ptz(cam_idx_code, 0);

          // check if the key pressed is +
          if (e.keyCode === 107) control_ptz(cam_idx_code, 8);
          // check if the key pressed is -
          if (e.keyCode === 109) control_ptz(cam_idx_code, 9);
      });

      let cam_idx_code;
      $(".ptz_up_left").click(function(e) { control_ptz(cam_idx_code, 6) })
      $(".ptz_up").click(function(e) { control_ptz(cam_idx_code, 7) })
      $(".ptz_up_right").click(function(e) { control_ptz(cam_idx_code, 0) })
      $(".ptz_left").click(function(e) { control_ptz(cam_idx_code, 5) })
      $(".ptz_right").click(function(e) { control_ptz(cam_idx_code, 1) })
      $(".ptz_down_left").click(function(e) { control_ptz(cam_idx_code, 4) })
      $(".ptz_down").click(function(e) { control_ptz(cam_idx_code, 3) })
      $(".ptz_down_right").click(function(e) { control_ptz(cam_idx_code, 2) })

      $(".ptz_zoom_in").click(function(e) { control_ptz(cam_idx_code, 8) })
      $(".ptz_zoom_out").click(function(e) { control_ptz(cam_idx_code, 9) })

      //初始化插件
      var jsDecoder = new JSPlugin({
          szId: "playWind",
          iType: 2,
          iWidth: 500,
          iHeight: 350,
          iMaxSplit: 4,
          iCurrentSplit: 1,
          szBasePath: "./dist",
          oStyle: {
              border: "#343434",
              borderSelect: "transparent",
              background: "#000 url('/assets/online.svg') no-repeat center center;"
          }
      });

      let counter = 0;

      $('#markerModal').on('hidden.bs.modal', function() {
          $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/online.svg") no-repeat center center');
          $("#controller").hide();
          // $(".camera_active").html(`1`);
          $('#obj_camera_name').html('');
          counter = 0;
          jsDecoder.JS_Stop(iWind).then(function() {
              console.log("stop success");
          }, function() {
              console.log("stop failed");
          });
          console.log("clodsed all camera");
          // clearInterval(camera_status_interval_id);
      })

      // async function get_camera_status(camera_idx) {
      //     try {
      //         const response = await $.ajax({
      //             type: "GET",
      //             url: `camstatus.php?act=get_camera_status_dep&camindex=${camera_idx}`,
      //             dataType: "json"
      //         });
      //         return response.status == 1;
      //     } catch (error) {
      //         console.error(error);
      //         return false;
      //     }
      // }

      let is_played = false;
      async function get_camera() {
          $('#change_camera').empty();
          $('#body_change_camera').empty();
          $(".camera_length").html(fetched_camera.length);
          $(".body_camera_length").html(fetched_body?.length || 0);

          arrangeWindow(1);
          fetched_camera.forEach((item, index) => {
              if (item.status == 1) {
                  $('#change_camera').append(`<a href="#" class="dropdown-item camera_item g_status" tabindex="-1" data-id="${item.id}" data-toggle="tab" 
                      style="font-size:22px;" ptz="${item.isptz}" cam_index="${item.cam_index}" el_count="${index}" 
                      status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
                  
              } else {
                  $('#change_camera').append(`<a href="#" class="dropdown-item camera_item r_status" tabindex="-1" data-id="${item.id}"
                      data-toggle="tab" style="font-size:22px;" ptz="${item.isptz}" cam_index="${item.cam_index}" 
                      el_count="${index}" status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
              }
          })
  
          fetched_body?.forEach((item, index) => {
              if (item.status == 1) {
                  $('#body_change_camera').append(`<a href="#" class="dropdown-item camera_item g_status" tabindex="-1" data-id="${item.id}" data-toggle="tab" 
                      style="font-size:22px;" ptz="0" cam_index="${item.cam_index}" el_count="${index}" 
                      status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
                  
              } else {
                  $('#body_change_camera').append(`<a href="#" class="dropdown-item camera_item r_status" tabindex="-1" data-id="${item.id}" 
                      data-toggle="tab" style="font-size:22px;" ptz="0" cam_index="${item.cam_index}" 
                      el_count="${index}" status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
              }
          })
          $("#body_current_camera").html(fetched_body?.[0]?.comment);




          $("#current_camera").html(fetched_camera[0].comment);
          let playURL = fetched_camera[0].url;
          // const current_status = await get_camera_status(fetched_camera[0].cam_index);
          if (fetched_camera[0].status) {
              if (fetched_camera[0].isptz == 1) $("#controller").show();
              jsDecoder.JS_Play(playURL, { playURL }, 0).then(
                  function() { 
                      cam_idx_code = fetched_camera[0].cam_index;
                      is_played = true; 
                      $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/online.svg") no-repeat center center'); 
                  },
                  function() { 
                      console.log("realplay failed");
                      is_played = false;
                      $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                      StopRealPlayAll();
                  });
              $("#current_camera").html(fetched_camera[0].comment);
          } else {
              is_played = false; 
              $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
          }

          // $(".camera_active").html(`1`);
          $(".camera_length").html(fetched_camera.length);

          // camera_status_interval_id = setInterval(() => {
          //     fetched_camera.forEach(async (item, index) => {
          //         const current_status = await get_camera_status(item.cam_index);
          //         var classValue = $(`#change_camera a[cam_index="${item.cam_index}"]`).attr('class');
          //         var remove_class = classValue.split(' ')[2];
          //         if (current_status) {
          //             $(`#change_camera a[cam_index="${item.cam_index}"]`).removeClass(remove_class).addClass('g_status');
          //         } else {
          //             $(`#change_camera a[cam_index="${item.cam_index}"]`).removeClass(remove_class).addClass('r_status');
          //         }
          //     })
          // }, camera_status_interval_time);
      }
      async function get_body_camera() {
          $('#body_change_camera').empty();
          arrangeWindow(1);
          if(!fetched_body || !fetched_body.length) return
          fetched_body?.forEach((item, index) => {
              if (item.status == 1) {
                  $('#body_change_camera').append(`<a href="#" class="dropdown-item camera_item g_status" tabindex="-1" data-toggle="tab" 
                      style="font-size:22px;" ptz="0" cam_index="${item.cam_index}" el_count="${index}" 
                      status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
                  
              } else {
                  $('#body_change_camera').append(`<a href="#" class="dropdown-item camera_item r_status" tabindex="-1" 
                      data-toggle="tab" style="font-size:22px;" ptz="0" cam_index="${item.cam_index}" 
                      el_count="${index}" status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
              }
          })
          
          $("#body_current_camera").html(fetched_body[0].comment);
          let playURL = fetched_body[0].url;
          if (fetched_body[0].status) {
              jsDecoder.JS_Play(playURL, { playURL }, 0).then(
                  function() { 
                      cam_idx_code = fetched_body[0].cam_index;
                      is_played = true; 
                      $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/online.svg") no-repeat center center'); 
                  },
                  function() { 
                      console.log("realplay failed");
                      is_played = false;
                      $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                  });
              $("#body_current_camera").html(fetched_body[0].comment);
          } else {
              is_played = false; 
              $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
          }

          $(".body_camera_length").html(fetched_body.length);
      }

      $(document).on('click', '#change_camera a', async function() {
          $("#current_camera").html($(this).text());
          $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/online.svg") no-repeat center center');
          $("#controller").hide();
          
          let ptz = $(this).attr("ptz");
          let cam_index = $(this).attr("cam_index");
          let el_count = parseInt($(this).attr("el_count"));
          let playURL = $(this).attr("playURL");
          let status = $(this).attr("status");
          let this_cam_item = $(this);
          var classValue = this_cam_item.attr('class');
          var remove_class = classValue.split(' ')[2];
          // $(".camera_active").html(el_count + 1);

          // const current_status = await get_camera_status(cam_index);
          const current_status = 1;
          if (current_status) {
            console.log('working');
            
            this_cam_item.removeClass(remove_class).addClass('g_status');
            if (is_played) {
                jsDecoder.JS_Stop(0).then(function() {
                    StopRealPlayAll();
                    console.log("stop success");
                    jsDecoder.JS_Play(playURL, { playURL }, 0).then(
                        function() { 
                            console.log("realplay success");
                            // $(".camera_active").html(`${el_count + 1}`)
                            cam_idx_code = cam_index;
                            if (ptz == 1) $("#controller").show();
                            is_played = true; 
                        },
                        function() { 
                            console.log("realplay failed");
                            is_played = false;
                            $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                            StopRealPlayAll();
                        }
                    );
                }, function() {
                    StopRealPlayAll();
                    console.log("stop failed");
                    $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                });
            } else {
                if (ptz == 1) $("#controller").show();
                jsDecoder.JS_Play(playURL, { playURL }, 0).then(
                    function() { 
                        console.log("realplay success");
                        is_played = true;
                        cam_idx_code = cam_index;
                    },
                    function() { 
                        console.log("realplay failed");
                        is_played = false;
                        $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                        StopRealPlayAll();
                    }
                );
            }
          } else {
              this_cam_item.removeClass(remove_class).addClass('r_status');
              $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
              if (is_played) {
                  jsDecoder.JS_Stop(iWind).then(
                      function() { is_played = false; console.log("stop success"); }, 
                      function() { console.log("stop failed"); });
                  StopRealPlayAll();
              }
          }
      });
      $(document).on('click', '#body_change_camera a', async function() {
          $("#body_current_camera").html($(this).text());
          $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/online.svg") no-repeat center center');
          $("#controller").hide();
          
          let ptz = $(this).attr("ptz");
          let cam_index = $(this).attr("cam_index");
          let el_count = parseInt($(this).attr("el_count"));
          let playURL = $(this).attr("playURL");
          let status = $(this).attr("status");
          let this_cam_item = $(this);
          var classValue = this_cam_item.attr('class');
          var remove_class = classValue.split(' ')[2];
          // $(".camera_active").html(el_count + 1);

          // const current_status = await get_camera_status(cam_index);
          const current_status = 1;
          if (current_status) {
            console.log('working');
            
            this_cam_item.removeClass(remove_class).addClass('g_status');
            if (is_played) {
                jsDecoder.JS_Stop(0).then(function() {
                    StopRealPlayAll();
                    console.log("stop success");
                    jsDecoder.JS_Play(playURL, { playURL }, 0).then(
                        function() { 
                            console.log("realplay success");
                            // $(".camera_active").html(`${el_count + 1}`)
                            cam_idx_code = cam_index;
                            if (ptz == 1) $("#controller").show();
                            is_played = true; 
                        },
                        function() { 
                            console.log("realplay failed");
                            is_played = false;
                            $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                            StopRealPlayAll();
                        }
                    );
                }, function() {
                    StopRealPlayAll();
                    console.log("stop failed");
                    $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                });
            } else {
                if (ptz == 1) $("#controller").show();
                jsDecoder.JS_Play(playURL, { playURL }, 0).then(
                    function() { 
                        console.log("realplay success");
                        is_played = true;
                        cam_idx_code = cam_index;
                    },
                    function() { 
                        console.log("realplay failed");
                        is_played = false;
                        $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
                        StopRealPlayAll();
                    }
                );
            }
          } else {
              this_cam_item.removeClass(remove_class).addClass('r_status');
              $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
              if (is_played) {
                  jsDecoder.JS_Stop(iWind).then(
                      function() { is_played = false; console.log("stop success"); }, 
                      function() { console.log("stop failed"); });
                  StopRealPlayAll();
              }
          }
      });
      
      $('.unmute').hide();
      $('.mute').click(function(e) {
          var iRet = jsDecoder.JS_OpenSound(iWind);
          if (iRet == 0) {
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

      function stop() {
          jsDecoder.JS_Stop(iWind).then(function() {
              console.log("stop success");
          }, function() {
              var html = "stop failed";
              document.getElementById("error").innerHTML = "<div>" + html + "</div>";
              console.log("stop failed");
          });
      }

      function arrangeWindow(i) {
          jsDecoder.JS_ArrangeWindow(i);
      }

      function CapturePicture(szType) {
          jsDecoder.JS_CapturePicture(iWind, "img", szType).then(function() {
              console.log("CapturePicture success");
          }, function() {
              var html = "CapturePicture failed";
              document.getElementById("error").innerHTML = "<div>" + html + "</div>";
              console.log("CapturePicture failed");
          });
      }

      function OpenSound() {
          var iRet = jsDecoder.JS_OpenSound(iWind);
          if (iRet == 0) alert("Ушбу камерада овоз бор, уни ёқишни тасдиқлайсизми?");
          else {
              alert("Ушбу камерада овоз йўқ");
              return;
          }
      }

      function CloseSound() {
          jsDecoder.JS_CloseSound(iWind)
      }

      function SetVolume() {
          iVolume = parseInt(document.getElementById("volume").value);
          jsDecoder.JS_SetVolume(iWind, iVolume);
      }

      function GetVolume() {
          //iVolume = parseInt(document.getElementById("volume").value);
          jsDecoder.JS_GetVolume(iWind, function(i) {
              document.getElementById("error").innerHTML = "<div>音量：" + i + "</div>";
              document.getElementById("volume").value = i;
          });
      }

      function StopRealPlayAll() {
          jsDecoder.JS_StopRealPlayAll()
      }

      function fullSreen() {
          jsDecoder.JS_FullScreenDisplay(true);
      }

      function fullScreenSingle() {
          jsDecoder.JS_FullScreenSingle(iWind);
      }

      function GetSelectWndInfo(xml) {
          console.log(xml);
          iWind = xml;
      }

      window.onresize = function() {
          jsDecoder.JS_Resize(615, 300);
      }




    });

  {/literal}
</script>



{include file="footer.tpl"}