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
    .modal-xxl {
  max-width: 80% !important;
}
{/literal}
</style>

<div class="flex-grow-1 container-p-y container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body d-flex" style="justify-content: space-between;">
                    <h4>Kunlik naryad</h4>
                    <button id="new" type="button" class="btn btn-primary waves-effect waves-light">
                        <i class="menu-icon tf-icons ti ti-plus"></i> Qoʻshish
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <!-- Projects table -->
        <div class="col-12">
            <div class="card">
                <div class="card-datatable table-responsive">
                    <table class="datatables-projects table border-top" id="localTable">
                        <thead>
                            <tr>
                                <th>No̱</th>
                                <th class="text-center">Viloyat</th>
                                <th class="text-center">Sana</th>
                                <th class="text-center">Obyekt turi</th>
                                <th class="text-center">Obyekt</th>
                                <th class="text-center">MG xodimlar soni</th>
                                {* <th class="text-center">QB xodimlar soni</th> *}
                                <th class="text-center">Yoʻnalishlar soni</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="table-body">
                            <!-- JS orqali toʻldiriladi -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--/ Projects table -->
    </div>
</div>

<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xxl modal-simple modal-edit-user">
    <div class="modal-content p-1 p-md-3">
      <div class="modal-body">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        <form id="localForm" class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm-4">
              <label>Sana</label>
              <input type="date" id="date" class="form-control" />
            </div>

            <div class="col-sm-4">
              <label>Obyekt turi</label>
              <select required class="form-control" id="object_type">
                <option value="">Tanlang...</option>
                <option value="Bozor">Bozor</option>
                <option value="Park">Park</option>
                <option value="Xiyobon">Xiyobon</option>
                <option value="Boshqa">Boshqa joy</option>
              </select>
            </div>

            <div class="col-sm-4">
              <label>Obyekt nomi</label>
              <select required class="form-control" id="object">
                <option value="">Tanlang...</option>
                <option value="">Markaziy Bozor</option>
                <option value="">Anhor lakamativ parki</option>
              </select>
            </div>

              <div class="col-sm-4">
              <label>MG javobgar shaxs unvoni</label>
              <input type="text" id="date" class="form-control" />
            </div>
            <div class="col-sm-4">
              <label>MG javobgar shaxs FISH</label>
              <input type="text" id="date" class="form-control" />
            </div>
            <div class="col-sm-4">
              <label>MG javobgar shaxs tel raqami</label>
              <input type="text" id="date" class="form-control" />
            </div>
            {* <hr > *}
            <div class="mt-4"></div>
            <hr>

            <div class="d-flex justify-content-between align-items-center mb-2">
              <h5 class="m-0">Patrullar</h5>
              <button type="button" id="addPatrol" class="btn btn-sm btn-success"><i class="ti ti-plus"></i> Qo‘shish</button>
            </div>

            <div id="patrulContainer" class="mt-2">
              <!-- Patrul bloklari shu yerda dinamik qo‘shiladi -->
            </div>

            <div class="col-12 text-center mt-3">
              <input type="hidden" id="id" />
              <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal">Bekor</button>
              <button id="SubButtonHrSetMarker" class="btn btn-primary me-sm-3 me-1">Saqlash</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!--/ Edit Modal -->

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<!-- Vendors JS -->
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

{* <script src="/assets/assets/js/forms-selects.js"></script> *}

<script>



{literal}

/**
 * Selects & Tags
 */

$(function () {
  const  select2 = $('.select2')
  // Default
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>').select2({
        placeholder: 'Select value',
        dropdownParent: $this.parent()
      });
    });
  }
});

  const STORAGE_KEY = "personal_staff_local_dynamic_v1";

/* Dastlabki misol ma'lumot */
let tables = JSON.parse(localStorage.getItem(STORAGE_KEY)) || [
  {
    id: 1,
    region: "Toshkent",
    date: "2025-10-21",
    object_type: "Bozor",
    object: "Chorsu",
    patruls: [
      { type: "PP (Piyoda patrul)", direction: "4", mg: "8", qb: "4", transport: "Nexia" },
      { type: "AP (Avtomobil patrul)", direction: "3", mg: "7", qb: "10", transport: "" }
    ]
  }
];
function renderSelect() {
  const select2 = $('.select2') 
  
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      console.log('dswsd', $this);
      $this.wrap('<div class="position-relative"></div>').select2({
        placeholder: 'Select value',
        dropdownParent: $this.parent()
      });
    });
  }
} 
// renderSelect()

