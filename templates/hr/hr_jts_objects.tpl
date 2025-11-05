{include file="header.tpl"}

<style>
    {literal}
        .table thead th,
        .table tbody td {
            text-transform: none !important;
        }

        .dt-buttons {
            gap: 10px;
            margin-left: 20px;
        }
    {/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex justify-content-between">
                    <h4>JTSB obyektlari</h4>
                    <button id="new" type="button" class="btn btn-primary waves-effect waves-light">
                        <i class="menu-icon tf-icons ti ti-plus"></i> Qo‘shish
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
                                <th class="text-center">No̱</th>
                                <th class="text-center">Viloyat</th>
                                <th class="text-center">Turi</th>
                                <th class="text-center">Nomi</th>
                                <th>Amallar</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="table-body"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-simple modal-edit-user">
    <div class="modal-content p-1 p-md-5">
      <div class="modal-body">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        <form id="localForm" class="needs-validation" novalidate>
          <div class="row g-3">
            
            <!-- Viloyat -->
            <div class="col-sm-4">
              <label>Viloyat</label>
              <select required class="form-select" id="structure_id">
                <option value="">Tanlang...</option>
                {foreach from=$Regions item=Item1 key=ikey1}
                  <option value="{$Item1.id}">{$Item1.name}</option>
                {/foreach}
   
              </select>
            </div>

            <!-- Turi -->
            <div class="col-sm-4">
              <label>Turi</label>
              <select required class="form-select" id="object_type">
                <option value="">Tanlang...</option>
                {foreach from=$ObjectTypes item=Item1 key=ikey1}
                  <option value="{$Item1.id}">{$Item1.name}</option>
                {/foreach}
              </select>
            </div>

            <!-- Nomi -->
            <div class="col-sm-4">
              <label>Nomi</label>
              <input required type="text" class="form-control" id="object_name" placeholder="Masalan: Registon maydoni" />
            </div>

              <!-- Manzili -->
            <div class="col-sm-4">
              <label>Manzili</label>
              <input required type="text" class="form-control" id="address" placeholder="Manzilni kiriting..." />
            </div>

              <!-- Maydoni -->
            <div class="col-sm-4">
              <label>Maydoni</label>
              <input required type="text" class="form-control" id="area" placeholder="Maydonini kiriting..." />
            </div>

               <!-- Admin tel -->
            <div class="col-sm-4">
              <label>Administrator telefon raqamlari</label>
              <input required type="text" class="form-control" id="admin_phone" placeholder="Telefon raqam kiriting..." />
            </div>

                 <!-- Admin tel -->


            {* <div class="col-sm-4">
              <label>Kameralar sonini kiriting</label>
              <input required type="text" class="form-control" id="name" placeholder="Kameralar sonini kiriting..." />
            </div> *}

               <!-- Bozor raxbari -->
            <div class="col-sm-4">
              <label>Rahbari</label>
              <input required type="text" class="form-control" id="object_head" placeholder="Bozor rahbarini kiriting..." />
            </div>

            <div class="col-sm-4">
              <label>Rahbar telefon raqami</label>
              <input required type="text" class="form-control" id="head_phone" placeholder="Telefon raqamini kiriting..." />
            </div>

              <!-- Bozor uchaskavoy -->
            <div class="col-sm-4">
              <label>Hudud uchastkavoyi FISH</label>
              <input required type="text" class="form-control" id="police_name" placeholder="FISHni kiriting..." />
            </div>

              <!-- Bozor uchaskavoy tel -->
            <div class="col-sm-4">
              <label>Hudud uchastkavoyi telefon raqami</label>
              <input required type="text" class="form-control" id="police_phone" placeholder="Telefon raqam kiriting..." />
            </div>

              <!-- Bozor rasmi -->
            <div class="col-sm-4">
               <label for="photo" class="form-label">Hudud rasmi</label>
               <input class="form-control" type="file" id="photo">
            </div>

              <div class="col-sm-4">
              <label>Nazorat kuzatuv maskani kengligi(lat)</label>
              <input required type="text" class="form-control" id="name" placeholder="kengligini kiriting..." />
            </div>

             <!-- Bozor uchaskavoy tel -->
            <div class="col-sm-4">
              <label>Nazorat kuzatuv maskani uzunligi(lot)</label>
              <input required type="text" class="form-control" id="name" placeholder="uzunligini kiriting..." />
            </div>

             <div class="col-sm-4">
              <label>Hamkorlikdagi tashkilotlar</label>
              <select required class="form-select" id="cooperate_id">
                <option value="">Tanlang...</option>
                {foreach from=$CooperateTypes item=Item1 key=ikey1}
                  <option value="{$Item1.id}">{$Item1.name}</option>
                {/foreach}
              </select>
            </div>
            <div class="col-sm-12">
              <label>Hamkorlikdagi tashkilotlar</label>
                <div id="uzbMap" style="height: 400px;"></div>
            </div>


            <!-- Tugmalar -->
            <div class="col-12 text-center">
              <input type="hidden" id="editIndex" value="">
              <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">
                Bekor qilish
              </button>
              <button id="saveBtn" class="btn btn-primary me-sm-3 me-1">Saqlash</button>
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


<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

<script>

    {literal}
    let localData = JSON.parse(localStorage.getItem("jts_objects")) || [
        { structure: "Toshkent", type: "Bozor", name1: "Chorsu bozori", name2: "12", name3: "" },
        { structure: "Samarqand", type: "Park", name1: "Registon maydoni", name2: "20", name3: "" }
    ];

    let drawCoords

    const tbody = document.getElementById("table-body");

    function renderTable() {
        tbody.innerHTML = "";
        localData.forEach((item, index) => {
            const tr = document.createElement("tr");
            tr.innerHTML = `
                <td class="text-center">${index + 1}</td>
                <td class="text-center">${item.structure}</td>
                <td class="text-center">${item.type}</td>
                <td class="text-center">${item.name1}</td>
                <td class="">
                  <div>
                    <a href="hr.php?act=jts_objects_sos&id=${item.id}" class="p-2">
                        <i class="ti ti-bell me-1"></i> SOS tugma
                    </a>
                  </div>
                  <div>
                    <a href="hr.php?act=jts_objects_camera&id=${item.id}" class="p-2">
                        <i class="ti ti-camera me-1"></i> Kamera
                    </a>
                  </div>
                  <div>
                    <a href="hr.php?act=jts_objects_door&id=${item.id}" class="p-2">
                        <i class="ti ti-door me-1"></i> Eshik
                    </a>
                  </div>

                </td>
                <td>
                    <div class="dropdown">
                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                            <i class="ti ti-dots-vertical"></i>
                        </button>
                        <div class="dropdown-menu">
                            <a href="#" class="dropdown-item editAction" data-index="${index}">
                                <i class="ti ti-pencil me-1"></i> Tahrirlash
                            </a>
                             <a href="#" class="dropdown-item editAction" data-index="${index}">
                                <i class="ti ti-eye me-1"></i> Batafsil
                            </a>
                            <a href="#" class="dropdown-item deleteAction" data-index="${index}">
                                <i class="ti ti-trash me-1"></i> O‘chirish
                            </a>
                        </div>
                    </div>
                </td>
            `;
            tbody.appendChild(tr);
        });
        localStorage.setItem("jts_objects", JSON.stringify(localData));
    }

    document.getElementById("new").addEventListener("click", () => {
        document.getElementById("localForm").reset();
        document.getElementById("editIndex").value = "";
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
        const lon = document.getElementById("lon").value.trim();
        const cooperate_id = document.getElementById("cooperate_id").value.trim();

        const editIndex = document.getElementById("editIndex").value;

        if (
          !structure_id || 
          !object_type || 
          !object_name
          !address || 
          !area || 
          !admin_phone || 
          !object_head || 
          !head_phone || 
          !police_name || 
          !police_phone || 
          !cooperate_id
        ) return alert("Barcha majburiy maydonlarni to‘ldiring!");


        const formData = new formData()

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
        if(lat) formData.append('lat', lat)
        if(lon) formData.append('lon', lon)
        
        renderTable();
        bootstrap.Modal.getInstance(document.getElementById("submitModal")).hide();
    });

    tbody.addEventListener("click", (e) => {
        const target = e.target.closest("a");
        if (!target) return;
        const index = target.dataset.index;

        if (target.classList.contains("deleteAction")) {
            if (confirm("Haqiqatan o‘chirmoqchimisiz?")) {
                localData.splice(index, 1);
                renderTable();
            }
        }

        if (target.classList.contains("editAction")) {
            const data = localData[index];
            document.getElementById("structure").value = data.structure;
            document.getElementById("type").value = data.type;
            document.getElementById("name1").value = data.name1;
            document.getElementById("name2").value = data.name2;
            document.getElementById("name3").value = data.name3;
            document.getElementById("editIndex").value = index;
            new bootstrap.Modal(document.getElementById("submitModal")).show();

            renderMap(data.coords)
        }
    });

    function renderMap(existingCoords){
      const mapContainer = document.getElementById('uzbMap')
      if(!mapContainer) return
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

      // Poligonlar uchun qatlam guruhi
      const drawnItems = new L.FeatureGroup();
      map.addLayer(drawnItems);

      // Agar oldindan polygon koordinatalar berilgan bo‘lsa
      if (existingCoords && existingCoords.length > 0) {
        const polygon = L.polygon(existingCoords, { color: 'blue' });
        drawnItems.addLayer(polygon);
        map.fitBounds(polygon.getBounds());
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



    renderTable();
    {/literal}
</script>

{include file="footer.tpl"}
