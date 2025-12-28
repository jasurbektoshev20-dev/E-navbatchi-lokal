{include file="header.tpl"}
<!-- Content -->
<link rel="stylesheet" href="/assets/assets/vendor/css/pages/app-chat.css" />
<link rel="stylesheet" href="/assets/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.css" />
<link rel="stylesheet" href="/assets/assets/vendor/libs/toastr/toastr.css" />
<link rel="stylesheet" href="/assets/assets/vendor/libs/animate-css/animate.css" />
<link rel="stylesheet" href="/assets/assets/vendor/libs/spinkit/spinkit.css" />

<style>
    {literal}
        #toast-container>.toast-warning {
            background-image: none !important;
        }

        #toast-container>div {
            padding: 14px 0 5px 5px !important;
        }

        .toast-title {
            font-weight: 400 !important;
        }

        body::-webkit-scrollbar {
            width: 10px;
        }

        /* .chart-container {
            position: relative;
            height: calc(50vh - 16.3rem);
            overflow: visible;
            padding: 0 5px;
            padding-bottom: 10px;
        } */

        .form-select-box{
            position: fixed;
            z-index: 2000;
            top: 0;
            left: 38%;
            transform: translateY(30px);
            display: flex;
            gap: 10px;
        }

        .form-select .selectOption {
            padding: 10px;
        }

        .card-text, .card-title{
            font-size: 17px !important;
        }

        small, .small {
            font-size: 1.25rem !important;
        }
/* 
        .chat-box-span{
            position: relative;
        }

        .chat-box-span span{
            text-align: end;
            position: absolute;
            right: 5px;
            bottom: 2px;
            font-weight: bold;
        }

        .chat-box-span p{
            padding-bottom: 10px;
        }

        .chat-message-text p{
            text-align: end;
        } */

     .chat-popup {
            position: fixed;
            bottom: 50px;
            right: 20px;
            width: 560px;
            height: 75vh;          /* 🔥 MUHIM */
            z-index: 9999;
            /* background: #fff;
            border-radius: 12px; */
            display: flex;
            flex-direction: column;
        }

        .chat-history-wrapper {
    display: flex;
    flex-direction: column;
    height: 100%;
    margin: 10px;
}

.chat-history-header {
    flex: 0 0 auto;
}

.chat-history-body {
    flex: 1 1 auto;        /* 🔥 ASOSIY JOY */
    overflow-y: auto;
    padding: 10px;
}

.chat-history-footer {
    flex: 0 0 auto;
}

.chat-history {
    margin: 0;
    padding: 0;
}

.message-input {
    min-height: 40px;
}

.app-chat .app-chat-history .chat-history-body {
    height: 55vh;
    padding: 2rem 1.5rem;
    overflow: hidden;
}

.noselect {
    user-select: none;
}

.camera-box {
    width: 100%;
    height: 500px; /* faqat shu yerda */
}

#playWind {
    width: 100%;
    height: 100%;
    position: relative;
}

.cam-overlay {
    position: absolute;
    inset: 0;
    background: rgba(0,0,0,0.85);
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    font-size: 20px;
    z-index: 10;
}

.cam-loading::after {
    content: "📡 Kamera ulanmoqda...";
    animation: pulse 1.2s infinite;
    font-size: 20px;
}

.cam-offline::after {
    content: "❌ Kamera offline";
    color: #ff5252;
    font-size: 20px;
}

@keyframes pulse {
    0% { opacity: .4; }
    50% { opacity: 1; }
    100% { opacity: .4; }
}

:fullscreen #playWind,
:fullscreen #playWind .parent-wnd {
    width: 100% !important;
    height: 100% !important;
}

.time-wrapper.horizontal {
  display: flex;
  flex-direction: column;
  gap: 20px;
  max-width: 900px;
  margin: 30px auto;
}

