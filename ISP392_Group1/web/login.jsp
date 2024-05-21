<%-- 
    Document   : login
    Created on : May 18, 2024, 8:18:18 PM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            .captcha-container {
                display: flex;
                align-items: center;
            }
            .captcha-container img {
                margin-right: 10px;
            }
            .captcha-refresh {
                cursor: pointer;
                width: 50px;
            }
            .google-btn {
                margin-top: -5px;
                margin-bottom: 10px;
                width: 350px;

                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 10px 16px;
                border: 1px solid #4285f4;
                border-radius: 4px;
                background-color: #fff;
                color: #4285f4;
                font-family: 'Roboto', sans-serif;
                font-size: 14px;
                font-weight: 500;
                text-decoration: none;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s, box-shadow 0.3s;
            }
            .google-btn:hover {
                background-color: #f1f3f4;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            }
            .google-btn img {
                margin-right: 15px;
                margin-left: 15px;
            }
        </style>
        <style>
            body {
                background-image: url(images/banner_background.jpg); /* Replace with the actual path to your image */
                background-size: cover;
                background-position: center;
            }
        </style>
    </head>
    <body>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section"></h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-7 col-lg-5">
                        <div class="wrap">
                            <div class="img" style="background-image: url(images/the-dien-thoai-50k.jpg);"></div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign In</h3>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                                            <a href="https://x.com/two_toner/" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                                        </p>
                                    </div>
                                </div>
                                <form action="LoginServlet" method="post" class="signin-form">
                                    <div class="form-group mt-3">
                                        <input type="text" class="form-control" name="username" required>
                                        <label class="form-control-placeholder" for="username">Username or Email</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" name="password" class="form-control" required>
                                        <label class="form-control-placeholder" for="password">Password</label>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>

                                    <div class="captcha-container">
                                        <img id="captchaImage" src="CaptchaGenerator" alt="CAPTCHA Image" />
                                        <img class="captcha-refresh" src="captchaRefresh.png" alt="Refresh CAPTCHA" onclick="refreshCaptcha()" />
                                    </div>
                                    <!--                                    <input type="text" name="captcha" placeholder="Enter CAPTCHA" required />-->
                                    <br>
                                    <div class="form-group">
                                        <input id="password-field" name="captcha" type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="password">Captcha</label>
                                    </div>
                                    <c:if test="${not empty errorMessage}">
                                        <div class="error-message">${errorMessage}</div>
                                    </c:if>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:9999/ISP392_Group1/LoginServlet&response_type=code&client_id=957942724914-d7o66vc94gln7kiiifn5j5k1cn6pjvet.apps.googleusercontent.com&approval_prompt=force" class="google-btn">
                                        <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google logo" width="20" height="20">
                                        Login With Google
                                    </a>  
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                                    </div>
                                    <div class="form-group d-md-flex">
                                        <div class="w-50 text-left">
                                            <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                                                <input type="checkbox" checked>
                                                <span class="checkmark"></span>
                                            </label>
                                        </div>
                                        <div class="w-50 text-md-right">
                                            <a href="#">Forgot Password</a>
                                        </div>
                                    </div>
                                </form>
                                <p class="text-center">Not a member? <a  href="register.jsp">Sign Up</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript">
                                            function refreshCaptcha() {
                                                document.getElementById("captchaImage").src = "CaptchaGenerator?ts=" + new Date().getTime();
                                            }
        </script>
    </body>
</html>
