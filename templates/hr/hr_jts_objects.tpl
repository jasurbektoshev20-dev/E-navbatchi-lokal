{include file="header.tpl"}

<style>
    {literal}
        .table thead th,
        .table tbody td {
            text-transform: none !important;
            font-size: 18px;
        }

        .dt-buttons {
            gap: 10px;
            margin-left: 20px;
        }

        .jts-object-icons-box{
          display: flex;
          justify-content: space-between;
        }
    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex justify-content-between">
                    <h4>ЖТСБ объектлари</h4>
                    <button id="new" type="button" class="btn btn-primary waves-effect waves-light">
                        <i class="menu-icon tf-icons ti ti-plus"></i> Қўшиш
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Jadval -->
    <div class="row mt-3">
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top">
                        <thead>
                            <tr>
                                <th class="text-center">Т/р</th>
                                <th class="text-center">Вилоят</th>
                                <th class="text-center">Тури</th>
                                <th class="text-center">Номи</th>
                                <th  class="text-center">Амаллар</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="table-body"></tbody>
                    </table>
                    <div class="loader"></div>
                    <nav aria-label="Page navigation" class="d-flex mt-3 align-items-center justify-content-center">
                      <ul class="pagination flex-wrap row-gap-2" id="pagination">
                        <li class="page-item prev">
                          <a class="page-link" href="javascript:void(0);" onclick="changePage(currentPage - 1)">
                            <i class="ti ti-chevron-left ti-xs scaleX-n1-rtl"></i>
                          </a>
                        </li>
                        <li class="page-item next">
                          <a class="page-link" href="javascript:void(0);" onclick="changePage(currentPage + 1)">
                            <i class="ti ti-chevron-right ti-xs scaleX-n1-rtl"></i>
                          </a>
                        </li>
                      </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-simple modal-edit-user">
    <div class="modal-content">
      <div class="modal-body p-0">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        <form id="localForm" class="needs-validation" novalidate>
          <div class="row g-3">
            
            <!-- Вилоят -->
            <div class="col-sm-4">
              <label>Вилоят</label>
              <select required class="form-select" id="structure_id">
                <option value="">Танланг...</option>
                {foreach from=$Regions item=Item1 key=ikey1}
                  <option value="{$Item1.id}">{$Item1.name}</option>
                {/foreach}
   
              </select>
            </div>

            <!-- Тури -->
            <div class="col-sm-4">
              <label>Тури</label>
              <select required class="form-select" id="object_type">
                <option value="">Танланг...</option>
                {foreach from=$ObjectTypes item=Item1 key=ikey1}
                  <option value="{$Item1.id}">{$Item1.name}</option>
                {/foreach}
              </select>
            </div>

            <!-- Номи -->
            <div class="col-sm-4">
              <label>Номи</label>
              <input required type="text" class="form-control" id="object_name" placeholder="Масалан: Регистон майдони" />
            </div>

              <!-- Manzili -->
            <div class="col-sm-4">
              <label>Манзили</label>
              <input required type="text" class="form-control" id="address" placeholder="Манзилни киритинг..." />
            </div>

              <!-- Maydoni -->
            <div class="col-sm-4">
              <label>Майдони</label>
              <input required type="text" class="form-control" id="area" placeholder="Майдонини киритинг гектарда..." />
            </div>

               <!-- Admin tel -->
            <div class="col-sm-4">
              <label>Администратор телефон рақамлари</label>
              <input required type="text" class="form-control" id="admin_phone" placeholder="Телефон рақам киритинг..." />
            </div>

                 <!-- Admin tel -->


            {* <div class="col-sm-4">
              <label>Kameralar sonini kiriting</label>
              <input required type="text" class="form-control" id="name" placeholder="Kameralar sonini kiriting..." />
            </div> *}

               <!-- Bozor raxbari -->
            <div class="col-sm-4">
              <label>Раҳбари</label>
              <input required type="text" class="form-control" id="object_head" placeholder="Ҳудуд раҳбарини киритинг..." />
            </div>

            <div class="col-sm-4">
              <label>Раҳбар телефон рақами</label>
              <input required type="text" class="form-control" id="head_phone" placeholder="Телефон рақамини киритинг..." />
            </div>

              <!-- Bozor uchaskavoy -->
            {* <div class="col-sm-4">
              <label>Ҳудуд участкавойи ФИШ</label>
              <input required type="text" class="form-control" id="police_name" placeholder="ФИШни киритинг..." />
            </div> *}

              <!-- Bozor uchaskavoy tel -->
            {* <div class="col-sm-4">
              <label>Ҳудуд участкавойи телефон рақами</label>
              <input required type="text" class="form-control" id="police_phone" placeholder="Телефон рақам киритинг..." />
            </div> *}

              <!-- Bozor rasmi -->
            <div class="col-sm-4">
               <label for="photo" class="form-label">Ҳудуд расми</label>
               <input class="form-control" type="file" id="photo">
            </div>

              <div class="col-sm-4">
              <label>Назорат кузатув маскани кенглиги(lat)</label>
              <input required type="text" class="form-control" id="lat" placeholder="кенглигини киритинг..." />
            </div>

             <!-- Bozor uchaskavoy tel -->
            <div class="col-sm-4">
              <label>Назорат кузатув маскани узунлиги(lot)</label>
              <input required type="text" class="form-control" id="long" placeholder="узунлигини киритинг..." />
            </div>

             {* <div class="col-sm-4">
              <label>Ҳамкорликдаги ташкилотлар</label>
              <select required class="form-select" id="cooperate_id">
                <option value="">Танланг...</option>
                {foreach from=$CooperateTypes item=Item1 key=ikey1}
                  <option value="{$Item1.id}">{$Item1.name}</option>
                {/foreach}
              </select>
            </div> *}

             <div class="col-sm-4">
              <label>Mahalla</label>
              <select required class="form-select" id="neighborhood_id">
                <option value="">Танланг...</option>
                {foreach from=$CooperateTypes item=Item1 key=ikey1}
                  <option value="{$Item1.id}">{$Item1.name}</option>
                {/foreach}
              </select>
            </div>


            <div class="col-sm-12">
              <label>Объект ҳудудини чизиш</label>
                <div id="uzbMap" style="height: 350px;"></div>
            </div>


            <!-- Tugmalar -->
            <div class="col-12 text-center">
              <input type="hidden" id="editId" value="">
              <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
                Бекор қилиш
              </button>
              <button id="saveBtn" class="btn btn-primary me-sm-3 me-1">Сақлаш</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- Leaflet asosiy -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>

