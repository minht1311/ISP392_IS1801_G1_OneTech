
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Dashboard</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Custom Stylesheet -->
        <link href="./plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="css/style_1.css" rel="stylesheet">

    </head>

    <body>

        <!--*******************
            Preloader start
        ********************-->
        <div id="preloader">
            <div class="loader">
                <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
                </svg>
            </div>
        </div>
        <!--*******************
            Preloader end
        ********************-->


        <!--**********************************
            Main wrapper start
        ***********************************-->
        <div id="main-wrapper">

            <!--**********************************
                Nav header start
            ***********************************-->
<!--            <div class="nav-header">
                <div class="brand-logo">
                    <a href="index.html">
                        <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                        <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
                        <span class="brand-title">
                            <img src="images/logo-text.png" alt="">
                        </span>
                    </a>
                </div>
            </div>-->
            <!--**********************************
                Nav header end
            ***********************************-->

            <!--**********************************
                Header start
            ***********************************-->
            <div class="header">    
                <div class="header-content clearfix">

                    <div class="nav-control">
                        <div class="hamburger">
                            <span class="toggle-icon"><i class="icon-menu"></i></span>
                        </div>
                    </div>
                    <div class="header-left">
                        <div class="input-group icons">
                            <div class="input-group-prepend">
                                <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                            </div>
                            <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                            <div class="drop-down   d-md-none">
                                <form action="#">
                                    <input type="text" class="form-control" placeholder="Search">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-email-outline"></i>
                                    <span class="badge gradient-1 badge-pill badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">3 New Messages</span>  

                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/1.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Saiful Islam</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/2.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Adam Smith</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Can you do me a favour?</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/3.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Barak Obama</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/4.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Hilari Clinton</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hello</div>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-bell-outline"></i>
                                    <span class="badge badge-pill gradient-2 badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">2 New Notifications</span>  

                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events near you</h6>
                                                        <span class="notification-text">Within next 5 days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Started</h6>
                                                        <span class="notification-text">One hour ago</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Ended Successfully</h6>
                                                        <span class="notification-text">One hour ago</span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events to Join</h6>
                                                        <span class="notification-text">After two days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown d-none d-md-flex">
                                <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                    <span>English</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                                </a>
                                <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li><a href="javascript:void()">English</a></li>
                                            <li><a href="javascript:void()">Dutch</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown">
                                <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                    <span class="activity active"></span>
                                    <img src="images/user/1.png" height="40" width="40" alt="">
                                </div>
                                <div class="drop-down dropdown-profile   dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                            </li>
                                            <li>
                                                <a href="email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                            </li>

                                            <hr class="my-2">
                                            <li>
                                                <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                            </li>
                                            <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            <div class="nk-sidebar">           
                <div class="nk-nav-scroll">
                    <ul class="metismenu" id="menu">
                        <li class="nav-label">Dashboard</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./index.html">Home 1</a></li>
                                <!-- <li><a href="./index-2.html">Home 2</a></li> -->
                            </ul>
                        </li>
                        <li class="mega-menu mega-menu-sm">
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./layout-blank.html">Blank</a></li>
                                <li><a href="./layout-one-column.html">One Column</a></li>
                                <li><a href="./layout-two-column.html">Two column</a></li>
                                <li><a href="./layout-compact-nav.html">Compact Nav</a></li>
                                <li><a href="./layout-vertical.html">Vertical</a></li>
                                <li><a href="./layout-horizontal.html">Horizontal</a></li>
                                <li><a href="./layout-boxed.html">Boxed</a></li>
                                <li><a href="./layout-wide.html">Wide</a></li>


                                <li><a href="./layout-fixed-header.html">Fixed Header</a></li>
                                <li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">Apps</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-envelope menu-icon"></i> <span class="nav-text">Email</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./email-inbox.html">Inbox</a></li>
                                <li><a href="./email-read.html">Read</a></li>
                                <li><a href="./email-compose.html">Compose</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./app-profile.html">Profile</a></li>
                                <li><a href="./app-calender.html">Calender</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-graph menu-icon"></i> <span class="nav-text">Charts</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./chart-flot.html">Flot</a></li>
                                <li><a href="./chart-morris.html">Morris</a></li>
                                <li><a href="./chart-chartjs.html">Chartjs</a></li>
                                <li><a href="./chart-chartist.html">Chartist</a></li>
                                <li><a href="./chart-sparkline.html">Sparkline</a></li>
                                <li><a href="./chart-peity.html">Peity</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">UI Components</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-grid menu-icon"></i><span class="nav-text">UI Components</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./ui-accordion.html">Accordion</a></li>
                                <li><a href="./ui-alert.html">Alert</a></li>
                                <li><a href="./ui-badge.html">Badge</a></li>
                                <li><a href="./ui-button.html">Button</a></li>
                                <li><a href="./ui-button-group.html">Button Group</a></li>
                                <li><a href="./ui-cards.html">Cards</a></li>
                                <li><a href="./ui-carousel.html">Carousel</a></li>
                                <li><a href="./ui-dropdown.html">Dropdown</a></li>
                                <li><a href="./ui-list-group.html">List Group</a></li>
                                <li><a href="./ui-media-object.html">Media Object</a></li>
                                <li><a href="./ui-modal.html">Modal</a></li>
                                <li><a href="./ui-pagination.html">Pagination</a></li>
                                <li><a href="./ui-popover.html">Popover</a></li>
                                <li><a href="./ui-progressbar.html">Progressbar</a></li>
                                <li><a href="./ui-tab.html">Tab</a></li>
                                <li><a href="./ui-typography.html">Typography</a></li>
                                <!-- </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                    <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                                </a>
                                <ul aria-expanded="false"> -->
                                <li><a href="./uc-nestedable.html">Nestedable</a></li>
                                <li><a href="./uc-noui-slider.html">Noui Slider</a></li>
                                <li><a href="./uc-sweetalert.html">Sweet Alert</a></li>
                                <li><a href="./uc-toastr.html">Toastr</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="widgets.html" aria-expanded="false">
                                <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                            </a>
                        </li>
                        <li class="nav-label">Forms</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./form-basic.html">Basic Form</a></li>
                                <li><a href="./form-validation.html">Form Validation</a></li>
                                <li><a href="./form-step.html">Step Form</a></li>
                                <li><a href="./form-editor.html">Editor</a></li>
                                <li><a href="./form-picker.html">Picker</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">Table</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./table-basic.html" aria-expanded="false">Basic Table</a></li>
                                <li><a href="./table-datatable.html" aria-expanded="false">Data Table</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">Pages</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./page-login.html">Login</a></li>
                                <li><a href="./page-register.html">Register</a></li>
                                <li><a href="./page-lock.html">Lock Screen</a></li>
                                <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                    <ul aria-expanded="false">
                                        <li><a href="./page-error-404.html">Error 404</a></li>
                                        <li><a href="./page-error-403.html">Error 403</a></li>
                                        <li><a href="./page-error-400.html">Error 400</a></li>
                                        <li><a href="./page-error-500.html">Error 500</a></li>
                                        <li><a href="./page-error-503.html">Error 503</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
                Content body start
            ***********************************-->
            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
                <style>
                    .manage-icon {
                        margin-right: 10px;
                        transition: transform 0.3s, color 0.3s;
                    }
                    .manage-icon:hover {
                        transform: scale(1.2);
                    }

                </style>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
            </head>
            <div class="content-body">

                <div class="row page-titles mx-0">
                    <div class="col p-md-0">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->

                <script>
                    function goToCategory() {
                        var selectedCategory = document.getElementById("cat").value;
                        window.location.href = "manage?id=" + selectedCategory;
                    }

                    function searchProduct() {
                        var selectedCategory = document.getElementById("cat").value;
                        var searchQuery = document.getElementById("search").value;
                        window.location.href = "manage?id=" + selectedCategory + "&search=" + searchQuery;
                    }

                    function showProductDetails(productId) {
                        var selectedCategory = document.getElementById("cat").value;
                        window.location.href = "manage?id=" + selectedCategory + "&productId=" + productId;
                    }

                    $(document).ready(function () {
                        var urlParams = new URLSearchParams(window.location.search);
                        if (urlParams.has('productId')) {
                            $('#productModalDetail').modal('show');
                        }
                    });
                    function closeModal() {
                        var selectedCategory = document.getElementById("cat").value;
                        window.location.href = "manage?id=" + selectedCategory;
                    }

                    function openAddProductModal1() {
                        $('#productModal1').modal('show');
                    }
                    function editProductDetails(productId) {
                        var selectedCategory = document.getElementById("cat").value;
                        window.location.href = "manage?id=" + selectedCategory + "&productId=" + productId;
                    }
                    $(document).ready(function () {
                        var urlParams = new URLSearchParams(window.location.search);
                        if (urlParams.has('productId')) {
                            $('#productModalUpdate').modal('show');
                        }
                    });
                </script>
                </head>
                <body>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Manage Product</h4>
                                        <div class="flex-container">
                                            <div class="header-left">
                                                <label class="card-title" for="category">Category:</label>
                                                <select class="form-control-sm" name="cat" id="cat" onchange="goToCategory()">
                                                    <option value="all" ${empty param.id || param.id == 'all' ? 'selected' : ''}>All</option>
                                                    <c:forEach var="c" items="${listC}">
                                                        <option value="${c.id}" ${param.id != null && param.id.equals(c.id.toString()) ? 'selected' : ''}>${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="header-right" style="display: flex; flex-direction: column; align-items: flex-end; margin-bottom: 10px;">
                                                <div class="input-group" style="margin-bottom: 10px;">
                                                    <div class="input-group-prepend">
                                                        <button class="btn btn-primary" onclick="searchProduct()"><i class="fa fa-search"></i></button>
                                                    </div>
                                                    <input type="text" class="form-control" id="search" name="search" placeholder="Search" onkeypress="if (event.keyCode === 13)
                                                                searchProduct()">
                                                </div>
                                                <a href="#" onclick="openAddProductModal1()" class ="btn mb-1 btn-success">Add Product</a>
                                                <jsp:useBean id="cate" class="dal.DAO"/>
                                                <form action="addProduct" method="post">
                                                    <div class="modal fade" id="productModal1" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-lg" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="productModalLabel">Add New Product</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body" style="max-height: 70vh; overflow-y: auto;">
                                                                    <form id="addProductForm" action="addProduct" method="post">
                                                                        <div class="form-group">
                                                                            <label for="product-id" class="col-form-label">ID:</label>
                                                                            <input type="text" class="form-control" id="product-id" name="id" required>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="product-name" class="col-form-label">Name:</label>
                                                                            <input type="text" class="form-control" id="product-name" name="name" required>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="product-price" class="col-form-label">Price:</label>
                                                                            <input type="text" class="form-control" id="product-price" name="price" required>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="product-quantity" class="col-form-label">Quantity:</label>
                                                                            <input type="text" class="form-control" id="product-quantity" name="quantity" required>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="product-description" class="col-form-label">Description:</label>
                                                                            <textarea class="form-control" id="product-description" name="description" required></textarea>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="product-discount" class="col-form-label">Discount:</label>
                                                                            <input type="text" class="form-control" id="product-discount" name="discount">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="product-status" class="col-form-label">Image:</label>
                                                                            <input type="file" class="form-control" id="product-status" name="image">
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="product-status" class="col-form-label">Category</label>
                                                                            <select name="cid">
                                                                                <c:forEach items="${cate.category}" var="c">
                                                                                    <option value="${c.id}">${c.name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal1">Close</button>
                                                                            <button type="submit" class="btn btn-primary">Save</button>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>


                                        </div>

                                        <div class="table-responsive">
                                            <h2>${requestScope.check1}</h2>
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Name</th>
                                                        <th>Price</th>
                                                        <th>Category</th>
                                                        <th>Quantity</th>
                                                        <th>Manage</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="p" items="${listP}">
                                                        <tr>
                                                            <td>${p.id}</td>
                                                            <td>${p.name}</td>
                                                            <td>${p.price}</td>
                                                            <td>${p.category.name}</td>
                                                            <td>${p.quantity}</td>
                                                            <td>
                                                                <a onclick="showProductDetails('${p.id}')" title="View"><i class="fas fa-eye manage-icon" style="margin-right: 10px; color: black"></i></a>
                                                                <a onclick="editProductDetails('${p.id}')" title="Edit"><i class="fas fa-edit manage-icon" style="margin-right: 10px; color: blue"></i></a>
                                                                <a  title="Archive" onclick="return confirm('Are you sure you want to archive this item?');"><i class="fas fa-archive manage-icon" style="color: red"></i></a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                            <!-- Bootstrap Modal -->

                                            <div class="modal fade show" id="productModalDetail" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="productModalLabel">${product.name}</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="window.location.href = 'manage'">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body" style="max-height: 70vh; overflow-y: auto;">
                                                            <form>
                                                                <div class="form-group">
                                                                    <label for="product-id" class="col-form-label">ID:</label>
                                                                    <input type="text" class="form-control" id="product-id" value="${product.id}" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-name" class="col-form-label">Name:</label>
                                                                    <input type="text" class="form-control" id="product-name" value="${product.name}" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-category" class="col-form-label">Category:</label>
                                                                    <input type="text" class="form-control" id="product-category" value="${product.category.name}" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-price" class="col-form-label">Price:</label>
                                                                    <input type="text" class="form-control" id="product-price" value="${product.price} VND" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-quantity" class="col-form-label">Quantity:</label>
                                                                    <input type="text" class="form-control" id="product-quantity" value="${product.quantity}" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-description" class="col-form-label">Description:</label>
                                                                    <textarea class="form-control" id="product-description" readonly>${product.description}</textarea>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-discount" class="col-form-label">Discount:</label>
                                                                    <input type="text" class="form-control" id="product-discount" value="${product.discount}" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-status" class="col-form-label">Image:</label>
                                                                    <input type="text" class="form-control" id="product-status" value="${product.image}" readonly>
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--update-->
                                            <form action="updateProduct" method="POST">
                                                <div class="modal fade" id="productModalUpdate" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-lg" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="productModalLabel">${product.name}</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="window.location.href = 'manage'">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body" style="max-height: 70vh; overflow-y: auto;">

                                                                <div class="form-group">
                                                                    <label for="product-id" class="col-form-label">ID:</label>
                                                                    <input type="text" class="form-control" id="product-id" value="${product.id}" name="id" >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-name" class="col-form-label">Name:</label>
                                                                    <input type="text" class="form-control" id="product-name" value="${product.name}" name="name" >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-price" class="col-form-label">Price:</label>
                                                                    <input type="number" class="form-control" id="product-price" value="${product.price}" name="price" >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-quantity" class="col-form-label">Quantity:</label>
                                                                    <input type="text" class="form-control" id="product-quantity" value="${product.quantity}" name="quantity" >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-description" class="col-form-label">Description:</label>
                                                                    <textarea class="form-control" id="product-description" name="description">${product.description}</textarea>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-discount" class="col-form-label">Discount:</label>
                                                                    <input type="text" class="form-control" id="product-discount" value="${product.discount}" name="discount" >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-status" class="col-form-label">Image:</label>
                                                                    <input type="file" class="form-control" id="product-status" value="${product.image}" name="image" >
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="product-status" class="col-form-label">Category</label>
                                                                    <select name="cid">
                                                                        <c:forEach items="${cate.category}" var="c">
                                                                            <option ${product.category.id == c.id?'selected':''} value="${c.id}">${c.name}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>

                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal()">Close</button>
                                                                <button type="submit" class="btn btn-primary">Update</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>
            <!--**********************************
                Content body end
            ***********************************-->


            <!--**********************************
                Footer start
            ***********************************-->
            <div class="footer">
                <div class="copyright">
                    <!--                    <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>-->
                </div>
            </div>
            <!--**********************************
                Footer end
            ***********************************-->
        </div>
        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Scripts
        ***********************************-->
        <script src="plugins/common/common.min.js"></script>
        <script src="js/custom.min.js"></script>
        <script src="js/settings.js"></script>
        <script src="js/gleek.js"></script>
        <script src="js/styleSwitcher.js"></script>

        <script src="./plugins/tables/js/jquery.dataTables.min.js"></script>
        <script src="./plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
        <script src="./plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

    </body>

</html>
