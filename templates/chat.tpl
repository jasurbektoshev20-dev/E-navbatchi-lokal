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

        .chart-container {
            position: relative;
            height: calc(50vh - 16.3rem);
            overflow: visible;
            padding: 0 5px;
            padding-bottom: 10px;
        }

        .form-select {
            position: fixed;
            z-index: 2000;
            top: 0;
            left: 45%;
            width: 450px;
            transform: translateY(30px);
        }

        .form-select .selectOption {
            padding: 10px;
        }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <div class="app-chat">
        <div style="height: calc(100vh - 7rem);" class="row">
            <div class="col-8">

            
                {* <select class="form-select card" id="regions">
                    {foreach from=$Regions item=region key=mkey}
                        <option class="selectOption" value="{$region.id}">{$region.name}</option>
                    {/foreach}
                </select> *}

                  <select class="form-select card" id="regions">
                    <option value="">— Viloyatni tanlang —</option>
                  </select>

                 {* <div id="card_duty" class="card-group d-flex flex-wrap gap-4 mt-4 justify-content-center"></div> *}
                 <div id="card_duty" class="mt-4"></div>




                {* <div id="card_duty" class="card-group d-flex gap-4">
                    {if !$Duty}
                        <div class="card text-center">
                            <div class="mt-3">
                                <img style="width: 270px; height: 293px; border-radius: 20px"
                                    src="assets/images/nophoto2.png">
                            </div>
                            <div class="card-body px-3 py-3">
                                {$Dict.no_data_found}
                            </div>
                        </div>
                    {/if}
                    {foreach from=$Duty item=item key=mkey}
                        <div class="card text-center">
                            <div class="mt-3">
                                <img style="width: 230px; height: 230px; border-radius: 20px"
                                    src="pictures/staffs/{$item.photo}">
                            </div>
                            <div class="card-body px-3 py-3">
                                <h6 class="pb-0 mb-0 card-title">{$item.staff}</h6>
                                <p class="pb-0 mb-0 card-text"> {$item.position} </p>
                                <p class="pb-0 mb-0 card-text"><small class="text-muted">{$item.role}
                                        {$item.lastname}</small></p>
                                <p class="pb-0 mb-0 card-text"><small class="text-muted">{$item.phone}</small></p>
                            </div>
                        </div>
                    {/foreach}
                </div> *}





                <div class="row mt-3 g-2">
                    {foreach from=$Cooperates item=item key=mkey}
                        <div class="col-md-6 col-lg-3 ">
                            <div class="card text-center chart-container">
                                <div class="mt-3">
                                    <img style="width: 100px; height: 100px; border-radius: 20px"
                                        src="pictures/cooperates/{$item.logo}">
                                </div>
                                <div class="card-body px-1 py-2">
                                    <h6 class="pb-0 mb-0 card-title">{$item.name}</h6>
                                    <p class="pb-0 mb-0 card-text"> {$item.phone} </p>
                                    <p class="pb-0 mb-0 card-text"><small class="text-muted">{$item.phone2}</small></p>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            </div>

            <!-- Chat History -->
            <div style="background-color: transparent;" class="col-4 app-chat-history card ">
                <div class="chat-history-wrapper">
                    <div class="chat-history-header border-bottom">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex overflow-hidden align-items-center">
                                <div class="chat-contact-info flex-grow-1 ms-2">
                                    <h6 class="m-0">{$Dict.instant_messaging_window}</h6>
                                    <small class="user-status text-muted">{$Dict.chat}</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="background-color: transparent;" class="chat-history-body">
                        <ul class="list-unstyled chat-history">
                            {foreach from=$Messages item=message key=mkey}
                                {if $UserStructure == $message.sender_id}
                                    <li class="chat-message chat-message-right">
                                        <div class="d-flex overflow-hidden">
                                            <div class="chat-message-wrapper flex-grow-1">
                                                <div class="chat-message-text">
                                                    <p class="mb-0">{$message.text}</p>
                                                </div>
                                                <div class="text-end text-muted mt-1">
                                                    <i class="ti ti-checks ti-xs me-1 text-success"></i>
                                                    <small>{$message.time}</small>
                                                </div>
                                            </div>
                                            <div class="user-avatar flex-shrink-0 ms-3">
                                                <div class="avatar avatar-sm">
                                                    {if $message.sender_pic}
                                                        <img src="/pictures/staffs/{$message.sender_pic}" alt="Avatar"
                                                            class="rounded-circle" />
                                                    {else}
                                                        <div class="bg-primary text-white rounded-circle text-center py-1">
                                                            {$message.shortname}
                                                        </div>
                                                    {/if}
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                {else}
                                    <li class="chat-message chat-message-left">
                                        <div class="d-flex overflow-hidden">
                                            <div class="user-avatar flex-shrink-0 ">
                                                <div class="avatar avatar-sm">
                                                    {if $message.sender_pic}
                                                        <img src="/pictures/staffs/{$message.sender_pic}" alt="Avatar"
                                                            class="rounded-circle" />
                                                    {else}
                                                        <div class="bg-primary text-white rounded-circle text-center py-1">
                                                            {$message.shortname}
                                                        </div>
                                                    {/if}
                                                </div>
                                            </div>
                                            <div class="chat-message-wrapper flex-grow-1 ms-3">
                                                <div class="chat-message-text">
                                                    <h6 class="mb-0 text-info">{$message.sender}</h6>
                                                    <p class="mb-0">{$message.text}</p>
                                                </div>
                                                <div class="text-end text-muted mt-1 d-flex ">
                                                    <small>{$message.time}</small>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                {/if}
                            {/foreach}
                        </ul>
                    </div>
                    <!-- Chat message form -->
                    <div class="chat-history-footer shadow-sm">
                        <div class="form-send-message d-flex justify-content-between align-items-center">
                            <input class="form-control message-input card border-0 me-3 shadow-none"
                                placeholder="{$Dict.write_message}" />
                            <div class="message-actions d-flex align-items-center">
                                <button class="btn btn-primary d-flex send-msg-btn" id="sendMsg">
                                    <i class="ti ti-send me-md-1 me-0"></i>
                                    <span class="align-middle d-md-inline-block d-none">{$Dict.send}</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Chat History -->

            <div class="app-overlay"></div>
        </div>
    </div>
