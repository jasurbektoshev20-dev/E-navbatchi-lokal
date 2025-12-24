<!DOCTYPE html>

<html lang="en" class="light-style layout-wide customizer-hide" dir="ltr" data-theme="theme-default"
    data-assets-path="/assets/assets/" data-template="vertical-menu-template">

<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>E-Gvardiya тизими</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/assets/images/favicon.png" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

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
    <!-- Vendor -->
    <link rel="stylesheet" href="/assets/assets/vendor/libs/@form-validation/umd/styles/index.min.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="/assets/assets/vendor/css/pages/page-auth.css" />

    <!-- Helpers -->
    <script src="/assets/assets/vendor/js/helpers.js"></script>
    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Template customizer: To hide customizer set displayCustomizer value false in config.js.  -->
    <script src="/assets/assets/vendor/js/template-customizer.js"></script>
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/assets/assets/js/config.js"></script>

    <script>
        {literal}

        {/literal}
    </script>
</head>

<body>
    <div class="authentication-wrapper authentication-cover authentication-bg"
        style="background-color: none !important;">
        <div class="authentication-inner row">
            <!-- Login -->
            <div class="d-flex col-lg-12 align-items-center">
                <div class="w-px-400 mx-auto">
                    <!-- Logo -->
                    <div class="row" style="justify-content: center;">
                        <img style="width: 250px;" src="/assets/images/logo.png" />
                    </div>
                    <!-- /Logo -->

                    <div class="row" style="justify-content: center;">
                        {* <h3 class="mb-1 text-center">{$Dict.site_title}</h3> *}
                        <h3 class="mb-1 text-center"><br>"E-GVARDIYA" МОНИТОРИНГ ТИЗИМИ</h3>
                    </div>

                    <form id="formAuthentication" class="mb-3" action="auth.php" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">{$Dict.username}</label>
                            <input type="text" class="form-control" id="username" name="login"
                                autocomplete="one-time-code" placeholder="Enter username" autofocus />
                        </div>
                        <div class="mb-3 form-password-toggle">
                            <div class="d-flex justify-content-between">
                                <label class="form-label" for="password">{$Dict.password}</label>
                            </div>
                            <div class="input-group input-group-merge">
                                <input type="password" id="password" class="form-control" name="password"
                                    autocomplete="new-password"
                                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                    aria-describedby="password" />
                                <span class="input-group-text cursor-pointer"><i class="ti ti-eye-off"></i></span>
                            </div>
                        </div>
                        <button class="btn btn-primary d-grid w-100">{$Dict.enter_system}</button>
                    </form>
                </div>
            </div>
            <!-- /Login -->
        </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->

    <script src="/assets/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="/assets/assets/vendor/libs/popper/popper.js"></script>
    <script src="/assets/assets/vendor/js/bootstrap.js"></script>
    <script src="/assets/assets/vendor/libs/node-waves/node-waves.js"></script>
    <script src="/assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="/assets/assets/vendor/libs/hammer/hammer.js"></script>
    <script src="/assets/assets/vendor/libs/i18n/i18n.js"></script>
    <script src="/assets/assets/vendor/libs/typeahead-js/typeahead.js"></script>
    <script src="/assets/assets/vendor/js/menu.js"></script>

    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="/assets/assets/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
    <script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
    <script src="/assets/assets/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>



    <script>
        var AJAXPHP = "ajax{$AddURL}.php";
        {literal}
            let isShowing = false;

            $('.ti-eye-off').click(function(e) {
                if (!isShowing) {
                    $('.ti-eye-off').addClass('ti-eye');
                    $('.ti-eye-off').removeClass('ti-eye-off');
                    $('#password').attr('type', 'text');
                    isShowing = true;
                } else {
                    $('.ti-eye').addClass('ti-eye-off');
                    $('.ti-eye').removeClass('ti-eye');
                    $('#password').attr('type', 'password');
                    isShowing = false;
                }
            })
        {/literal}
    </script>
</body>

</html>