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
                    <h4 style="margin: 0;">Chorsu bozoriga 23.10.2025 sanada tushgan naryadlar ro'yxati</h4>
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
                          <th class="text-center">№</th>
                          <th class="text-center">Patrul turi</th>
                          <th class="text-center">Yo‘nalishi</th>
                          <th class="text-center">Smenasi</th>
                          <th class="text-center">F.I.Sh</th>
                          <th class="text-center">Avtomobil markasi</th>
                          <th class="text-center">Avtomobil raqami</th>
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
             
            <div class="col-sm-4">
        <label>Patrul turini tanlang</label>
              <select class="form-control">
                <option value="">Tanlang...</option>
                <option class="p-type" value="pp">Piyoda patrul</option>
                <option class="p-type" value="ap">Avto patrul</option>
                <option class="p-type" value="mp">Moto patrul</option>
                <option class="p-type" value="op">Otliq patrul</option>
              </select>
      </div>
      <div class="col-sm-4">
        <label>Yo‘nalishni kiriting</label>
        <input type="number" class="form-control p-direction" value="">
      </div>
       <div class="col-sm-4">
        <label>Smenasini kiriting</label>
        <input type="number" class="form-control p-direction" value="">
      </div>
        <div class="col-sm-4 mt-3">
              <label>Bo'linmani tanlang</label>
              <select required class="form-control" id="division_date">
                <option value="">Tanlang...</option>
                <option value="Bars1">Bars1</option>
                <option value="Bog'izag'on">Bog'izag'on</option>
                <option value="Bars2">Bars2</option>
                <option value="Nurafshon">Nurafshon</option>
              </select>
            </div>

            <div class="col-sm-4 mt-3">
              <label for="responsible_person_date">Harbiy xizmatchini tanlang</label>
              <select required class="select2 form-select" id="responsible_person_date" multiple>
                <option value="">Tanlang...</option>
                <option value="p-pk Berdiyev M">p-pk Berdiyev M</option>
                <option value="m-r Zokirov M">m-r Zokirov M</option>
                <option value="l-nt Toshev J.N">l-nt Toshev J.N</option>
                <option value="l-nt Umrzakov">l-nt Umrzakov</option>
                <option value="k-n Sadullayev">k-n Sadullayev F.R</option>
                <option value="m-r Rustamov">m-r Rustamov A.J</option>
                <option value="p-pk Usmonov">p-pk Usmonov A.X</option>
              </select>
            </div>
          <div class="col-sm-4">
               <label for="select2Multiple" class="form-label">Epikirovkani tanlang</label>
          <select id="select2Multiple" class="select2 form-select" multiple>
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
            <div class="col-sm-4">
             <label>Avtomobil markasini kiriting</label>
             <input type="text" class="form-control p-qb" value="">
      </div>
        <div class="col-sm-4">
        <label>Avtomobil raqamini kiriting</label>
        <input type="text" class="form-control p-transport" value="">
      </div>

            <!-- Tugmalar -->
            <div class="col-12 text-center mt-5">
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
//  localStorage.clear()
{literal}

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


let localData = JSON.parse(localStorage.getItem("patrol_list")) || [];

const tbody = document.getElementById("table-body");

// Jadvalni yangilash
function renderTable() {
  tbody.innerHTML = "";
localData.forEach((item, index) => {
  const tr = document.createElement("tr");
  tr.innerHTML = `
    <td class="text-center">${index + 1}</td>
    <td class="text-center">${item.type}</td>
    <td class="text-center">${item.direction}</td>
    <td class="text-center">${item.smena}</td>
    <td class="text-center">${item.person}</td>
    <td class="text-center">${item.carModel}</td>
    <td class="text-center">${item.carNumber}</td>
    <td class="text-center">
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

  localStorage.setItem("patrol_list", JSON.stringify(localData));
}

// Qo‘shish modalini ochish
document.getElementById("new").addEventListener("click", () => {
  document.getElementById("localForm").reset();
  document.getElementById("editIndex").value = "";
    $('#responsible_person_date').val(null).trigger('change');
  $('#select2Multiple').val(null).trigger('change');

    new bootstrap.Modal(document.getElementById("submitModal")).show();
});

// Saqlash
document.getElementById("saveBtn").addEventListener("click", (e) => {
  e.preventDefault();

  const type = document.querySelector('#localForm select.form-control').value;
  const direction = document.querySelectorAll('.p-direction')[0].value.trim();
  const smena = document.querySelectorAll('.p-direction')[1].value.trim();
  const division = document.getElementById('division_date').value.trim();
  const persons = Array.from(document.getElementById('responsible_person_date').selectedOptions).map(opt => opt.value);
  const carModel = document.querySelectorAll('.p-qb')[0].value.trim();
  const carNumber = document.querySelectorAll('.p-transport')[0].value.trim();

  if (!type || !division || persons.length === 0) {
    alert("Majburiy maydonlarni to‘ldiring!");
    return;
  }

  const editIndex = document.getElementById("editIndex").value;

  // 🧠 Agar tahrir rejimi bo‘lmasa, har bir tanlangan xizmatchi uchun yangi obyekt yaratamiz
  if (editIndex === "") {
    persons.forEach(person => {
      const newItem = { type, direction, smena, division, person, carModel, carNumber };
      localData.push(newItem);
    });
  } else {
    // 🛠 Tahrir rejimi (bitta ma’lumotni yangilash)
    const person = persons[0]; // faqat bittasi tanlangan holatda
    const updatedItem = { type, direction, smena, division, person, carModel, carNumber };
    localData[editIndex] = updatedItem;
  }

  renderTable();
  bootstrap.Modal.getInstance(document.getElementById("submitModal")).hide();
});


// Tahrirlash va o‘chirish
tbody.addEventListener("click", (e) => {
  const target = e.target.closest("a");
  if (!target) return;
  const index = target.dataset.index;

  if (target.classList.contains("deleteAction")) {
    if (confirm("O‘chirishni xohlaysizmi?")) {
      localData.splice(index, 1);
      renderTable();
    }
  }

  if (target.classList.contains("editAction")) {
    const item = localData[index];
    document.querySelector('#localForm select.form-control').value = item.type;
    document.querySelectorAll('.p-direction')[0].value = item.direction;
    document.querySelectorAll('.p-direction')[1].value = item.smena;
    document.getElementById('division_date').value = item.division;
    document.getElementById('responsible_person_date').value = item.person;
    document.querySelectorAll('.p-qb')[0].value = item.carModel;
    document.querySelectorAll('.p-transport')[0].value = item.carNumber;
    document.getElementById("editIndex").value = index;

    new bootstrap.Modal(document.getElementById("submitModal")).show();
  }
});

renderTable();
{/literal}

</script>


{include file="footer.tpl"}