</div>

<script src="/assets/js/echarts.min.js"></script>
<script src="/assets/js/socketio.js"></script>

<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.js"></script>
<script src="/assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="/assets/assets/vendor/libs/toastr/toastr.js"></script>

<script>
    var UserStructure = "{$UserStructure}";
    var StaffID = "{$smarty.session.userid}";
    var AJAXPHP = "ajax{$AddURL}.php";
    var staff_1 = "{$Dict.staff_1}"
    var staff_2 = "{$Dict.staff_2}"
    var staff_3 = "{$Dict.staff_3}"
    var no_data_found = "{$Dict.no_data_found}"
    let staffphoto = `/pictures/staffs/{$smarty.session.staffphoto}` || "/assets/assets/img/avatars/1.png"
    {literal}


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



(function(){
    if (window.__dutyAppInitialized) return;
    window.__dutyAppInitialized = true;

    // ======= "Baza" sifatida ishlaydigan JS ma'lumotlar =======
    const Regions = [
      { id: 1, name: "Toshkent" },
      { id: 2, name: "Samarqand" },
      { id: 3, name: "Farg'ona" }
    ];

    const Duties = {
      1: [
        { staff: "Aliyev Jasur", position: "Direktor", role: "Boshliq", lastname: "Aliyev", phone: "+99890 1112233", photo: "aliyev.jpg" },
        { staff: "Karimova Dilnoza", position: "Yordamchi", role: "Assistent", lastname: "Karimova", phone: "+99891 5556677", photo: "dilnoza.jpg" },
        { staff: "Raxmonov Akmal", position: "Xodim", role: "Texnik", lastname: "Raxmonov", phone: "+99899 4445566", photo: "akmal.jpg" }
      ],
      2: [
        { staff: "Rasulov Bekzod", position: "Nazorat bo‘limi", role: "Inspektor", lastname: "Rasulov", phone: "+99893 1234567", photo: "bekzod.jpg" }
      ],
      3: [] // Farg'ona uchun ma'lumot yo'q
    };

    const NO_DATA_TEXT = "Ma'lumot topilmadi.";

    $(function() {
      Regions.forEach(region => {
        $('#regions').append(`<option value="${region.id}">${region.name}</option>`);
      });
      showDefaultCard();
    });

    function showDefaultCard() {
      $('#card_duty').html(`
        <div class="main-card text-center">
          <img style="width: 270px; height: 293px; border-radius: 20px" src="assets/images/nophoto2.png">
          <div class="mt-3">${NO_DATA_TEXT}</div>
        </div>
      `);
    }

    $('#regions').off('change.dutyApp').on('change.dutyApp', function() {
      const region = $(this).val();
      $('#card_duty').empty();

      if (!region) {
        showDefaultCard();
        return;
      }

      const data = Duties[region] || [];

      if (!data.length) {
        $('#card_duty').html(`
          <div class="main-card text-center">
            <img style="width: 270px; height: 293px; border-radius: 20px" src="assets/images/nophoto2.png">
            <div class="mt-3">${NO_DATA_TEXT}</div>
          </div>
        `);
      } else {
        // Bitta katta card (box) ichida barcha odamlarni ko‘rsatamiz
        let innerCards = "";
        data.forEach(item => {
          innerCards += `
            <div class="col-md-4 col-sm-6">
              <div class="card staff-card text-center p-3 mb-4">
                <img style="width: 160px; height: 160px; border-radius: 15px; object-fit: cover;"
                     src="pictures/staffs/${item.photo}"
                     alt="${item.staff}"
                     onerror="this.onerror=null;this.src='assets/images/nophoto2.png'">
                <div class="card-body px-2 py-2">
                  <h6 class="card-title mb-1">${item.staff}</h6>
                  <p class="mb-1">${item.position}</p>
                  <p class="mb-1"><small class="text-muted">${item.role} ${item.lastname}</small></p>
                  <p class="mb-0"><small class="text-muted">${item.phone}</small></p>
                </div>
              </div>
            </div>`;
        });

        $('#card_duty').html(`
          <div class="main-card"> 
            <div class="row">${innerCards}</div>
          </div>
        `);
      }
    });

  })();
