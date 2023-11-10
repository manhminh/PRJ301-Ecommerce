<%-- 
    Document   : detailsProduct
    Created on : Oct 1, 2023, 7:36:43 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Meta -->
        <meta charset="utf-8">
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
        <link href="assets\css\lightbox.css" rel="stylesheet">



        <!-- Icons/Glyphs -->
        <link rel="stylesheet" href="assets\css\font-awesome.css">

        <!-- Fonts --> 
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>


    </head>
    <body class="cnt-home">
        <!-- ============================================== HEADER ============================================== -->
        <jsp:include page="menu.jsp"></jsp:include>

            <!-- ============================================== HEADER : END ============================================== -->
            <div class="breadcrumb">
                <div class="container">
                    <div class="breadcrumb-inner">
                        <ul class="list-inline list-unstyled">
                            <li><a href="home">Home</a></li>
                            <li><a href="category?cId=1">Category</a></li>
                            <li class='active'>${product.name}</li>
                    </ul>
                </div><!-- /.breadcrumb-inner -->
            </div><!-- /.container -->
        </div><!-- /.breadcrumb -->
        <div class="body-content outer-top-xs">
            <div class='container'>
                <div class='row single-product'>
                    <div class='col-md-9'>
                        <div class="detail-block">
                            <div class="row  wow fadeInUp">
                                <form method="POST" action="buy?pId=${product.id}">
                                    <div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
                                        <div class="product-item-holder size-big single-product-gallery small-gallery">

                                            <div id="owl-single-product">
                                                <div class="single-product-gallery-item" id="slide1">
                                                    <a data-lightbox="image-1" data-title="Gallery" href="images/${product.image}">
                                                        <img class="img-responsive" alt="" src="images/${product.image}" data-echo="images/${product.image}">
                                                    </a>
                                                </div><!-- /.single-product-gallery-item -->

                                            </div><!-- /.gallery-thumbs -->

                                        </div><!-- /.single-product-gallery -->
                                    </div><!-- /.gallery-holder -->        			
                                    <div class='col-sm-6 col-md-7 product-info-block'>
                                        <div class="product-info">
                                            <h1 class="name">${product.name}</h1>

                                            <div class="rating-reviews m-t-20">
                                                <div class="row">
                                                    <div class="col-sm-12 d-flex align-items-center">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:if test="${i <= rate}">
                                                                <i class="fa fa-star" style="color: orange"></i>
                                                            </c:if>
                                                            <c:if test="${i > rate}">
                                                                <i class="fa fa-star" style="color: grey"></i>
                                                            </c:if>
                                                        </c:forEach>
                                                        <span style="color: #aaa">( ${reviews.size() > 0 ? reviews.size() : 0} reviews)</span>
                                                        <span style="color: #000">| Amount: ${product.getQuantity()}</span>
                                                        <span style="color: #000">| Sold: ${product.getSoldOut()}</span>
                                                    </div>
                                                </div><!-- /.row -->		
                                            </div><!-- /.rating-reviews -->

                                            <div class="stock-container info-container m-t-10">
                                                <div class="row">
                                                    <div class="col-sm-2">
                                                        <div class="stock-box">
                                                            <span class="label">Availability :</span>
                                                        </div>	
                                                    </div>
                                                    <div class="col-sm-9">
                                                        <div class="stock-box">
                                                            <span class="value">${product.getQuantity() > 0 ? "In Stock" : "Sold Out"}</span>
                                                        </div>	
                                                    </div>
                                                </div><!-- /.row -->	
                                            </div><!-- /.stock-container -->

                                            <div class="description-container m-t-20" style="font-size: 16px">
                                                ${product.description}
                                            </div>

                                            <div class="price-container info-container m-t-20">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="price-box">
                                                            <input name="price" value="${product.getPriceAfterDiscount()}" hidden/>
                                                            <span class="price">$${product.getPriceAfterDiscount()}</span>
                                                            <span class="price-strike">$${product.getPrice()}</span>
                                                        </div>
                                                    </div>

                                                </div><!-- /.row -->
                                            </div><!-- /.price-container -->

                                            <div class="quantity-container info-container">
                                                <div class="row align-items-center">
                                                    <div class="col-sm-2">
                                                        <span class="label">Quantity :</span>
                                                    </div>

                                                    <div class="col-sm-2">
                                                        <div class="cart-quantity">
                                                            <div class="quant-input">
                                                                <input ${product.getQuantity() > 0 ? "" : "disabled"} id="amount" name="amount" type="number" value="1">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-8">
                                                        <button onclick="sendMessage()" ${product.getQuantity() > 0 ? "" : "disabled"} id="btn-add-cart" class="btn btn-primary buy py-2" style="font-size: 14px">
                                                            <i class="fa fa-shopping-cart inner-right-vs"></i> 
                                                            ADD TO CART
                                                        </button>
                                                        <a class="btn btn-danger" href="reviews?pId=${product.id}">
                                                            <i class="fa fa-comments inner-right-vs"></i>
                                                            See Reviews
                                                        </a>
                                                    </div>
                                                </div><!-- /.row -->
                                            </div><!-- /.quantity-container -->
                                        </div><!-- /.product-info -->
                                    </div><!-- /.col-sm-7 -->
                                </form>
                            </div><!-- /.row -->
                        </div>
                    </div><!-- /.col -->
                    <div class="clearfix"></div>
                </div><!-- /.row -->
                <!-- ============================================== BRANDS CAROUSEL ============================================== -->
                <div id="brands-carousel" class="logo-slider wow fadeInUp">
                    <div class="logo-slider-inner">	
                        <div id="brand-slider" class="owl-carousel brand-slider custom-carousel owl-theme">
                        </div>
                    </div>
                </div><!-- /.logo-slider -->
                <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
        </div><!-- /.body-content -->

        <!-- ============================================================= FOOTER ============================================================= -->
        <jsp:include page="footer.jsp"></jsp:include>
            <!-- ============================================================= FOOTER : END============================================================= -->

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

            <script>
                const amountInput = document.getElementById('amount');

                amountInput.addEventListener('input', function () {
                    if (amountInput.value <= 1) {
                        amountInput.value = 1;
                    }
                    if (amountInput.value >= ${product.getQuantity()}) {
                        amountInput.value = ${product.getQuantity()};
                    }
                });

//                var websocket = new WebSocket("ws://localhost:9999/AssignmentPRJ301/product-quantity");
//                websocket.onopen = function (message) {
//                    processOpen(message);
//                };
//                websocket.onclose = function (message) {
//                    processClose(message);
//                };
//                websocket.onerror = function (message) {
//                    processError(message);
//                };
//                websocket.onmessage = function (message) {
//                    processMessage(message);
//                };
//                function processMessage(message) {
//                    console.log(message);
//                }
//                function processOpen(message) {
//                    console.log("Server connect... \n");
//                }
//                function processClose(message) {
//                    console.log("Server Disconnect... \n");
//                }
//                function processError(message) {
//                    console.log("Error... " + message + " \n");
//                }
//                
//                const inputAmount = document.querySelector("#amount");
//                console.log(inputAmount)
//
//                function sendMessage() {
//                    if (typeof websocket !== 'undefined' && websocket.readyState === WebSocket.OPEN) {
//                        websocket.send(inputAmount.value);
//                    }
//                }
        </script>
    </body>
</html>
