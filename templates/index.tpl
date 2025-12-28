{include file="header.tpl"}
<!-- Content -->

<style>
  {literal}
    body::-webkit-scrollbar {
      width: 10px;
    }

    .chart-container {
      position: relative;
      height: 35vh;
      overflow: visible;
    }

    .card {
      height: 420px;
    }

    .card,
    select {
      /* background: #2f334910 !important;
            backdrop-filter: blur(5px); */
      padding-bottom: 10px;
    }

    /* Modal ichidagi joylar ro‘yxati */
    .modal-xxl {
      max-width: 95%;
      width: 95%;
    }

    .place-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .space-main-modal-box h4 {
      font-size: 24px;
      text-align: center;
    }

    .space-main-body-img {
      width: 100%;
      height: 60vh;
    }

    .space-main-body-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .space-main-body-password ul {
      list-style-type: none;
      padding: 0px;
      height: 75vh;
      overflow-y: auto;
    }

    .space-main-body-password ul li {
      margin: 8px 0px;
      border-radius: 7px;
      padding: 6px;
      background-color: #4d49c3;
    }

    .space-main-body-password ul li h6 {
      font-size: 18px;
      margin: 0;
      padding-bottom: 4px;
    }

    .space-main-body-password ul li h6 span {
      padding-top: 15px;
      margin-right: 7px;
    }

    .space-main-body-password ul li p {
      padding: 0;
      margin: 0;
      font-size: 18px;
      padding-left: 10px;
    }

    .space-main-body-duty ul {
      list-style-type: none;
      padding: 0;
      height: 72vh;
      overflow-y: auto;
    }

    .space-main-body-duty ul li {
      font-size: 18px;
    }

    .modal-title {
      border1px solid red;
    }

    .chart-container {
      display: flex;
      gap: 10px;
      /* padding: 0px 20px; */
    }

    .region-box {
      padding: 10px;
      box-shadow: 3px 1px 29px 0px rgba(34, 60, 80, 0.26);
      /* background-color: #fff; */
      border-radius: 7px;
      height: 35vh;
      overflow-y: auto;
    }

    .scrollable {
      height: fit-content;
      list-style-type: none;
      padding: 0;
    }

    .space-main-body-umumu video {
      height: 100%;
    }

    .form-select{
      font-size: 18px;
    }

  {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
  <div class="row">

    <!-- JTSB html chartining html qismi boshi -->
    <div class="col-md-4 col-lg-4 mb-2">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Жавобгарлик объектлари</h4>
          </div>
          <div class="col-4">
                <select class="form-select" id="event_count">
              <option value="">Ҳудудлар</option>

              {foreach from=$Regions item=Item1 key=ikey1 name=regionLoop}
                  {if $smarty.foreach.regionLoop.iteration <= 14}
                      <option value="{$Item1.id}">{$Item1.name}</option>
                  {/if}
              {/foreach}

          </select>
          </div>
          <div class="chart-container" id="all_events_by_type"></div>
        </div>
      </div>
    </div>

    <!-- JTSB html chartining html qismi tugashi -->


    <div class="col-md-4 col-lg-4 mb-2">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Оммавий тадбирлар</h4> <br>
          </div>
          <div class="col-4">
             <select class="form-select" id="public_events">
              <option value="">Ҳудудлар</option>

              {foreach from=$Regions item=Item1 key=ikey1 name=regionLoop}
                  {if $smarty.foreach.regionLoop.iteration <= 14 }
                      <option value="{$Item1.id}">{$Item1.name}</option>
                  {/if}
              {/foreach}

          </select>
          </div>
          <div class="chart-container" id="get_events_by_type"></div>
        </div>
      </div>
    </div>

   
    <!-- 1-modali: kategoriya → viloyatlar kesimi -->
    <div class="modal fade" id="eventTypeModal" tabindex="-1" aria-labelledby="eventTypeModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="eventTypeModalLabel">Категория маълумотлари</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Yopish"></button>
          </div>
          <div class="modal-body" id="eventTypeModalBody">
            <!-- JS orqali tavsiflar va viloyatlar chiqadi -->
          </div>
        </div>
      </div>
    </div>

    <!-- 2-modali: viloyat ichidagi tadbirlar ro'yxati va batafsil -->
    <div class="modal fade" id="eventListModal" tabindex="-1" aria-labelledby="eventListModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable modal-xxl modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="eventListModalLabel">Тадбирлар рўйхати</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Yopish"></button>
          </div>
          <div class="modal-body" id="eventListModalBody">
          </div>
        </div>
      </div>
    </div>


    <div class="col-md-4 col-lg-4 mb-2">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Идоравий тадбирлар</h4> <br>
          </div>
          <div class="col-4">
            <select class="form-select" id="departmental_events"> 
                  <option value="">Ҳудудлар</option>

              {foreach from=$Regions item=Item1 key=ikey1 name=regionLoop}
                  {if $smarty.foreach.regionLoop.iteration <= 14}
                      <option value="{$Item1.id}">{$Item1.name}</option>
                  {/if}
              {/foreach}
            </select>
          </div>
          <div class="chart-container" id="get_departmental_events"></div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="eventTypeModal1" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 id="eventTypeModalLabel1" class="modal-title"></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div id="eventTypeModalBody1" class="modal-body"></div>
        </div>
      </div>
    </div>



    <div class="col-md-4 col-lg-4 mt-4">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Жамоат тартибини сақлаш ҳудудлар кесимида
            </h4>
          </div>
          <div class="chart-container" id="get_events_by_region"></div>
        </div>
      </div>
    </div>




    <div class="col-md-4 col-lg-4 mt-4">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Оммавий тадбирлар ҳудудлар кесимида
            </h4>
          </div>
          <div class="chart-container" id="get_events_by_region1"></div>
        </div>
      </div>
    </div>

    <div class="col-md-4 col-lg-4 mt-4">
      <div class="card">
        <div class="mx-3 my-2 row">
          <div class="col-8">
            <h4 class="card-title">Идоравий тадбирлар ҳудудлар кесимида
            </h4>
          </div><br>
          <div class="chart-container" id="get_events_by_region2"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="/assets/js/echarts.min.js"></script>
<script src="/assets/pathsData.js"></script>

<script>
  var AJAXPHP = "ajax.php";
  var dict_avaregae = "{$Dict.avaregae}";
  var dict_all = "{$Dict.all}";
  var dict_by_day = "{$Dict.one_day}";
  var dict_by_month = "{$Dict.begin_month}";
  var dict_by_year = "{$Dict.one_year}";
  {literal}



 $(document).ready(function() {

  let structure_id = null;

 const colors = [
        "#6EB5FF", // ko‘k
        "#5CC97B", // yashil
        "#A472FF", // to‘q binafsha
        "#FFB84D", // och sariq
        "#99CCFF", // och ko‘k
        "#FFD24C", // sariq (eng katta bo‘lak)
        "#4BA3C7", // havorang
        "#7AD67A", // och yashil
        "#FF884C", // to‘q sariq
        "#B266FF", // binafsha
        "#FF6666", // qizil
      ];

       const colors1 = [
        // "#6EB5FF", // ko‘k
        "#5CC97B", // yashil
        "#A472FF", // to‘q binafsha
        "#FFB84D", // och sariq
        "#99CCFF", // och ko‘k
        "#FFD24C", // sariq (eng katta bo‘lak)
        "#4BA3C7", // havorang
        "#7AD67A", // och yashil
        "#FF884C", // to‘q sariq
        "#B266FF", // binafsha
        "#FF6666", // qizil
      ];

  
  function safeDisposeChartByDom(dom) {
    if (!dom) return;
    try {
      const prev = echarts.getInstanceByDom(dom);
      if (!prev) return;
    
      if (dom.parentNode) {
        echarts.dispose(dom);
      } else {
       
        prev.clear && prev.clear();
      }
    } catch (err) {
      console.warn('safeDisposeChartByDom error:', err);
    }
  }

  // Global resize handler variant (optional)
  function globalResizeAllCharts() {
    try {
      echarts.getInstanceByDom(document.getElementById('all_events_by_type'))?.resize();
      echarts.getInstanceByDom(document.getElementById('get_events_by_region'))?.resize();
    } catch (err) {
      // ignorable
    }
  }

  // --- AJAX / Data fetch ---
  function getObjects() {
    // URL build
    let url = `ajax.php?act=jts_objects`;
    const params = [];
    if (structure_id !== null && !Number.isNaN(structure_id)) params.push(`structure_id=${encodeURIComponent(structure_id)}`);
    if (params.length) url += '&' + params.join('&');

    // AJAX
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      success: function(response) {
        // safety defaults
        const stats = response?.stats || [];
        all_events_by_type(stats);
        get_events_by_region(response || {});
        console.log('AJAX success:', { structure_id, url, response });
      },
      error: function(xhr, status, error) {
        console.error('back xato error 45:', error, xhr);
      }
    });
  }

  // --- CHART: ALL EVENTS BY TYPE (pie donut) ---
  function all_events_by_type(data = []) {
    const dom = document.getElementById('all_events_by_type');
    if (!dom) return console.error('Container #all_events_by_type topilmadi');

    // safe dispose old
    safeDisposeChartByDom(dom);

    dom.innerHTML = '';

    const myChart = echarts.init(dom);

    const total = Array.isArray(data) ? data.reduce((s, it) => s + Number(it.value || 0), 0) : 0;

    const option = {
      color: colors1,
      textStyle: { fontFamily: "Arial, sans-serif", fontSize: "18px" },
      title: {
        text: String(total),
        left: 'center',
        top: '37%',
        textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' },
      },
      legend: {
        bottom: 20,
        left: 'center',
        textStyle: {
          color: '#b7b7b7',
          fontSize: 18
        }
      },
      grid: {
        bottom: 80,
        containLabel: true
      },
      tooltip: {
        backgroundColor: 'white',
        textStyle: { fontSize: 18, color: '#000' }
      },
      series: [{
        type: 'pie',
        radius: ['20%', '60%'],
        center: ['50%', '40%'],
        label: {
          show: true,
          position: 'outside',
          formatter: '{c}',
          textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' }
        },
        itemStyle: {
          borderRadius: 10,
          shadowColor: 'rgba(0,0,0,0.5)',
          shadowBlur: 20
        },
        data: (Array.isArray(data) ? data : []).map(item => ({
          name: item.name || '',
          value: Number(item.value || 0),
          id: item.id
        }))
      }]
    };

    myChart.setOption(option);

    // remove old click handlers (agar mavjud bo'lsa)
    try { myChart.off && myChart.off('click'); } catch(e){}

    myChart.on('click', function(params) {
      // agar structure_id null bo'lsa umumiy xarita; aks holda region ichidagi objectlar uchun
      if (structure_id !== null) {
        window.location.href = `hr.php?act=regions_map&region_id=${structure_id}&object_type=${params.data.id}`;
      } else {
        window.location.href = `hr.php?act=regions_map&object_type=${params.data.id}`;
      }
    });

    const resizeFn = () => myChart.resize();
    window.addEventListener('resize', resizeFn);

  }

  // --- CHART / LIST: EVENTS BY REGION or OBJECT LIST ---
  function get_events_by_region(data = {}) {
    const dom = document.getElementById('get_events_by_region');
    if (!dom) return console.error('Container #get_events_by_region topilmadi');

    // Dispose old charts safely
    safeDisposeChartByDom(dom);

    dom.innerHTML = '';

    if (structure_id !== null) {
      // Build HTML
      let allHtml = `<div class="col-12"><div class="region-box">`;
      (data.list || []).forEach(cat => {
        const places = cat.objects || [];
        let listHtml = '<ul class="place-list scrollable">';
        places.forEach(p => {

          const name = String(p.object_name || '').replace(/</g, "&lt;").replace(/>/g, "&gt;");
          listHtml += `<li class="alert alert-dark" role="alert" data-cat="${cat.name}" data-place="${name}">${name}</li>`;
        });
        listHtml += '</ul>';

        allHtml += `
          <div class="category-block mb-2">
            <h5 class="mb-2 text-primary">${cat.name}</h5>
            ${listHtml}
          </div>
        `;
      });
      allHtml += `</div></div>`;

      dom.innerHTML = allHtml;
      return;
    }

    const myChart = echarts.init(dom);

    const statRegion = Array.isArray(data.stat_region) ? data.stat_region : [];
    const option = {
      textStyle: { fontFamily: "Arial, sans-serif", fontSize: "18px" },
      xAxis: {
        type: 'category',
        data: statRegion.map(item => item.name),
        axisLabel: { interval: 0, fontSize: 16, rotate: 45, color: '#b7b7b7' },
        axisLine: { show: false },
        splitLine: { show: false }
      },
      grid: { bottom: 110, right: 30, left: 60 },
      yAxis: {
        type: 'value',
        minInterval: 1,
        axisLabel: { color: '#b7b7b7', fontSize: 18 },
        axisLine: { show: false },
        splitLine: { show: false }
      },
       tooltip: {
          backgroundColor: 'white',
           textStyle: {
                fontSize: 18,     // 🔥 shu yerda o'zgartirasan
                color: '#000'
            }
        },
      series: [{
        data: statRegion.map(item => parseInt(item.value) || 0),
        type: 'bar',
        barMaxWidth: 60,
        itemStyle: { color: (p) => colors[p.dataIndex % colors.length], borderRadius: [8, 8, 0, 0] },
        label: { fontSize: 18, show: true, position: 'top', color: '#b7b7b7' }
      }]
    };

    myChart.setOption(option);

    // resize handler for this chart
    const resizeFn = () => myChart.resize();
    window.addEventListener('resize', resizeFn);
  }

  // --- SELECT HANDLER ---
  $(document).ready(function(){
    // init: if select has a preselected non-empty value, set it; else null
    const rawInit = $('#event_count').val();
    structure_id = rawInit ? (isNaN(parseInt(rawInit,10)) ? null : parseInt(rawInit,10)) : null;

    // initial fetch
    getObjects();

    // change handler
    $('#event_count').on('change', function() {
      const raw = $(this).val();
      structure_id = raw ? (isNaN(parseInt(raw,10)) ? null : parseInt(raw,10)) : null;
      console.log('Select changed, structure_id =', structure_id);
      getObjects();
    });

    // optional: delegate click on place items
    $(document).on('click', '.place-list li', function(){
      const place = $(this).data('place') || $(this).text();
      // misol uchun tooltip yoki modal ochish mumkin
      console.log('Place clicked:', place);
    });
  });

  // Expose some helpers for debugging (optional)
  window.__jts_debug = {
    getObjects,
    safeDisposeChartByDom,
    globalResizeAllCharts
  };





        // ommaviy tadbirlar uchun kodlar

   const resizeHandlers = new Map();

    // Add a resize listener for a chart dom, tracked so we can remove later
  function addResizeHandler(dom, handler) {
    if (!dom) return;
    const id = dom.id || dom;
    // remove existing if any
    if (resizeHandlers.has(id)) {
      try { window.removeEventListener('resize', resizeHandlers.get(id)); } catch(e){}
    }
    resizeHandlers.set(id, handler);
    window.addEventListener('resize', handler);
  }

  // Remove resize handler for dom
  function removeResizeHandler(dom) {
    if (!dom) return;
    const id = dom.id || dom;
    const h = resizeHandlers.get(id);
    if (h) {
      try { window.removeEventListener('resize', h); } catch(e){}
      resizeHandlers.delete(id);
    }
  }

  // --- AJAX / fetch ---
  function getEvents() {
    let url = `${AJAXPHP}?act=public_events`;
    const params = [];
    if (structure_id !== null && !Number.isNaN(structure_id)) params.push(`structure_id=${encodeURIComponent(structure_id)}`);
    if (params.length) url += '&' + params.join('&');

    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      success: function(response) {
        // safety defaults
        get_events_by_type(response?.stats || []);
        get_events_by_region1(response || {});
      },
      error: function(xhr, status, error) {
        console.error('AJAX error:', error);
      }
    });
  }

  // --- CHART: events by type (pie) ---
  function get_events_by_type(data = []) {
    const dom = document.getElementById('get_events_by_type');
    if (!dom) return console.error('Container #get_events_by_type topilmadi');

    // safe dispose previous chart and remove resize handler
    removeResizeHandler(dom);
    safeDisposeChartByDom(dom);
    dom.innerHTML = ''; // clear any leftover

    const myChart = echarts.init(dom);

    const total = Array.isArray(data) ? data.reduce((sum, item) => sum + Number(item.value || 0), 0) : 0;

    const option = {
      color: colors1,
      textStyle: { fontFamily: "Arial, sans-serif", fontSize: 18 },
      title: {
        text: String(total),
        left: 'center',
        top: '32%',
        textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' },
      },
      legend: {
        bottom: 20,
        left: 'center',
        textStyle: {
          color: '#b7b7b7',
          fontSize: 18
        }
      },
      grid: {
        bottom: 80,
        containLabel: true
      },
       tooltip: {
          backgroundColor: 'white',
           textStyle: {
                fontSize: 18,     // 🔥 shu yerda o'zgartirasan
                color: '#000'
            }
        },
      series: [{
        type: 'pie',
        radius: ['20%', '60%'],
        center: ['50%', '35%'],
        label: {
          show: true,
          position: 'outside',
          formatter: '{c}',
          textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' }
        },
        itemStyle: {
          borderRadius: 10,
          shadowColor: 'rgba(0,0,0,0.5)',
          shadowBlur: 20
        },
        data: (Array.isArray(data) ? data : []).map(item => ({
          name: item.name || '',
          value: Number(item.value || 0),
          id: item.id
        }))
      }]
    };

    myChart.setOption(option);

    // safe click handlers
    try { myChart.off && myChart.off('click'); } catch(e){}
    myChart.on('click', function(params) {
      // original code redirected to public_event_map
      window.location.href = `hr.php?act=public_event_map`;
    });

    // add resize handler and track it
    const resizeFn = () => { try { myChart.resize(); } catch(e){} };
    addResizeHandler(dom, resizeFn);
  }

  // --- CHART or LIST: events by region or object list ---
  function get_events_by_region1(data = {}) {
    const dom = document.getElementById('get_events_by_region1');
    if (!dom) return console.error('Container #get_events_by_region1 topilmadi');

    // remove previous resize handler and dispose any chart
    removeResizeHandler(dom);
    safeDisposeChartByDom(dom);

    // Clear DOM to remove old HTML/chart
    dom.innerHTML = '';

    if (structure_id !== null) {
      // region selected -> show grouped lists
      let allHtml = `<div class="col-12"><div class="region-box">`;
      (data.list || []).forEach(cat => {
        const places = cat.objects || [];
        let listHtml = '<ul class="place-list scrollable">';
        places.forEach(p => {
          const safeName = String(p.object_name || '').replace(/</g, "&lt;").replace(/>/g, "&gt;");
          listHtml += `<li class="alert alert-dark" role="alert" data-cat="${cat.name}" data-place="${safeName}">${safeName}</li>`;
        });
        listHtml += '</ul>';

        allHtml += `
          <div class="category-block mb-2">
            <h5 class="mb-2 text-primary">${cat.name}</h5>
            ${listHtml}
          </div>
        `;
      });
      allHtml += `</div></div>`;
      dom.innerHTML = allHtml;
      return;
    }

    // Default state: draw bar chart by regions
    const myChart = echarts.init(dom);

    const statRegion = Array.isArray(data.stat_region) ? data.stat_region : [];
    const option = {
      textStyle: { fontFamily: "Arial, sans-serif" },
      xAxis: {
        type: 'category',
        data: statRegion.map(item => item.name),
        axisLabel: { interval: 0, fontSize: 16, rotate: 45, color: '#b7b7b7' },
        axisLine: { show: false },
        splitLine: { show: false }
      },
      grid: { bottom: 110, right: 30, left: 80 },
      yAxis: {
        type: 'value',
        minInterval: 1,
        axisLabel: { color: '#b7b7b7', fontSize: 18 },
        axisLine: { show: false },
        splitLine: { show: false }
      },
       tooltip: {
          backgroundColor: 'white',
           textStyle: {
                fontSize: 18,     // 🔥 shu yerda o'zgartirasan
                color: '#000'
            }
        },
      series: [{
        data: statRegion.map(item => parseInt(item.value) || 0),
        type: 'bar',
        barMaxWidth: 60,
        itemStyle: { color: (p) => colors[p.dataIndex % colors.length], borderRadius: [8, 8, 0, 0] },
        label: { fontSize: 18, show: true, position: 'top', color: '#b7b7b7' }
      }]
    };

    myChart.setOption(option);

    // resize handler tracked
    const resizeFn = () => { try { myChart.resize(); } catch(e){} };
    addResizeHandler(dom, resizeFn);
  }

  // --- SELECT handler binding ---
  function initSelectHandler() {
    // initial read
    const raw = $('#public_events').val();
    structure_id = raw ? (isNaN(parseInt(raw,10)) ? null : parseInt(raw,10)) : null;

    // bind change
    $('#public_events').off('change.public_events_ns').on('change.public_events_ns', function() {
      const v = $(this).val();
      structure_id = v ? (isNaN(parseInt(v,10)) ? null : parseInt(v,10)) : null;
      console.log('public_events changed -> structure_id =', structure_id);
      getEvents();
    });
  }

  // init on DOM ready
  $(document).ready(function(){
    initSelectHandler();
    getEvents();
  });

  // Expose for debug
   window.__pubEventsDebug = { getEvents, get_events_by_type, get_events_by_region1, safeDisposeChartByDom };


   
    // idoraviy tadbirlar



   const resizeHandlers2 = new Map();

    // Add a resize listener for a chart dom, tracked so we can remove later
  function addResizeHandler2(dom, handler) {
    if (!dom) return;
    const id = dom.id || dom;
    // remove existing if any
    if (resizeHandlers2.has(id)) {
      try { window.removeEventListener('resize', resizeHandlers2.get(id)); } catch(e){}
    }
    resizeHandlers2.set(id, handler);
    window.addEventListener('resize', handler);
  }

  // Remove resize handler for dom
  function removeResizeHandler2(dom) {
    if (!dom) return;
    const id = dom.id || dom;
    const h = resizeHandlers2.get(id);
    if (h) {
      try { window.removeEventListener('resize', h); } catch(e){}
      resizeHandlers2.delete(id);
    }
  }

  // --- AJAX / fetch ---
  function getDepartmentalEvents() {
    let url = `${AJAXPHP}?act=reyd_events`;
    const params = [];
    if (structure_id !== null && !Number.isNaN(structure_id)) params.push(`structure_id=${encodeURIComponent(structure_id)}`);
    if (params.length) url += '&' + params.join('&');

    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      success: function(response) {
        // safety defaults
        get_departmental_events(response?.stats || []);
        get_events_by_region2(response || {});
      },
      error: function(xhr, status, error) {
        console.error('AJAX error:', error);
      }
    });
  }

  // --- CHART: events by type (pie) ---
  function get_departmental_events(data = []) {
    const dom = document.getElementById('get_departmental_events');
    if (!dom) return console.error('Container #get_departmental_events topilmadi');

    // safe dispose previous chart and remove resize handler
    removeResizeHandler2(dom);
    safeDisposeChartByDom(dom);
    dom.innerHTML = ''; // clear any leftover

    const myChart = echarts.init(dom);

    const total = Array.isArray(data) ? data.reduce((sum, item) => sum + Number(item.value || 0), 0) : 0;

    const option = {
      color: colors1,
      textStyle: { fontFamily: "Arial, sans-serif", fontSize: 18 },
      title: {
        text: String(total),
        left: 'center',
        top: '32%',
        textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' },
      },
     legend: {
        bottom: 20,
        left: 'center',
        textStyle: {
          color: '#b7b7b7',
          fontSize: 18
        }
      },
      grid: {
        bottom: 80,
        containLabel: true
      },
       tooltip: {
          backgroundColor: 'white',
           textStyle: {
                fontSize: 18,     // 🔥 shu yerda o'zgartirasan
                color: '#000'
            }
        },
      series: [{
        type: 'pie',
        radius: ['20%', '60%'],
        center: ['50%', '35%'],
        label: {
          show: true,
          position: 'outside',
          formatter: '{c}',
          textStyle: { fontSize: 18, fontWeight: 'bold', color: '#b7b7b7' }
        },
        itemStyle: {
          borderRadius: 10,
          shadowColor: 'rgba(0,0,0,0.5)',
          shadowBlur: 20
        },
        data: (Array.isArray(data) ? data : []).map(item => ({
          name: item.name || '',
          value: Number(item.value || 0),
          id: item.id
        }))
      }]
    };

    myChart.setOption(option);

    // safe click handlers
    // try { myChart.off && myChart.off('click'); } catch(e){}
    // myChart.on('click', function(params) {
    //   // original code redirected to public_event_map
    //   window.location.href = `hr.php?act=public_event_map`;
    // });

    // add resize handler and track it
    const resizeFn = () => { try { myChart.resize(); } catch(e){} };
    addResizeHandler2(dom, resizeFn);
  }

  // --- CHART or LIST: events by region or object list ---
  function get_events_by_region2(data = {}) {
    const dom = document.getElementById('get_events_by_region2');
    if (!dom) return console.error('Container #get_events_by_region2 topilmadi');

    // remove previous resize handler and dispose any chart
    removeResizeHandler2(dom);
    safeDisposeChartByDom(dom);

    // Clear DOM to remove old HTML/chart
    dom.innerHTML = '';

    if (structure_id !== null) {
      // region selected -> show grouped lists
      let allHtml = `<div class="col-12"><div class="region-box">`;
      (data.list || []).forEach(cat => {
        const places = cat.objects || [];
        let listHtml = '<ul class="place-list scrollable">';
        places.forEach(p => {
          const safeName = String(p.object_name || '').replace(/</g, "&lt;").replace(/>/g, "&gt;");
          listHtml += `<li class="alert alert-dark" role="alert" data-cat="${cat.name}" data-place="${safeName}">${safeName}</li>`;
        });
        listHtml += '</ul>';

        allHtml += `
          <div class="category-block mb-2">
            <h5 class="mb-2 text-primary">${cat.name}</h5>
            ${listHtml}
          </div>
        `;
      });
      allHtml += `</div></div>`;
      dom.innerHTML = allHtml;
      return;
    }

    // Default state: draw bar chart by regions
    const myChart = echarts.init(dom);

    const statRegion = Array.isArray(data.stat_region) ? data.stat_region : [];
    const option = {
      textStyle: { fontFamily: "Arial, sans-serif" },
      xAxis: {
        type: 'category',
        data: statRegion.map(item => item.name),
        axisLabel: { interval: 0, fontSize: 16, rotate: 45, color: '#b7b7b7' },
        axisLine: { show: false },
        splitLine: { show: false }
      },
      grid: { bottom: 110, right: 30, left: 80 },
      yAxis: {
        type: 'value',
        minInterval: 1,
        axisLabel: { color: '#b7b7b7', fontSize: 18 },
        axisLine: { show: false },
        splitLine: { show: false }
      },
       tooltip: {
          backgroundColor: 'white',
           textStyle: {
                fontSize: 18,     // 🔥 shu yerda o'zgartirasan
                color: '#000'
            }
        },
      series: [{
        data: statRegion.map(item => parseInt(item.value) || 0),
        type: 'bar',
        barMaxWidth: 60,
        itemStyle: { color: (p) => colors[p.dataIndex % colors.length], borderRadius: [8, 8, 0, 0] },
        label: { fontSize: 18, show: true, position: 'top', color: '#b7b7b7' }
      }]
    };

    myChart.setOption(option);

    // resize handler tracked
    const resizeFn = () => { try { myChart.resize(); } catch(e){} };
    addResizeHandler2(dom, resizeFn);
  }

  // --- SELECT handler binding ---
  function initSelectHandler2() {
    // initial read
    const raw = $('#departmental_events').val();
    structure_id = raw ? (isNaN(parseInt(raw,10)) ? null : parseInt(raw,10)) : null;

    $('#departmental_events').off('change.departmental_events_ns').on('change.departmental_events_ns', function() {
      const v = $(this).val();
      structure_id = v ? (isNaN(parseInt(v,10)) ? null : parseInt(v,10)) : null;
      console.log('departmental_events changed -> structure_id =', structure_id);
      getDepartmentalEvents();
    });
  }

  // init on DOM ready
  $(document).ready(function(){
    initSelectHandler2();
    getDepartmentalEvents();
  });

  // Expose for debug
  window.__pubDepartmentalEventsDebug = { getDepartmentalEvents, get_departmental_events, get_events_by_region2, safeDisposeChartByDom };











        
    });














  {/literal}
</script>
<!-- / Content -->
{include file="footer.tpl"}