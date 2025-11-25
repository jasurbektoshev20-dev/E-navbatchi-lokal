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

        .leaflet-popup,
        .leaflet-popup-content-wrapper {
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

        .parent-wnd>div:nth-child(3) {
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

        #staffInfoModal {
            position: absolute;
            width: 820px;
            height: 500px;
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

            0%,
            100% {
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

        .history-modal-dialog {
            max-width: 80% !important;
        }

        .history-filter-section {
            display: flex;
            align-items: flex-end;
            font-size: 18px;
        }

        .telemetryCard {
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

        .telemetryCard .telementary-card-head {
            display: flex;
            justify-content: space-around;
            align-items: center;
            padding-left: 25px;
            height: 70px;
            font-size: 18px;
        }

        .telemetryCard .telementary-card-head img {
            transform: rotate(90deg);
            width: 50px;
            height: 100px;
        }

        .telemetryCard .telementary-card-head p {
            margin: 0%;
        }

        .telemetryCard .telemetry-card-body .col-12 {
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
            width: 40px;
            height: 40px;
            object-fit: cover;
        }

        .map-icon-about .map-about-box-xiyobon img {
            width: 25px;
            height: 40px;
            object-fit: cover;
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
            color: #E2E8F0;
            /* oqga yaqin */
        }

        .passport-card p,
        .passport-card a {
            margin: 0;
            font-size: 16px;
            color: #94A3B8;
            /* kulrang-oq */
            text-decoration: none;
        }

        .passport-icon {
            width: 38px;
            height: 38px;
            background: rgba(56, 189, 248, 0.1);
            /* cyan glow */
            border: 1px solid rgba(56, 189, 248, 0.4);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
            color: #38BDF8;
            /* neon cyan */
            backdrop-filter: blur(3px);
        }

        .space-main-head h4 {
            color: #fff;
            border-bottom: 3px solid #38BDF8;
            padding-bottom: 4px;
        }

        /* Ichki scroll berish */
        .space-main-body-passport {
            max-height: 320px;
            /* xohlagan balandlik */
            overflow-y: auto;
            padding-right: 6px;
            /* scroll tegmasligi uchun */
        }

        .space-main-body-passport .passport-li-about {
            display: flex;
            gap: 7px;
        }

        .space-main-body-passport .passport-li-about h6,
        .space-main-body-passport .passport-li-about p {
            padding: 0;
        }

        /* Scrollbar style (dark mode) */
        .space-main-body-passport::-webkit-scrollbar {
            width: 6px;
        }

        .space-main-body-passport ul li {
            align-items: center;
        }

        .space-main-body-passport::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
        }

        .space-main-body-passport::-webkit-scrollbar-thumb {
            background: rgba(56, 189, 248, 0.45);
            /* cyan */
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

        .button_box {
            color: #000;
            position: absolute;
            bottom: 0px;
        }

        .tab-content {
            padding: 0;
        }

        .text-yellow {
            color: #fff;
            font-size: 18px;
            font-weight: bold;
        }

        .modal-body .nav-item button {
            font-size: 20px;
        }

        .is-accordion {
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
            padding-left: 45px;
            /* ichkariga kiradi */
            border-left: 1px solid rgba(255, 255, 255, 0.08);
        }

        .summary-span {
            font-size: 18px;
            color: #fff;
        }

        /* FILTER TOGGLE BUTTON */
        .filter-toggle-btn {
            position: absolute;
            top: 35px;
            left: 70px;
            background: rgba(0, 0, 0, 0.6);
            color: #38BDF8;
            border: 1px solid rgba(56, 189, 248, 0.4);
            padding: 8px 16px;
            font-size: 15px;
            border-radius: 8px;
            backdrop-filter: blur(6px);
            cursor: pointer;
            z-index: 2000;
            transition: all .3s ease;
        }

        .filter-toggle-btn:hover {
            background: rgba(56, 189, 248, 0.15);
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
            background: rgba(0, 0, 0, 0.45);
            border-radius: 18px;
            border: 1px solid rgba(56, 189, 248, 0.3);
            backdrop-filter: blur(10px);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7);
        }

        .stylish-card {
            width: 450px;
            background: #1e293b;
            /* dark slate */
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 14px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.45);
            transition: 0.3s ease;
        }

        .stylish-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 35px rgba(0, 0, 0, 0.6);
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
            color: #f1f5f9;
            /* light text */
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
            background: #000;
        }

        .modal-object-about .mapboxgl-popup-content .mapboxgl-popup-close-button {
            font-size: 30px;
        }

        .staff-cal-word {
            font-size: 20px;
            color: #38BDF8;
        }

        .cal-word.hidden {
            display: none;
        }

        .responsible-key-text.hidden {
            display: none;
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

    <!-- Modal -->

    <div class="modal show fade bd-example-modal-xl" id="markerModal" tabindex="-1" aria-hidden="true"
        style="z-index: 99999 !important;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header position-relative">
                    <h2 class="modal-title position-absolute start-50 translate-middle-x" id="markerModalTitle"
                        style="color: #fff;">
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

                                <div id="dialogMap" class="mt-1"></div>
                            </div>

                            <!-- RIGHT SIDE -->
                            <div class="col-5 d-flex flex-column">

                                <!-- CAMERA BLOCK -->
                                <div>
                                    <div class="space-main-head">
                                        <h4 class="m-0">Камералар</h4>
                                    </div>

                                    <div class="camera-box position-relative"
                                        style="background: rgba(0,0,0,0.25); border-radius: 12px;">
                                        <div id="playWind" style="width: 100%; height: 280px; border-radius: 12px;">
                                        </div>

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

                                                    <div class="d-flex justify-content-between border-bottom mb-1"
                                                        style="border-color:#555;">
                                                        <span class="text-yellow">Жами камералар:
                                                            <span class="text-white camera_length"></span>
                                                        </span>

                                                        <ul class="nav nav-pills mb-0">
                                                            <li class="nav-item dropdown dropup">
                                                                <a href="#" id="current_camera" class="dropdown-toggle"
                                                                    data-toggle="dropdown"></a>
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
                                                                <a href="#" id="body_current_camera"
                                                                    class="dropdown-toggle" data-toggle="dropdown"></a>
                                                                <div class="dropdown-menu" id="body_change_camera">
                                                                </div>
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
                                        <button class="nav-link active" data-bs-toggle="tab"
                                            data-bs-target="#tab_passport">Объект маълумотлари</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab_duty">Куч
                                            воситалар</button>
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
        <i class="bi bi-funnel-fill"></i> Filter
    </button>

    <div class="row filter-mpg hidden-panel">
        <div class="col-12">
            <div class="card">
                <div class="card-body px-3 py-1" style="height: 80vh;">
                    <div class="mb-1 col-12">
                        <label for="viloyatSelect" class="form-label text-warning fs-5">Объектлар</label>
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
                        <label for="objectSelect" id="objectLabelLabel" class="form-label text-warning fs-5">Объект
                            номи</label>
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

                    <div class="mb-1 col-12">
                        <label class="form-label text-warning fs-5">{$Dict.regions}</label>
                        <select class="form-select" id="select_region">
                            <option value="0">{$Dict.all}</option>
                            {foreach from=$Regions item=Item key=key name=regionsLoop}
                                {if $smarty.foreach.regionsLoop.iteration <= 14}
                                    <option value="{$Item.id}" data-lat="{$Item.latitude}" data-lon="{$Item.longtitude}"
                                        data-zoom="{$Item.zoom}">
                                        {$Item.name}
                                    </option>
                                {/if}
                            {/foreach}
                        </select>
                    </div>

                    <div class="col-12 mt-3">
                        <label class="form-label text-success fs-5">{$Dict.cars}<span style="color: #ddd;"
                                id="total_thg"></span></label>
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
        <div class="card-header pb-0 pt-2"></div>
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
                            <div class="col-12"><strong> <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        fill="currentColor" class="bi bi-clock" viewBox="0 0 16 16">
                                        <path
                                            d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71z" />
                                        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16m7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0" />
                                    </svg> {$Dict.time}:</strong> <span id="telemetryTime">--:--:--</span></div>
                            <div class="col-12"><strong> <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        fill="currentColor" class="bi bi-speedometer" viewBox="0 0 16 16">
                                        <path
                                            d="M8 2a.5.5 0 0 1 .5.5V4a.5.5 0 0 1-1 0V2.5A.5.5 0 0 1 8 2M3.732 3.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707M2 8a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8m9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5m.754-4.246a.39.39 0 0 0-.527-.02L7.547 7.31A.91.91 0 1 0 8.85 8.569l3.434-4.297a.39.39 0 0 0-.029-.518z" />
                                        <path fill-rule="evenodd"
                                            d="M6.664 15.889A8 8 0 1 1 9.336.11a8 8 0 0 1-2.672 15.78zm-4.665-4.283A11.95 11.95 0 0 1 8 10c2.186 0 4.236.585 6.001 1.606a7 7 0 1 0-12.002 0" />
                                    </svg> {$Dict.speed}:</strong> <span id="telemetrySpeed">0 km/h</span></div>
                            <div class="col-12"><strong> <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd"
                                            d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z" />
                                    </svg> {$Dict.distance}:</strong> <span id="telemetryDistance">0 km</span></div>
                            <div class="col-12"><strong><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                        fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
                                        <path
                                            d="M4 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zM4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z" />
                                        <path
                                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1zm11 0H3v14h3v-2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V15h3z" />
                                    </svg> {$Dict.region}:</strong> <span id="telemetryRegion">Ташкент</span></div>
                        </div>

                        <hr style="border-color: white;">

                        <div class="d-flex justify-content-between"
                            style="padding-bottom: 10px; gap:5px; font-size:16px;">
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
    href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css"
    type="text/css" />

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
    var AJAXPHP = "ajax{$AddURL}.php";
    var HRAJAXPHP = "hrajax{$AddURL}.php";

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
        document.getElementById("filterToggleBtn").addEventListener("click", function() {
            const panel = document.querySelector(".filter-mpg");
            $(".filter-mpg").toggleClass("hidden-panel");
        });

        var urlParams = new URLSearchParams(window.location.search);
        let cluster = L.markerClusterGroup({ chunkedLoading: true });
        let gps_url = 'uzgps.php';
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
            layers: L.tileLayer(`http://10.100.9.145:8080/tile/{z}/{x}/{y}.png`, 
            {
                className: 'dark' == 'dark' ? 'map-tiles' : 'map-tiles-light',
                maxZoom: 20
            })
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

            } else {
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
        } else {
            getObjects()
        }

        const allMarkers = L.layerGroup();

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

                    allMarkers.clearLayers();
                    if (!response || !response.length) return;

                    const bozor = response.filter(item => item.object_type == 1);
                    const bog = response.filter(item => item.object_type == 3);
                    const xiyobon = response.filter(item => item.object_type == 2);
                    const boshqa = response.filter(item => item.object_type == 4);

                    $('.map-about-box-bozor span').html(bozor.length);
                    $('.map-about-box-bog span').html(bog.length);
                    $('.map-about-box-xiyobon span').html(xiyobon.length);
                    $('.map-about-box-boshqa span').html(boshqa.length);

                    // Markerlarni LayerGroup ga qo‘shamiz
                    response.forEach(m => {

                        const marker = L.marker([m.lat, m.long], { icon: markerIcons[m.object_type] })
                            .bindTooltip(m.object_name, {
                                direction: 'top',
                                offset: [0, -10],
                                className: 'my-tooltip'
                            });

                        marker.id = m.id;
                        marker.type = m.object_type;
                        allMarkers.addLayer(marker);

                        marker.on('click', function() {
                            $('#markerModalTitle').text(m.object_name);

                            $.ajax({
                                url: `${AJAXPHP}?act=get_jts_object_by_id&id=${m.id}`,
                                type: 'GET',
                                dataType: 'json'
                            });
                        });
                    });

                    // Markerlarni xaritaga qo‘shamiz
                    allMarkers.addTo(map);

                    // Hamma marker koordinatalari
                    const markerCoords = response.map(m => [m.lat, m.long]);

                    if (markerCoords.length > 0) {
                        const bounds = L.latLngBounds(markerCoords);

                        map.flyToBounds(bounds, {
                            padding: [50, 50],
                            duration: 1
                        });
                    }
                }
            });
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

    {/literal}
</script>




{include file="footer.tpl"}