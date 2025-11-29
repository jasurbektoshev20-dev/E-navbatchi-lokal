{include file="header.tpl"}

<link href="/assets/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
<link href="/assets/global_assets/css/icons/material/styles.min.css" rel="stylesheet" type="text/css">

<link href="/assets/global_assets/css/icons/fontawesome/styles.min.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">



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


<style>
  {literal}
    /* mpg style */
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
            position: absolute;
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
            width: 660px;
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
 


  /* region object style */
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
     width: 35px;
      height: 55px;
      object-fit: cover;
    }

    .map-icon-about .map-about-box-xiyobon img {
      width: 35px;
      height: 55px;
      object-fit: cover;
    }


    /* .filters {
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
    } */

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
      position: relative;
    }

    #playWind .parent-wnd {
      text-align: center !important;
    }

      
    #playWind2 .parent-wnd {
      display: flex;
      flex-direction: column;
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
  font-size: 20px !important;
  font-weight: 600;

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
/* 
.filter-mpg{
  position: absolute;
  right: 30px;
  top: 0;
  width: 400px;
}

.filter-mpg .card{
  width: 400px;
}

.filter-mpg .card-body{
  width: 400px;
} */

/* FILTER TOGGLE BUTTON */
.filter-toggle-btn {
  position: absolute;
  top: 35px;
  left: 70px;
  background: rgba(0,0,0,0.6);
  color: #38BDF8;
  border: 1px solid rgba(56,189,248,0.4);
  padding: 8px 16px;
  font-size: 15px;
  border-radius: 8px;
  backdrop-filter: blur(6px);
  cursor: pointer;
  z-index: 150;
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
/* Panelni boshlang'ich holatda yashiramiz */
.hidden-panel {
    opacity: 0;
    /* transform: translateX(40px); */
    pointer-events: none;
}


/* Card styling — qoraga mos premium ko‘rinish */
.filter-mpg .card {
  background: rgba(0,0,0,0.45);
  border-radius: 18px;
  border: 1px solid rgba(56,189,248,0.3);
  backdrop-filter: blur(10px);
  box-shadow: 0 0 20px rgba(0,0,0,0.7);
}

.stylish-card {
  width: 450px;
  /* background: #1e293b; /* dark slate */
  /* border-radius: 14px; */
  /* box-shadow: 0 8px 20px rgba(0, 0, 0, 0.45); */
  transition: 0.3s ease;
}

.stylish-card:hover {
  /* transform: translateY(-6px);
  box-shadow: 0 14px 35px rgba(0, 0, 0, 0.6); */
}

/* Rasm */
.staff-photo {
  width: 110px;
  height: 110px;
  object-fit: cover;
  border-radius: 12px;
  border: 2px solid rgba(255, 255, 255, 0.15);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
}

/* Xodim nomi */
.staff-name {
  font-weight: 700;
  font-size: 24px;
  color: #f1f5f9; /* light text */
  margin-bottom: 6px;
}

/* Telefon qismi */
.staff-phone {
  font-size: 18px;
  color: #cbd5e1;
}
.staff-phone-link {
  text-decoration: none;
  color: #38bdf8;
  font-weight: 600;
  font-size: 20px;
}
.staff-phone-link:hover {
  color: #0ea5e9;
}

/* Button */
.view-camera-btn {
  background: linear-gradient(135deg, #0ea5e9, #0284c7);
  color: white;
  font-size: 18px;
  font-weight: 600;
  border-radius: 10px;
  border: none;
  box-shadow: 0 4px 15px rgba(14, 165, 233, 0.4);
  transition: 0.3s ease;
}

.view-camera-btn:hover {
  background: linear-gradient(135deg, #38bdf8, #0ea5e9);
  box-shadow: 0 6px 22px rgba(56, 189, 248, 0.35);
  transform: translateY(-2px);
}

.view-camera-btn .camera-icon-style {
  font-size: 20px;
}

.modal-object-about .mapboxgl-popup-content {
    background: #1e293b;
  }

  .modal-object-about .mapboxgl-popup-content .mapboxgl-popup-close-button{
    font-size: 30px;
  }

  .staff-cal-word{
    font-size: 20px;
    color: #38BDF8;
  }

  .cal-word.hidden{
    display: none;
  }

  .responsible-key-text.hidden{
    display: none;
  }

  #staffInfoModal .card-body{
    padding: 0% 15px;
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
                <img src="pictures/icons_marker/bozor.png"
                  alt="Бозор учун маркер">
                <p>Бозорлар-<span>0</span> та</p>
              </div>
              <div class="map-about-box map-about-box-xiyobon">
                <img src="pictures/icons_marker/xiyobon.png"
                  alt="Xiyobon uchun marker">
                <p>Хиёбонлар-<span>0</span> та</p>
              </div>
              <div class="map-about-box map-about-box-bog">
                <img src="pictures/icons_marker/istirohat.png"
                  alt="Isritohat bog'i uchun marker">
                <p>Исритоҳат боғлари-<span>0</span> та</p>
              </div>
              <div class="map-about-box map-about-box-boshqa">
                <img src="pictures/icons_marker/boshqa.png" alt="Boshqa joy uchun marker">
                <p>Бошқа жойлар-<span>0</span> та</p>
              </div>
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
              <div class="col-7 modal-object-about">
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




            <button id="filterToggleBtn" class="filter-toggle-btn">
                <i class="bi bi-funnel-fill"></i> Фильтр
            </button>

          <div class="row filter-mpg hidden-panel">
              <div class="col-12">
                  <div class="card">
                      <div class="card-body px-3 py-1" style="height: 80vh;">
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
                                <label for="objectTypeSelect" class="form-label text-warning fs-5">Объект тури</label>
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

                          <div class="mb-1 col-12">
                              <label class="form-label text-warning fs-5">{$Dict.in_service}</label>
                              <select id="in_service" class="select2 form-select">
                                  <option value="0">{$Dict.today_serviced}</option>
                                  <option value="1">{$Dict.all}</option>
                              </select>
                          </div>

                          {* <div class="mb-1 col-12">
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
                          </div> *}

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
            <div id="playWind2" style="width: 640px; height: 400px;"></div>
            <div class="rounded" id="offline_bg">
                <span>Камера оффлине!</span>
            </div>
            <div class="items">
                <div class="row w-100 mt-3">
                    <div class="col-1">
                        <button class="px-2 py-1 btn btn-danger" type="button" onClick="fullScreenSingle(1)">
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
                    {* <div class="col-1">
                        <button class="px-2 py-1 btn btn-success ml-2" type="button" onClick="takeScreenshot()">
                            <i class="tf-icons ti ti-screenshot"></i>
                        </button>
                    </div> *}
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









{* 3d karta uchun urllar *}
<script src="https://cesium.com/downloads/cesiumjs/releases/1.104/Build/Cesium/Cesium.js"></script>
<link href="https://cesium.com/downloads/cesiumjs/releases/1.104/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
<script src="/assets/global_assets/js/main/bootstrap.bundle.min.js"></script>

{* 
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script> *}

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




<audio id="alertSound" src="/assets/images/alert.mp3"></audio>
<script src="https://rawgit.com/bbecquet/Leaflet.RotatedMarker/master/leaflet.rotatedMarker.js"></script>

<script src="/assets/assets/vendor/libs/select2/select2.js"></script>
<script src="/assets/assets/vendor/libs/toastr/toastr.js"></script>

<script>
  let AJAXPHP = "ajax{$AddURL}.php";
  let HRAJAXPHP = "hrajax{$AddURL}.php";

    let text_more = "{$Dict.more}";
    let dict_select = "{$Dict.select}";
    let dict_search = "{$Dict.search}";
    let dict_alarm_msg = "{$Dict.alarm_msg}";
    let dict_alarm_calls = "{$Dict.alarm_calls}";
    let dict_total_time = "{$Dict.total_time}";
    let dict_distance = "{$Dict.distance}";
    let dict_watch = "{$Dict.watch}";
    let UserStructure = "{$UserStructure}";
    
    let $jq2 = jQuery.noConflict(true);
    $jq2('#camera_modal').draggable();
  {literal}

   


    document.addEventListener("DOMContentLoaded", function() {

     document.getElementById("filterToggleBtn").addEventListener("click", function () {
        const panel = document.querySelector(".filter-mpg");
        // panel.classList.toggle("active");
          $(".filter-mpg").toggleClass("hidden-panel");
    });




      let urlParams = new URLSearchParams(window.location.search);

        let cluster = L.markerClusterGroup({ chunkedLoading: true });
        let gps_url = '../uzgps.php';
        let isOnOffTime = 60;
        let isOnOffSpeed = 5;
        let region_id = 0;
        let in_service = 0;
        let lastCarsPositions;
        let allCars = [];


      let object_id, object_type

      let fetched_camera, fetched_body;

      let bodyCameraMarkers = {};
      // O‘zbekiston markazi koordinatalari
      const uzbekistanCenter = [41.2995, 69.2401]; // Toshkent markazi

      // Xaritani yaratish
      const map = L.map("uzbMap", {
        center: [41.6384, 64.0202],
        zoom: 7,     
        // layers: L.tileLayer(`http://10.19.7.4:8080/tile/{z}/{x}/{y}.png`, { maxZoom: 19 }),
        // layers: L.tileLayer(`http://10.100.9.145:8080/tile/{z}/{x}/{y}.png`, { 
         layers: L.tileLayer(`https://tile.openstreetmap.org/{z}/{x}/{y}.png`, {
          className: 'dark' == 'dark' ? 'map-tiles' : 'map-tiles-light',
          maxZoom: 20
        }),
        // layers: L.tileLayer(`https://tile.openstreetmap.org/{z}/{x}/{y}.png`, { maxZoom: 19 }),
      });

      // Marker ikonkalari
      const markerIcons = {
        '1': L.icon({
          iconUrl: 'pictures/icons_marker/bozor.png',
          iconSize: [35, 50]
        }),
        '3': L.icon({
          iconUrl: 'pictures/icons_marker/istirohat.png',
          iconSize: [35, 50]
        }),
        '2': L.icon({
          iconUrl: 'pictures/icons_marker/xiyobon.png',
          iconSize: [35, 50],
        }),
        '4': L.icon({
          iconUrl: 'pictures/icons_marker/boshqa.png',
          iconSize: [35, 50],
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
          let newUrl = window.location.pathname + '?' + urlParams.toString();
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
                      initCamera()
                      
                    }
                    if (response?.data?.body_cameras && response?.data?.body_cameras.length) {
                      fetched_body = response.data.body_cameras;
                      initCamera()

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
      let id = this.value;
      region_id = id
      getObjects()
        callCars(region_id, in_service);
    })

    // Filtering in service
    $('#in_service').change(function(event) {
        in_service = this.value;
        callCars(region_id, in_service);
    });

          // Filtering regions
        // $('#select_region').change(function(event) {
        //     region_id = this.value;
        //     callCars(region_id, in_service);
        // });

     
    
    $('#objectTypeSelect').on('change', function() {
      let id = this.value;
      object_type = id

      getObjects()
    })
    $('#objectSelect').on('change', function() {
      let id = this.value;
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
        // style: `mapbox://styles/mapbox/dark-v11`,
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
            el.style.width = '100px';
            el.style.height = '30px';
            el.style.backgroundImage = `url('/pictures/marker_icons/door_icon.png')`;
            el.style.backgroundSize = 'cover';
            el.title = door.name;

            new mapboxgl.Marker(el)
              .setLngLat([lon, lat])
              .setPopup(new mapboxgl.Popup()
                .setHTML(
                  `<div style="color: #38BDF8; font-size:18px;">${door.name}</div>`
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
                  `<div style="color: #38BDF8; font-size:20px;"> <b>${track.car_name}</b><br>Tezlik: ${track.speed} km/h<br>${track.date} </div>`
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
              <div style="color: #38BDF8; text-align:center">
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
                <div class="user-card-about p-3 stylish-card">
      <div class="user-about-card-img text-center mb-3">
        <img src="${photoUrl}" alt="расм юкланмаган" class="staff-photo" />
      </div>

      <div class="user-card-about-text text-center">
        <div class="staff-name mb-3">${camera.staff_name || 'Xodim nomi yo‘q'}</div>

        <div class="mt-2 staff-phone">
          <i class="bi bi-telephone-fill text-success me-1"></i>
          <a href="tel:${camera.staff_phone || ''}" class="staff-phone-link">
            ${camera.staff_phone || ''}
          </a>
        </div> <br>

         <div class="mt-2 staff-cal-word">
         <i class="bi bi-shield-lock-fill text-warning me-1 cursor-pointer" id="cal-word-id"></i>
         <span class="cal-word hidden">${camera.staff_sname}</span>
        </div>

        <div class="d-flex align-items-center justify-content-center">
          <button
            class="btn mt-2 px-4 py-2 popup-body-camera-btn view-camera-btn"
            data-id="${camera.id}"
          >
            <i class="bi bi-camera-video-fill me-2 camera-icon-style"></i>
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
            el.style.backgroundImage = `url('/assets/images/sos1.png')`;
            el.style.backgroundSize = 'cover';
            el.title = sos.name;
            el.style.width = '60px';
            el.style.height = '40px';

            new mapboxgl.Marker(el)
              .setLngLat([lon, lat])
              .setPopup(new mapboxgl.Popup().setHTML(
                `<div style="color: #38BDF8; font-size:18px;">${sos.name}</div>`
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
      }, 2000);
    }





    // Funksiya: yangi koordinatalarni yangilash (socket orqali)
    function updateCameraPosition(id, newLat, newLon) {
      const camera = bodyCameraMarkers[id];
      if (!camera) return;

      // Yangi target koordinatalarni o‘rnatamiz
      camera.target = { lat: newLat, lon: newLon };

      // camera?.setLngLat([newLon, newLat]);
    }


    function renderPassportDetails(params) {
      const container = document.querySelector('.space-main-body-passport')
      if (!container || !params) return
      console.log("Param", params)
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
                       <li>
                      <div class="passport-icon">
                        <i class="bi bi-shield-lock-fill" id="responsible-key-icon"></i>
                      </div>
                      <div class="passport-li-about">
                        <p class="responsible-key-text hidden">
                          ${params?.responsible_sname}
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

      


      $(document).on('click','#cal-word-id', function(){
        let calWord = document.querySelector('.cal-word')
        calWord.classList.toggle('hidden')
      })

      $(document).on('click','#responsible-key-icon', function(){
        let calWord = document.querySelector('.responsible-key-text')
        calWord.classList.toggle('hidden')
      })


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



      let iWind = 0;
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
      let jsDecoder;

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

          jsDecoder = null
          $("#playWind").empty();
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
          //         let classValue = $(`#change_camera a[cam_index="${item.cam_index}"]`).attr('class');
          //         let remove_class = classValue.split(' ')[2];
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
          let classValue = this_cam_item.attr('class');
          let remove_class = classValue.split(' ')[2];
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
          let classValue = this_cam_item.attr('class');
          let remove_class = classValue.split(' ')[2];
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
          let iRet = jsDecoder.JS_OpenSound(iWind);
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
              let html = "stop failed";
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
              let html = "CapturePicture failed";
              document.getElementById("error").innerHTML = "<div>" + html + "</div>";
              console.log("CapturePicture failed");
          });
      }

      function OpenSound() {
          let iRet = jsDecoder.JS_OpenSound(iWind);
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

      function fullScreenSingle(id) {
          jsDecoder.JS_FullScreenSingle(id);
      }

      function GetSelectWndInfo(xml) {
          console.log(xml);
          iWind = xml;
      }



      function initCamera() {
        jsDecoder = new JSPlugin({
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
        })
        jsDecoder.JS_Resize(615, 300);

        get_camera()
      }

















































      // mpg 

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
                     layers: L.tileLayer(`https://tile.openstreetmap.org/{z}/{x}/{y}.png`, {
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

  

        // Finding cars
        $(document).ready(function() {
            $('#searchCars').wrap('<div class="position-relative my-2"></div>').select2({
                placeholder: dict_select,
                dropdownParent: $('#searchCars').parent()
            });

                // Find functions
            function findCarOnMap(id) {
                let marker = allCars.find(item => item.options.id == id);
                map.flyTo(marker.getLatLng(), 18, { duration: 3 })
                setTimeout(() => { map.panTo(marker.getLatLng(), { animate: true, duration: 3000 }); marker.openPopup(); }, 3100)
            }
            // --- Find functions

            $('#searchCars').on('select2:select', function (e) {
                findCarOnMap(e.params.data.id)
            });
        });

        // Function to fly to the bounds of all markers
        function flyToMarkers(data) {
            let bounds = new L.LatLngBounds();
            data.forEach(function (marker) {
                bounds.extend([marker.lat, marker.lon]);
            });
            // map.flyToBounds(bounds, { duration: 2, maxZoom: 14 });
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





    });

  {/literal}
</script>



<script src="/dist1/jsPlugin-1.2.0.min.js"></script>
<script src="/dist1/cryptico.min.js"></script>
<script src="/dist1/uuid.js"></script>
<script src="/dist1/jquery.cookie.js"></script>


<script>
    {literal}
        //外部回调
        let iWind = 0;
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
        let jsDecoder
        
        $('.close-camera').click(function(e) {
            // console.log("closed all camera");
            StopRealPlayAll();
            $("#carCameraModal").hide();
            $("#offline_bg").hide();
            jsDecoder = null
            $("#playWind2").empty();
            
        })
        $('.close-staff-info').click(function(e) {
            $("#staffInfoModal").hide();
   
        })

        function openBodyCam(car_id, og_id) {
          console.log(car_id, og_id)
            initCamera()
            $("#carCameraModal").show();

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
                        arrangeWindow(2)
                        $("#offline_bg").hide();
                        $("#playWind2").show();
                        play_camera(data.cams[0].url, 0);
                        setTimeout(() => {
                          if(data.cams?.[1]?.url){
                            console.log(2222);
                            
                            play_camera(data.cams[1].url, 1);
                          }
                        }, 1000);
                    } else {
                        $("#offline_bg").show();
                        $("#playWind2").hide();
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
                                        <img class="staff-photo2" src="/pictures/staffs/${item.photo}" alt="">
                                    </div>

                                    <div class="staff-name2 mt-3">
                                        ${item.staff_name}
                                    </div>

                                    <a href="tel:${item.phone}" class="staff-phone2 mt-2">
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
            let iRet = jsDecoder.JS_OpenSound(iWind);
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
                let html = "stop failed";
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
                let html = "CapturePicture failed";
                document.getElementById("error").innerHTML = "<div>" + html + "</div>";
                console.log("CapturePicture failed");
            });
        }

        function OpenSound () {
            let iRet = jsDecoder.JS_OpenSound (iWind);
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
 

        function initCamera() {
          jsDecoder = new JSPlugin2({
            szId: "playWind2",
            iType: 2,
            iWidth: 640,
            iHeight: 400,
            iMaxSplit: 2,
            iCurrentSplit: 2,
            szBasePath: "./dist1",
            oStyle: {
                border: "#343434",
                borderSelect: "transparent",
                background: "#000 url('/assets/online.svg') no-repeat center center;"
            }
          });
          jsDecoder.JS_Resize(640, 400);
        }
    {/literal}
</script>




{include file="footer.tpl"}