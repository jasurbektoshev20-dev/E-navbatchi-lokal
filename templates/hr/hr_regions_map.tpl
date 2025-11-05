{include file="header.tpl"}

	<link href="/assets/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
	<link href="/assets/global_assets/css/icons/material/styles.min.css" rel="stylesheet" type="text/css">

	<link href="/assets/global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">



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
      color: #000;
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

    .space-main-body-passport ul li img {
      width: 100%;
      height: 450px;
      object-fit: cover;
    }

    .space-main-body-passport ul li {
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .space-main-body-passport ul li h4 {
      margin: 0%;
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
      width: 100%; height: 40vh;
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
    
    #controller{
        display: flex;
        border-radius: 20px;
        justify-content: space-around;
        align-items: center;
        position: fixed;
        top: 80%;
        left: 89%;
        padding: 10px; 
        background:#254063e3;
        width: 200px; 
        height: 200px;
        z-index: 999999999;
    }
    .zoom_opt{
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
          alt="Bozor uchun marker">
        <p>Bozor-<span>0</span> ta</p>
      </div>
      <div class="map-about-box map-about-box-xiyobon">
        <img src="https://www.nicepng.com/png/full/15-159490_small-google-maps-marker-blue.png"
          alt="Xiyobon uchun marker">
        <p>Xiyobon-<span>0</span> ta</p>
      </div>
      <div class="map-about-box map-about-box-bog">
        <img src="https://images.freeimages.com/fic/images/icons/2463/glossy/512/location.png"
          alt="Isritohat bog'i uchun marker">
        <p>Isritohat bog'i-<span>0</span> ta</p>
      </div>
      <div class="map-about-box map-about-box-boshqa">
        <img src="https://cdn-icons-png.flaticon.com/512/6284/6284577.png" alt="Boshqa joy uchun marker">
        <p>Boshqa joy-<span>0</span> ta</p>
      </div>
    </div>
  </div>

  <div class="filters bg-white rounded shadow" style="z-index: 2000;">
    <div>
      <label for="viloyatSelect" class="form-label">Hududlar</label>
      <select id="viloyatSelect" class="form-select">
        <option value="">Hududni tanlang</option>
        {foreach from=$Regions item=Item1 key=ikey1}
          <option value="{$Item1.id}">{$Item1.name}</option>
        {/foreach}
      </select>
    </div>

    <div>
      <label for="objectTypeSelect" class="form-label">Obyekt turi</label>
      <select id="objectTypeSelect" class="form-select">
        <option value="">Jami obyektlar</option>
        {foreach from=$ObjectTypes item=Item1 key=ikey1}
          <option value="{$Item1.id}">{$Item1.name}</option>
        {/foreach}
      </select>
    </div>

    <div>
      <label for="objectSelect" id="objectLabelLabel" class="form-label">Obyektlar</label>
      <select id="objectSelect" class="form-select">
        <option value="">Obyektni tanlang</option>
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
          <h2 class="modal-title position-absolute start-50 translate-middle-x" id="markerModalTitle">
            Marker nomi
          </h2>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <div class="modal-body">
          {* <img id="markerModalImg" src="" alt="" class="img-fluid mb-3" style="max-height:200px;">
              <p id="markerModalViloyat"></p>
              <p id="markerModalType"></p>
              <p id="markerModalInfo"></p> *}
          <div class="space-main-modal-box">
            <div class="row">
              {*  *}
              <div class="col-6">
                <div class="space-main-head">
                  <h4>Pasport Ma'lumotlari</h4>
                </div>
                <div id="dialogMap"></div>
                <div class="space-main-body-passport">
                 
                </div>
              </div>

              <div class="col-6">
                  <div>
                    <div class="space-main-head">
                      <h4>MG tomonidan ajratilgan kuch vositalar</h4>
                    </div>
                    <div class="space-main-body-duty">
                      
                    </div>
                  </div>

                    <div class="space-main-body-umumu">
                      <div class="space-main-head">
                        <h4 class="m-0">Kameralar</h4>
                      </div>
                      <div class="row text-center">
                          <div id="playWind" style="width: 800px; height: 400px;"></div>
                          <div class="button_box" style="width: 100%;">
                              <div class="items">
                                  <div class="d-flex gap-1 px-2 mt-2" style="align-items:center;">
                                      <button class="btn btn-danger" type="button" onClick="fullSreen()">
                                          <i class="icon-screen-full"></i>
                                      </button>
                                      <button class="btn btn-warning ml-2 unmute" type="button">
                                          <i class="icon-volume-medium"></i>
                                      </button>
                                      <button class="btn btn-info ml-2 mute" type="button">
                                          <i class="icon-volume-mute5"></i>
                                      </button>
                                      <button class="btn btn-warning ml-2" type="button" onClick="CapturePicture('JPEG')">
                                          <i class="icon-camera"></i>
                                      </button>
                                      <span class="text-yellow ml-2" style="font-size: 22px;"><span class="current_camera"></span>:
                                          &nbsp; <span class="text-white camera_active"></span></span> &nbsp;&nbsp;&nbsp;
                                      <span class="text-yellow" style="font-size: 22px;"><span class="camera_length"></span>: &nbsp;
                                          <span class="text-white camera_length"></span></span>
                                      <div class="col-3">
                                          <ul class="nav nav-pills mb-0">
                                              <li class="nav-item dropdown dropup">
                                                  <a href="#" id="current_camera" class="dropdown-toggle" data-toggle="dropdown"><span class="select"></span></a>
                                                  <div class="dropdown-menu" style="max-height: 300px; overflow-y: scroll;" id="change_camera"></div>
                                              </li>
                                          </ul>
                                      </div>
                                      <div id="error" style="color:red"></div>
                                  </div>
                              </div>
                          </div>
                      </div>
                      {* <div class="row">
                        <div class="col-12">
                          <video width="100%" height="270px" autoplay loop controls muted>
                            <source src="/templates/hr/videos/video-4.mp4" type="video/mp4">
                          </video>
                        </div>
                        <div class="col-12">
                          <video width="100%" height="270px" autoplay loop controls muted>
                            <source src="/templates/hr/videos/video-5.mp4" type="video/mp4">
                          </video>
                        </div>
                        <div class="col-12">
                          <video width="100%" height="270px" autoplay loop controls muted>
                            <source src="/templates/hr/videos/video-6.mp4" type="video/mp4">
                          </video>
                        </div>
                      </div> *}
                    </div>
                </div>

            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="controller" class="row text-center modal fade show" tabindex="-1" aria-modal="true" role="dialog" style="display: none;">
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
<link
  rel="stylesheet"
  href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
  type="text/css"
/>


<script>
    var AJAXPHP = "ajax{$AddURL}.php";
    var HRAJAXPHP = "hrajax{$AddURL}.php";
  {literal}

    
    document.addEventListener("DOMContentLoaded", function() {


    let region_id, object_id, object_type

      
    // O‘zbekiston markazi koordinatalari
    const uzbekistanCenter = [41.2995, 69.2401]; // Toshkent markazi

    // Xaritani yaratish
    const map = L.map("uzbMap", {
      center: [41.6384, 64.0202],
      zoom: 7,
      // layers: L.tileLayer(`http://10.19.7.4:8080/tile/{z}/{x}/{y}.png`, { maxZoom: 19 }),
      layers: L.tileLayer(`http://10.100.9.145:8080/tile/{z}/{x}/{y}.png`, { maxZoom: 19 }),
      // layers: L.tileLayer(`https://tile.openstreetmap.org/{z}/{x}/{y}.png`, { maxZoom: 19 }),
    });
    // Marker ikonkalari
    const markerIcons = {
      '1': L.icon({ iconUrl: 'https://icons.iconarchive.com/icons/paomedia/small-n-flat/512/map-marker-icon.png',
        iconSize: [30, 30] }),
      '3': L.icon({ iconUrl: 'https://images.freeimages.com/fic/images/icons/2463/glossy/512/location.png',
        iconSize: [35, 35] }),
      '2': L.icon({ iconUrl: 'https://www.nicepng.com/png/full/15-159490_small-google-maps-marker-blue.png',
        iconSize: [20, 35],  }),
      '4': L.icon({ iconUrl: 'https://cdn-icons-png.flaticon.com/512/6284/6284577.png', iconSize: [30, 30],
         })
    };

    // GeoJSONni yuklash
    fetch("/templates/hr/json/uz_regions.geojson")
      .then((res) => res.json())
      .then((data) => {
        const regionsLayer = L.geoJSON(data, {
          style: (feature) => ({
            color: "#333", // chegara
            weight: 1.5,
            fillColor: getColor(feature.properties.shapeName),
            fillOpacity: 0.5,
          }),
          onEachFeature: (feature, layer) => {
            const name = feature.properties.shapeName;
            layer.bindPopup(`<b>${name}</b>`);

            // Faqat bosilganda ishlaydi
            layer.on("click", (e) => {
              const selected = feature.properties.shapeName;
              map.fitBounds(e.target.getBounds());
              console.log(`Tanlangan viloyat: ${selected}`);
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

    getObjects()
    function getObjects(){
      
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
              if(!response && !response.length) return
      
              const bozor = response.filter(item => item.object_type == 1)
              const bog = response.filter(item => item.object_type == 3)
              const xiyobon = response.filter(item => item.object_type == 2)
              const boshqa = response.filter(item => item.object_type == 4)

              $('.map-about-box-bozor span').html(bozor.length)
              $('.map-about-box-bog span').html(bog.length)
              $('.map-about-box-xiyobon span').html(xiyobon.length)
              $('.map-about-box-boshqa span').html(boshqa.length)


              // LayerGroup
              const allMarkers = L.layerGroup().addTo(map);

              // Markerlarni LayerGroup ga qo'shamiz
              response.forEach(m => {
                const marker = L.marker([m.lat, m.long], { icon: markerIcons[m.object_type] })
                  .bindTooltip(m.object_name, { direction: 'top', offset: [0, -10] });

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
                      if(!response) return
                      
                      $("#markerModal").modal("show");

                      renderDialogMap(response?.data)
                      renderPassportDetails(response?.data)
                      renderDutyDetails(response?.data?.routine)
                      
                    },
                    error: function(xhr, status, error) {
                      console.error('AJAX error:', error);
                    }
                  })
                });
              });

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





    function renderDialogMap(params) {
      const mapContainer = document.querySelector('#dialogMap')
      if(!mapContainer) return
      let dialogMap = null

      const MAPBOX_ACCESS_TOKEN =
        'pk.eyJ1Ijoic2hhdmthdDAxIiwiYSI6ImNsOHJjcmo2azA2dWEzb254amM0dHlzcjEifQ.HNCCG0V7PLGSnAKUBZWzuw';

      let map_center = [69.276138, 41.312123]
      mapboxgl.accessToken = MAPBOX_ACCESS_TOKEN;
      dialogMap = new mapboxgl.Map({
        container: 'dialogMap',
        style: `mapbox://styles/mapbox/standard`,
        center: map_center,
        zoom: 5.5,
        pitch: 0,
        antialias: true
      });

      const geocoder = new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        marker: false,
        placeholder: 'Search Address',
        mapboxgl: mapboxgl
      });

      dialogMap.addControl(new mapboxgl.NavigationControl());
      setTimeout(() => {
        dialogMap.resize();
      }, 300);
    }

    function renderPassportDetails(params){
      const container = document.querySelector('.space-main-body-passport')
      if(!container || !params) return

      // <li>
      //   <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
      //         class="bi bi-dice-1" viewBox="0 0 16 16">
      //         <circle cx="8" cy="8" r="1.5" />
      //         <path
      //           d="M13 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zM3 0a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V3a3 3 0 0 0-3-3z" />
      //       </svg></span> Hudud joylashgan mahalla: </h6>
      //   <p>Rohat mahallasi</p>
      // </li>
      // <li>
      //   <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
      //         class="bi bi-shop-window" viewBox="0 0 16 16">
      //         <path
      //           d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5m2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5" />
      //       </svg></span> Savdo obyektlar soni: </h6>
      //   <p>70 ta</p>
      // </li>
       container.innerHTML = `
        <ul>
          <li>
            <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                  class="bi bi-geo-alt" viewBox="0 0 16 16">
                  <path
                    d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10" />
                  <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                </svg></span> Manzili: </h6>
            <p> ${params.address} </p>
          </li>
          <li>
            <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                  class="bi bi-telephone-forward" viewBox="0 0 16 16">
                  <path
                    d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708" />
                </svg></span>Administrator telefon raqami: </h6>
            <p>${params.admin_phone}</p>
          </li>
          <li>
            <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                  class="bi bi-border-all" viewBox="0 0 16 16">
                  <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z" />
                </svg></span>Maydoni: </h6>
            <p> ${params.area} m²</p>
          </li>
          <li>
            <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                  class="bi bi-door-open" viewBox="0 0 16 16">
                  <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1" />
                  <path
                    d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z" />
                </svg></span>Kirish chiqish eshiklar soni: </h6>
            <p>${params.count_doors} ta</p>
          </li>
          <li>
            <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                  class="bi bi-person" viewBox="0 0 16 16">
                  <path
                    d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z" />
                </svg></span>Bozor rahbari: </h6>
            <p>${params.object_head} ${params.head_phone}</p>
          </li>
          <li>
            <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                  class="bi bi-person" viewBox="0 0 16 16">
                  <path
                    d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z" />
                </svg></span>Bozor uchastkavoyi: </h6>
            <p>${params.police_name} ${params.police_phone}</p>
          </li>
          <li>
            <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                  class="bi bi-telephone-forward" viewBox="0 0 16 16">
                  <path
                    d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708" />
                </svg></span> Hamkor tashkilotlar aloqa: </h6>
            <p> ${params.cooperate}</p>
          </li>

        </ul>
       `
      
    }
    function renderDutyDetails(params){
      const container = document.querySelector('.space-main-body-duty')
      if(!container || !params) return

      // <li class="alert alert-dark" role="alert">Sektorlar soni: <span>4 ${params.responsible_name} ta</span> </li>
      container.innerHTML = `
        <ul class="d-flex flex-wrap gap-3">
          <li class="alert alert-dark" role="alert">MG javobgar: <span>${params.responsible_name} </span>
          </li>
          <li class="alert alert-dark" role="alert">Jami shaxsiy tarkib: <span>${params.all_staff} nafar</span> </li>
          <li class="alert alert-dark" role="alert">Piyoda patrullar: <span>${params.walker_patrul} nafar</span> </li>
          <li class="alert alert-dark" role="alert">Avto patrullar: <span>${params.avto_patrul} nafar</span> </li>
          <li class="alert alert-dark" role="alert">Yo'nalishlar: <span>${params.patrul_types_count} ta</span> </li>
          <li class="alert alert-dark" role="alert">Kameralar soni: <span>${params.count_cameras} ta</span> </li>
          <li class="alert alert-dark" role="alert">Tashvish tugmalar soni: <span>${params.count_sos} ta</span> </li>
          <li class="alert alert-dark" role="alert">Xizmat hayvonlari: <span>${params.horse_patrul} ta</span> </li>
          <li class="alert alert-dark" role="alert">Maxsus vositalar soni: <span>${params.epikirofka_count} ta</span> </li>
          <li class="alert alert-dark" role="alert">Texnikalar: <span>${params.car_count} ta</span></li>
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



 
    });

  {/literal}
</script>


<script src="/assets/hls.js"></script>

<script src="/dist/jsPlugin-1.2.0.min.js"></script>
<script src="/dist/polyfill2.js"></script>
<script src="/dist/cryptico.min.js"></script>
<script src="/dist/uuid.js"></script>
<script src="/dist/jquery.cookie.js"></script>

<script>
    {literal}
        //外部回调
      document.addEventListener("DOMContentLoaded", function() {
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
            iWidth: 800,
            iHeight: 400,
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
            $(".camera_active").html(`1`);
            $('#obj_camera_name').html('');
            counter = 0;
            jsDecoder.JS_Stop(iWind).then(function() {
                console.log("stop success");
            }, function() {
                console.log("stop failed");
            });
            console.log("clodsed all camera");
            clearInterval(camera_status_interval_id);
        })

        async function get_camera_status(camera_idx) {
            try {
                const response = await $.ajax({
                    type: "GET",
                    url: `camstatus.php?act=get_camera_status_dep&camindex=${camera_idx}`,
                    dataType: "json"
                });
                return response.status == 1;
            } catch (error) {
                console.error(error);
                return false;
            }
        }

        let is_played = false;
        async function get_camera() {
            $('#change_camera').empty();
            arrangeWindow(1);
            $("#camera_modal").modal("show");
            fetched_camera.forEach((item, index) => {
                if (item.status == 1) {
                    $('#change_camera').append(`<a href="#" class="dropdown-item camera_item g_status" tabindex="-1" data-toggle="tab" 
                        style="font-size:22px;" ptz="${item.isptz}" cam_index="${item.cam_index}" el_count="${index}" 
                        status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
                    
                } else {
                    $('#change_camera').append(`<a href="#" class="dropdown-item camera_item r_status" tabindex="-1" 
                        data-toggle="tab" style="font-size:22px;" ptz="${item.isptz}" cam_index="${item.cam_index}" 
                        el_count="${index}" status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
                }
            })
            console.log(fetched_camera[0])
            $("#current_camera").html(fetched_camera[0].comment);
            let playURL = fetched_camera[0].url;
            const current_status = await get_camera_status(fetched_camera[0].cam_index);
            if (current_status) {
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

            $(".camera_active").html(`1`);
            $(".camera_length").html(fetched_camera.length);

            camera_status_interval_id = setInterval(() => {
                fetched_camera.forEach(async (item, index) => {
                    const current_status = await get_camera_status(item.cam_index);
                    var classValue = $(`#change_camera a[cam_index="${item.cam_index}"]`).attr('class');
                    var remove_class = classValue.split(' ')[2];
                    if (current_status) {
                        $(`#change_camera a[cam_index="${item.cam_index}"]`).removeClass(remove_class).addClass('g_status');
                    } else {
                        $(`#change_camera a[cam_index="${item.cam_index}"]`).removeClass(remove_class).addClass('r_status');
                    }
                })
            }, camera_status_interval_time);
        }
        async function get_body_camera() {
            $('#change_camera').empty();
            arrangeWindow(1);
            $("#camera_modal").modal("show");
            fetched_body.forEach((item, index) => {
                if (item.status == 1) {
                    $('#change_camera').append(`<a href="#" class="dropdown-item camera_item g_status" tabindex="-1" data-toggle="tab" 
                        style="font-size:22px;" ptz="${item.isptz}" cam_index="${item.cam_index}" el_count="${index}" 
                        status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
                    
                } else {
                    $('#change_camera').append(`<a href="#" class="dropdown-item camera_item r_status" tabindex="-1" 
                        data-toggle="tab" style="font-size:22px;" ptz="${item.isptz}" cam_index="${item.cam_index}" 
                        el_count="${index}" status="${item.status}" playURL="${item.url}">${item.comment}</a>`)
                }
            })
            
            $("#current_camera").html(fetched_body[0].comment);
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
                $("#current_camera").html(fetched_body[0].comment);
            } else {
                is_played = false; 
                $('.parent-wnd > div:first-child').css('background', '#000 url("/assets/offline.svg") no-repeat center center');
            }

            $(".camera_active").html(`1`);
            $(".camera_length").html(fetched_body.length);
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

            const current_status = await get_camera_status(cam_index);
            if (current_status) {
                this_cam_item.removeClass(remove_class).addClass('g_status');
                if (is_played) {
                    jsDecoder.JS_Stop(0).then(function() {
                        StopRealPlayAll();
                        console.log("stop success");
                        jsDecoder.JS_Play(playURL, { playURL }, 0).then(
                            function() { 
                                console.log("realplay success");
                                $(".camera_active").html(`${el_count + 1}`)
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
            jsDecoder.JS_Resize(800, 400);
        }
      })
    {/literal}
</script>



{include file="footer.tpl"}