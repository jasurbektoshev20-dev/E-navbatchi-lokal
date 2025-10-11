<!DOCTYPE html>

<html lang="en" class="dark-style layout-navbar-fixed layout-menu-fixed layout-compact" dir="ltr"
    data-theme="theme-default" data-assets-path="/assets/assets/" data-template="vertical-menu-template-no-customizer">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>{$Dict.site_title}</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/images/favicon.png" />

    <!-- Icons -->
    <link rel="stylesheet" href="/assets/assets/vendor/fonts/fontawesome.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/fonts/tabler-icons.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/fonts/flag-icons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/assets/assets/vendor/css/rtl/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/assets/assets/vendor/css/rtl/theme-default.css"
        class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/assets/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/assets/assets/vendor/libs/node-waves/node-waves.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/apex-charts/apex-charts.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/swiper/swiper.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/datatables-bs5/datatables.bootstrap5.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/datatables-responsive-bs5/responsive.bootstrap5.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/datatables-checkboxes-jquery/datatables.checkboxes.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="/assets/assets/vendor/css/pages/cards-advance.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/flatpickr/flatpickr.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/bootstrap-datepicker/bootstrap-datepicker.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/bootstrap-daterangepicker/bootstrap-daterangepicker.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/jquery-timepicker/jquery-timepicker.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/pickr/pickr-themes.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/select2/select2.css" />


    <link rel="stylesheet" href="/assets/assets/vendor/libs/leaflet/leaflet.css">
    <script src="/assets/assets/vendor/libs/leaflet/leaflet.js"></script>

    <link rel="stylesheet" href="/assets/assets/vendor/libs/typeahead-js/typeahead.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/quill/typography.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/quill/katex.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/quill/editor.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/dropzone/dropzone.css" />
    <link rel="stylesheet" href="/assets/assets/vendor/libs/bootstrap-maxlength/bootstrap-maxlength.css" />

    <!-- Helpers -->
    <script src="/assets/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="/assets/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/assets/assets/js/config.js"></script>
    <script src="/assets/assets/vendor/libs/jquery/jquery.js"></script>

    <style>
        {literal}
            .card,
            select,
            .nav-tabs,
            .tab-content,
            input {
                /* background: #2f334910;
                backdrop-filter: blur(150px); */
            }

            html:not(.layout-menu-collapsed) .bg-menu-theme .menu-inner .menu-item:not(.active)>.menu-link:hover,
            .layout-menu-hover.layout-menu-collapsed .bg-menu-theme .menu-inner .menu-item:not(.active)>.menu-link:hover {
                background: rgba(134, 146, 208, 0.06);
            }

            .form-control {
                /* background-color: #2f3349 !important; */
            }

            .tab-content {
                background: none !important;
            }

        {/literal}
    </style>
</head>

