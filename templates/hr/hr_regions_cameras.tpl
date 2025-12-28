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

        /* .telemetryCard{
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
         } */

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
  background: linear-gradient(
    135deg,
    rgba(12,17,43,0.85),
    rgba(5,8,20,0.9)
  );
  border-radius: 20px;
  /* border: 1px solid rgba(0,240,255,0.25); */

  /* Glass effect */
  backdrop-filter: blur(14px) saturate(160%);
  -webkit-backdrop-filter: blur(14px) saturate(160%);

  /* Premium shadow */
  box-shadow:
    0 0 20px rgba(0,0,0,0.7),
    inset 0 0 12px rgba(0,240,255,0.08);

  transition: all 0.35s ease-in-out;
}

.stylish-card {
  width: 450px;
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

  .my-cluster {
  background: transparent !important;
}

.cluster-icon {
  width: 40px;
  height: 40px;
  color: #fff;
  font-weight: 700;
  border-radius: 50%;
  display:flex;
  align-items:center;
  justify-content:center;
  border: 2px solid #fff;
  box-shadow: 0 2px 6px rgba(0,0,0,0.4);
}

/* car cluster: qizil rang */
.cluster-cars { background: #ff5a5f; }

/* object cluster: ko'k rang */
.cluster-objects { background: #1e90ff; }

.leaflet-popup-content{
  color: #fff;
}

.replay-controls {
    display: flex;
    gap: 14px;
    justify-content: center;
    padding-bottom: 10px;
}

.replay-btn {
    width: 52px;
    height: 52px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    font-size: 24px;
    transition: all 0.25s ease;
    box-shadow: 0 6px 14px rgba(0,0,0,0.25);
}

/* PLAY */
.replay-btn.play {
    background: #28c76f;
    color: #fff;
}
.replay-btn.play:hover {
    transform: scale(1.1);
    background: #22b965;
}

/* PAUSE */
.replay-btn.pause {
    background: #ff9f43;
    color: #fff;
}
.replay-btn.pause:hover {
    transform: scale(1.1);
    background: #f08c2e;
}

/* RESTART */
.replay-btn.restart {
    background: #ea5455;
    color: #fff;
}
.replay-btn.restart:hover {
    transform: scale(1.1);
    background: #d94344;
}

.telemetryCard {
    position: absolute;
    top: 110px;
    right: 30px;
    width: 350px;
    z-index: 9999;
    font-family: sans-serif;
    background: linear-gradient(160deg, #1e2235, #14172a);
    border-radius: 16px;
    padding: 14px 14px 10px;
    color: #fff;
    box-shadow: 0 10px 30px rgba(0,0,0,0.35);
    
}

.telementary-card-head {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 10px;
}

.telementary-card-head img {
    width: 54px;
    height: auto;
}

.telement-date-now {
    font-size: 17px;
    opacity: 0.85;
}

.telemetry-card-body > div {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: rgba(255,255,255,0.04);
    border-radius: 10px;
    padding: 8px 12px;
    margin-bottom: 8px;
    font-size: 17px;
}

.telemetry-card-body strong {
    display: flex;
    align-items: center;
    gap: 8px;
    font-weight: 500;
    opacity: 0.9;
}

.telemetry-card-body svg {
    opacity: 0.85;
}

.telemetry-card-body span {
    font-weight: 600;
    font-size: 18px;
}


#telemetrySpeed {
    color: #28c76f;
}

#telemetryDistance {
    color: #00cfe8;
}

#telemetryTime {
    letter-spacing: 1px;
}

.replay-controls {
    margin-top: 12px;
}

#telemetryRegion{
  font-size: 14px;
}

.mpg-details{
  display: flex;
  justify-content: space-around;
  width: 100%;
}

.mpg-details h3{
  font-size: 22px;
  color: rgb(149, 219, 149);
  margin: 0;
}

.bodycam-cluster-wrapper {
  background: transparent;
}

.bodycam-cluster {
  position: relative;
  width: 30px;
  height: 55px;
}

.bodycam-img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  display: block;
}

/* O‘RTADAGI OCHIQ TO‘RTBURCHAK ICHIDAGI RAQAM */
.bodycam-count {
  position: absolute;
    bottom: -10px;
    left: 170%;
  transform: translateX(-50%);
  width: 28px;
  height: 28px;

 background: greenyellow;
  color: black;

  display: flex;
  align-items: center;
  justify-content: center;

  font-size: 16px;
  font-weight: bold;
 border-radius: 50%; 

   box-shadow: inset 0 0 6px rgba(0, 255, 136, 0.6); 
}

.search-dropdownName {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  max-height: 600px !important;
  overflow-y: auto;
  background: #565555;
  border: 1px solid #ddd;
  border-radius: 6px;
  list-style: none;
  padding: 0;
  margin: 4px 0 0;
  z-index: 1000;
  display: none;
}

.search-dropdownName li {
  padding: 8px 12px;
  cursor: pointer;
}

.search-dropdownName li:hover {
  background: #f1f5f9;
}

