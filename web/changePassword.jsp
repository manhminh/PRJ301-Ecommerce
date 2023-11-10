<%-- 
    Document   : changePassword
    Created on : Oct 26, 2023, 8:02:46 PM
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
                        <li class='active'>Change Password</li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->

        <div class="body-content">
            <div class="container">
                <div class="sign-in-page">
                    <div class="row" style="display: flex; justify-content: center">
                        <!-- Sign-in -->			
                        <div class="col-md-8 col-sm-8 sign-in">
                            <h4 class="">Change password</h4>
                            <form class="register-form outer-top-xs" role="form" method="POST" action="password?userId=${user.id}">
                                <c:if test="${isValidPassword == false}">
                                    <div class="alert alert-danger" role="alert">
                                        ${error}
                                    </div>
                                </c:if>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail1">Email</label>
                                    <input type="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" name="email" value="${user.email}" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control unicase-form-control text-input" id="exampleInputPassword1" name="oldPassword" required>
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputPassword1">New Password</label>
                                    <input type="password" class="form-control unicase-form-control text-input" id="exampleInputPassword1" name="newPassword" required>
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputPassword1">Confirmed Password</label>
                                    <input type="password" class="form-control unicase-form-control text-input" id="exampleInputPassword1" name="confirmedPassword" required>
                                </div>
                                <button type="submit" class="btn-upper btn btn-primary checkout-page-button">Save</button>
                            </form>					
                        </div>
                        <!-- Sign-in -->
                    </div><!-- /.row -->
                </div><!-- /.sigin-in-->
            </div>    
        </div><!-- /.body-content -->
        <!-- For demo purposes – can be removed on production -->


        <!-- For demo purposes – can be removed on production : End -->

        <!-- JavaScripts placed at the end of the document so the pages load faster -->
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


        <!-- For demo purposes – can be removed on production : End -->



    </body>
</html>