/*
        $('#regions').change(function() {
            let region = $(this).val();
            $.ajax({
                type: "GET",
                url: `${AJAXPHP}?act=get_duty&id=${region}`,
                dataType: "json",
                encode: true,
                success: function(data) {
                    $('#card_duty').empty()
                    if (!data || data.length === 0) {
                        $('#card_duty').append(`
                            <div class="card text-center">
                                <div class="mt-3">
                                    <img style="width: 270px; height: 293px; border-radius: 20px" src="assets/images/nophoto2.png">
                                </div>
                                <div class="card-body px-3 py-3">
                                    ${no_data_found}
                                </div>
                            </div>
                        `);
                    } else {
                        // Iterate over data and append cards
                        data.forEach(item => {
                            $('#card_duty').append(`
                                <div class="card text-center">
                                    <div class="mt-3">
                                        <img style="width: 230px; height: 230px; border-radius: 20px" src="pictures/staffs/${item.photo}">
                                    </div>
                                    <div class="card-body px-3 py-3">
                                        <h6 class="pb-0 mb-0 card-title">${item.staff}</h6>
                                        <p class="pb-0 mb-0 card-text">${item.position}</p>
                                        <p class="pb-0 mb-0 card-text"><small class="text-muted">${item.role} ${item.lastname}</small></p>
                                        <p class="pb-0 mb-0 card-text"><small class="text-muted">${item.phone}</small></p>
                                    </div>
                                </div>
                            `);
                        });
                    }

                }
            })
        })


*/










        const socket = io('http://10.19.7.4:3000');
        socket.on('get_message', (data) => {
            const messageAlignmentClass = UserStructure == data[0].sender_id ? "chat-message-right" :
                "chat-message-left";
            const alignmentClassForPic = UserStructure == data[0].sender_id ? "" : "flex-row-reverse";
            const ms = UserStructure == data[0].sender_id ? "" : "ms-3";
            const userName = UserStructure == data[0].sender_id ? "" : data[0].sender;
            const displayNone = UserStructure == data[0].sender_id ? "" : "d-none";
            const getPicSrc = data[0].sender_pic ? `/pictures/staffs/${data[0].sender_pic}` : "/assets/images/nophoto2.png";

            let chatHistoryBox = $(".chat-history");
            chatHistoryBox.append(`
                            <li class="chat-message ${messageAlignmentClass}">
                                <div class="d-flex overflow-hidden ${alignmentClassForPic}">
                                    <div class="chat-message-wrapper flex-grow-1 ${ms}">
                                    <div class="chat-message-text">
                                    <h6 class="mb-0 text-info">${userName}</h6>
                                    <p class="mb-0">${data[0].text}</p>
                                </div>
                                <div class="text-end text-muted mt-1">
                                    <i class="ti ti-checks ti-xs me-1 text-success ${displayNone}"></i>
                                    <small>${data[0].time}</small>
                                </div>
                            </div>
                            <div class="user-avatar flex-shrink-0 ${ms}">
                                                        <div class="avatar avatar-sm">
                            ${data[0].sender_pic ?
                            `<img src="/pictures/staffs/${data[0].sender_pic}" alt="Avatar" class="rounded-circle" />`: 
                            `<div class="bg-primary text-white rounded-circle text-center py-1">${data[0].shortname}</div>`}
                            </div>
                        </div>
                    </div>
                </li>`);
            scrollToBottom();
            toastr.options = {
                maxOpened: 1,
                autoDismiss: true,
                closeButton: true,
                newestOnTop: true,
                progressBar: true,
                timeOut: 1000 * 10,
                extendedTimeOut: 1000 * 60,
                positionClass: 'toast-top-right',
                // preventDuplicates: true,
                onclick: null,
            };
            if (UserStructure != data[0].sender_id) {
                var audio = new Audio('assets/assets/audio/Discovery.mp3');
                audio.play();
                toastr['warning']('', `<div class="d-flex gap-2">
                        <div class="mt-3"> 
                            ${data[0].sender_pic ? `<img src="/pictures/staffs/${data[0].sender_pic}" alt="Avatar" class="rounded-circle avatar avatar-sm" />`: 
                            `<div class="bg-primary text-white rounded-circle avatar-sm text-center pt-1 avatar">${data[0].shortname}</div>`}
                        </div>
                        <div class="mt-3">
                            <h6 class="mb-0 text-info">${userName}</h6>
                            <p style="padding-right: 30px;" class="mb-0 text-muted font-weight-light">${data[0].text}</p>
                        </div>
                    </div`);
            }
        });

        // Send Message
        function sendMsg(e) {
            let msg = messageInput.val();
            if (msg) {
                const currentTimestamp = new Date();
                $.ajax({
                    type: "POST",
                    url: `http://10.19.7.4:3000/send_message`,
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

    {/literal}
</script>
<!-- / Content -->
{include file="footer.tpl"}