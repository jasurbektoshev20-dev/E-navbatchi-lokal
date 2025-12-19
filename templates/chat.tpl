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
        }

    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <div class="app-chat">
        <div style="height: calc(100vh - 7rem);" class="row">
            <div class="col-8">

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


        // Hozirgi user ID (Smarty’dan data-attr orqali olishing mumkin)
        // const UserStructure = parseInt($('#UserStructure').val() || 0); 

        function renderChats(messages) {
                    const $list = $('.chat-history'); // <ul class="list-unstyled chat-history">
                    $list.empty();

                    messages.forEach(function (m) {
                        const isMe = (UserStructure === parseInt(m.sender_id));
                        console.log('chat m : ', m)
                        if (isMe) {
                        // O'ng tomondagi (o'zing) xabar
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
            staff_id: UserStructure, // agar PHPda shundan olayotgan bo'lsang
            limit: 50                // kerak bo'lsa o'zgartirasan
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

        // Chat refresh (every 1 second)
    //    function refreshChat(newHtml) {
    //         let chatList = $(".chat-history");
    //         let oldHtml = chatList.html();
    //          chatList.html(newHtml);
    //         // Faqat o'zgarish bo'lsa yangilaymiz
    //         if (oldHtml.trim() !== newHtml.trim()) {
                

    //             // Silliq scroll pastga
    //             chatHistoryBody.scrollTo({
    //                 top: chatHistoryBody.scrollHeight,
    //                 behavior: "smooth"
    //             });
    //         }
    //     }


    //     // Har 1 sekundda chaqirish
    //     setInterval(refreshChat, 1000);


        
$(document).ready(function () {

    function loadDutyByRegion(region) {
        $.ajax({
            type: "GET",
            url: `${AJAXPHP}?act=get_duty&id=${region}`,
            dataType: "json",
            success: function (data) {
                $('#card_duty').empty();

                if (!data || data.length === 0) {
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
                    data.forEach(item => {
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

});

    {/literal}
</script>
<!-- / Content -->
{include file="footer.tpl"}