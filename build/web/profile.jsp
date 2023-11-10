<%-- 
    Document   : modalProfile
    Created on : Oct 25, 2023, 9:05:23 PM
    Author     : Admin
--%>

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
                        <li class='active'>Profile</li>
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
                            <h4 class="">Profile</h4>
                            <form class="register-form outer-top-xs" role="form" method="POST" action="profile?userId=${user.id}">
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail1">Email</label>
                                    <input type="email" class="form-control unicase-form-control text-input" id="exampleInputEmail1" name="email" value="${user.email}" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control unicase-form-control text-input" id="exampleInputPassword1" name="password" value="${user.password}" disabled="true">
                                </div>
                                 <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail1">Username</label>
                                    <input type="text" class="form-control unicase-form-control text-input" id="exampleInputPassword1" name="username" value="${user.username}">
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail1">Address</label>
                                    <input type="text" class="form-control unicase-form-control text-input" id="exampleInputPassword1" name="address" value="${user.address}">
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail1">Gender</label>
                                    <select class="form-control form-select" value="${user.gender}" name="gender">
                                        <option value="0" ${user.gender == 0 ? "selected" : ""}>Male</option>
                                        <option value="1" ${user.gender == 1 ? "selected" : ""}>Female</option>
                                        <option value="2" ${user.gender == 2 ? "selected" : ""}>Others</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleInputEmail1">Avatar</label>
                                    <input id="fileUpload" type="file" name="avatar" value="" onchange="loadFile(event)" />
                                    <img src="images/${user.avatar}" id="output" style="width: 100px; height: 100px; display: block; margin-top: 8px; object-fit: contain"/>      
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

        <!-- For demo purposes – can be removed on production -->

        <script>
            var loadFile = function (event) {
                var output = document.getElementById('output');
                console.log(event.target.files[0]);
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function () {
                    URL.revokeObjectURL(output.src);
                };
            };
        </script>
        <!-- For demo purposes – can be removed on production : End -->



    </body>
</html>

