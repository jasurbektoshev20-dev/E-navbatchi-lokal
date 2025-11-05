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

    .space-main-body-password ul li img {
      width: 100%;
      height: 450px;
      object-fit: cover;
    }

    .space-main-body-password ul li {
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .space-main-body-password ul li h4 {
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
      <div class="map-about-box">
        <img src="https://icons.iconarchive.com/icons/paomedia/small-n-flat/512/map-marker-icon.png"
          alt="Bozor uchun marker">
        <p>Bozor-350 ta</p>
      </div>
      <div class="map-about-box map-about-box-xiyobon">
        <img src="https://www.nicepng.com/png/full/15-159490_small-google-maps-marker-blue.png"
          alt="Xiyobon uchun marker">
        <p>Xiyobon-200 ta</p>
      </div>
      <div class="map-about-box">
        <img src="https://images.freeimages.com/fic/images/icons/2463/glossy/512/location.png"
          alt="Isritohat bog'i uchun marker">
        <p>Isritohat bog'i-270 ta</p>
      </div>
      <div class="map-about-box">
        <img src="https://cdn-icons-png.flaticon.com/512/6284/6284577.png" alt="Boshqa joy uchun marker">
        <p>Boshqa joy-230 ta</p>
      </div>
    </div>
  </div>

  <div class="filters bg-white rounded shadow" style="z-index: 2000;">
    <div>
      <label for="viloyatSelect" class="form-label">Hududlar</label>
      <select id="viloyatSelect" class="form-select">
        <option value="">Hududni tanlang</option>
        <option value="toshkent">Toshkent</option>
        <option value="andijon">Andijon</option>
        <option value="buxoro">Buxoro</option>
        <option value="fargona">Farg'ona</option>
        <option value="jizzax">Jizzax</option>
        <option value="namangan">Namangan</option>
        <option value="navoiy">Navoiy</option>
        <option value="qashqadaryo">Qashqadaryo</option>
        <option value="samarqand">Samarqand</option>
        <option value="sirdaryo">Sirdaryo</option>
        <option value="surxondaryo">Surxandaryo</option>
        <option value="toshkent_viloyati">Toshkent viloyati</option>
        <option value="xorazm">Xorazm</option>
        <option value="qoraqalpoq">Qoraqalpog'iston Respublikasi</option>
      </select>
    </div>

    <div>
      <label for="objectSelect" class="form-label">Obyekt turi</label>
      <select id="objectSelect" class="form-select">
        <option value="">Jami obyektlar</option>
        <option value="bozor">Bozor</option>
        <option value="bog">Istirohat bog'i</option>
        <option value="xiyobon">Xiyobon</option>
        <option value="boshqa">Boshqa</option>
      </select>
    </div>

    <div>
      <label for="objectLabelSelect" id="objectLabelLabel" class="form-label">Obyektlar</label>
      <select id="objectLabelSelect" class="form-select">
        <option value="">Obyektni tanlang</option>
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
                <div class="space-main-body-password">
                  <ul>
                    <li>
                      {* <img src="/templates/hr/img/bozor-tayyor_2.png" alt=""> *}
                      <div id="dialogMap"></div>
                    </li>
                    {* <li>
                      <h4> <a href="#" id="open3DMap" data-lat="41.32621" data-lng="69.22800" data-name="Chorsu bozori">
                          Kartaga o'tish
                        </a></h4>
                    </li> *}
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-geo-alt" viewBox="0 0 16 16">
                            <path
                              d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A32 32 0 0 1 8 14.58a32 32 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10" />
                            <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4m0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
                          </svg></span> Manzili: </h6>
                      <p>Oʻzbekiston, Toshkent shahri, Nayman koʻchasi, 69</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-dice-1" viewBox="0 0 16 16">
                            <circle cx="8" cy="8" r="1.5" />
                            <path
                              d="M13 1a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zM3 0a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V3a3 3 0 0 0-3-3z" />
                          </svg></span> Hudud joylashgan mahalla: </h6>
                      <p>Rohat mahallasi</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-shop-window" viewBox="0 0 16 16">
                            <path
                              d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5m2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5" />
                          </svg></span> Savdo obyektlar soni: </h6>
                      <p>70 ta</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path
                              d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708" />
                          </svg></span>Administrator telefon raqami: </h6>
                      <p>+998 90 123-45-67 +998 91 123-45-67</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-border-all" viewBox="0 0 16 16">
                            <path d="M0 0h16v16H0zm1 1v6.5h6.5V1zm7.5 0v6.5H15V1zM15 8.5H8.5V15H15zM7.5 15V8.5H1V15z" />
                          </svg></span>Maydoni: </h6>
                      <p>4046.86 m²</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-door-open" viewBox="0 0 16 16">
                            <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1" />
                            <path
                              d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117M11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z" />
                          </svg></span>Kirish chiqish eshiklar soni: </h6>
                      <p>4 ta</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-person" viewBox="0 0 16 16">
                            <path
                              d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z" />
                          </svg></span>Bozor rahbari: </h6>
                      <p>Berdiyev Muzaffar +998 90 234-76-90</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-person" viewBox="0 0 16 16">
                            <path
                              d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z" />
                          </svg></span>Bozor uchastkavoyi: </h6>
                      <p>Toshev Jasurbek +998 91 233-76-96</p>
                    </li>
                    <li>
                      <h6><span><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor"
                            class="bi bi-telephone-forward" viewBox="0 0 16 16">
                            <path
                              d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.762.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708" />
                          </svg></span> Hamkor tashkilotlar aloqa: </h6>
                      <p> IIV- +998 91 123-45-67 FVV- +998 97 851-12-23</p>
                    </li>

                  </ul>
                </div>
              </div>

              <div class="col-6">
                  <div>
                    <div class="space-main-head">
                      <h4>MG tomonidan ajratilgan kuch vositalar</h4>
                    </div>
                    <div class="space-main-body-duty">
                      <ul class="d-flex flex-wrap gap-3">
                        <li class="alert alert-dark" role="alert">MG javobgar: <span>leytenant Umrzakov Javohir </span>
                        </li>
                        <li class="alert alert-dark" role="alert">Jami shaxsiy tarkib: <span>20 nafar</span> </li>
                        <li class="alert alert-dark" role="alert">Piyoda patrullar: <span>12 nafar</span> </li>
                        <li class="alert alert-dark" role="alert">Avto patrullar: <span>8 nafar</span> </li>
                        <li class="alert alert-dark" role="alert">Yo'nalishlar: <span>4 ta</span> </li>
                        <li class="alert alert-dark" role="alert">Sektorlar soni: <span>4 ta</span> </li>
                        <li class="alert alert-dark" role="alert">Kameralar soni: <span>12 ta</span> </li>
                        <li class="alert alert-dark" role="alert">Tashvish tugmalar soni: <span>4 ta</span> </li>
                        <li class="alert alert-dark" role="alert">Xizmat hayvonlari: <span>8 ta</span> </li>
                        <li class="alert alert-dark" role="alert">Maxsus vositalar soni: <span>12 ta</span> </li>
                        <li class="alert alert-dark" role="alert">Texnikalar: <span>12 ta</span></li>
                      </ul>
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
  {literal}

    
    document.addEventListener("DOMContentLoaded", function() {
      
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

    // Marker ikonkalari
    const markerIcons = {
      bozor: L.icon({ iconUrl: 'https://icons.iconarchive.com/icons/paomedia/small-n-flat/512/map-marker-icon.png',
        iconSize: [30, 30], iconAnchor: [25, 50], popupAnchor: [0, -45] }),
      bog: L.icon({ iconUrl: 'https://images.freeimages.com/fic/images/icons/2463/glossy/512/location.png',
        iconSize: [35, 35], iconAnchor: [25, 50], popupAnchor: [0, -45] }),
      xiyobon: L.icon({ iconUrl: 'https://www.nicepng.com/png/full/15-159490_small-google-maps-marker-blue.png',
        iconSize: [20, 35], iconAnchor: [22, 45], popupAnchor: [0, -40] }),
      boshqa: L.icon({ iconUrl: 'https://cdn-icons-png.flaticon.com/512/6284/6284577.png', iconSize: [30, 30],
        iconAnchor: [22, 45], popupAnchor: [0, -40] })
    };

    // sahifa ochilganda karta chiroyli ochilishi
    setTimeout(() => {
      document.getElementById('uzbMap').classList.add('visible');
    }, 500);


    // Markerlar ro‘yxati
    const markers = [
      // toshkent shahar
      { coords: [41.32621, 69.22800], name: "Chorsu bozori", type: "bozor", viloyat: "toshkent" },
      { coords: [41.2742, 69.3105], name: "Mirobod dehqon bozori", type: "bozor", viloyat: "toshkent" },
      { coords: [41.25160, 69.33305], name: "Qo'yliq dehqon bozori", type: "bozor", viloyat: "toshkent" },
      { coords: [41.27785, 69.21493], name: "Navruz bozori", type: "bozor", viloyat: "toshkent" },
      { coords: [41.30396, 69.28460], name: "Furqat bog'i", type: "bog", viloyat: "toshkent" },
      { coords: [41.33875, 69.33472], name: "Mirzo Ulug'bek Markaziy bog'i", type: "bog", viloyat: "toshkent" },
      { coords: [41.33820, 69.31570], name: "Lakamativ bog'i", type: "bog", viloyat: "toshkent" },
      { coords: [41.36835, 69.30495], name: "Toshkent hayvonot bog'i", type: "bog", viloyat: "toshkent" },
      { coords: [41.3480, 69.2882], name: "Shaxidlar xotirasi xiyoboni", type: "xiyobon", viloyat: "toshkent" },
      { coords: [41.3111, 69.2795], name: "Amir Temur saylgohi", type: "xiyobon", viloyat: "toshkent" },
      { coords: [41.291684849329364, 69.27961605366362], name: "Toshkent pravoslav ma'naviy-ma'muriy markazi",
        type: "boshqa", viloyat: "toshkent" },
      { coords: [41.325726038893265, 69.31075196900717], name: "Toshkent shahar Masih cherkovi", type: "boshqa",
        viloyat: "toshkent" },
      { coords: [41.35921926724288, 69.28756612326129], name: "Yunusobod dehqon bozor", type: "bozor",
        viloyat: "toshkent" },
      { coords: [41.35555, 69.29987], name: "Abu Saxiy dehqon bozori", type: "bozor", viloyat: "toshkent" },
      { coords: [41.37000110258014, 69.26955051372533], name: "Pushkin saylgohi", type: "xiyobon",
        viloyat: "toshkent" },
      { coords: [41.34875, 69.33472], name: "Do'stlik bog'i", type: "bog", viloyat: "toshkent" },
      { coords: [41.36820, 69.31570], name: "Yapon bog'i", type: "bog", viloyat: "toshkent" },
      { coords: [41.271684849329364, 69.27961605366362], name: "Toshkent xalqaro cherkov", type: "boshqa",
        viloyat: "toshkent" },
      { coords: [41.335726038893265, 69.30075196900717], name: "Yevriylar turar joylari", type: "boshqa",
        viloyat: "toshkent" },
      { coords: [41.37000110258014, 69.27955051372533], name: "Sergeli markaziy xiyoboni", type: "xiyobon",
        viloyat: "toshkent" },
      { coords: [41.37000110258014, 69.28955051372533], name: "Adiblar xiyoboni", type: "xiyobon",
        viloyat: "toshkent" },

      // toshkent viloyati
      { coords: [41.132924167226264, 70.0988564929309], name: "Yangiobod dehqon bozor", type: "bozor",
        viloyat: "toshkent_viloyati" },
      { coords: [41.06926230588689, 70.19499176331537], name: "Parkent bozori", type: "bozor",
        viloyat: "toshkent_viloyati" },
      { coords: [41.30516717227009, 69.75104605572989], name: "Toshkent viloyati xiyoboni", type: "xiyobon",
        viloyat: "toshkent_viloyati" },
      { coords: [41.66456564615232, 70.04095883943369], name: "Toshkent viloyati bog'", type: "bog",
        viloyat: "toshkent_viloyati" },
      { coords: [41.57454920620336, 69.63311223780255], name: "G'azalkent xiyoboni", type: "xiyobon",
        viloyat: "toshkent_viloyati" },
      { coords: [40.852837505033996, 69.4699735971501], name: "Olmaliq", type: "boshqa",
        viloyat: "toshkent_viloyati" },

      //Sirdaryo
      { coords: [42.46530066169878, 59.614013093783875], name: "Guliston savdo kompleksi", type: "bozor",
        viloyat: "sirdaryo" },
      { coords: [40.49755312046327, 68.7844307401733], name: "Guliston shahar Madaniyat va istirohat bog'i",
        type: "bog", viloyat: "sirdaryo" },

      // jizzax
      { coords: [41.320553095168556, 69.25590812920176], name: "Alisher Navoiy bilimdonlar maskani",
        type: "xiyobon", viloyat: "jizzax" },
      { coords: [41.23762933388264, 69.3300124588027], name: "Eski shahar dehqon bozori", type: "bozor",
        viloyat: "jizzax" },
      { coords: [40.116144986218835, 67.82532947096821], name: "Istiqlol bolalar bog'i", type: "bog",
        viloyat: "jizzax" },
      { coords: [40.132676103033326, 67.82703852899014], name: "Yoshlar ko'chasi saylgohi", type: "xiyobon",
        viloyat: "jizzax" },

      // samarqand
      { coords: [39.66285190283602, 66.981757919134], name: "Siyob dehqon bozori", type: "bozor",
        viloyat: "samarqand" },
      { coords: [39.61580497340271, 66.95239238782855], name: "Temir yo'l dehqon bozori", type: "bozor",
        viloyat: "samarqand" },
      { coords: [39.66372839021606, 66.98173007037661], name: "Samarqand shodiyonasi bozori", type: "bozor",
        viloyat: "samarqand" },
      { coords: [39.65581736702614, 66.97535767227416], name: "Yoshlik bog'i", type: "bog",
      viloyat: "samarqand" },
      { coords: [39.65677679200463, 67.0314874294734], name: "Alisher Navoiy bog'i", type: "bog",
        viloyat: "samarqand" },
      { coords: [39.665480101457014, 66.89979188731508], name: "Yo'lbarslar xiyoboni", type: "xiyobon",
        viloyat: "samarqand" },
      { coords: [39.689559784835645, 66.88748256963672], name: "Islom Karimov xiyoboni", type: "xiyobon",
        viloyat: "samarqand" },

      //navoiy
      { coords: [40.1078093074207, 65.3816026037011], name: "Navoiy saxovat dehqon bozori", type: "bozor",
        viloyat: "navoiy" },
      { coords: [40.108781512597744, 65.3693469778999], name: "Navoiy Alisher Navoiy bog'i", type: "bog",
        viloyat: "navoiy" },
      { coords: [40.09257725806076, 65.38046307087143], name: "Navoiy Xiyoboni", type: "xiyobon",
        viloyat: "navoiy" },
      { coords: [40.08902314840619, 65.37858015212156], name: "Radonejning Avliyo Sergius cherkovi",
        type: "boshqa", viloyat: "navoiy" },
      { coords: [41.568098146070255, 64.22618343410005], name: "Zarafshon shahar bozori", type: "bozor",
        viloyat: "navoiy" },
      { coords: [43.176366622689265, 64.27463294634757], name: "Zarafshon shahar bog'i", type: "bog",
        viloyat: "navoiy" },
      { coords: [42.53704931457116, 63.299789396677056], name: "Zarafshon shahar xiyoboni", type: "xiyobon",
        viloyat: "navoiy" },
      { coords: [40.571006822043316, 65.67388422251499], name: "Nurota bozori", type: "bozor",
      viloyat: "navoiy" },
      { coords: [40.563899967964716, 65.7016075333948], name: "Nurota xiyoboni", type: "xiyobon",
        viloyat: "navoiy" },
      { coords: [40.66708160751162, 65.66831866466273], name: "G'azgon bozori", type: "bozor",
      viloyat: "navoiy" },
      { coords: [40.88790899554547, 63.44549246410996], name: "G'azgon bozori", type: "xiyobon",
      viloyat: "navoiy" },
      { coords: [41.052901655790514, 62.9469004499608], name: "G'azgon bozori", type: "bog", viloyat: "navoiy" },
      { coords: [40.1368435616625, 63.50232832200967], name: "G'azgon bozori", type: "bozor", viloyat: "navoiy" },
      { coords: [42.816460785040135, 61.69218482972521], name: "Markaziy Qizilqum milliy tabiat bog'i",
        type: "bog", viloyat: "navoiy" },

      //buxoro
      { coords: [39.77787, 64.41020], name: "Buxoro qadimiy joy", type: "boshqa", viloyat: "buxoro" },
      { coords: [39.7810861685039, 64.40090812570742], name: "Buxoro markaziy dehqon bozori", type: "bozor",
        viloyat: "buxoro" },
      { coords: [39.7960962368612, 64.43013028432192], name: "Boqiy buxoro bog'i", type: "bog",
      viloyat: "buxoro" },
      { coords: [39.76598220902566, 64.42306942862973], name: "Ibn Sino favvoralar maydoni", type: "xiyobon",
        viloyat: "buxoro" },
      { coords: [39.77802362529207, 64.40730768383943], name: "Bolo-Xauz masjidi", type: "boshqa",
        viloyat: "buxoro" },
      { coords: [39.77625083686887, 64.41505390335017], name: "Poi Kalon majmuasi", type: "boshqa",
        viloyat: "buxoro" },

      //fargona
      { coords: [40.2993198601648, 71.97797823254797], name: "Fargona markaziy dehqon bozor", type: "bozor",
        viloyat: "fargona" },
      { coords: [40.48890058879545, 71.65248405563604], name: "Fargona xotira xiyoboni", type: "xiyobon",
        viloyat: "fargona" },
      { coords: [40.38857789758589, 71.78149959814942], name: "Ахмад Ал – Фарғоний истирохат боғи", type: "bog",
        viloyat: "fargona" },

      //namangan
      { coords: [41.07433068403397, 71.62854752866805], name: "Yoshlik baraka bozori", type: "bozor",
        viloyat: "namangan" },
      { coords: [41.00358513145741, 71.61828434575968], name: "Afsonalar vodiysi", type: "bog",
        viloyat: "namangan" },
      { coords: [41.302682868669706, 69.23557765566024], name: "Namangan Adiblar xiyoboni", type: "xiyobon",
        viloyat: "namangan" },
      { coords: [41.01255205762726, 71.67183178250251], name: "Arhangel Mikoil Cherkovi", type: "boshqa",
        viloyat: "namangan" },

      //andijon
      { coords: [40.77064163580476, 72.3514006077863], name: "Andijon markaziy bozor", type: "bozor",
        viloyat: "andijon" },
      { coords: [40.7767313713031, 72.3481847084659], name: "Z.M.Bobur maydoni", type: "xiyobon",
        viloyat: "andijon" },
      { coords: [40.765495863592, 72.35748011503424], name: "Andijon bolalar bogi", type: "bog",
        viloyat: "andijon" },

      //qashqadaryo
      { coords: [38.89911425584375, 65.80373479518629], name: "Qarshi dehqon bozori", type: "bozor",
        viloyat: "qashqadaryo" },
      { coords: [38.88904890403104, 65.81817873087765], name: "Qahqadaryo sohili xiyoboni", type: "xiyobon",
        viloyat: "qashqadaryo" },
      { coords: [38.866640443212404, 65.80036562675336], name: "Vatanparvar istiroshat bogi", type: "bog",
        viloyat: "qashqadaryo" },

      //surxondaryo
      { coords: [38.19584090222818, 67.2043134580868], name: "Yashil dunyo dehqon bozori", type: "bozor",
        viloyat: "surxondaryo" },
      { coords: [37.459397291363075, 66.88683743239343], name: "Markaziy dehqon bozor", type: "bozor",
        viloyat: "surxondaryo" },
      { coords: [37.68785791338187, 67.0546570316785], name: "Bolajon bogi", type: "bog",
      viloyat: "surxondaryo" },
      { coords: [37.45388270802194, 67.06632922125025], name: "Yoshlar sayilgohi bogi", type: "bog",
        viloyat: "surxondaryo" },
      { coords: [37.515992061713334, 67.44329705669496], name: "San'at saroyi xiyoboni", type: "xiyobon",
        viloyat: "surxondaryo" },

      //xorazm
      { coords: [42.465316490731524, 59.61361612672109], name: "Nukus san’at muzeyi", type: "boshqa",
        viloyat: "xorazm" },
      { coords: [41.55402294580902, 60.62115416717337], name: "Urganch markaziy bozor", type: "bozor",
        viloyat: "xorazm" },
      { coords: [41.55819997899874, 60.619796584368174], name: "Amir Tumur bog'i", type: "bog",
      viloyat: "xorazm" },
      { coords: [41.547273010463044, 60.626203626696146], name: "Avesto xiyoboni", type: "xiyobon",
        viloyat: "xorazm" },

      //qoraqalpoq
      { coords: [43.11526981406603, 58.915557794836474], name: "Nukus markaziy dehqon bozor", type: "bozor",
        viloyat: "qoraqalpoq" },
      { coords: [43.75789810694173, 59.021607859651795], name: "Istiqlol bolalar bog'i", type: "bog",
        viloyat: "qoraqalpoq" },
      { coords: [44.16634461153955, 58.26311558894126], name: "Do'stlik kanali bo'yi xalq dam olish saylgohi",
        type: "xiyobon", viloyat: "qoraqalpoq" },
      { coords: [44.55051408466998, 56.77134544868612], name: "Do'stlik xiyoboni", type: "xiyobon",
        viloyat: "qoraqalpoq" },
      { coords: [43.17810405982948, 58.271911708847206], name: "Motamsaro ona haykali va Vatanparvar bog'i",
        type: "xiyobon", viloyat: "qoraqalpoq" },
      { coords: [45.06902403698563, 59.25137251838662], name: "Kantubek", type: "boshqa", viloyat: "qoraqalpoq" },
      { coords: [43.756995285543866, 60.4297622989299], name: "Daukara", type: "boshqa", viloyat: "qoraqalpoq" },
      { coords: [43.52004836996265, 60.96463370221791], name: "Taxtako;pir", type: "boshqa",
      viloyat: "qoraqalpoq" },
      { coords: [43.325923272293565, 60.00772552160315], name: "Akmagnit", type: "xiyobon",
      viloyat: "qoraqalpoq" },
      { coords: [42.26094768467411, 56.30836993556625], name: "Akmagnit", type: "xiyobon",
      viloyat: "qoraqalpoq" },
      { coords: [42.42172510749652, 57.131831645526255], name: "Akmagnit", type: "bozor", viloyat: "qoraqalpoq" },
      { coords: [43.038012797544106, 56.292832922170774], name: "Akmagnit", type: "bog", viloyat: "qoraqalpoq" },

    ];

    // LayerGroup
    const allMarkers = L.layerGroup().addTo(map);

    // Markerlarni LayerGroup ga qo'shamiz
    markers.forEach(m => {
      const marker = L.marker(m.coords, { icon: markerIcons[m.type] })
        .bindTooltip(m.name, { direction: 'top', offset: [0, -10] });

      marker.viloyat = m.viloyat;
      marker.type = m.type;
      marker.info = m.info || "";
      allMarkers.addLayer(marker);

      marker.on('click', function() {
        document.getElementById('markerModalTitle').innerText = m.name;

        // Shu joyda "Kartaga o'tish" tugmasiga kerakli koordinatalarni yozamiz
        // const open3DLink = document.getElementById('open3DMap');
        // open3DLink.dataset.lat = m.coords[0];
        // open3DLink.dataset.lng = m.coords[1];
        // open3DLink.dataset.name = m.name;

        // 1-modalni ochamiz
        $("#markerModal").modal("show");

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
      });
    });

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



    // Viloyat va object tanlanganda kartada select bo'lib o'zgaradigan funksiyasi
    const viloyatSelect = document.getElementById('viloyatSelect');
    const objectSelect = document.getElementById('objectSelect');
    const objectLabelSelect = document.getElementById('objectLabelSelect');
    const objectLabelLabel = document.getElementById('objectLabelLabel');

    function clearObjectLabelSelect() {
      objectLabelSelect.innerHTML = '<option value="">Obyektni tanlang</option>';
    }

    function fadeInMarker(marker) {
      marker.setOpacity(0);
      marker.addTo(map);
      let opacity = 0;
      const step = 0.1;
      const interval = setInterval(() => {
        opacity += step;
        if (opacity >= 1) {
          marker.setOpacity(1);
          clearInterval(interval);
        } else {
          marker.setOpacity(opacity);
        }
      }, 50);
    }

    function filterMarkers() {
      const selectedViloyat = viloyatSelect.value;
      const selectedType = objectSelect.value;
      let delay = 0;

      allMarkers.eachLayer(marker => {
        let show = true;

        if (selectedViloyat && marker.viloyat !== selectedViloyat) show = false;
        if (selectedType && marker.type !== selectedType) show = false;

        if (show) {
          setTimeout(() => {
            marker.addTo(map);
            const el = marker.getElement();
            if (el) {
              el.style.transition = 'transform 0.5s ease, opacity 0.5s ease';
              el.style.opacity = 0;

              // Keyin sakrash animatsiyasi
              setTimeout(() => {
                el.style.opacity = 1;
              }, 50);
            }
          }, delay);
          delay += 100; // markerlar ketma-ket chiqadi
        } else {
          map.removeLayer(marker);
        }
      });
    }


    viloyatSelect.addEventListener('change', function() {
      const selectedViloyat = this.value;
      const markersInViloyat = markers.filter(m => m.viloyat === selectedViloyat);
      if (markersInViloyat.length > 0) {
        map.flyTo(markersInViloyat[0].coords, 12, { animate: true, duration: 1.5 });
      }
      filterMarkers();
    });

    // Object turi tanlanganda obyekt nomlari selectini yangilash
    objectSelect.addEventListener('change', function() {
      const selectedType = this.value;
      const selectedViloyat = viloyatSelect.value;
      clearObjectLabelSelect();

      // Label matnini o‘zgartirish
      let labelText = "Obyektlar";
      if (selectedType === "bozor") labelText = "Bozorlar";
      else if (selectedType === "bog") labelText = "Bog‘lar";
      else if (selectedType === "xiyobon") labelText = "Xiyobonlar";
      else if (selectedType === "boshqa") labelText = "Boshqa obyektlar";
      objectLabelLabel.textContent = labelText;

      const filteredMarkers = markers.filter(m =>
        (!selectedViloyat || m.viloyat === selectedViloyat) &&
        (!selectedType || m.type === selectedType)
      );

      filteredMarkers.forEach(m => {
        const opt = document.createElement('option');
        opt.value = m.name;
        opt.textContent = m.name;
        objectLabelSelect.appendChild(opt);
      });

      if (filteredMarkers.length === 0) {
        const opt = document.createElement('option');
        opt.textContent = "Obyekt topilmadi";
        opt.disabled = true;
        objectLabelSelect.appendChild(opt);
      }

      filterMarkers();
    });

    // Obyekt nomi tanlanganda xaritaga o'tish
      objectLabelSelect.addEventListener('change', function() {
        const selectedName = this.value;
        const selectedMarker = markers.find(m => m.name === selectedName);

        if (selectedMarker) {
          map.flyTo(selectedMarker.coords, 16, { animate: true, duration: 1.5 });
        }
      });

      // 3d kartaga o'tib ketadigan joyi 
    // document.getElementById("open3DMap").addEventListener("click", function(e) {
    //   e.preventDefault();

    //   const lat = parseFloat(this.dataset.lat);
    //   const lng = parseFloat(this.dataset.lng);
    //   const name = this.dataset.name;

    //   // Agar koordinata bo‘lmasa, chiqamiz
    //   if (!lat || !lng) return;


    //   // 2-modal (3D karta) ni ochamiz
    //   const modal = new bootstrap.Modal(document.getElementById('map3DModal'));
    //     modal.show();

    //     // 3D kartani yuklash (kechikish bilan)
    //     setTimeout(() => {
    //       // Avval eski Cesium instance bo‘lsa, tozalaymiz
    //       if (window.cesiumViewer) {
    //         window.cesiumViewer.destroy();
    //         window.cesiumViewer = null;
    //       }

    //       // Yangi Cesium viewer yaratamiz
    //       window.cesiumViewer = new Cesium.Viewer("cesiumContainer", {
    //         baseLayerPicker: false,
    //         animation: false,
    //         timeline: false,
    //         geocoder: false,
    //         fullscreenButton: true,
    //         terrainProvider: new Cesium.EllipsoidTerrainProvider(),
    //       });

    //       // Google Satellite qo‘shamiz
    //       window.cesiumViewer.imageryLayers.removeAll();
    //       window.cesiumViewer.imageryLayers.addImageryProvider(
    //         new Cesium.UrlTemplateImageryProvider({
    //           url: "https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",
    //           maximumLevel: 22,
    //           credit: "Google Satellite"
    //         })
    //       );

    //       // Marker qo‘shamiz
    //       window.cesiumViewer.entities.add({
    //         name,
    //         position: Cesium.Cartesian3.fromDegrees(lng, lat),
    //         point: { pixelSize: 15, color: Cesium.Color.RED },
    //         label: { text: name, pixelOffset: new Cesium.Cartesian2(0, -25) }
    //       });

    //       // Kamera uchadi
    //       window.cesiumViewer.camera.flyTo({
    //         destination: Cesium.Cartesian3.fromDegrees(lng, lat, 800), // 👈 YAQINROQ
    //         orientation: {

    //           pitch: Cesium.Math.toRadians(-20), // pastga ozgina qaraydi
    //           roll: 0.0
    //         },
    //         complete: function() {
    //           window.cesiumViewer.camera.moveBackward(8000); // orqaroqqa 800 metr

    //         }
    //       });

    //     }, 500);
    //   });

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