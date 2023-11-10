<%-- 
    Document   : home
    Created on : Sep 29, 2023, 8:52:28 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Product" %>
<%@page import="dal.ReviewDAO" %>
<%@page import="dal.ProductDAO" %>
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
            <div class="body-content outer-top-xs" id="top-banner-and-menu">
                <div class="container">
                    <div class="row"> 
                        <!-- ============================================== SIDEBAR ============================================== -->
                    <jsp:include page="sidebar.jsp"></jsp:include>
                        <!-- ============================================== SIDEBAR : END ============================================== --> 

                        <!-- ============================================== CONTENT ============================================== -->
                        <div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder"> 
                            <!-- ========================================== SECTION – HERO ========================================= -->

                            <div id="hero">
                                <div id="owl-main" class="owl-carousel owl-inner-nav owl-ui-sm">
                                    <div class="item" style="background-image: url(assets/images/sliders/01.jpg);">
                                        <div class="container-fluid">
                                            <div class="caption bg-color vertical-center text-left">
                                                <div class="slider-header fadeInDown-1">Top Brands</div>
                                                <div class="big-text fadeInDown-1"> New Collections </div>
                                                <div class="excerpt fadeInDown-2 hidden-xs"> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span> </div>
                                                <div class="button-holder fadeInDown-3"> <a href="category?cId=1" class="btn-lg btn btn-uppercase btn-primary shop-now-button">Shop Now</a> </div>
                                            </div>
                                            <!-- /.caption --> 
                                        </div>
                                        <!-- /.container-fluid --> 
                                    </div>
                                    <!-- /.item -->

                                    <div class="item" style="background-image: url(assets/images/sliders/02.jpg);">
                                        <div class="container-fluid">
                                            <div class="caption bg-color vertical-center text-left">
                                                <div class="slider-header fadeInDown-1">Spring 2016</div>
                                                <div class="big-text fadeInDown-1"> Women <span class="highlight">Fashion</span> </div>
                                                <div class="excerpt fadeInDown-2 hidden-xs"> <span>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit</span> </div>
                                                <div class="button-holder fadeInDown-3"> <a href="category?cId=1" class="btn-lg btn btn-uppercase btn-primary shop-now-button">Shop Now</a> </div>
                                            </div>
                                            <!-- /.caption --> 
                                        </div>
                                        <!-- /.container-fluid --> 
                                    </div>
                                    <!-- /.item --> 

                                </div>
                                <!-- /.owl-carousel --> 
                            </div>

                            <!-- ========================================= SECTION – HERO : END ========================================= --> 
                            <!-- ============================================== FEATURED PRODUCTS ============================================== -->
                            <section class="section featured-product wow fadeInUp">
                                <h3 class="section-title">All products</h3>
                                <div class="owl-carousel home-owl-carousel custom-carousel owl-theme outer-top-xs">
                                <c:forEach items="${listProducts}" var="product">
                                    <%
                                        ReviewDAO rDAO = new ReviewDAO();
                                        Product p = (Product) pageContext.getAttribute("product");
                                        int rate = rDAO.getRatingProduct(p.getId());
                                        p.setRating(rate);
                                        ProductDAO pDAO = new ProductDAO();
                                        pDAO.updateProduct(p);
                                    %>
                                    <c:set value="<%= p.getRating() %>" var="rating"></c:set>
                                    <div class="item item-carousel">
                                        <div class="products">
                                            <div class="product" style="border: 1px solid #e3e3e3; border-radius: 4px">
                                                <div class="product-image">
                                                    <div class="image img-responsive"> <a href="detailsProduct?pId=${product.id}"><img src="images/${product.image}" alt=""></a> </div>
                                                    <!-- /.image -->
                                                </div>
                                                <!-- /.product-image -->

                                                <div class="product-info text-center">
                                                    <h3 class="name"><a href="detailsProduct?pId=${product.id}">${product.name}</a></h3>
                                                    <div class="rating-product">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:if test="${i <= rating}">
                                                                <i class="fa fa-star" style="color: orange"></i>
                                                            </c:if>
                                                            <c:if test="${i > rating}">
                                                                <i class="fa fa-star" style="color: grey"></i>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                    <div class="description"></div>
                                                    <div class="product-price"> 
                                                        <span class="price-before-discount">$${product.price}</span>
                                                        <span style="color: red; margin-left: 4px">-${Math.round(product.discount * 100)}%</span>
                                                        <div class="price">$${Math.round((product.price - product.discount*product.price)*100)/100}</div>
                                                    </div>
                                                    <!-- /.product-price --> 

                                                </div>
                                            </div>
                                            <!-- /.product --> 

                                        </div>
                                        <!-- /.products --> 
                                    </div>
                                    <!-- /.item -->
                                </c:forEach>
                            </div>
                            <!-- /.home-owl-carousel --> 
                        </section>
                        <!-- /.section --> 
                        <!-- ============================================== FEATURED PRODUCTS : END ============================================== --> 
                    </div>
                    <!-- /.homebanner-holder --> 
                    <!-- ============================================== CONTENT : END ============================================== --> 
                </div>
                <!-- /.row --> 
                <!-- ============================================== BRANDS CAROUSEL ============================================== -->
                <div id="brands-carousel" class="logo-slider wow fadeInUp">
                    <div class="logo-slider-inner">
                    </div>
                    <!-- /.logo-slider-inner --> 

                </div>
                <!-- /.logo-slider --> 
                <!-- ============================================== BRANDS CAROUSEL : END ============================================== --> 
            </div>
            <!-- /.container --> 
        </div>
        <!-- /#top-banner-and-menu --> 

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
    </body>
</html>

