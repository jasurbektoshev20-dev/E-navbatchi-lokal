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
                    <h4>Таъсир ҳудудлари</h4>
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
                                <th class="text-center">Бўлинма</th>
                                <th class="text-center">Номи</th>
                                <th>Амаллар</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$ImpactAreas item=Table key=tkey}
                                <tr class="lb" id="row_{$Table.id}">
                                    <td class="text-right">{$tkey+1}</td>
                                    <td>{$Table.structure}</td>
                                    <td>{$Table.name}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a rel="{$Table.id}" class="dropdown-item editAction"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-pencil me-1"></i>{$Dict.edit}</a>
                                                <a rel="{$Table.id}" class="dropdown-item delete"
                                                    href="javascript:void(0);"><i
                                                        class="ti ti-trash me-1"></i>{$Dict.delete}</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
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
                            <select required class="form-select" id="region_id">
                                <option value="">Танланг...</option>
                                {foreach from=$Regions item=Item1 key=ikey1}
                                    <option value="{$Item1.id}">{$Item1.name}</option>
                                {/foreach}

                            </select>
                        </div>

                        <div class="col-sm-4">
                            <label>{$Dict.territorial_short}</label>
                            <select id="structure_id" class="form-select">
                                <option value="">{$Dict.choose}</option>
                                {foreach from=$Structures item=obj}
                                    <option value="{$obj.id}">{$obj.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        <!-- Номи -->
                        <div class="col-sm-4">
                            <label>Номи</label>
                            <input required type="text" class="form-control" id="name"
                                placeholder="Masalan: Registon maydoni" />
                        </div>

                        <div class="col-sm-12">
                            <label>Объект ҳудудини чизиш</label>
                            <div id="uzbMap" style="height: 350px;"></div>
                        </div>

                        <!-- Tugmalar -->
                        <div class="col-12 text-center">
                            <input type="hidden" id="id" value="">
                            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal"
                                aria-label="Close">
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.4/leaflet.draw.js"></script>

<!-- 🧩 Fullscreen plugin -->
<link rel="stylesheet"
    href="https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/leaflet.fullscreen.css" />
<script src="https://api.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v1.0.1/Leaflet.fullscreen.min.js"></script>

<script src="/assets/assets/vendor/libs/datatables-bs5/datatables-bootstrap5.js"></script>
<script src="/assets/assets/vendor/libs/sweetalert2/sweetalert2.js"></script>
<script src="/assets/assets/vendor/libs/dropzone/dropzone.js"></script>
<script src="/assets/assets/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

<script>
    var dict_infraction = "{$Dict.infraction}"
    var dict_action_taken = "{$Dict.action_taken}"
    var dict_person_drafted = "{$Dict.person_drafted}"
    var dict_old_photo = "{$Dict.old_photo}"
    var dict_new_photo = "{$Dict.new_photo}"
    var dict_download_pdf = "{$Dict.download_pdf}"
    var dict_docx_download = "{$Dict.docx_download}"

    var Var_comment1	= "{$Dict.comment1}";
    var Var_comment2	= "{$Dict.comment2}";
    var Var_comment3	= "{$Dict.comment3}";
    var Var_main_photo	= "{$Dict.main_photo}";
    var Var_ObjectId	= "{$Organization.id}";
    var dict_choose = "{$Dict.choose}";
    {literal}

        var dt_basic_table = $('.datatables-projects'),
            dt_basic;
        let drawCoords;

        // DataTable with buttons
        if (dt_basic_table.length) {
            dt_basic = dt_basic_table.DataTable({
                displayLength: 10,
                lengthMenu: [5, 10, 25, 50, 75, 100, 1000]
            });
        }

        // Filtering
        $('#region_id').change(function(event) {
            $.get("ajax.php?act=get_divisions&structure_id=" + this.value, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#structure_id').empty();
                $('#structure_id').append(`<option value="">${dict_choose}</option>`);
                sInfo.forEach((item, index) => {
                    $('#structure_id').append(`<option value="${item.id}">${item.name}</option>`);
                });
            });
        });

        $('#new').click(function() {
            $('#submitModal').modal('toggle');
            $('#region_id').val(0);
            $('#region_id').trigger("change");
            $('#structure_id').val(0);
            $('#structure_id').trigger("change");
            $('#name').val("");

            renderMap();
        });

        $('.datatables-projects tbody').on('click', '.editAction', function() {
            $('#submitModal').modal('toggle');

            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=get_impact_area&rowid=" + RowId, function(html) {
                var sInfo = jQuery.parseJSON(html);

                $('#id').val(sInfo.id);
                $('#region_id').val(sInfo.structure_id);
                $('#structure_id').val(sInfo.structure_id);
                $('#name').val(sInfo.name);

                if (sInfo.geom) {
                    const coords = JSON.parse(sInfo.geom)
                    renderMap(coords?.coordinates?. [0]);
                } else {
                    renderMap();
                }
            });
        })

        // Form validation and submit
        const bsValidationForms = $('.needs-validation');
        Array.prototype.slice.call(bsValidationForms).forEach(function(form) {
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    event.preventDefault();
                    event.stopPropagation();

                    var form_data = new FormData();
                    form_data.append('id', $('#id').val());

                    if ($('#structure_id').val() == 0) {
                        form_data.append('structure_id', $('#region_id').val());
                    } else {
                        form_data.append('structure_id', $('#structure_id').val() || $('#region_id').val());
                    }

                    form_data.append('name', $('#name').val());
                    form_data.append('geom', JSON.stringify(drawCoords));

                    $.ajax({
                        url: 'hrajax.php?act=act_impact_area',
                        dataType: 'text',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data,
                        type: 'post',
                        success: function(resdata) {
                            //console.log(resdata);
                            var NewArray = resdata.split("<&sep&>");
                            if (NewArray[0] == 0) {
                                location.reload();
                            } else {
                                alert(resdata);
                            }
                        }
                    });
                }

                form.classList.add('was-validated');
            });
        });

        // Delete Record
        $('.datatables-projects tbody').on('click', '.delete', function() {
            var RowId = $(this).attr('rel');
            $.get("hrajax.php?act=del_impact_area&rowid=" + RowId, function(html) {
                if (html == 0) {
                    $("#row_" + RowId).remove();
                }
            });
        });


        function renderMap(existingCoords) {
            const mapContainer = $('#uzbMap')
            if (!mapContainer) return
            if (L.DomUtil.get('uzbMap') !== null) {
                L.DomUtil.get('uzbMap')._leaflet_id = null;
            }
            // O‘zbekiston markazi koordinatalari
            const uzbekistanCenter = [41.2995, 69.2401]; // Toshkent markazi

            // Xaritani yaratish
            const map = L.map("uzbMap", {
                center: [41.6384, 64.0202],
                zoom: 7,
                layers: L.tileLayer(`http://10.100.9.145:8080/tile/{z}/{x}/{y}.png`, { maxZoom: 19 }),
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
                        duration: 1 // animatsiya davomiyligi (soniyada)
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
            map.on(L.Draw.Event.CREATED, function(event) {
                const layer = event.layer;
                drawnItems.addLayer(layer);

                const coords = layer.getLatLngs()[0].map(p => [p.lat, p.lng]);
                drawCoords = coords
                console.log("Yangi polygon koordinatalari:", coords);
            });

            // Tahrirlangan obyekt
            map.on(L.Draw.Event.EDITED, function(event) {
                event.layers.eachLayer(function(layer) {
                    const coords = layer.getLatLngs()[0].map(p => [p.lat, p.lng]);
                    drawCoords = coords
                    console.log("Tahrirlangan polygon:", coords);
                });
            });
        }

    {/literal}
</script>

{include file="footer.tpl"}