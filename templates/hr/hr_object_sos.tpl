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
                                <th>No̱</th>
                                <th class="text-center">Viloyat</th>
                                <th class="text-center">Turi</th>
                                <th class="text-center">Nomi</th>
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
              <select required class="form-select" id="structure">
                <option value="">Tanlang...</option>
                <option value="Andijon">Andijon</option>
                <option value="Buxoro">Buxoro</option>
                <option value="Farg‘ona">Farg‘ona</option>
                <option value="Jizzax">Jizzax</option>
                <option value="Namangan">Namangan</option>
                <option value="Navoiy">Navoiy</option>
                <option value="Qashqadaryo">Qashqadaryo</option>
                <option value="Samarqand">Samarqand</option>
                <option value="Sirdaryo">Sirdaryo</option>
                <option value="Surxondaryo">Surxondaryo</option>
                <option value="Toshkent">Toshkent</option>
                <option value="Xorazm">Xorazm</option>
              </select>
            </div>

            <!-- Turi -->
            <div class="col-sm-4">
              <label>Turi</label>
              <select required class="form-select" id="type">
                <option value="">Tanlang...</option>
                <option value="Bozorlar">Bozorlar</option>
                <option value="Xiyobonlar">Xiyobonlar</option>
                <option value="Parklar">Parklar</option>
                <option value="Boshqa joylar">Boshqa joylar</option>
              </select>
            </div>

           <!-- Turi -->
            <div class="col-sm-4">
              <label>Nomini tanlang</label>
              <select required class="form-select" id="type">
                <option value="">Tanlang...</option>
                <option value="Bozorlar">Chorsu bozori</option>
                <option value="Xiyobonlar">Yunusobot bozori</option>
                <option value="Parklar">Chilonzor bozori</option>
                <option value="Boshqa joylar">Abu saxiy bozori</option>
              </select>
            </div>

             <!-- SOS tugma lat -->
              <div class="col-sm-4">
              <label>SOS tugma kengligi(lat)</label>
              <input required type="text" class="form-control" id="name" placeholder="kengligini kiriting..." />
            </div>

             <!-- SOS tugma long
              -->
            <div class="col-sm-4">
              <label>SOS tugma uzunligi(long)</label>
              <input required type="text" class="form-control" id="name" placeholder="uzunligini kiriting..." />
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
        { structure: "Toshkent", type: "Bozor", name1: "Chorsu bozori", name2: "", name3: "" },
        { structure: "Samarqand", type: "Park", name1: "Registon maydoni", name2: "", name3: "" }
    ];

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
    });

    document.getElementById("saveBtn").addEventListener("click", (e) => {
        e.preventDefault();
        const structure = document.getElementById("structure").value.trim();
        const type = document.getElementById("type").value.trim();
        const name1 = document.getElementById("name1").value.trim();
        const name2 = document.getElementById("name2").value.trim();
        const name3 = document.getElementById("name3").value.trim();
        const editIndex = document.getElementById("editIndex").value;

        if (!structure || !type || !name1)
            return alert("Barcha majburiy maydonlarni to‘ldiring!");

        if (editIndex === "") {
            localData.push({ structure, type, name1, name2, name3 });
        } else {
            localData[editIndex] = { structure, type, name1, name2, name3 };
        }

        localStorage.setItem("jts_objects", JSON.stringify(localData));
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
        }
    });

    renderTable();
    {/literal}
</script>

{include file="footer.tpl"}