<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->

            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme"
                style="background: #2f3349 !important; backdrop-filter: blur(0px); ">
                <div class="app-brand demo">
                    <a href="/index.php?act=index&mid=DQtttt" class="app-brand-link">
                        <span class="app-brand-logo demo">
                            <img style="width: 30px !important;" src="/assets/images/logo.png" />
                        </span>
                        <!--<span style="color: #d8dcee !important" class="app-brand-text demo menu-text fw-bold">{$Dict.site_name}</span>-->
                             <span style="color: #d8dcee !important" class="app-brand-text demo menu-text fw-bold">E-Gvardiya</span>
                    </a>

                    <a style="color:#d8dcee" href="javascript:void(0);"
                        class="layout-menu-toggle menu-link text-large ms-auto">
                        <i class="ti menu-toggle-icon d-none d-xl-block ti-sm align-middle"></i>
                        <i class="ti ti-x d-block d-xl-none ti-sm align-middle"></i>
                    </a>
                </div>

                <div class="menu-inner-shadow"></div>

                <ul class="menu-inner py-1">
                    <!-- Dashboards -->
                    <li class="menu-header small text-uppercase">
                        <span style="color:#d8dcee !important" class="menu-header-text">{$Dict.pages}</span>
                    </li>

                    {foreach from=$Menu item=Amenu key=mkey}
                        {if $Amenu.has_children eq 5}
                            <li class="menu-item {$Amenu.class}">
                                <a href="{$Amenu.url}" target="_blank" class="menu-link">
                                    <i style="color:#d8dcee !important" class="{$Amenu.menu_icon}"></i>
                                    <div style="color:#d8dcee !important">{$Amenu.name}</div>
                                </a>
                            </li>
                        {else}
                            {if $Amenu.has_children eq 0 and $Amenu.parent eq 0}
                                <li class="menu-item {$Amenu.class}">
                                    <a href="{$Amenu.url}" class="menu-link">
                                        <i style="color:#d8dcee !important" class="{$Amenu.menu_icon}"></i>
                                        <div style="color:#d8dcee !important">{$Amenu.name}</div>
                                    </a>
                                </li>
                            {else}
                                {if $Amenu.parent eq 0}
                                    <li class="menu-item {if $Amenu.parent_class}{$Amenu.parent_class} open{/if}">
                                        <a style="color:#d8dcee !important" href="javascript:void(0);" class="menu-link menu-toggle">
                                            <i style="color:#d8dcee !important" class="{$Amenu.menu_icon}"></i>
                                            <div style="color:#d8dcee !important">{$Amenu.name}</div>
                                        </a>

                                        <ul class="menu-sub">
                                            {foreach from=$Menu item=SubItem key=mkey}
                                                {if $Amenu.id eq $SubItem.parent}
                                                    <li class="menu-item {$SubItem.class}">
                                                        <a href="{$SubItem.url}" class="menu-link">
                                                            <div style="color:#d8dcee !important">{$SubItem.name}</div>
                                                        </a>
                                                    </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                                    </li>
                                {/if}
                            {/if}
                        {/if}
                    {/foreach}
                </ul>
            </aside>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->
                {* background: #2f334910 !important; backdrop-filter: blur(50px); *}
                <nav style=""
                    class="layout-navbar navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme container-fluid"
                    id="layout-navbar">
                    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                            <i class="ti ti-menu-2 ti-sm"></i>
                        </a>
                    </div>

                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                        <!-- Search -->
                        <div class="navbar-nav align-items-center">
                            <div class="nav-item navbar-search-wrapper mb-0">
                                <a class="nav-item nav-link search-toggler d-flex align-items-center px-0"
                                    href="javascript:void(0);">
                                    {if $ThisMenu.menu_icon}
                                        <i class="{$ThisMenu.menu_icon} text-success"></i>
                                        <span class="d-none d-md-inline-block fs-4">{$ThisMenu.name}</span>
                                    {/if}
                                </a>
                            </div>
                        </div>
                        <!-- /Search -->

                        <ul class="navbar-nav flex-row align-items-center ms-auto">
                            <!-- Language -->
                            <li class="nav-item dropdown-language dropdown me-2 me-xl-0">
                                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                                    data-bs-toggle="dropdown">
                                    <i class="ti ti-language rounded-circle ti-md"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    {foreach from=$Langs item=Item key=mkey}
                                        <li>
                                            <a class="dropdown-item {$Item.class}" href="/index.php?slang={$Item.keyword}"
                                                data-language="{$Item.keyword}">
                                                <span class="align-middle">{$Item.lname}</span>
                                            </a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </li>
                            <!--/ Language -->

                            <!-- Style Switcher -->
                            <li class="nav-item dropdown-style-switcher dropdown me-2 me-xl-0">
                                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                                    data-bs-toggle="dropdown">
                                    <i class="ti ti-md"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-styles">
                                    <li>
                                        <a class="dropdown-item" href="javascript:void(0);" data-theme="light">
                                            <span class="align-middle"><i class="ti ti-sun me-2"></i>Light</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="javascript:void(0);" data-theme="dark">
                                            <span class="align-middle"><i class="ti ti-moon me-2"></i>Dark</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="javascript:void(0);" data-theme="system">
                                            <span class="align-middle"><i
                                                    class="ti ti-device-desktop me-2"></i>System</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- / Style Switcher-->

                            <!-- User -->
                            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                                    data-bs-toggle="dropdown">
                                    <div class="avatar avatar-online">
                                        {if $smarty.session.staffphoto}
                                            <img style="width: 38px; height: 38px !important; object-fit: cover;"
                                                src="/pictures/staffs/{$smarty.session.staffphoto}" alt
                                                class="h-auto rounded-circle" />
                                        {else}
                                            <img src="/assets/assets/img/avatars/1.png" alt class="h-auto rounded-circle" />
                                        {/if}
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li>
                                        <a class="dropdown-item">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div class="avatar avatar-online">
                                                        {if $smarty.session.staffphoto}
                                                            <img style="width: 38px; height: 38px !important; object-fit: cover;"
                                                                src="/pictures/staffs/{$smarty.session.staffphoto}" alt
                                                                class="h-auto rounded-circle" />
                                                        {else}
                                                            <img src="/assets/assets/img/avatars/1.png" alt
                                                                class="h-auto rounded-circle" />
                                                        {/if}
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span class="fw-medium d-block">{$smarty.session.name}</span>
                                                    <small class="text-muted">{$Role_Name}</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    <li>
                                        <a class="dropdown-item" href="/logout.php">
                                            <i class="ti ti-logout me-2 ti-sm"></i>
                                            <span class="align-middle">{$Dict.logout}</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!--/ User -->
                        </ul>
                    </div>

                    <!-- Search Small Screens -->
                    <div class="navbar-search-wrapper search-input-wrapper d-none">
                        <input type="text" class="form-control search-input container-xxl border-0"
                            placeholder="Search..." aria-label="Search..." />
                        <i class="ti ti-x ti-sm search-toggler cursor-pointer"></i>
                    </div>
                </nav>

                <!-- / Navbar -->

                <!-- Content wrapper -->
<div class="content-wrapper">