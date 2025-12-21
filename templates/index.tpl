{* {include file="header.tpl"}

<div class="container-fluid py-3">
  <div class="row">

    <!-- ================= OBJECTS ================= -->
    <div class="col-md-4">
      <div class="card p-3">
        <div class="d-flex justify-content-between mb-2">
          <h4>Жавобгарлик объектлари</h4>
          <select id="event_count" class="form-select w-50">
            <option value="">Ҳудудлар</option>
            {foreach from=$Regions item=r}
              <option value="{$r.id}">{$r.name}</option>
            {/foreach}
          </select>
        </div>
        <div id="chart_objects" style="height:320px"></div>
      </div>
    </div>

    <!-- ================= PUBLIC ================= -->
    <div class="col-md-4">
      <div class="card p-3">
        <div class="d-flex justify-content-between mb-2">
          <h4>Оммавий тадбирлар</h4>
          <select id="public_events" class="form-select w-50">
            <option value="">Ҳудудлар</option>
            {foreach from=$Regions item=r}
              <option value="{$r.id}">{$r.name}</option>
            {/foreach}
          </select>
        </div>
        <div id="chart_public" style="height:320px"></div>
      </div>
    </div>

    <!-- ================= DEPARTMENTAL ================= -->
    <div class="col-md-4">
      <div class="card p-3">
        <div class="d-flex justify-content-between mb-2">
          <h4>Идоравий тадбирлар</h4>
          <select id="departmental_events" class="form-select w-50">
            <option value="">Ҳудудлар</option>
            {foreach from=$Regions item=r}
              <option value="{$r.id}">{$r.name}</option>
            {/foreach}
          </select>
        </div>
        <div id="chart_departmental" style="height:320px"></div>
      </div>
    </div>

  </div>
</div>

<!-- ================= LIBS ================= -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/assets/js/echarts.min.js"></script>

<!-- ================= AJAX FILE ================= -->
<script>
var AJAXPHP = "ajax.php";
</script>

<!-- ================= JS ================= -->
<script>
{literal}

// ---------- STRUCTURES ----------
let obj_structure = null;
let pub_structure = null;
let dep_structure = null;

// ---------- DISPOSE ----------
function dispose(dom){
  const inst = echarts.getInstanceByDom(dom);
  if(inst) inst.dispose();
}

// ---------- DRAW ----------
function drawPie(domId, data){
  const dom = document.getElementById(domId);
  dispose(dom);

  if(!data || !data.length){
    dom.innerHTML =
      '<div style="color:#aaa;text-align:center;margin-top:130px">Маълумот йўқ</div>';
    return;
  }

  const chart = echarts.init(dom);
  chart.setOption({
    tooltip:{},
    legend:{bottom:0},
    series:[{
      type:'pie',
      radius:['35%','65%'],
      data:data
    }]
  });
}

// ---------- LOADERS ----------
function loadObjects(){
  let url = AJAXPHP + "?act=jts_objects";
  if(obj_structure) url += "&structure_id=" + obj_structure;

  $.getJSON(url,function(res){
    console.log("OBJECTS:",res);
    drawPie("chart_objects",res.stats||[]);
  });
}

function loadPublic(){
  let url = AJAXPHP + "?act=public_events";
  if(pub_structure) url += "&structure_id=" + pub_structure;

  $.getJSON(url,function(res){
    console.log("PUBLIC:",res);
    drawPie("chart_public",res.stats||[]);
  });
}

function loadDepartmental(){
  let url = AJAXPHP + "?act=reyd_events";
  if(dep_structure) url += "&structure_id=" + dep_structure;

  $.getJSON(url,function(res){
    console.log("DEPARTMENTAL:",res);
    drawPie("chart_departmental",res.stats||[]);
  });
}

// ---------- INIT ----------
$(function(){

  console.log("JS READY, AJAX =",AJAXPHP);

  $("#event_count").change(function(){
    obj_structure = this.value || null;
    loadObjects();
  });

  $("#public_events").change(function(){
    pub_structure = this.value || null;
    loadPublic();
  });

  $("#departmental_events").change(function(){
    dep_structure = this.value || null;
    loadDepartmental();
  });

  loadObjects();
  loadPublic();
  loadDepartmental();
});

{/literal}
</script>

{include file="footer.tpl"} *}




































{include file="header.tpl"}