/* CARD */
.time-card.wide {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: linear-gradient(90deg, #0c1934, #09152a);
  border-radius: 18px;
  padding: 20px 28px;
  height: 100px;
  box-shadow: 0 0 25px rgba(79,124,255,0.25);
}

/* LEFT */
.time-left {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.time-title {
  color: #8ea8ff;
  font-size: 15px;
  letter-spacing: 1px;
  text-transform: uppercase;
}

/* TIME */
.time-display {
  font-size: 34px;
  font-weight: bold;
  letter-spacing: 3px;
  color: #ffffff;
}

.time-display.fast {
  color: #ff4d4d; /* qizil */
  text-shadow: 0 0 8px rgba(255, 77, 77, 0.7);
}

/* ICON */
.time-icon {
  font-size: 40px;
  opacity: 0.7;
}

/* BUTTONS */
.time-controls.horizontal {
  display: flex;
  gap: 12px;
}

.time-controls.horizontal button {
  background: #0e1a32;
  border: 1px solid #4f7cff;
  color: #fff;
  font-size: 18px;
  width: 44px;
  height: 44px;
  border-radius: 12px;
  cursor: pointer;
  transition: 0.3s;
}

.time-controls.horizontal button:hover {
  background: #4f7cff;
  box-shadow: 0 0 12px #4f7cff;
}

.time-controls button.active {
  background: #4f7cff;
  box-shadow: 0 0 14px #4f7cff;
  transform: scale(1.05);
}

/* start active */
.time-controls button.active.start {
  background:  #ff4d4d;;
  box-shadow: 0 0 8px rgba(255, 77, 77, 0.7);
}

/* stop active */
.time-controls button.active.stop {
  background: #ffb84d;
  box-shadow: 0 0 14px rgba(255,184,77,.8);
}

/* reset hover */
.time-controls button.reset:hover {
  background: #ff5c5c;
  box-shadow: 0 0 14px rgba(255,92,92,.8);
}


    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <div class="app-chat">
        <div style="height: calc(100vh - 7rem);" class="row">
            <div class="col-7">

                <div class="form-select-box">
                   <select class="form-select card" id="regions">
                        {foreach from=$Regions item=region key=mkey}
                            <option class="selectOption" value="{$region.id}">{$region.name}</option>
                        {/foreach}
                  </select>
                   <select id="division_id" class="form-select">
                        <option value="">Танланг...</option>
                  </select>
                </div>
             

                 <div id="card_duty"></div>

                <div class="row mt-3 g-2">
                    {foreach from=$Cooperates item=item key=mkey}
                        <div class="col-md-6 col-lg-3 ">
                            <div class="card text-center chart-container">
                                <div class="mt-3">
                                    <img style="width: 90px; height: 85px; border-radius: 20px"
                                        src="pictures/cooperates/{$item.logo}">
                                </div>
                                <div class="card-body px-1 py-2">
                                    <h6 class="pb-0 mb-0 card-title" >{$item.name}</h6>
                                  <p class="pb-0 mb-0 card-text">
                                      <a href="tel:{$item.phone}">{$item.phone}</a>
                                  </p>
                                  <p class="pb-0 mb-0 card-text">
                                      <a href="tel:{$item.phone2}">{$item.phone2}</a>
                                  </p>
                                  
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>
          <div class="col-5">
            <div class="camera-box position-relative">
                <div id="playWind"></div>
            </div>


        <div class="time-wrapper horizontal">
            <!-- MAHALLIY VAQT -->
            <div class="time-card wide">
                <div class="time-left">
                <div class="time-title"> Маҳаллий вақт</div>
                <div class="time-display" id="localTime">00:00:00</div>
                </div>
                <div class="time-icon">🕒</div>
            </div>

            <!-- TEZKOR VAQT -->
            <div class="time-card wide">
                <div class="time-left">
                <div class="time-title">Тезкор вақт</div>
                <div class="time-display fast" id="fastTime">00:00:00</div>
                </div>

              <div class="time-controls horizontal">
                <button id="startBtn" class="start">▶</button>
                <button id="stopBtn" class="stop">⏸</button>
                <button id="resetBtn" class="reset">🔄</button>
             </div>

            </div>
        </div>


            
            </div>




            <!-- CHAT POPUP -->
            <div id="chatPopup" class="chat-popup d-none">
                <div style="background-color: transparent;" class="app-chat-history card"  id="chatDragHandle">
                    <div class="chat-history-wrapper">
                        <div class="chat-history-header border-bottom d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="m-0">{$Dict.instant_messaging_window}</h6>
                                <small class="text-muted">{$Dict.chat}</small>
                            </div>
                            <button id="closeChat" class="btn btn-sm btn-light">✕</button>
                        </div>

                        <div class="chat-history-body">
                            <ul class="list-unstyled chat-history"></ul>
                        </div>

                        <div class="chat-history-footer shadow-sm">
                            <div class="form-send-message d-flex align-items-center">
                                <input class="form-control message-input border-0 me-2"
                                    placeholder="{$Dict.write_message}">
                                <button class="btn btn-primary" id="sendMsg">
                                    <i class="ti ti-send"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button id="openChat" class="btn btn-primary position-fixed"
                    style="bottom:20px; right:20px; border-radius:50%; width:55px; height:55px;">
                💬
            </button>



        
        </div>
    </div>
</div>

<script src="/assets/js/echarts.min.js"></script>
<script src="/assets/js/socketio.js"></script>

<script src="/assets/hls.js"></script>

<script src="/dist/jsPlugin-1.2.0.min.js"></script>
<script src="/dist/polyfill2.js"></script>
<script src="/dist/cryptico.min.js"></script>
<script src="/dist/uuid.js"></script>
<script src="/dist/jquery.cookie.js"></script>

<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.js"></script>
<script src="/assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/assets/assets/vendor/libs/toastr/toastr.js"></script>

<script>
    var UserStructure = "{$UserStructure}";
    var StaffID = "{$smarty.session.userid}";
    var AJAXPHP = "ajax.php";
    var staff_1 = "{$Dict.staff_1}"
    var staff_2 = "{$Dict.staff_2}"
    var staff_3 = "{$Dict.staff_3}"
    var no_data_found = "{$Dict.no_data_found}"
    let staffphoto = `/pictures/staffs/{$smarty.session.staffphoto}` || "/assets/assets/img/avatars/1.png"
    {literal}

const startBtn = document.getElementById('startBtn');
const stopBtn  = document.getElementById('stopBtn');
const resetBtn = document.getElementById('resetBtn');

function clearActive() {
  startBtn.classList.remove('active');
  stopBtn.classList.remove('active');
}

startBtn.addEventListener('click', () => {
  clearActive();
  startBtn.classList.add('active');
  startBtn.classList.add('start');
});

stopBtn.addEventListener('click', () => {
  clearActive();
  stopBtn.classList.add('active');
  stopBtn.classList.add('stop');
});

resetBtn.addEventListener('click', () => {
  clearActive();
});


function updateLocalTime() {
  const now = new Date();
  const time =
    String(now.getHours()).padStart(2, '0') + ':' +
    String(now.getMinutes()).padStart(2, '0') + ':' +
    String(now.getSeconds()).padStart(2, '0');

  document.getElementById('localTime').innerText = time;
}
setInterval(updateLocalTime, 1000);
updateLocalTime();

/* ===========================
   TEZKOR VAQT (STOPWATCH)
=========================== */
let timer = null;
let seconds = 0;

function renderFastTime() {
  const h = String(Math.floor(seconds / 3600)).padStart(2, '0');
  const m = String(Math.floor((seconds % 3600) / 60)).padStart(2, '0');
  const s = String(seconds % 60).padStart(2, '0');
  document.getElementById('fastTime').innerText = `${h}:${m}:${s}`;
}

document.getElementById('startBtn').onclick = () => {
  if (timer) return;
  timer = setInterval(() => {
    seconds++;
    renderFastTime();
  }, 1000);
};

document.getElementById('stopBtn').onclick = () => {
  clearInterval(timer);
  timer = null;
};

document.getElementById('resetBtn').onclick = () => {
  clearInterval(timer);
  timer = null;
  seconds = 0;
  renderFastTime();
};

renderFastTime();















        let isDragging = false;
        let offsetX = 0;
        let offsetY = 0;

const $popup = $('#chatPopup');
const $handle = $('#chatDragHandle');

$handle.on('mousedown', function (e) {
    isDragging = true;

    const pos = $popup.offset();
    offsetX = e.pageX - pos.left;
    offsetY = e.pageY - pos.top;

    $('body').addClass('noselect'); // text select bo'lmasin
});

$(document).on('mousemove', function (e) {
    if (!isDragging) return;

    $popup.css({
        left: e.pageX - offsetX,
        top:  e.pageY - offsetY,
        bottom: 'auto',
        right: 'auto'
    });
});

$(document).on('mouseup', function () {
    isDragging = false;
    $('body').removeClass('noselect');
});



        $('#openChat').on('click', function () {
            $('#chatPopup').toggleClass('d-none');
        });

        $('#closeChat').on('click', function () {
            $('#chatPopup').addClass('d-none');
        });

        function renderChats(messages) {
                    const $list = $('.chat-history'); 
                    $list.empty();

                    messages.forEach(function (m) {
                        const isMe = (UserStructure === parseInt(m.sender_id));
                     
                        if (isMe) {
                        const html = `
                            <li class="chat-message chat-message-right">
                            <div class="d-flex overflow-hidden">
                                <div class="chat-message-wrapper flex-grow-1">
                                <div class="chat-message-text chat-box-span">
                                    <p class="mb-0">${m.text ?? ''}</p>
                                    <span>${m.shortname1 ?? ''}${m.sender_name ?? ''}</span>
                                </div>
                                <div class="text-end text-muted mt-1">
                                    <i class="ti ti-checks ti-xs me-1 text-success"></i>
                                    <small>${m.time}</small>
                                </div>
                                </div>
                                <div class="user-avatar flex-shrink-0 ms-3">
                                <div class="avatar avatar-sm">
                                    ${
                                    m.sender_pic
                                        ? `<img src="/pictures/staffs/${m.sender_pic}" class="rounded-circle" />`
                                        : `<div class="bg-primary text-white rounded-circle text-center py-1">
                                            ${m.shortname ?? ''}
                                        </div>`
                                    }
                                </div>
                                </div>
                            </div>
                            </li>`;
                        $list.append(html);
                        } else {
                        // Chap tomondagi xabar
                        const html = `
                            <li class="chat-message chat-message-left">
                            <div class="d-flex overflow-hidden">
                                <div class="user-avatar flex-shrink-0">
                                <div class="avatar avatar-sm">
                                    ${
                                    m.sender_pic
                                        ? `<img src="/pictures/staffs/${m.sender_pic}" class="rounded-circle" />`
                                        : `<div class="bg-primary text-white rounded-circle text-center py-1">
                                            ${m.shortname ?? ''}
                                        </div>`
                                    }
                                </div>
                                </div>
                                <div class="chat-message-wrapper flex-grow-1 ms-3">
                                <div class="chat-message-text">
                                    <h6 class="mb-0">${m.text ?? ''}</h6>
                                    <p class="mb-0 text-info">${m.sender_name ?? ''}</p>
                                </div>
                                <div class="text-end text-muted mt-1 d-flex">
                                    <small>${m.time}</small>
                                </div>
                                </div>
                            </div>
                            </li>`;
                        $list.append(html);
                        }
                    });

                    // Pastga skroll
                    const $body = $('.chat-history-body');
                    $body.scrollTop($body[0].scrollHeight);
          }

        function loadChats() {
        $.ajax({
            url: `${AJAXPHP}?act=get_chats`,
            type: 'GET',
            dataType: 'json',
            data: {
            staff_id: UserStructure, 
            limit: 50        
            },
            success: function (res) {
            if (!res) return;
            renderChats(res);
            },
            error: function (xhr, status, error) {
            console.error('get_chats AJAX error:', error);
            }
        });
        }

        // Sahifa yuklanganda bir marta
        loadChats();

        // Har 5 sekundda yangilab turish
        setInterval(loadChats, 4000);

        function addPendingMessage(text) {
            const tempId = 'tmp-' + Date.now();

            const html = `
                <li class="chat-message chat-message-right" data-id="${tempId}">
                <div class="chat-message-wrapper">
                    <div class="chat-message-text">
                    <p class="mb-0">${text}</p>
                    </div>
                    <div class="text-end text-muted mt-1 status-line">
                    <i class="ti ti-clock ti-xs me-1 text-warning"></i>
                    <small>Yuborilmoqda...</small>
                    </div>
                </div>
                </li>
            `;
            $('.chat-history').append(html);
            scrollToBottom();
            return tempId;
     }

     function markMessageSent(tempId, time) {
            const $msg = $(`[data-id="${tempId}"]`);
            $msg.find('.status-line').html(`
                <i class="ti ti-checks ti-xs me-1 text-success"></i>
                <small>${time}</small>
            `);
            }





        let color = localStorage.getItem('templateCustomizer-vertical-menu-template-no-customizer--Style') == 'light' ?
            '#000' : '#fff';

        let chatHistoryBody = document.querySelector('.chat-history-body');
        let messageInput = $('.message-input');
        let formSendMessage = $('.form-send-message');

        messageInput.focus();
        // Chat history scrollbar
        if (chatHistoryBody) {
            new PerfectScrollbar(chatHistoryBody, {
                wheelPropagation: false,
                suppressScrollX: true
            });
        }

        // Scroll to bottom function
        function scrollToBottom() {
            chatHistoryBody.scrollTo(0, chatHistoryBody.scrollHeight);
        }
        scrollToBottom();

    
       // Send Message
        function sendMsg(e) {
            let msg = messageInput.val();
             const tempId = addPendingMessage(msg);
            if (msg) {
                
                const currentTimestamp = new Date();
                $.ajax({
                    type: "POST",
                    url: `hrajax.php?act=act_chat`,
                    dataType: "json",
                    encode: true,
                    contentType: "application/json",
                    data: JSON.stringify({
                        sender_id: UserStructure,
                        staff_id: StaffID,
                        time: currentTimestamp.toISOString(),
                        text: msg,
                        status: 1
                    }),
                    success: function(data) {
                        console.log('data', data);
                          if (data && data.time) {
                               markMessageSent(tempId, data.time);
                          }
                    }
                })

                let chatHistoryBox = $(".chat-history");
                messageInput.val('');
                scrollToBottom();
                $(this).trigger('click');
            }
        }

        $(document).on("keypress", '.message-input', async function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                sendMsg()
            }
        });
        $('#sendMsg').on('click', sendMsg);




        
   $(document).ready(function () {
        let fetched_camera = [];

        function loadDutyByRegion(region) {
            $.ajax({
                type: "GET",
                url: `${AJAXPHP}?act=get_duty&id=${region}`,
                dataType: "json",
                success: function (data) {
                   fetched_camera = data?.cameras || [];
                    initCamera();
                    get_camera(); 
                    $('#card_duty').empty();

                    if (!data?.Duty || data?.Duty.length === 0) {
                        $('#card_duty').append(`
                            <div class="card text-center card-duty-img-box">
                                <div class="mt-3">
                                    <img style="width: 250px; height: 293px; border-radius: 20px" src="assets/images/nophoto2.png">
                                </div>
                                <div class="card-body px-3 py-3">
                                    ${no_data_found}
                                </div>
                            </div>
                        `);
                    } else {
                        let cardContent = '';
                        data?.Duty.forEach(item => {
                            cardContent += `
                                <div class="staff-item text-center">
                                    <img style="width: 230px; height: 270px; border-radius: 20px" src="pictures/staffs/${item.photo}">
                                    <h6 class="mt-2 mb-0 card-title">${item.staff}</h6>
                                
                                    <p class="mb-0 card-text"><small class="text-muted">${item.role} ${item.lastname}</small></p>
                                    <p class="mb-0 card-text"><small class="text-muted">
                                    <a href="tel:${item.phone}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone-forward-fill" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877zm10.761.135a.5.5 0 0 1 .708 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 0 1-.708-.708L14.293 4H9.5a.5.5 0 0 1 0-1h4.793l-1.647-1.646a.5.5 0 0 1 0-.708"/>
                                        </svg> ${item.phone}
                                        </a>
                                    </small></p>
                                </div>
                            `;
                        });

                        $('#card_duty').append(`
                            <div class="card text-center p-3">
                                <div class="d-flex justify-content-center gap-4 flex-wrap">
                                    ${cardContent}
                                </div>
                            </div>
                        `);
                    }
                }
            });
        }

    function loadDivisionsByRegion(regionId) {
        $.get(`${AJAXPHP}?act=get_divisions&structure_id=${regionId}`, function (data) {
            $('#division_id').empty().append('<option value="">Танланг...</option>');
            if (data && data.length > 0) {
                $.each(data, function (i, d) {
                    $('#division_id').append(`<option value="${d.id}">${d.name}</option>`);
                });
            }
        }, 'json');
    }

    let initialRegion = $('#regions').val();
    let divisionId = $('#division_id').val();

    $('#regions').change(function () {
        initialRegion = $(this).val();
        if (!initialRegion) {
            $('#division_id').empty().append('<option value="">Танланг...</option>');
            $('#card_duty').empty();
            return;
        }

        loadDivisionsByRegion(initialRegion);

        loadDutyByRegion(initialRegion);
    });
    $('#division_id').change(function () {
        divisionId = $(this).val();
        loadDutyByRegion(divisionId);
    });

    if (initialRegion) {
        loadDivisionsByRegion(initialRegion);
        loadDutyByRegion(initialRegion);
    }




















let normalSize = { w: 0, h: 0 };

    function getLayoutByCount(count) {
    if (count <= 1) return 1;
    if (count <= 4) return 2;
    if (count <= 9) return 3;
    return 4;
}

let jsDecoder = null;

function initCamera() {

    const el = document.getElementById('playWind');
    const w = el.clientWidth;
    const h = el.clientHeight;

    if (jsDecoder) {
        jsDecoder.JS_StopRealPlayAll();
        return;
    }

    jsDecoder = new JSPlugin({
        szId: "playWind",
        iType: 2,
        iWidth: w,
        iHeight: h,
        iMaxSplit: 16,
        szBasePath: "./dist",
        oStyle: {
            border: "#343434",
            borderSelect: "#4caf50",
            background: "#000"
        }
    });

    jsDecoder.JS_Resize(w, h);
    bindDblClick();
}



async function get_camera() {

    if (!jsDecoder || !fetched_camera || !fetched_camera.length) return;

    jsDecoder.JS_StopRealPlayAll();

    const camCount = fetched_camera.length;
    const layout = getLayoutByCount(camCount);

    jsDecoder.JS_ArrangeWindow(layout);

 fetched_camera.forEach((cam, index) => {

    const $wnd = $('.parent-wnd > div').eq(index);
    $wnd.css('position', 'relative');

    const $loading = $('<div class="cam-overlay cam-loading"></div>');
    $wnd.append($loading);

    // Offline bo‘lsa
    if (!cam.status || !cam.url) {
        $loading.removeClass('cam-loading').addClass('cam-offline');
        retryCamera(cam, index);
        return;
    }

    jsDecoder.JS_Play(
        cam.url,
        { playURL: cam.url },
        index
    ).then(
        () => {
            $loading.remove();
        },
        () => {
            $loading.removeClass('cam-loading').addClass('cam-offline');
            retryCamera(cam, index);
        }
    );
});


    $(".camera_length").text(camCount);
}




let isResizing = false;
function resetDecoder() {
    if (!jsDecoder) return;

    jsDecoder.JS_StopRealPlayAll();
    jsDecoder.JS_DestroyControl();

    jsDecoder = null;

    setTimeout(() => {
        initCamera();
        get_camera();
    }, 200);
}


function fullSreen() {
    const el = document.getElementById('playWind');

    if (!document.fullscreenElement) {
        el.requestFullscreen();
    } else {
        document.exitFullscreen();
    }
}



document.addEventListener("fullscreenchange", function () {
    // fullscreen'dan chiqilganda
    if (!document.fullscreenElement) {
        resetDecoder();
    }
});




function bindDblClick() {
    const el = document.getElementById('playWind');
    if (!el) return;

    el.addEventListener('dblclick', function (e) {
        e.preventDefault();
        fullSreen();
    });
}





  function retryCamera(cam, index) {
    setTimeout(() => {

        const $wnd = $('.parent-wnd > div').eq(index);
        const $loading = $wnd.find('.cam-overlay');

        if ($loading.hasClass('cam-offline')) {
            console.log('Retry camera', index);
            jsDecoder.JS_Play(
                cam.url,
                { playURL: cam.url },
                index
            );
        }

    }, 5000);
}




});

    {/literal}
</script>
<!-- / Content -->
{include file="footer.tpl"}