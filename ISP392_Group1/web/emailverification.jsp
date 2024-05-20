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
                                        <h3 class="mb-4">Email Verification</h3>
                                    </div>

                                </div>
                                <div class="d-flex">
                                    <div class="w-100">
                                        <h5 class="mb-4">Please enter CODE that has been sent to your email.</h5>
                                    </div>

                                </div>
                                <form action="verify" method="post" class="signin-form">
                                    <div class="form-group mt-3">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="authcode" required>
                                            <label class="form-control-placeholder" for="authcode">Code</label>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="form-control btn btn-primary rounded submit px-3">Verify</button>
                                        </div>
                                    </div>
                                </form>
                                <p class="text-center">No CODE sent? <a data-toggle="tab" href="#signup">Resend</a></p>
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

