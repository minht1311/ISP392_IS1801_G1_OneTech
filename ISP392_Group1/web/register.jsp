<%-- 
    Document   : login
    Created on : May 18, 2024, 8:18:18 PM
    Author     : ADMIN
--%>

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
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h3 class="mb-4">Sign Up</h3>
                                    </div>
                                    <div class="w-100">
                                        <p class="social-media d-flex justify-content-end">
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                                            <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                                        </p>
                                    </div>
                                </div>
                                <form action="#" class="signin-form">
                                    <div class="form-group mt-3">
                                        <input type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="username">Username</label>
                                    </div>
                                    <div class="form-group mt-3">
                                        <input type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="email">Email</label>
                                    </div>
                                    <div class="form-group mt-3">
                                        <input type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="phone">Phone Number</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" required>
                                        <label class="form-control-placeholder" for="password">Password</label>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="password" class="form-control" required>
                                        <label class="form-control-placeholder" for=" repeat-password">Repeat Password</label>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="first-name">First Name</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="password-field" type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="last-name">Last Name</label>
                                    </div>
                                    <div class="form-group">
                                        <input id="date-of-birth-field" type="date" class="form-control" required>
                                        <label class="form-control-placeholder" for="dob"></label>
                                    </div>
                                    <div class="form-group">
                                        <input id="address-field" type="text" class="form-control" required>
                                        <label class="form-control-placeholder" for="address">Address</label>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary rounded submit px-3">Get OTP</button>
                                    </div>
                                    
                                </form>
                                <p class="text-center">Already a member? <a data-toggle="tab" href="#signup">Sign In</a></p>
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
    </body>
</html>