/* Jadvalni render qilish */
function renderTable() {
  const tbody = document.getElementById("table-body");
  tbody.innerHTML = "";
  tables.forEach((row, idx) => {
    const firstPatrol = row.patruls[0] || {};
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${idx + 1}</td>
      <td class="text-center">${row.region}</td>
      <td class="text-center">${row.date}</td>
      <td class="text-center">${row.object_type}</td>
      <td class="text-center">${row.object}</td>
      <td class="text-center">${firstPatrol.mg || ""}</td>
      <td class="text-center">${firstPatrol.direction || ""}</td>
      <td>
        <div class="dropdown">
          <button type="button" class="btn p-0 dropdown-toggle" data-bs-toggle="dropdown">
            <i class="ti ti-dots-vertical"></i>
          </button>
          <div class="dropdown-menu">
            <a href="javascript:void(0);" class="dropdown-item editAction" data-id="${row.id}"><i class="ti ti-pencil"></i> Tahrirlash</a>
            <a href="javascript:void(0);" class="dropdown-item delete" data-id="${row.id}"><i class="ti ti-trash"></i> O‘chirish</a>
          </div>
        </div>
      </td>
    `;
    tbody.appendChild(tr);
  });
  localStorage.setItem(STORAGE_KEY, JSON.stringify(tables));
}

/* Patrul blokini yaratish */
function createPatrolBlock(patrul = {}, id) {
  
  return `
 
    <div class="row align-items-end g-2 patrol-block  mt-3" id="patrolBlock_${id}" data-id="${id}" style="border:1px solid #dfdfe3; border-radius:6px; padding:10px;">
      <div class="col-1 text-center">
        <button type="button" class="btn btn-danger removePatrol"><i class="ti ti-x"></i></button>
      </div>
      <div class="col-sm-2">
        <label>Patrul turini tanlang</label>
              <select class="form-control">
                <option value="">Tanlang...</option>
                <option class="p-type" value="pp">Piyoda patrul</option>
                <option class="p-type" value="ap">Avto patrul</option>
                <option class="p-type" value="mp">Moto patrul</option>
                <option class="p-type" value="op">Otliq patrul</option>
              </select>
      </div>
      <div class="col-sm-2">
        <label>Yo‘nalishni kiriting</label>
        <input type="number" class="form-control p-direction" value="${patrul.direction || ""}">
      </div>
      <div class="col-sm-2">
         <label>Jinsni tanlang</label>
              <select class="form-control">
                <option value="">Tanlang...</option>
                <option class="p-type" value="pp">Ayol</option>
                <option class="p-type" value="ap">Erkak</option>
       </select>
      </div>
         <div class="col-sm-2">
         <label>Lavozimini tanlang</label>
              <select class="form-control">
                <option value="">Tanlang...</option>
                <option class="p-type" value="ofitser">Ofitser</option>
                <option class="p-type" value="serjant">Serjant</option>
       </select>
      </div>
      <div class="col-sm-2">
        <label>Harbiy unvonini kiriting</label>
        <input type="text" class="form-control p-qb" value="${patrul.qb || ""}">
      </div>
        <div class="col-sm-2">
        <label>FISH ni kiriting</label>
        <input type="text" class="form-control p-transport" value="${patrul.transport || ""}">
      </div>
        <div class="col-sm-2">
        <label>Mobil telni kiriting</label>
        <input type="text" class="form-control p-transport" value="${patrul.transport || ""}">
      </div>
          <div class="col-sm-4">
               <label for="select2Multiple" class="form-label">Epikirovkani tanlang</label>
                <select id="select2Multiple_${id}" class="select2 form-select" multiple>
                  <option class="p-type" value="ofitser">PM</option>
                  <option class="p-type" value="serjant">AK74</option>
                  <option class="p-type" value="serjant">Rezinali tayoq</option>
                  <option class="p-type" value="serjant">Shit</option>
                  <option class="p-type" value="serjant">Pichoq</option>
                  <option class="p-type" value="serjant">Ratsiya</option>
                  <option class="p-type" value="serjant">Body kamera</option>
                  <option class="p-type" value="serjant">Planshet</option>
                  <option class="p-type" value="serjant">Elektroshoker</option>
                  <option class="p-type" value="serjant">Mobil telefon</option>
                  <option class="p-type" value="serjant">Serjant</option>
              </select>
         </div>
            <div class="col-sm-2">
             <label>Avtomobil markasini kiriting</label>
             <input type="text" class="form-control p-qb" value="${patrul.qb || ""}">
      </div>
        <div class="col-sm-2">
        <label>Avtomobil raqamini kiriting</label>
        <input type="text" class="form-control p-transport" value="${patrul.transport || ""}">
      </div>
    </div>
  `;
}

/* Patrul bloklarini yuklash */
function loadPatruls(patruls) {
  const container = document.getElementById("patrulContainer");
  const id = Date.now() + Math.random().toString(36).substring(2);

  container.innerHTML = patruls.map(p => createPatrolBlock(p, id)).join("");
    
  const  select2 = $(`#patrolBlock_${id} #select2Multiple_${id}`)
  // Default
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>').select2({
        placeholder: 'Select value',
        dropdownParent: $this.parent()
      });
    });
  }

}

/* Modalni tozalash */
function openNew() {
  document.getElementById("id").value = "";
  // document.getElementById("structure").value = "";
  document.getElementById("date").value = new Date().toISOString().slice(0, 10);
  document.getElementById("object_type").value = "";
  document.getElementById("object").innerHTML = '<option value="">Tanlang...</option>';
  loadPatruls([{ type: "", direction: "", mg: "", qb: "", transport: "" }]);
  new bootstrap.Modal("#submitModal").show();
}