<!-- Leaflet.Draw -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.js"></script>

<!-- 🧩 Fullscreen plugin -->
<link rel="stylesheet" href="https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css" />
<script src="https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js"></script>


<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

<script>
    var AJAXPHP = "ajax{$AddURL}.php";
    var HRAJAXPHP = "hrajax{$AddURL}.php";

    {literal}

    let localData = JSON.parse(localStorage.getItem("jts_objects")) || [
        { structure: "Toshkent", type: "Bozor", name1: "Chorsu bozori", name2: "12", name3: "" },
        { structure: "Samarqand", type: "Park", name1: "Registon maydoni", name2: "20", name3: "" }
    ];

    let drawCoords

    let currentPage = 1;
    const itemsPerPage = 9;
    let totalPages = 0;

    const tbody = document.getElementById("table-body");

    function renderTable() {
        tbody.innerHTML = "";
        $('.loader').empty();
        $('.loader').append(`
            <div class="text-center my-5 py-5">
                <div class="spinner-border spinner-border-lg text-info my-5" role="status">
                    <span class="visually-hidden">Лоадинг...</span>
                </div>
            </div>
        `);
        let url = `${AJAXPHP}?act=get_jts_objects`;
        let params = [];
        
        if (currentPage) params.push(`start=${currentPage}`);
        if (itemsPerPage) params.push(`number=${itemsPerPage}`);
        if (params.length > 0) url += '&' + params.join('&');


        $.ajax({
          url: url,
          type: 'GET',
          dataType: 'json',
          success: function(response) {
            $('.loader').empty();
            if (!response.data.length) {
                $('#pagination').hide();
                $('.loader').append(`
                    <div class="text-center my-5" style="padding: 10vh 0">
                        Маълумот мавжуд эмас!
                    </div>
                `);
            } else {
              response.data.forEach((item, index) => {
                  const tr = document.createElement("tr");
                  tr.innerHTML = `
                      <td class="text-center">${index + 1}</td>
                      <td class="text-center">${item.structure}</td>
                      <td class="text-center">${item.object_type}</td>
                      <td class="text-center">${item.object_name}</td>
                      <td class="jts-object-icons-box">
                        <div>
                          <a href="hr.php?act=jts_objects_sos&id=${item.id}" class="p-2">
                              <i class="ti ti-bell me-1"></i> Ташвиш тугма
                          </a>
                        </div>
                        <div>
                          <a href="hr.php?act=jts_objects_camera&id=${item.id}" class="p-2">
                              <i class="ti ti-camera me-1"></i> Камера
                          </a>
                        </div>
                        <div>
                          <a href="hr.php?act=jts_objects_door&id=${item.id}" class="p-2">
                              <i class="ti ti-door me-1"></i> Эшик
                          </a>
                        </div>
      
                      </td>
                      <td>
                          <div class="dropdown">
                              <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                  <i class="ti ti-dots-vertical"></i>
                              </button>
                              <div class="dropdown-menu">
                                  <a href="#" class="dropdown-item editAction" data-id="${item.id}">
                                      <i class="ti ti-pencil me-1"></i> Таҳрирлаш
                                  </a>
                                  <a href="#" class="dropdown-item deleteAction" data-id="${item.id}">
                                      <i class="ti ti-trash me-1"></i> Ўчириш
                                  </a>
                              </div>
                          </div>
                      </td>
                  `;
                  tbody.appendChild(tr);
              });
            }

            totalPages = Math.ceil(response.total / itemsPerPage);
            renderPagination()

          },
          error: function(xhr, status, error) {
            console.error('AJAX error:', error);
          }
        })

    }

    document.getElementById("new").addEventListener("click", () => {
        document.getElementById("localForm").reset();
        document.getElementById("editId").value = "";
        new bootstrap.Modal(document.getElementById("submitModal")).show();
        renderMap()

    });

    document.getElementById("saveBtn").addEventListener("click", (e) => {
        e.preventDefault();
        const structure_id = document.getElementById("structure_id").value.trim();
        const object_type = document.getElementById("object_type").value.trim();
        const object_name = document.getElementById("object_name").value.trim();
        const address = document.getElementById("address").value.trim();
        const area = document.getElementById("area").value.trim();
        const admin_phone = document.getElementById("admin_phone").value.trim();
        const object_head = document.getElementById("object_head").value.trim();
        const head_phone = document.getElementById("head_phone").value.trim();
        const police_name = document.getElementById("police_name").value.trim();
        const police_phone = document.getElementById("police_phone").value.trim();
        const lat = document.getElementById("lat").value.trim();
        const long = document.getElementById("long").value.trim();
        const cooperate_id = document.getElementById("cooperate_id").value.trim();

        const editId = document.getElementById("editId").value;

        if (
          !structure_id || 
          !object_type || 
          !object_name ||
          !address || 
          !area || 
          !admin_phone || 
          !object_head || 
          !head_phone || 
          !police_name || 
          !police_phone || 
          !lat || 
          !long || 
          !drawCoords || 
          !cooperate_id
        ) return alert("Барча мажбурий майдонларни тўлдиринг!");


        const formData = new FormData()

        formData.append('structure_id', structure_id)
        formData.append('object_type', object_type)
        formData.append('object_name', object_name)
        formData.append('address', address)
        formData.append('area', area)
        formData.append('admin_phone', admin_phone)
        formData.append('object_head', object_head)
        formData.append('head_phone', head_phone)
        formData.append('police_name', police_name)
        formData.append('police_phone', police_phone)
        formData.append('cooperate_id', cooperate_id)
        formData.append('lat', lat)
        formData.append('long', long)
        formData.append('geom', JSON.stringify(drawCoords));

        if(editId){
          formData.append('id', editId)
          $.ajax({
            url: `${HRAJAXPHP}?act=act_jts_objects&rowid=${editId}`,
            type: 'POST',               // FormData uchun POST kerak
            data: formData,             // FormData yuboramiz
            processData: false,         // jQuery FormData’ni stringify qilib yubormasligi uchun
            contentType: false,         // headerni avtomatik belgilasin
            success: function(response) {
              console.log('Юборилди:', response);
              renderTable();
            },
            error: function(xhr, status, error) {
              console.error('AJAX error:', error);
            }
          });
        }else{
          $.ajax({
            url: `${HRAJAXPHP}?act=act_jts_objects`,
            type: 'POST',               // FormData uchun POST kerak
            data: formData,             // FormData yuboramiz
            processData: false,         // jQuery FormData’ni stringify qilib yubormasligi uchun
            contentType: false,         // headerni avtomatik belgilasin
            success: function(response) {
              console.log('Юборилди:', response);
              renderTable();
            },
            error: function(xhr, status, error) {
              console.error('AJAX error:', error);
            }
          });
        }
        
        
        bootstrap.Modal.getInstance(document.getElementById("submitModal")).hide();
    });

    tbody.addEventListener("click", (e) => {
        const target = e.target.closest("a");
        if (!target) return;
        const id = $(target).data('id');

        if (target.classList.contains("deleteAction")) {
            if (confirm("Ҳақиқатан ўчирмоқчимисиз?")) {
                $.ajax({
                  url: `${HRAJAXPHP}?act=del_jts_objects&rowid=${id}`,
                  type: 'GET',
                  dataType: 'json',
                  success: function(response) {
                    renderTable()
                  },
                  error: function(xhr, status, error) {
                    console.error('AJAX error:', error);
                  }
                })
            }
        }

        if (target.classList.contains("editAction")) {

            $.ajax({
              url: `${HRAJAXPHP}?act=get_jts_objects&rowid=${id}`,
              type: 'GET',
              dataType: 'json',
              success: function(response) {
                const data = response;
                document.getElementById("structure_id").value = data.structure_id;
                document.getElementById("object_type").value = data.object_type;
                document.getElementById("object_name").value = data.object_name;
                document.getElementById("address").value = data.address;
                document.getElementById("area").value = data.area;
                document.getElementById("admin_phone").value = data.admin_phone;
                document.getElementById("object_head").value = data.object_head;
                document.getElementById("head_phone").value = data.head_phone;
                document.getElementById("police_name").value = data.police_name;
                document.getElementById("police_phone").value = data.police_phone;
                document.getElementById("cooperate_id").value = data.cooperate_id;
                document.getElementById("lat").value = data.lat;
                document.getElementById("long").value = data.long;
                
                document.getElementById("editId").value = id;
                new bootstrap.Modal(document.getElementById("submitModal")).show();
                if(data.geom){
                  const coords = JSON.parse(data.geom)
                  renderMap(coords?.coordinates?.[0])
                }else{
                  renderMap()
                }
              },
              error: function(xhr, status, error) {
                console.error('AJAX error:', error);
              }
            })
        }
    });

    function renderMap(existingCoords){
      
      const mapContainer = document.getElementById('uzbMap')
      if(!mapContainer) return
      if (L.DomUtil.get('uzbMap') !== null) {
        L.DomUtil.get('uzbMap')._leaflet_id = null;
      }
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
      setTimeout(() => {
        map.invalidateSize();
      }, 300);

      // 🧩 Fullscreen tugmasi
      map.addControl(new L.Control.Fullscreen({
        position: 'topleft', // joylashuvi (topleft, topright, bottomleft, bottomright)
        title: {
          'false': 'Тўлиқ экранга ўтиш',
          'true': 'Тўлиқ экрандан чиқиш'
        }
      }));

      // Poligonlar uchun qatlam guruhi
      const drawnItems = new L.FeatureGroup();
      map.addLayer(drawnItems);

      // Agar oldindan polygon koordinatalar berilgan bo‘lsa
      if (existingCoords && existingCoords.length > 0) {
        let coords = existingCoords;

        // Ba’zida backend long-lat yuboradi, buni to‘g‘rilaymiz:
        if (Math.abs(coords[0][0]) > 90) {
          coords = coords.map(([long, lat]) => [lat, long]);
        }

        drawCoords = coords
        const polygon = L.polygon([coords], { color: 'blue' }).addTo(drawnItems);
        setTimeout(() => {
          // map.fitBounds(polygon.getBounds(), {
          //   padding: [50, 50] // [y, x] pikselda
          // });
          map.flyToBounds(polygon.getBounds(), {
            padding: [80, 80], // atrofida bo‘sh joy
            duration: 1         // animatsiya davomiyligi (soniyada)
          });
        }, 1000);
      }


      // Chizish va tahrirlash nazorati
      const drawControl = new L.Control.Draw({
        edit: {
          featureGroup: drawnItems,
          remove: true,
        },
        draw: {
          polygon: true,
          marker: false,
          circle: false,
          polyline: false,
          rectangle: false,
          circlemarker: false,
        },
      });
      map.addControl(drawControl);

      // Yangi chizilgan obyektni saqlash
      map.on(L.Draw.Event.CREATED, function (event) {
        const layer = event.layer;
        drawnItems.addLayer(layer);

        const coords = layer.getLatLngs()[0].map(p => [p.lat, p.lng]);
        drawCoords = coords
        console.log("Yangi polygon koordinatalari:", coords);
      });

      // Tahrirlangan obyekt
      map.on(L.Draw.Event.EDITED, function (event) {
        event.layers.eachLayer(function (layer) {
          const coords = layer.getLatLngs()[0].map(p => [p.lat, p.lng]);
          drawCoords = coords
          console.log("Tahrirlangan polygon:", coords);
        });
      });
    }


    
    // Render pagination buttons based on currentPage and totalPages
    function renderPagination() {
        $('#pagination').empty();
        const visiblePages = 3;  // Number of visible pages around the current page
        const sidePages = 2;  

        $('#pagination').append(`
            <li class="page-item prev ${currentPage === 1 ? 'disabled' : ''}">
                <a class="page-link" href="javascript:void(0);" onclick="changePage(currentPage - 1)">
                    <i class="ti ti-chevron-left ti-xs scaleX-n1-rtl"></i>
                </a>
            </li>
        `);

        // Function to render a single page number
        function renderPage(i) {
            $('#pagination').append(`
                <li class="page-item ${i === currentPage ? 'active' : ''}">
                    <a class="page-link" href="javascript:void(0);" onclick="changePage(${i})">${i}</a>
                </li>
            `);
        }

        // Display first few pages and current surrounding pages
        if (totalPages <= visiblePages + sidePages * 2) {
            // If the total number of pages is small, show all pages
            for (let i = 1; i <= totalPages; i++) {
                renderPage(i);
            }
        } else {
            // Show the first few pages
            for (let i = 1; i <= sidePages; i++) {
                renderPage(i);
            }

            // Show ellipsis (...) if we're skipping pages in the middle
            if (currentPage > visiblePages + sidePages) {
                $('#pagination').append('<li class="page-item disabled"><span class="page-link">...</span></li>');
            }

            // Show a few pages around the current page
            const startPage = Math.max(currentPage - visiblePages, sidePages + 1);
            const endPage = Math.min(currentPage + visiblePages, totalPages - sidePages);
            for (let i = startPage; i <= endPage; i++) {
                renderPage(i);
            }

            // Show ellipsis (...) if we're skipping pages at the end
            if (currentPage < totalPages - visiblePages - sidePages) {
                $('#pagination').append('<li class="page-item disabled"><span class="page-link">...</span></li>');
            }

            // Show the last few pages
            for (let i = totalPages - sidePages + 1; i <= totalPages; i++) {
                renderPage(i);
            }
        }

        // Append the next button
        $('#pagination').append(`
            <li class="page-item next ${currentPage === totalPages ? 'disabled' : ''}">
                <a class="page-link" href="javascript:void(0);" onclick="changePage(currentPage + 1)">
                    <i class="ti ti-chevron-right ti-xs scaleX-n1-rtl"></i>
                </a>
            </li>
        `);
    }

    // Change the page and re-fetch data
    function changePage(page) {
        if (page < 1 || page > totalPages) return;  // Prevent invalid page navigation
        currentPage = page;  // Update current page
        renderTable()
    }

    renderTable();
    {/literal}
</script>

{include file="footer.tpl"}