<div class="container-fluid py-3">

  <!-- ================= TOP DONUTS ================= -->
  <div class="row">

    <div class="col-md-4">
      <div class="card p-3">
        <div class="d-flex justify-content-between mb-2">
          <h5>Жавобгарлик объектлари</h5>
          <select id="event_count" class="form-select w-50">
            <option value="">Ҳудудлар</option>
            {foreach from=$Regions item=r}
              <option value="{$r.id}">{$r.name}</option>
            {/foreach}
          </select>
        </div>
        <div id="chart_objects" style="height:300px"></div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card p-3">
        <div class="d-flex justify-content-between mb-2">
          <h5>Оммавий тадбирлар</h5>
          <select id="public_events" class="form-select w-50">
            <option value="">Ҳудудлар</option>
            {foreach from=$Regions item=r}
              <option value="{$r.id}">{$r.name}</option>
            {/foreach}
          </select>
        </div>
        <div id="chart_public" style="height:300px"></div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card p-3">
        <div class="d-flex justify-content-between mb-2">
          <h5>Идоравий тадбирлар</h5>
          <select id="departmental_events" class="form-select w-50">
            <option value="">Ҳудудлар</option>
            {foreach from=$Regions item=r}
              <option value="{$r.id}">{$r.name}</option>
            {/foreach}
          </select>
        </div>
        <div id="chart_departmental" style="height:300px"></div>
      </div>
    </div>

  </div>

  <!-- ================= BOTTOM BARS ================= -->
  <div class="row mt-4">

    <div class="col-md-4">
      <div class="card p-3">
        <h6>Жамоат тартибини сақлаш ҳудудлар кесимида</h6>
        <div id="bar_objects" style="height:280px"></div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card p-3">
        <h6>Оммавий тадбирлар ҳудудлар кесимида</h6>
        <div id="bar_public" style="height:280px"></div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card p-3">
        <h6>Идоравий тадбирлар ҳудудлар кесимида</h6>
        <div id="bar_departmental" style="height:280px"></div>
      </div>
    </div>

  </div>

</div>

<!-- ================= LIBS ================= -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/assets/js/echarts.min.js"></script>

<script>
var AJAXPHP = "ajax.php";
</script>

<script>
{literal}

// ---------- STRUCTURES ----------
let obj_structure = null;
let pub_structure = null;
let dep_structure = null;

// ---------- HELPERS ----------
function dispose(dom){
  const inst = echarts.getInstanceByDom(dom);
  if(inst) inst.dispose();
}

// ---------- DONUT ----------
function drawPie(domId, data){
  const dom = document.getElementById(domId);
  dispose(dom);

  if(!data || !data.length){
    dom.innerHTML = '<div style="text-align:center;color:#888;margin-top:120px">Маълумот йўқ</div>';
    return;
  }

  const chart = echarts.init(dom);
  chart.setOption({
    tooltip:{},
    legend:{bottom:0},
    series:[{
      type:'pie',
      radius:['40%','65%'],
      data:data
    }]
  });
}

// ---------- BAR ----------
function drawBar(domId, labels, values){
  const dom = document.getElementById(domId);
  dispose(dom);

  const chart = echarts.init(dom);
  chart.setOption({
    tooltip:{},
    xAxis:{ type:'category', data:labels, axisLabel:{rotate:30} },
    yAxis:{ type:'value' },
    series:[{ type:'bar', data:values, barWidth:'50%' }]
  });
}

// ---------- LOAD DONUTS ----------
function loadObjects(){
  let url = AJAXPHP + "?act=jts_objects";
  if(obj_structure) url += "&structure_id=" + obj_structure;
  $.getJSON(url,res=>drawPie("chart_objects",res.stats||[]));
}

function loadPublic(){
  let url = AJAXPHP + "?act=public_events";
  if(pub_structure) url += "&structure_id=" + pub_structure;
  $.getJSON(url,res=>drawPie("chart_public",res.stats||[]));
}

function loadDepartmental(){
  let url = AJAXPHP + "?act=reyd_events";
  if(dep_structure) url += "&structure_id=" + dep_structure;
  $.getJSON(url,res=>drawPie("chart_departmental",res.stats||[]));
}

// ---------- LOAD BARS ----------
function loadBars(){
  $.getJSON(AJAXPHP+"?act=jts_objects",res=>drawBar("bar_objects",res.labels||[],res.values||[]));
  $.getJSON(AJAXPHP+"?act=public_events",res=>drawBar("bar_public",res.labels||[],res.values||[]));
  $.getJSON(AJAXPHP+"?act=reyd_events",res=>drawBar("bar_departmental",res.labels||[],res.values||[]));
}

// ---------- INIT ----------
$(function(){

  $("#event_count").change(function(){
    obj_structure = this.value || null;
    loadObjects();
  });

  $("#public_events").change(function(){
    pub_structure = this.value || null;
    loadPublic();
  });

  $("#departmental_events").change(function(){
    dep_structure = this.value || null;
    loadDepartmental();
  });

  loadObjects();
  loadPublic();
  loadDepartmental();
  loadBars();
});

{/literal}
</script>

{include file="footer.tpl"}
