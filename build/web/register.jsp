<%-- 
    Document   : register
    Created on : Oct 3, 2023, 2:33:02 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">

        <title>Flipmart premium HTML5 & CSS3 Template</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">

        <!-- Customizable CSS -->
        <link rel="stylesheet" href="assets\css\main.css">
        <link rel="stylesheet" href="assets\css\blue.css">
        <link rel="stylesheet" href="assets\css\owl.carousel.css">
        <link rel="stylesheet" href="assets\css\owl.transitions.css">
        <link rel="stylesheet" href="assets\css\animate.min.css">
        <link rel="stylesheet" href="assets\css\rateit.css">
        <link rel="stylesheet" href="assets\css\bootstrap-select.min.css">




        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="assets\css\font-awesome.css">

        <!-- Fonts --> 
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>


    </head>
    <body class="cnt-home">
        <div class="breadcrumb">
            <div class="container">
                <div class="breadcrumb-inner">
                    <ul class="list-inline list-unstyled">
                        <li><a href="home">Home</a></li>
                        <li class="active">Register</a></li>
                        <li><a href="login">Logins</a></li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->

        <div class="body-content">
            <div class="container">
                <div class="sign-in-page">
                    <div class="row">
                        <!-- create a new account -->
                        <div class="col-md-6 col-sm-6 create-new-account">
                            <h4 class="checkout-subtitle">Create a new account</h4>
                            <form class="register-form outer-top-xs" role="form" method="POST" action="register">
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail2">Email Address <span>*</span></label>
                                    <input name="email" type="email" class="form-control unicase-form-control text-input" id="exampleInputEmail2" required>
                                    <c:if test="${isValidEmail == false}">
                                        <div style="color: red">
                                            ${errorEmail}
                                        </div>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="password">Password <span>*</span></label>
                                    <input name="password" type="password" class="form-control unicase-form-control text-input" id="password" required>
                                    <c:if test="${isValidPassword == false}">
                                        <div style="color: red">
                                            ${errorPassword}
                                        </div>
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="confirmedPassword">Confirm Password <span>*</span></label>
                                    <input name="confirmedPassword" type="password" class="form-control unicase-form-control text-input" id="confirmedPassword" required>
                                    <c:if test="${isValidConfirmedPassword == false}">
                                        <div style="color: red">
                                            ${errorConfirmedPassword}
                                        </div>
                                    </c:if>
                                </div>
                                <a href="login" class="forgot-password pull-right">Already you have an account?</a>
                                <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Sign Up</button>
                            </form>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="image">
                                <img style="margin: auto; display: block" src="images/avatarGithub.jpg" alt=""/>
                            </div>
                        </div>	
                    </div><!-- /.row -->
                </div><!-- /.sigin-in-->
            </div><!-- /.container -->
        </div><!-- /.body-content -->

        <script src="assets\js\jquery-1.11.1.min.js"></script>

        <script src="assets\js\bootstrap.min.js"></script>

        <script src="assets\js\bootstrap-hover-dropdown.min.js"></script>
        <script src="assets\js\owl.carousel.min.js"></script>

        <script src="assets\js\echo.min.js"></script>
        <script src="assets\js\jquery.easing-1.3.min.js"></script>
        <script src="assets\js\bootstrap-slider.min.js"></script>
        <script src="assets\js\jquery.rateit.min.js"></script>
        <script type="text/javascript" src="assets\js\lightbox.min.js"></script>
        <script src="assets\js\bootstrap-select.min.js"></script>
        <script src="assets\js\wow.min.js"></script>
        <script src="assets\js\scripts.js"></script>

        <!-- For demo purposes – can be removed on production -->

        <script src="switchstylesheet/switchstylesheet.js"></script>

        <script>
            $(document).ready(function () {
                $(".changecolor").switchstylesheet({seperator: "color"});
                $('.show-theme-options').click(function () {
                    $(this).parent().toggleClass('open');
                    return false;
                });
            });

            $(window).bind("load", function () {
                $('.show-theme-options').delay(2000).trigger('click');
            });
        </script>
        <!-- For demo purposes – can be removed on production : End -->
    </body>
</html>