.camera-full {
  width: 100%;
  height: calc(100vh - 180px); /* header + selectlar */
  background: #000;
}

#cameraSection {
  overflow: hidden;
}


/* .custom-select {
  position: relative;
  width: 50%;
} */

.custom-select {
    position: absolute;
    width: 50%;
    top: 50px;
    right: 10%;
}

#objectSearch {
  width: 100%;
  padding: 10px;
  background: #1e1e1e;
  color: #fff;
  border: 1px solid #444;
  border-radius: 4px;
}

#objectSearch::placeholder {
  color: #aaa;
}

.dropdownName {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  background: #1e1e1e;
  border: 1px solid #444;
  max-height: 200px;
  overflow-y: auto;
  z-index: 1000;
}

.dropdownName div {
  padding: 8px 10px;
  cursor: pointer;
  color: #fff;
}

.dropdownName div:hover {
  background: #333;
}

.hidden {
  display: none;
}

.search-dropdown {
  position: absolute;
  top: 100%;
  left: 0;
  right: 0;
  max-height: 600px;
  overflow-y: auto;
  background: #565555;
  border: 1px solid #ddd;
  border-radius: 6px;
  list-style: none;
  padding: 0;
  margin: 4px 0 0;
  z-index: 1000;
  display: none;
}

.search-dropdown li {
  padding: 8px 12px;
  cursor: pointer;
}

