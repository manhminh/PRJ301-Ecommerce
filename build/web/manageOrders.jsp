<%-- 
    Document   : manageOrders
    Created on : Oct 24, 2023, 8:43:38 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Product" %>
<%@page import="models.OrderDetails" %>
<%@page import="models.User" %>
<%@page import="models.Order" %>
<%@page import="dal.ProductDAO" %>
<%@page import="dal.OrderDAO" %>
<%@page import="dal.UserDAO" %>
<%@page import="models.Status" %>
<%@page import="dal.StatusDAO" %>
<%@page import="models.Shipping" %>
<%@page import="dal.ShippingDAO" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    </head>
    <body>
        <div class="wrapper d-flex align-items-stretch">
            <jsp:include page="sidebar/sidebar.jsp"></jsp:include>
                <div id="content" class="p-4 p-md-5 pt-5">
                    <div class="container">
                        <div class="row">
                            <div class="filter-order">
                                <form action="orders" method="POST">
                                    <div>
                                        <label class="form-label">Date from: </label>
                                        <input id="minDate" name = "minDate" type="date"/>
                                        <label class="form-label">To: </label>
                                        <input id="maxDate" name = "maxDate" type="date"/>
                                    </div>
                                    <div>
                                        <label class="form-label">Total value from: </label>
                                        <input id="minPrice" name="minPrice" />
                                        <label class="form-label">To: </label>
                                        <input id="maxPrice" name="maxPrice"/>
                                    </div>
                                    <div>
                                        <select name="sortValue" id="sortValue">
                                            <option value="date">Sort by date</option>
                                            <option value="od.quantity * od.price">Sort by total value</option>
                                            <option value="od.quantity">Sort by quantity sold</option>
                                        </select>
                                    </div>
                                    <div>
                                        <button class="mt-3 btn btn-dark" id="btn-search" type="submit">Search</button>
                                    </div>
                                </form>
                            </div>
                            <div class="table-user mt-4 mb-4">
                                <table class="table table-hover table-bordered">
                                    <h3 class="mt-3 mb-4">Table Orders</h3>
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Customer Address</th>
                                            <th scope="col">Customer Email</th>
                                            <th scope="col">Total Value</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Shipping</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orders}" var="order">
                                        <% 
                                            OrderDetails o = (OrderDetails)pageContext.getAttribute("order");
                                            ProductDAO pDAO = new ProductDAO();
                                            Product product = pDAO.getProductById(o.getProductId());
                                            
                                            UserDAO uDAO = new UserDAO();
                                            OrderDAO oDAO = new OrderDAO();
                                            Order od = oDAO.getOrderByOrderId(o.getOrderId());
                                            User customer = uDAO.getUserById(od.getUserId());
                                            
                                            StatusDAO sDAO = new StatusDAO();
                                            Status status = sDAO.getStatusById(o.getStatusId());
                                                
                                            ShippingDAO shDAO = new ShippingDAO();
                                            Shipping shipping = shDAO.getShippingById(o.getShippingId());
                                        %>
                                        <c:set value="<%= shipping %>" var="sh"></c:set>
                                        <tr>
                                            <td>#${order.getOrderDetailsId()}</td>
                                            <td>
                                                <img src="images/<%= product.getImage() %>" style="width: 80px; height: 100px" alt="alt"/>
                                            </td>
                                            <td><%= customer.getAddress() %></td>
                                            <td><%= customer.getEmail() %></td>
                                            <td>${order.price * order.quantity + sh.getPrice()}</td>
                                            <td>${order.getDate()}</td>
                                            <td>
                                                <%=  status.getName() %>
                                            </td>
                                            <td>
                                                <%=  shipping.getName() %>
                                            </td>
                                            <td>
                                                <a href="update-order?id=${order.orderDetailsId}" class="btn btn-sm btn-primary text-white">Edit status</a>
                                            </td>
                                        </tr>   
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var storedMinDate = sessionStorage.getItem('minDate');
            if (storedMinDate) {
                document.getElementById('minDate').value = storedMinDate;
            }
            document.getElementById('minDate').addEventListener('input', function (event) {
                sessionStorage.setItem('minDate', event.target.value);
            });

            var storedMaxDate = sessionStorage.getItem('maxDate');
            if (storedMaxDate) {
                document.getElementById('maxDate').value = storedMaxDate;
            }
            document.getElementById('maxDate').addEventListener('input', function (event) {
                sessionStorage.setItem('maxDate', event.target.value);
            });

            var sroteMinPrice = sessionStorage.getItem('minPrice');
            if (sroteMinPrice) {
                document.getElementById('minPrice').value = sroteMinPrice;
            }
            document.getElementById('minPrice').addEventListener('input', function (event) {
                sessionStorage.setItem('minPrice', event.target.value);
            });

            var sroteMaxPrice = sessionStorage.getItem('maxPrice');
            if (sroteMaxPrice) {
                document.getElementById('maxPrice').value = sroteMaxPrice;
            }
            document.getElementById('maxPrice').addEventListener('input', function (event) {
                sessionStorage.setItem('maxPrice', event.target.value);
            });

            var sroteSortValue = sessionStorage.getItem('sortValue');
            if (sroteSortValue) {
                document.getElementById('sortValue').value = sroteSortValue;
            }
            document.getElementById('sortValue').addEventListener('input', function (event) {
                sessionStorage.setItem('sortValue', event.target.value);
            });
        </script>
    </body>
</html>