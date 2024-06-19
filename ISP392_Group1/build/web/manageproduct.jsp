
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

                    </div>
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown">
                                <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                    <span class="activity active"></span>
                                    <img src="images/user/1.png" height="40" width="40" alt="">
                                </div>
                                <div class="drop-down dropdown-profile   dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li><a href="logout"><i class="icon-key"></i> <span>Logout</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="nk-sidebar">           
                <div class="nk-nav-scroll">
                    <ul class="metismenu" id="menu">
                        <li class="nav-label">Manage</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-menu menu-icon"></i><span class="nav-text">Manage</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="ManageAccount" aria-expanded="false">Manage Account</a></li>
                                    <c:if test="${role eq 'user'}">
                                    <li><a href="ChangePassword" aria-expanded="false">Change Password</a></li>
                                    </c:if>
                                <li><a href="manage" aria-expanded="false">Manage Product</a></li>
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
                            <li class="breadcrumb-item active"><a href="home.jsp">Home</a></li>
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
                    function populateDetailModal(id, name, category, price, quantity, description, discount, image) {
                        $('#detail-product-id').val(id);
                        $('#detail-product-name').val(name);
                        $('#detail-product-category').val(category);
                        $('#detail-product-price').val(price);
                        $('#detail-product-quantity').val(quantity);
                        $('#detail-product-description').val(description);
                        $('#detail-product-discount').val(discount);
                        $('#detail-product-image').val(image);
                    }
                    $(document).ready(function () {
                        var urlParams = new URLSearchParams(window.location.search);
                        if (urlParams.has('productId')) {
                            $('#productModalUpdate').modal('show');
                        }
                    });
                    function editProductDetails(productId) {
                        var selectedCategory = document.getElementById("cat").value;
                        window.location.href = "manage?id=" + selectedCategory + "&productId=" + productId;
                    }
                    function closeModal() {
                        var selectedCategory = document.getElementById("cat").value;
                        window.location.href = "manage?id=" + selectedCategory;
                    }

                    function openAddProductModal1() {
                        $('#productModal1').modal('show');
                    }

                </script>
                </head>
                <body>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                    <h4 class="card-title"><a href="manage">Manage Account</a></h4>
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
                                            </div>
                                        </div>

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
                                                            <!-- View Product Details -->
                                                            <a href="#" data-toggle="modal" data-target="#productModalDetail" onclick="populateDetailModal('${p.id}', '${p.name}', '${p.category.name}', '${p.price}', '${p.quantity}', '${p.description}', '${p.discount}', '${p.image}')"
                                                               title="View"><i class="fas fa-eye manage-icon" style="margin-right: 10px; color: black"></i></a>

                                                            <!-- Edit Product Details -->
                                                            <a onclick="editProductDetails('${p.id}')" title="Edit"><i class="fas fa-edit manage-icon" style="margin-right: 10px; color: blue"></i></a>

                                                            <!-- Archive Product -->
                                                            <a href="archive?id=${p.id}" title="Archive" onclick="return confirm('Are you sure you want to archive this item?');"><i class="fas fa-archive manage-icon" style="color: red"></i></a>
                                                        </td>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <!-- Bootstrap Modal -->

                                        <div class="modal fade" id="productModalDetail" tabindex="-1" role="dialog" aria-labelledby="productModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg" role="document">
                                                <div class="modal-content">
                                                    <!-- Modal content for detail -->
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="productModalLabel">Product Detail</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form>
                                                            <div class="form-group">
                                                                <label for="detail-product-id" class="col-form-label">ID:</label>
                                                                <input type="text" class="form-control" id="detail-product-id" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="detail-product-name" class="col-form-label">Name:</label>
                                                                <input type="text" class="form-control" id="detail-product-name" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="detail-product-category" class="col-form-label">Category:</label>
                                                                <input type="text" class="form-control" id="detail-product-category" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="detail-product-price" class="col-form-label">Price:</label>
                                                                <input type="text" class="form-control" id="detail-product-price" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="detail-product-quantity" class="col-form-label">Quantity:</label>
                                                                <input type="text" class="form-control" id="detail-product-quantity" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="detail-product-description" class="col-form-label">Description:</label>
                                                                <textarea class="form-control" id="detail-product-description" readonly></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="detail-product-discount" class="col-form-label">Discount:</label>
                                                                <input type="text" class="form-control" id="detail-product-discount" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="detail-product-image" class="col-form-label">Image:</label>
                                                                <input type="text" class="form-control" id="detail-product-image" readonly>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Bootstrap Modal for Update -->
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
