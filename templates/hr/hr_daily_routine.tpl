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
          <h4>Obyektlar bo'yicha naryadlar</h4>
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
                <th class="text-center">Sana</th>
                <th class="text-center">Turi</th>
                <th class="text-center">Nomi</th>
                <th class="text-center">Bo'linma nomi</th>
                <th class="text-center">Javobgar shaxs</th>
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

<!-- Modal -->
<div class="modal fade" id="submitModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-simple modal-edit-user">
    <div class="modal-content p-1 p-md-5">
      <div class="modal-body">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        <form id="localForm" class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm-6">
              <label>Sana</label>
              <input required type="date" class="form-control" id="structure" />
            </div>

            <div class="col-sm-6">
              <label>Nomini tanlang</label>
              <select required class="form-select" id="name1">
                <option value="">Tanlang...</option>
                <option value="Registon maydoni">Registon maydoni</option>
                <option value="Markaziy bozor">Markaziy bozor</option>
                <option value="Abu saxiy bozori">Abu saxiy bozori</option>
                <option value="Farxod bozori">Farxod bozori</option>
                <option value="Anhor lakamativ parki">Anhor lakamativ parki</option>
              </select>
            </div>

            <div class="col-sm-6 mt-3">
              <label>Bo'linmani tanlang</label>
              <select required class="form-control" id="division">
                <option value="">Tanlang...</option>
                <option value="Bars1">Bars1</option>
                <option value="Bog'izag'on">Bog'izag'on</option>
                <option value="Bars2">Bars2</option>
                <option value="Nurafshon">Nurafshon</option>
              </select>
            </div>

            <div class="col-sm-6 mt-3">
              <label>Javobgar shaxsni tanlang</label>
              <select required class="form-control" id="responsible_person">
                <option value="">Tanlang...</option>
                <option value="p-pk Berdiyev M">p-pk Berdiyev M</option>
                <option value="m-r Zokirov M">m-r Zokirov M</option>
                <option value="l-nt Toshev J.N">l-nt Toshev J.N</option>
                <option value="l-nt Umrzakov">l-nt Umrzakov</option>
              </select>
            </div>

            <!-- Tugmalar -->
            <div class="col-12 text-center mt-5">
              <input type="hidden" id="editIndex" value="">
              <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal">Bekor qilish</button>
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

// localStorage.clear()
 {literal}
let localData = JSON.parse(localStorage.getItem("jts_objects")) || [
  { structure: "2025-10-23", type: "Bozor", name1: "Chorsu bozori", division: "Markaziy devon", responsible_person: "p-pk Berdiyev M" },
  { structure: "2025-10-22", type: "Park", name1: "Registon maydoni", division: "Bars2", responsible_person: "l-nt Toshev J.N" }
];

const tbody = document.getElementById("table-body");

function getTypeByName(name) {
  name = name.toLowerCase();
  if (name.includes("bozor")) return "Bozor";
  if (name.includes("park") || name.includes("maydon")) return "Park";
  if (name.includes("saxiy")) return "Savdo maskani";
  return "Boshqa";
}

function renderTable() {
  tbody.innerHTML = "";
  localData.forEach((item, index) => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td class="text-center">${index + 1}</td>
      <td class="text-center">
        <a 
          href="hr.php?act=dailiy_routine_date&mid={$smarty.get.mid}&date=${encodeURIComponent(item.structure)}"
          class="text-primary text-decoration-underline"
        >
          ${item.structure}
        </a>
      </td>
      <td class="text-center">${item.type}</td>
      <td class="text-center">${item.name1}</td>
      <td class="text-center">${item.division}</td>
      <td class="text-center">${item.responsible_person}</td>
      <td>
        <div class="dropdown">
          <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
            <i class="ti ti-dots-vertical"></i>
          </button>
          <div class="dropdown-menu">
            <a href="#" class="dropdown-item editAction" data-index="${index}">
              <i class="ti ti-pencil me-1"></i> Tahrirlash
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
  const name1 = document.getElementById("name1").value.trim();
  const division = document.getElementById("division").value.trim();
  const responsible_person = document.getElementById("responsible_person").value.trim();
  const editIndex = document.getElementById("editIndex").value;

  if (!structure || !name1 || !division || !responsible_person) {
    alert("Barcha majburiy maydonlarni to‘ldiring!");
    return;
  }

  const type = getTypeByName(name1);

  if (editIndex === "") {
    localData.push({ structure, type, name1, division, responsible_person });
  } else {
    localData[editIndex] = { structure, type, name1, division, responsible_person };
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
    document.getElementById("name1").value = data.name1;
    document.getElementById("division").value = data.division;
    document.getElementById("responsible_person").value = data.responsible_person;
    document.getElementById("editIndex").value = index;
    new bootstrap.Modal(document.getElementById("submitModal")).show();
  }
});

renderTable();
{/literal}
</script>

{include file="footer.tpl"}
