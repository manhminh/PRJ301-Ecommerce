<%-- 
    Document   : category
    Created on : Oct 1, 2023, 7:59:12 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Product" %>
<%@page import="dal.ReviewDAO" %>
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
    <body>
        <!-- ============================================== HEADER ============================================== -->
        <jsp:include page="menu.jsp"></jsp:include>
            <!-- ============================================== HEADER : END ============================================== --> 

            <!-- ============================================== HEADER : END ============================================== -->
            <div class="breadcrumb">
                <div class="container">
                    <div class="breadcrumb-inner">
                        <ul class="list-inline list-unstyled">
                            <li><a href="home">Home</a></li>
                            <li class='active'>Category</li>
                        </ul>
                    </div>
                    <!-- /.breadcrumb-inner --> 
                </div>
                <!-- /.container --> 
            </div>
            <!-- /.breadcrumb -->
            <div class="body-content outer-top-xs">
                <div class='container'>
                    <div class='row'>
                    <c:set value="${cId}" var="id"/>
                    <jsp:include page="sidebar.jsp"></jsp:include>
                        <!-- /.sidebar -->
                        <div class='col-md-9'> 
                            <div class="search-result-container ">
                                <div id="myTabContent" class="tab-content category-list">
                                    <div class="tab-pane active " id="grid-container">
                                        <div class="category-product">
                                            <div class="row" id="content">
                                            <c:forEach items="${listProductsByCategory}" var="product">
                                                <%
                                                    ReviewDAO rDAO = new ReviewDAO();
                                                    Product p = (Product) pageContext.getAttribute("product");
                                                    int rate = rDAO.getRatingProduct(p.getId());
                                                %>
                                                <c:set value="<%= rate %>" var="rating"></c:set>

                                                    <div class="col-sm-6 col-md-4 wow fadeInUp products">
                                                        <div class="product" style=" box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px">
                                                            <div class="product-image">
                                                                <div class="image"> <a href="detailsProduct?pId=${product.id}">
                                                                    <img src="images/${product.image}" alt=""></a> 
                                                            </div>
                                                        </div>
                                                        <div class="product-info" style="width: 50%; margin: auto; border-top: 1px solid #ddd">
                                                            <h3 class="name"><a style="font-weight: 600; font-size: 16px" href="detailsProduct?pId=${product.id}">${product.name}</a></h3>
                                                            <div class="rating-product">
                                                                <span style="color: #555; font-weight: 600">Rating:</span>
                                                                <span style="color: #aaa; font-weight: 600; margin-left: 4px">${rating}</span>
                                                                /<span style="font-weight: 600">5</span>
                                                                <i class="fa fa-star" style="color: orange"></i>
                                                            </div>
                                                            <div class="description"></div>
                                                            <div class="product-price" style="position: relative"> 
                                                                <span style="font-weight: 600; color: #555; margin-right: 4px">Price: </span>
                                                                <span class="price-before-discount">$${product.price}</span>
                                                                <span style="color: red; position: absolute; font-size: 11px">-${Math.round(product.discount * 100)}%</span>
                                                                <div class="price" >
                                                                    $${product.getPriceAfterDiscount()}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                            <div class="clearfix filters-container">
                                <div class="text-center">
                                    <button onclick="loadMore()" class="${amount == maxSize? "btn btn-primary": "btn btn-danger"}" style="margin-bottom: 15px">Load more</button>
                                </div>
                            </div>
                            <!-- /.filters-container --> 

                        </div>
                        <!-- /.search-result-container --> 

                    </div>
                    <!-- /.col --> 
                </div>
                <!-- /.row --> 
                <!-- ============================================== BRANDS CAROUSEL ============================================== -->
                <div id="brands-carousel" class="logo-slider wow fadeInUp">
                    <div class="logo-slider-inner">
                    </div>
                    <!-- /.logo-slider-inner --> 
                </div>
            </div>
            <!-- /.container --> 

        </div>
        <!-- /.body-content --> 
        <!-- ============================================================= FOOTER ============================================================= -->
        <jsp:include page="footer.jsp"></jsp:include>
            <script>
                function loadMore() {
                    let amount = document.getElementsByClassName("products").length;
                    $.ajax({
                        url: "/AssignmentPRJ301/load?id=${id}",
                        type: "get",
                        data: {
                            amount: amount
                        },
                        success: function (data) {
                            console.log(data)
                            let row = document.querySelector("#content");
                            row.innerHTML += data;
                        }
                    });
                }

        </script>
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
        <script src="assets\js\bootstrap-select.min.js"></script> 
        <script src="assets\js\wow.min.js"></script> 
        <script src="assets\js\scripts.js"></script>
    </body>
</html>