.search-dropdown li:hover {
  background: #f1f5f9;
}
  {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid position-relative">
        
         <div class="row">
              <div class="mb-1 col-4">
                                <label for="viloyatSelect" class="form-label text-warning fs-5">{$Dict.regions}</label>
                                <select id="viloyatSelect" class="form-select">
                                  <option value="">Танланг</option>
                                  {foreach from=$Regions item=Item1 key=ikey1}
                                  <option value="{$Item1.id}">{$Item1.name}</option>
                                  {/foreach}
                                </select>
                 </div>

                     <div class="mb-1 col-4 position-relative" id="object-wrapper">
                                  <label class="form-label text-warning fs-5">Объект номи</label>

                                  <input
                                    type="text"
                                    id="object_search"
                                    class="form-control"
                                    placeholder="Объектни қидиринг..."
                                    autocomplete="off"
                                  >

                                  <!-- select form submit va change uchun -->
                                  <select id="objectSelect" class="form-select d-none">
                                    <option value="">Танланг</option>
                                    {foreach from=$Objects item=Item1}
                                      <option value="{$Item1.id}">{$Item1.name}</option>
                                    {/foreach}
                                  </select>

                                  <ul id="object_list" class="search-dropdown"></ul>
                 </div>

         </div>
         


          <div class="row text-center modal fade show" tabindex="-1" aria-modal="true" role="dialog"
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

       <div id="cameraSection" style="margin-top:15px;">
           <div id="playWind" class="camera-full"></div>
      </div>
       
</div>



<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>


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
  let AJAXPHP = "ajax.php";
  let HRAJAXPHP = "hrajax.php";

    let text_more = "{$Dict.more}";
    let dict_select = "{$Dict.select}";
    let dict_search = "{$Dict.search}";
    let dict_alarm_msg = "{$Dict.alarm_msg}";
    let dict_alarm_calls = "{$Dict.alarm_calls}";
    let dict_total_time = "{$Dict.total_time}";
    let dict_distance = "{$Dict.distance}";
    let dict_watch = "{$Dict.watch}";
    let UserStructure = "{$UserStructure}";
    
  {literal}

    let urlParams = new URLSearchParams(window.location.search);
     let objects = [];

    let region_id = null;
    let object_id = null;

    let fetched_camera = [];

    $(document).ready(function () {
      getObjects();
    });

$('#viloyatSelect').on('change', function () {
  region_id = this.value || null;
  object_id = null;

  $('#object_search').val('');
  $('#object_list').empty().hide();
  $('#objectSelect').html('<option value="">Объектни танланг</option>');

  getObjects();
});



     $('#objectSelect').on('change', function () {
      object_id = this.value || null;

      if (!object_id) return;

      getObjectById(object_id);
    });

function getObjects() {
  let url = `${AJAXPHP}?act=get_jts_map`;

  if (region_id) {
    url += `&region_id=${region_id}`;
  }

  $.ajax({
    url,
    type: 'GET',
    dataType: 'json',
    success: function (response) {
      fetched_camera = response || [];

      // 🔥 SEARCH UCHUN ARRAY
      objects = fetched_camera.map(o => ({
        id: o.id,
        name: o.object_name
      }));

      renderObjectSelect(fetched_camera);
      renderList(objects); // 🔥 faqat shu viloyat obyektlari
    },
    error: function (err) {
      console.error(err);
    }
  });
}




function filterObjectsByRegion() {
  let filtered = fetched_camera;

  if (region_id) {
    filtered = fetched_camera.filter(obj =>
      obj.structure_id == region_id
    );
  }

  renderObjectSelect(filtered);
}


function renderObjectSelect(objects) {
  let html = '<option value="">Объектни танланг</option>';

  if (!objects.length) {
    html += '<option value="">Объект топилмади</option>';
  }

  objects.forEach(obj => {
    html += `<option value="${obj.id}">${obj.object_name}</option>`;
  });

  $('#objectSelect').html(html);
}

 

const objectSearch = document.getElementById('object_search');
const objectSelect = document.getElementById('objectSelect');
const objectList   = document.getElementById('object_list');
const wrapper      = document.getElementById('object-wrapper');


// 🔹 Ro‘yxatni chizish funksiyasi
function renderList(list) {
  objectList.innerHTML = '';

  if (!list.length) {
    objectList.style.display = 'none';
    return;
  }

  list.forEach(item => {
    const li = document.createElement('li');
    li.textContent = item.name;

    li.onclick = () => {
      objectSearch.value = item.name;
      objectSelect.value = item.id;

      objectSelect.dispatchEvent(new Event('change'));
      objectList.style.display = 'none';
    };

    objectList.appendChild(li);
  });

  objectList.style.display = 'block';
}



objectSearch.addEventListener('input', function () {
  const val = this.value.toLowerCase();

  if (!val) {
    object_id = null;
    objectSelect.value = '';
    renderList(objects); // 🔥 faqat hozirgi viloyat
    return;
  }

  renderList(
    objects.filter(o => o.name.toLowerCase().includes(val))
  );
});



// 🔹 Input bosilganda to‘liq ro‘yxat chiqadi
objectSearch.addEventListener('focus', function () {
  renderList(objects);
});

// 🔹 Tashqariga bosilganda yopiladi
document.addEventListener('click', function (e) {
  if (!e.target.closest('#object-wrapper')) {
    objectList.style.display = 'none';
  }
});


function getObjectById(id) {
  $("#markerLoader").show();
  $.ajax({
    url: `${AJAXPHP}?act=get_jts_object_by_id&id=${id}`,
    type: 'GET',
    dataType: 'json',
    success: function (response) {
      $("#markerLoader").hide();

      if (!response || !response.cameras || !response.cameras.length) {
        alert('Bu obyektda kamera yo‘q');
        return;
      }

      fetched_camera = response.cameras;

      // 🔥 MODAL EMAS, SHU SAHIFADA KO‘RSATAMIZ
      $('#cameraSection').show();

      initCamera();
    },
    error: function (err) {
      console.error(err);
    }
  });
}



function arrangeWindow() {
  if (!jsDecoder) return;
  jsDecoder.JS_ArrangeWindow(4); // 🔥 doim 2x2
}


function get_camera() {
  if (!jsDecoder) return;

  jsDecoder.JS_StopRealPlayAll();

  const maxView = 4; // 🔥 faqat 4 ta kamera
  arrangeWindow();

  fetched_camera.slice(0, maxView).forEach((cam, index) => {
    if (!cam || !cam.url) return;

    jsDecoder.JS_Play(
      cam.url,
      { playURL: cam.url },
      index // 🔥 0,1,2,3
    ).catch(() => console.warn('Play failed', cam));
  });

  $("#current_camera").html(`Kameralar: ${Math.min(fetched_camera.length, 4)}`);
}








      function playFirstCamera() {
        const cam = fetched_camera[0];

        $("#current_camera").html(cam.comment);

        if (!cam.status) return;

        if (cam.isptz == 1) $("#controller").show();

        jsDecoder.JS_Play(cam.url, { playURL: cam.url }, 0)
          .then(() => {
            cam_idx_code = cam.cam_index;
            is_played = true;
          })
          .catch(() => {
            is_played = false;
          });
      }

let jsDecoder;

function initCamera() {
  if (jsDecoder) {
    jsDecoder.JS_StopRealPlayAll();
    jsDecoder = null;
    $('#playWind').empty();
  }

  const el = document.getElementById('playWind');

  jsDecoder = new JSPlugin({
    szId: "playWind",
    iType: 2,
    iWidth: el.clientWidth,
    iHeight: el.clientHeight,
    iMaxSplit: 4,        // 🔥 maksimum 4
    iCurrentSplit: 4,    // 🔥 boshlanishida 2x2
    szBasePath: "./dist",
    oStyle: {
      border: "#343434",
      borderSelect: "transparent",
      background: "#000"
    }
  });

  jsDecoder.JS_Resize(el.clientWidth, el.clientHeight);

  get_camera();
  bindDblClick();
}


window.addEventListener('resize', () => {
  if (!jsDecoder) return;

  const el = document.getElementById('playWind');
  jsDecoder.JS_Resize(el.clientWidth, el.clientHeight);
});


function bindDblClick() {
  const el = document.getElementById('playWind');

  if (!el) {
    console.warn('bindDblClick: #playWind topilmadi');
    return;
  }

  el.addEventListener(
    'dblclick',
    function (e) {
      e.preventDefault();
      // fullSreen();
      // openFullscreen();
    },
    { capture: true }
  );
}


    {/literal}
</script>




{include file="footer.tpl"}