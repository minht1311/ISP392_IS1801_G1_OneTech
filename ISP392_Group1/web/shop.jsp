<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
        <title>Shop</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="OneTech shop project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="styles/shop_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/shop_responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <style>
            .shop_sidebar {
                text-align: left;
                width: 186px;
                background: #ddd;
            }

            .sidebar_section {
                padding: 0;

            }

            .sidebar_section .sidebar_title {
                font-weight: bold;
                font-size: 30px;
                margin-bottom: 10px;
            }

            .sidebar_section .sidebar_subtitle {
                font-weight: bold; /* Set to bold */
                font-size: 24px; /* Increased font size */
                margin-bottom: 10px;
                border-bottom: 1px solid #ddd; /* Added underline */
                padding-bottom: 5px; /* Added padding for space between text and underline */
            }

            .sidebar_categories {
                list-style: none;
                margin: 0;
                padding: 0;
            }

            .sidebar_categories li {
                text-indent: 15px;
                border-bottom: 1px dashed #ddd;
                padding: 2px 0;
            }

            .sidebar_categories li a {
                border-bottom: 1px dashed #ddd;
                padding: 6px 0;
                display: block;
                font-weight: bold;
                font-size: 20px; /* Increased font size */
            }

            .sidebar_categories li a:hover {
                background-color: #85C9DE;
                color: #FFFFFF;
                text-decoration: none;
            }

            .sidebar_categories li a.active {
                background-color: #85C9DE;
                color: #FFFFFF;
                text-decoration: none;
            }

            .sidebar_categories ul {
                padding: 0px;
            }

            .sidebar_categories ul li {
                text-indent: 10px;
            }

            .sidebar_categories ul li a {
                font-weight: normal;
                font-size: 18px; /* Increased font size */
            }


            .disabled {
                pointer-events: none;
                opacity: 0.5;
            }

            .page_nav li.active a {
                font-weight: bold;
                color: white;
                background-color: #007bff;
                border-radius: 4px;
                padding: 0.2em 0.5em;
            }


            .product-card {
                margin-bottom: 15px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                transition: 0.3s;
            }

            .product-card:hover {
                box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            }

            .product_image img {
                width: 100%;
                height: auto;
            }

            .product-info {
                padding: 15px;
            }

            .product_price {
                font-size: 16px;
                font-weight: 500;
                margin-top: 10px;
            }

            .product_name {
                margin-top: 5px;
            }

            .name_cart_container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .name_cart_container a {
                font-size: 14px;
                color: #000;
                text-decoration: none;
            }

            .name_cart_container a:hover {
                color: #0e8ce4;
            }

            .cart_icon i {
                margin-right: 5px;
            }

            .cart_icon a {
                font-size: 14px;
                color: #000;
                text-decoration: none;
            }

            .cart_icon a:hover {
                color: #0e8ce4;
            }

        </style>

    </head>

    <body>

        <div class="super_container">

            <!-- Header -->

            <header class="header">

                <!-- Top Bar -->

                <div class="top_bar">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-row">
                                <div class="top_bar_contact_item"><div class="top_bar_icon"><img src="images/phone.png" alt=""></div>+38 068 005 3570</div>
                                <div class="top_bar_contact_item"><div class="top_bar_icon"><img src="images/mail.png" alt=""></div><a href="https://colorlib.com/cdn-cgi/l/email-protection#630502101710020f061023040e020a0f4d000c0e"><span class="__cf_email__" data-cfemail="c8aea9bbbcbba9a4adbb88afa5a9a1a4e6aba7a5">[email&#160;protected]</span></a></div>
                                <div class="top_bar_content ml-auto">
                                    <div class="top_bar_menu">
                                        <ul class="standard_dropdown top_bar_dropdown">
                                            <li>
                                                <a href="#">English<i class="fas fa-chevron-down"></i></a>
                                                <ul>
                                                    <li><a href="#">Italian</a></li>
                                                    <li><a href="#">Spanish</a></li>
                                                    <li><a href="#">Japanese</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="#">$ US dollar<i class="fas fa-chevron-down"></i></a>
                                                <ul>
                                                    <li><a href="#">EUR Euro</a></li>
                                                    <li><a href="#">GBP British Pound</a></li>
                                                    <li><a href="#">JPY Japanese Yen</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="top_bar_user">
                                        <div class="user_icon"><img src="images/user.svg" alt=""></div>
                                        <div><a href="#">Register</a></div>
                                        <div><a href="#">Sign in</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>		
                </div>

                <!-- Header Main -->

                <div class="header_main">
                    <div class="container">
                        <div class="row">

                            <!-- Logo -->
                            <div class="col-lg-2 col-sm-3 col-3 order-1">
                                <div class="logo_container">
                                    <div class="logo"><a href="#">OneTech</a></div>
                                </div>
                            </div>

                            <!-- Search -->
                            <div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
                                <div class="header_search">
                                    <div class="header_search_content">
                                        <div class="header_search_form_container">
                                            <form action="#" class="header_search_form clearfix">
                                                <input type="search" required="required" class="header_search_input" placeholder="Search for products...">
                                                <button type="submit" class="header_search_button trans_300" value="Submit"><img src="images/search.png" alt=""></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Wishlist -->
                            <div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
                                <div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
                                    <!-- Cart -->
                                    <div class="cart">
                                        <div class="cart_container d-flex flex-row align-items-center justify-content-end">
                                            <div class="cart_icon">
                                                <img src="images/cart.png" alt="">
                                                <div class="cart_count"><span>10</span></div>
                                            </div>
                                            <div class="cart_content">
                                                <div class="cart_text"><a href="#">Cart</a></div>
                                                <div class="cart_price">$85</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Navigation -->
                <nav class="main_nav">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="main_nav_content d-flex flex-row">
                                    <div class="main_nav_menu m2-auto">
                                        <ul class="standard_dropdown main_nav_dropdown">
                                            <li><a href="#">Home<i class="fas fa-chevron-down"></i></a></li>
                                            <li class="hassubs">
                                                <a href="#">Super Deals<i class="fas fa-chevron-down"></i></a>
                                                <ul>
                                                    <li>
                                                        <a href="#">Menu Item<i class="fas fa-chevron-down"></i></a>
                                                        <ul>
                                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                </ul>
                                            </li>
                                            <li class="hassubs">
                                                <a href="#">Featured Brands<i class="fas fa-chevron-down"></i></a>
                                                <ul>
                                                    <li>
                                                        <a href="#">Menu Item<i class="fas fa-chevron-down"></i></a>
                                                        <ul>
                                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                            <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="#">Menu Item<i class="fas fa-chevron-down"></i></a></li>
                                                </ul>
                                            </li>
                                            <li class="hassubs">
                                                <a href="#">Pages<i class="fas fa-chevron-down"></i></a>
                                                <ul>
                                                    <li><a href="shop.html">Shop<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="product.html">Product<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="blog.html">Blog<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="blog_single.html">Blog Post<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="regular.html">Regular Post<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="cart.html">Cart<i class="fas fa-chevron-down"></i></a></li>
                                                    <li><a href="contact.html">Contact<i class="fas fa-chevron-down"></i></a></li>
                                                </ul>
                                            </li>
                                            <li><a href="blog.html">Blog<i class="fas fa-chevron-down"></i></a></li>
                                            <li><a href="contact.html">Contact<i class="fas fa-chevron-down"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>

                <!-- Menu -->


            </header>

            <!-- Home -->

            <div class="home">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/shop_background.jpg"></div>
                <div class="home_overlay"></div>
                <div class="home_content d-flex flex-column align-items-center justify-content-center">
                    <h2 class="home_title">Card & Vouchers</h2>
                </div>
            </div>

            <!-- Shop -->

            <div class="shop">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <!-- Shop Sidebar -->
                            <div class="shop_sidebar">
                                <div class="sidebar_section">
                                    <div class="sidebar_title">Brand</div>
                                    <div class="sidebar_subtitle" id="dropdown_trigger">Card</div>
                                    <ul class="sidebar_categories" id="dropdown_menu">
                                        <c:forEach items="${requestScope.listC}" var="category">
                                            <li><a class="nav-link ${tag == category.id ? "active":""}" href="Category2Servlet?cid=${category.id}">${category.name}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-9">
                            <!-- Shop Content -->
                            <div class="shop_content">
                                <div class="shop_bar clearfix">
                                    <div class="shop_product_count"><span>${productCount}</span> products found</div>
                                    <div class="shop_sorting">
                                        <span>Sort by:</span>
                                        <ul>
                                            <li>
                                                <span class="sorting_text">highest rated<i class="fas fa-chevron-down"></span></i>
                                                <ul>
                                                    <li class="shop_sorting_button" data-isotope-option='{ "sortBy": "original-order" }'>highest rated</li>
                                                    <li class="shop_sorting_button" data-isotope-option='{ "sortBy": "name" }'>name</li>
                                                    <li class="shop_sorting_button"data-isotope-option='{ "sortBy": "price" }'>price</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="row" id="product-container">
                                        <c:forEach items="${listP}" var="p">
                                            <!-- Product Item -->
                                            <div class="product col-md-3">
                                                <div class="product-card">
                                                    <div class="product_image d-flex flex-column align-items-center justify-content-center">
                                                        <img src="${p.image}" alt="">
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="product_price">
                                                            <h3>${p.getFormattedPrice()}  </h3>
                                                        </div>
                                                        <div class="product_name">
                                                            <div class="name_cart_container d-flex justify-content-between align-items-center">
                                                                <a href="detail?pid=${p.id}">${p.name}</a>
                                                                <p class="cart_icon">
                                                                    <a href="#">
                                                                        <i class="fas fa-shopping-cart"></i>
                                                                    </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <!-- Shop Page Navigation -->
                                <div class="shop_page_nav d-flex flex-row">
                                    <div id="page_prev" class="page_prev d-flex flex-column align-items-center justify-content-center">
                                        <i class="fas fa-chevron-left"></i>
                                    </div>
                                    <ul class="page_nav d-flex flex-row">
                                        <c:forEach begin="1" end="${endPage}" var="i">
                                            <li><a href="javascript:void(0);" onclick="loadPage(${i})">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                    <div id="page_next" class="page_next d-flex flex-column align-items-center justify-content-center">
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>
            </div>






            <!-- Footer -->

            <footer class="footer">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 footer_col">
                            <div class="footer_column footer_contact">
                                <div class="logo_container">
                                    <div class="logo"><a href="#">OneTech</a></div>
                                </div>
                                <div class="footer_title">Got Question? Call Us 24/7</div>
                                <div class="footer_phone">+38 068 005 3570</div>
                                <div class="footer_contact_text">
                                    <p>17 Princess Road, London</p>
                                    <p>Grester London NW18JR, UK</p>
                                </div>
                                <div class="footer_social">
                                    <ul>
                                        <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fab fa-youtube"></i></a></li>
                                        <li><a href="#"><i class="fab fa-google"></i></a></li>
                                        <li><a href="#"><i class="fab fa-vimeo-v"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 offset-lg-2">
                            <div class="footer_column">
                                <div class="footer_title">Find it Fast</div>
                                <ul class="footer_list">
                                    <li><a href="#">Computers & Laptops</a></li>
                                    <li><a href="#">Cameras & Photos</a></li>
                                    <li><a href="#">Hardware</a></li>
                                    <li><a href="#">Smartphones & Tablets</a></li>
                                    <li><a href="#">TV & Audio</a></li>
                                </ul>
                                <div class="footer_subtitle">Gadgets</div>
                                <ul class="footer_list">
                                    <li><a href="#">Car Electronics</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="footer_column">
                                <ul class="footer_list footer_list_2">
                                    <li><a href="#">Video Games & Consoles</a></li>
                                    <li><a href="#">Accessories</a></li>
                                    <li><a href="#">Cameras & Photos</a></li>
                                    <li><a href="#">Hardware</a></li>
                                    <li><a href="#">Computers & Laptops</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-2">
                            <div class="footer_column">
                                <div class="footer_title">Customer Care</div>
                                <ul class="footer_list">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">Order Tracking</a></li>
                                    <li><a href="#">Wish List</a></li>
                                    <li><a href="#">Customer Services</a></li>
                                    <li><a href="#">Returns / Exchange</a></li>
                                    <li><a href="#">FAQs</a></li>
                                    <li><a href="#">Product Support</a></li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </footer>


        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                                                var currentPage = 1;
                                                var totalPages = ${endPage}; // Assuming endPage is available as a global variable

                                                function loadPage(pageNumber) {
                                                    if (pageNumber < 1 || pageNumber > totalPages) {
                                                        return;
                                                    }
                                                    $.ajax({
                                                        url: "/ISP392_Group1/ProductServlet",
                                                        type: "get",
                                                        data: {
                                                            page: pageNumber
                                                        },
                                                        success: function (data) {
                                                            var row = document.getElementById("product-container");
                                                            row.innerHTML = data;  // Clear current products and load new ones
                                                            currentPage = pageNumber;
                                                            updatePagination();
                                                        },
                                                        error: function (xhr) {
                                                            console.error(xhr.responseText);
                                                        }
                                                    });
                                                }

                                                function updatePagination() {
                                                    var prevButton = document.getElementById("page_prev");
                                                    var nextButton = document.getElementById("page_next");

                                                    prevButton.classList.toggle("disabled", currentPage === 1);
                                                    nextButton.classList.toggle("disabled", currentPage === totalPages);

                                                    var pageNav = document.querySelector(".page_nav");
                                                    pageNav.innerHTML = '';
                                                    for (var i = 1; i <= totalPages; i++) {
                                                        var li = document.createElement("li");
                                                        var a = document.createElement("a");
                                                        a.href = "javascript:void(0);";
                                                        a.onclick = (function (pageNumber) {
                                                            return function () {
                                                                loadPage(pageNumber);
                                                            };
                                                        })(i);
                                                        a.textContent = i;
                                                        li.appendChild(a);
                                                        if (i === currentPage) {
                                                            li.classList.add("active");
                                                        }
                                                        pageNav.appendChild(li);
                                                    }
                                                }

                                                document.getElementById("page_prev").addEventListener("click", function () {
                                                    if (currentPage > 1) {
                                                        loadPage(currentPage - 1);
                                                    }
                                                });

                                                document.getElementById("page_next").addEventListener("click", function () {
                                                    if (currentPage < totalPages) {
                                                        loadPage(currentPage + 1);
                                                    }
                                                });

                                                document.addEventListener("DOMContentLoaded", function () {
                                                    updatePagination();
                                                });
        </script>


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/shop_custom.js"></script>

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                                                window.dataLayer = window.dataLayer || [];
                                                function gtag() {
                                                    dataLayer.push(arguments);
                                                }
                                                gtag('js', new Date());

                                                gtag('config', 'UA-23581568-13');
        </script>

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                                                window.dataLayer = window.dataLayer || [];
                                                function gtag() {
                                                    dataLayer.push(arguments);
                                                }
                                                gtag('js', new Date());

                                                gtag('config', 'UA-23581568-13');
        </script>

    </body>

</html>