<%-- 
    Document   : order.jsp
    Created on : Oct 10, 2023, 9:55:33 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Product" %>
<%@page import="models.CartItem" %>
<%@page import="models.Order" %>
<%@page import="models.User" %>
<%@page import="models.OrderDetails" %>
<%@page import="models.Status" %>
<%@page import="models.Shipping" %>

<%@page import="dal.ProductDAO" %>
<%@page import="dal.CartItemDAO" %>
<%@page import="dal.OrderDAO" %>
<%@page import="dal.UserDAO" %>
<%@page import="dal.StatusDAO" %>
<%@page import="dal.ShippingDAO" %>


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
        <style>
            td {
                padding: 8px !important;
            }
        </style>
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
                            <li class='active'>Orders</li>
                        </ul>
                    </div><!-- /.breadcrumb-inner -->
                </div><!-- /.container -->
            </div><!-- /.breadcrumb -->

            <div class="body-content">
                <div class="container">
                    <div class="checkout-box ">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel-group checkout-steps" id="accordion">
                                    <!-- checkout-step-01  -->
                                    <div class="panel panel-default checkout-step-01">

                                        <!-- panel-heading -->
                                        <div class="panel-heading">
                                            <h4 class="unicase-checkout-title">
                                                <a data-toggle="collapse" class="" data-parent="#accordion" href="#collapseOne">
                                                    <span>Order Details</span>All Orders Bought
                                                </a>
                                            </h4>
                                        </div>
                                        <!-- panel-heading -->

                                        <div id="collapseOne" class="panel-collapse collapse in">

                                            <!-- panel-body  -->
                                            <div class="panel-body">
                                                <table class="table table-light">
                                                    <thead>
                                                        <tr>
                                                            <th>No.</th>
                                                            <th>Date</th>
                                                            <th>Product Image</th>
                                                            <th>Product Name</th>
                                                            <th>Quantity</th>
                                                            <th>Price</th>
                                                            <th>Status</th>
                                                            <th>Shipping</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>		
                                                    <tbody>
                                                    <c:if test="${orders == null}">
                                                        <tr>
                                                            <td>
                                                                <h5>Not have anything in there</h5>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                    <c:forEach items="${requestScope.orders}" var="order">
                                                        <% 
                                                            OrderDetails od = (OrderDetails)pageContext.getAttribute("order");
                                                            ProductDAO pDAO = new ProductDAO();
                                                            Product product = pDAO.getProductById(od.getProductId());
                                                        %>
                                                        <tr>
                                                            <td>#${order.orderDetailsId}</td>
                                                            <td>
                                                                ${order.date}
                                                            </td>
                                                            <td>
                                                                <img src="images/<%= product.getImage() %>" alt="alt" style="width:80px; height: 100px"/>
                                                            </td>
                                                            <td>
                                                                <%= product.getName() %>
                                                            </td>
                                                            <td>
                                                                ${order.quantity}
                                                            </td>
                                                            <td>
                                                                ${order.price}
                                                            </td>
                                                            <% 
                                                                   StatusDAO sDAO = new StatusDAO();
                                                                   Status status = sDAO.getStatusById(od.getStatusId());
                                                            %>
                                                            <c:set value="<%= status %>" var="st"></c:set>
                                                            <td>
                                                                <%=  status.getName() %>
                                                            </td>
                                                            <% 
                                                                   ShippingDAO shDAO = new ShippingDAO();
                                                                   Shipping shipping = shDAO.getShippingById(od.getShippingId());
                                                            %>
                                                            <td>
                                                                <%=  shipping.getName() %>
                                                            </td>
                                                            <td>
                                                                <a href="delete-order?odId=${order.getOrderDetailsId()}" class="btn btn-danger small">
                                                                    <i class="fa fa-trash"></i>
                                                                    Delete
                                                                </a>
                                                                <c:if test="${st.getStatusId() == 4}">
                                                                    <a class="btn btn-primary" href="add-review?productId=<%= product.getId() %>">
                                                                        <i class="fa fa-commenting"></i>
                                                                        Review
                                                                    </a>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- panel-body  -->

                                    </div><!-- row -->
                                </div>
                                <!-- checkout-step-01  -->
                            </div><!-- /.checkout-steps -->
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.checkout-box -->
                <!-- ============================================== BRANDS CAROUSEL ============================================== -->
                <div id="brands-carousel" class="logo-slider wow fadeInUp">

                    <div class="logo-slider-inner">	
                    </div><!-- /.logo-slider-inner -->

                </div><!-- /.logo-slider -->
                <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
        </div><!-- /.body-content -->
        <!-- ============================================================= FOOTER ============================================================= -->
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
