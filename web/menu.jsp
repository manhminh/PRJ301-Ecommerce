<%-- 
    Document   : menu
    Created on : Oct 1, 2023, 9:58:49 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Product" %>
<%@page import="models.CartItem" %>
<%@page import="dal.ProductDAO" %>

<header class="header-style-1"> 

    <!-- ============================================== TOP MENU ============================================== -->
    <div class="top-bar animate-dropdown">
        <div class="container">
            <div class="header-top-inner">
                <div class="cnt-account">
                    <ul class="list-unstyled" style="display: flex; align-items: center; justify-content: flex-end">
                        <c:if test="${sessionScope.user == null}">
                            <li><a href="register"><i class="icon fa fa-user"></i>Register</a></li>
                            <li><a href="login"><i class="icon fa fa-lock"></i>Login</a></li>
                            </c:if>

                        <c:if test="${sessionScope.user != null}">
                            <li>
                                <div style="color: white; font-size: 15px">
                                    Hello, ${sessionScope.user.username != null ? sessionScope.user.username : "User"}${sessionScope.user.username == null ? sessionScope.user.id : ""}
                                </div>
                            </li>

                            <li class="animate-dropdown" style="cursor: pointer"> 
                                <div class="dropdown dropdown-cart">
                                    <ul class="dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="images/${sessionScope.user.avatar}" style="width: 25px; height: 25px; border-radius: 50%" alt="avt"/>
                                    </ul>
                                    <ul class="dropdown-menu" style="padding: 0">
                                        <li style="display: block; padding: 0">
                                            <a href="profile" style="padding: 1rem; font-weight: 400; color: #212529; display: block">
                                                Profile
                                            </a>
                                            <hr style="margin: 0">
                                        </li>


                                        <li style="display: block; padding: 0">
                                            <a href="order-details" style="padding: 1rem; font-weight: 400; color: #212529; display: block">
                                                History
                                            </a>
                                            <hr style="margin: 0">
                                        </li>

                                        <li style="display: block; padding: 0">
                                            <a href="password" style="padding: 1rem; font-weight: 400; color: #212529; display: block">
                                                Change Password
                                            </a>
                                            <hr style="margin: 0">
                                        </li>

                                        <c:if test="${sessionScope.user.role != 1}">
                                            <li style="display: block; padding: 0">
                                                <a href="dashboard.jsp" style="padding: 1rem; font-weight: 400; color: #212529; display: block">
                                                    Seller
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </li>

                            <li>
                                <a href="logout">
                                    <i class="icon fa fa-outdent"></i>
                                    Logout
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- /.header-top-inner --> 
        </div>
        <!-- /.container --> 
    </div>
    <!-- /.header-top --> 
    <!-- ============================================== TOP MENU : END ============================================== -->
    <div class="main-header">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3 logo-holder"> 
                    <!-- ============================================================= LOGO ============================================================= -->
                    <div class="logo"> <a href="home"> <img src="assets\images\logo.png" alt="logo"> </a> </div>
                    <!-- /.logo --> 
                    <!-- ============================================================= LOGO : END ============================================================= --> </div>
                <!-- /.logo-holder -->

                <div class="col-xs-12 col-sm-12 col-md-7 top-search-holder"> 
                    <!-- /.contact-row --> 
                    <!-- ============================================================= SEARCH AREA ============================================================= -->
                    <div class="search-area">
                        <form action="search" method="GET">
                            <div class="control-group">
                                <input class="search-field" placeholder="Search here..." name="textSearch">
                                <button type="submit" class="search-button"></button> 
                            </div>
                        </form>
                    </div>
                    <!-- /.search-area --> 
                    <!-- ============================================================= SEARCH AREA : END ============================================================= --> </div>
                <!-- /.top-search-holder -->

                <div class="col-xs-12 col-sm-12 col-md-2 animate-dropdown top-cart-row"> 
                    <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
                    <div class="dropdown dropdown-cart">
                        <a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
                            <div class="items-cart-inner" onclick="sendNotification()">
                                <div class="basket"> <i class="glyphicon glyphicon-shopping-cart"></i> </div>
                                <div class="basket-item-count"><span class="count">${items != null ? items.size() : 0}</span></div>
                                <div class="total-price-basket"> <span class="lbl">cart -</span> <span class="total-price"> <span class="sign">$</span><span class="value">${items != null ? totalPrice: 0}</span> </span> </div>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <c:forEach items="${requestScope.items}" var="item">
                                <% 
                                    ProductDAO pDAO = new ProductDAO();
                                    CartItem ci = (CartItem)pageContext.getAttribute("item");
                                    Product product = pDAO.getProductById(ci.getProductId());
                                %>
                                <li>
                                    <div class="cart-item product-summary">
                                        <div class="row">
                                            <div class="col-xs-4">
                                                <div class="image"> <a href="shopping-cart"><img src="images/<%= product.getImage() %>" alt=""></a> </div>
                                            </div>
                                            <div class="col-xs-5">
                                                <h3 class="name"><a href="shopping-cart"><%= product.getName() %></a></h3>
                                                <div class="price">$<%= product.getPriceAfterDiscount() %></div>
                                            </div>
                                            <div class="col-xs-1 action" style="margin: 0 6px"> 
                                                <span>x<%= ci.getQuantity() %></span>
                                            </div>
                                            <div class="col-xs-1 action" style="margin: 0 2px"> 
                                                <a href="delete-item?id=<%= ci.getCiId() %>"><i class="fa fa-trash"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.cart-item -->
                                    <div class="clearfix"></div>
                                    <hr>
                                </li>
                            </c:forEach>
                            <div class="clearfix cart-total">
                                <div class="pull-right"> <span class="text">Sub Total :</span><span class='price'>$${items != null ? totalPrice: 0}</span> </div>
                                <div class="clearfix"></div>
                                <a href="shopping-cart" class="btn btn-upper btn-primary btn-block m-t-20">Go to your Cart</a> 
                            </div>
                            <!-- /.cart-total--> 
                        </ul>
                        <!-- /.dropdown-menu--> 
                    </div>
                    <!-- /.dropdown-cart --> 

                    <!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= --> </div>
                <!-- /.top-cart-row --> 
            </div>
            <!-- /.row --> 

        </div>
        <!-- /.container --> 

    </div>
    <script>
        var websocket = new WebSocket("ws://localhost:9999/AssignmentPRJ301/notification");
        websocket.onopen = function (message) {
            processOpen(message);
        };
        websocket.onclose = function (message) {
            processClose(message);
        };
        websocket.onerror = function (message) {
            processError(message);
        };
        websocket.onmessage = function (message) {
            processMessage(message);
        };
        function processMessage(message) {
            console.log(message);
        }
        function processOpen(message) {
            console.log("Server connect... \n");
        }
        function processClose(message) {
            console.log("Server Disconnect... \n");
        }
        function processError(message) {
            console.log("Error... " + message + " \n");
        }

        function sendNotification() {
            websocket.send(JSON.stringify({
                action: "order-toast",
                userID: 23,
            }));
        }
    </script>
    <!-- /.main-header --> 
</header>