/* Tahrirlash */
function openEdit(id) {
  const obj = tables.find(t => t.id == id);
  if (!obj) return;
  document.getElementById("id").value = obj.id;
  // document.getElementById("structure").value = obj.region;
  document.getElementById("date").value = obj.date;
  document.getElementById("object_type").value = obj.object_type;
  document.getElementById("object").innerHTML = `<option>${obj.object}</option>`;
  loadPatruls(obj.patruls || []);
  new bootstrap.Modal("#submitModal").show();
}

/* Saqlash */
document.getElementById("localForm").addEventListener("submit", function(e){
  e.preventDefault();

  const id = document.getElementById("id").value;
  // const region = document.getElementById("structure").value.trim();
  const date = document.getElementById("date").value.trim();
  const object_type = document.getElementById("object_type").value.trim();
  const object = document.getElementById("object").value.trim();

  const patruls = Array.from(document.querySelectorAll(".patrol-block")).map(block => ({
    type: block.querySelector(".p-type").value.trim(),
    direction: block.querySelector(".p-direction").value.trim(),
    mg: block.querySelector(".p-mg").value.trim(),
    qb: block.querySelector(".p-qb").value.trim(),
    transport: block.querySelector(".p-transport").value.trim()
  }));

  if (!region || !date || !object_type || !object) {
    alert("Majburiy maydonlarni to‘ldiring!");
    return;
  }

  if (id) {
    const idx = tables.findIndex(t => t.id == id);
    if (idx !== -1) tables[idx] = { id, region, date, object_type, object, patruls };
  } else {
    const newId = tables.length ? Math.max(...tables.map(t => t.id)) + 1 : 1;
    tables.push({ id: newId, region, date, object_type, object, patruls });
  }

  localStorage.setItem(STORAGE_KEY, JSON.stringify(tables));
  renderTable();

  // 🧠 Modalni xavfsiz yopish
  const modalEl = document.getElementById("submitModal");
  const modalInstance = bootstrap.Modal.getInstance(modalEl);
  modalInstance.hide();

  // 🔧 Qo‘shimcha: backdrop’ni ham tozalab tashlash
  setTimeout(() => {
    document.body.classList.remove('modal-open');
    document.querySelectorAll('.modal-backdrop').forEach(b => b.remove());
  }, 300);
});


/* Patrul qo‘shish */
document.getElementById("addPatrol").addEventListener("click", () => {
  const id = Date.now() + Math.random().toString(36).substring(2);

  document.getElementById("patrulContainer").insertAdjacentHTML("beforeend", createPatrolBlock({}, id));
  
  const  select2 = $(`#patrolBlock_${id} #select2Multiple_${id}`)
  // Default
  if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>').select2({
        placeholder: 'Select value',
        dropdownParent: $this.parent()
      });
    });
  }
});

/* Patrul o‘chirish */
document.addEventListener("click", function(e){
  if (e.target.closest(".removePatrol")) {
    e.target.closest(".patrol-block").remove();
  }
});

/* Tahrirlash va o‘chirish eventlari */
document.addEventListener("click", function(e){
  const edit = e.target.closest(".editAction");
  const del = e.target.closest(".delete");
  if (edit) openEdit(edit.dataset.id);
  if (del) {
    const id = del.dataset.id;
    if (confirm("O‘chirmoqchimisiz?")) {
      tables = tables.filter(t => t.id != id);
      localStorage.setItem(STORAGE_KEY, JSON.stringify(tables));
      renderTable();
    }
  }
});

/* Patrul o‘chirish */
document.addEventListener("click", function(e){
  if (e.target.closest(".removePatrol")) {
    e.target.closest(".patrol-block").remove();
  }
});

// Qo‘shish tugmasi ishlashi uchun
document.getElementById("new").addEventListener("click", openNew);

/* Tahrirlash va o‘chirish eventlari */
document.addEventListener("click", function(e){
  const edit = e.target.closest(".editAction");
  const del = e.target.closest(".delete");
  if (edit) openEdit(edit.dataset.id);
  if (del) {
    const id = del.dataset.id;
    if (confirm("O‘chirmoqchimisiz?")) {
      tables = tables.filter(t => t.id != id);
      localStorage.setItem(STORAGE_KEY, JSON.stringify(tables));
      renderTable();
    }
  }
});

// Modal yopilgandan keyin fonni tozalash
document.getElementById('submitModal').addEventListener('hidden.bs.modal', function () {
  document.body.classList.remove('modal-open');
  const backdrops = document.querySelectorAll('.modal-backdrop');
  backdrops.forEach(b => b.remove());
});

/* Init */
document.addEventListener("DOMContentLoaded", renderTable);


/* Init */
// "Qo‘shish" tugmasini bosganda yangi yozuv ochish
document.getElementById("new").addEventListener("click", openNew);

document.addEventListener("DOMContentLoaded", renderTable);

{/literal}
</script>

{include file="footer.tpl"}
