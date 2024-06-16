<%-- 
    Document   : menu
    Created on : 25 May 2024, 22:43:19
    Author     : MTTRBLX
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="plugins/slick-1.8.0/slick.css">
<link rel="stylesheet" type="text/css" href="styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="styles/responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="top_bar">
            <div class="container">
                <div class="row">
                    <div class="col d-flex flex-row">
                        <div class="top_bar_content ml-auto">
                            <div class="top_bar_menu">
                                
                            </div>

                            <div class="top_bar_menu">

                                <%
                                String user = (String) session.getAttribute("user");
                                if (user != null) {
                                %>
                                <ul class="standard_dropdown top_bar_dropdown">
                                    <div class="user_icon"><img src="images/user.svg" alt=""></div>
                                    <li>
                                        <a href="#">Welcome, <%= user %><i class="fas fa-chevron-down"></i></a>
                                        <ul>
                                            <li><a href="#">Wishlist</a></li>
                                            <li><a href="#">Cart</a></li>
                                            <li><a href="#">Change Password</a></li>
                                            <li><a href="#" id="logoutLink">Logout</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                                <script>
                                    document.getElementById('logoutLink').addEventListener('click', function (event) {
                                        event.preventDefault();
                                        Swal.fire({
                                            title: "Log out of your account?",
                                            icon: "warning",
                                            showCancelButton: true,
                                            confirmButtonColor: "#3085d6",
                                            cancelButtonColor: "#d33",
                                            confirmButtonText: "Log out!"
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                window.location.href = "logout"; // redirect to logout URL
                                            }
                                        });
                                    });
                                </script>
                                <%
                                } else {
                                %>
                                <div class="top_bar_user">
                                    <div class="user_icon"><img src="images/user.svg" alt=""></div>
                                    <div><a href="register.jsp">Register</a></div>
                                    <div><a href="login.jsp">Sign in</a></div>
                                </div>
                                <%
                                    }
                                %>

                            </div>
                        </div>
                    </div>
                </div>
            </div>		
        </div>
    </body>
</html>
