<%-- 
    Document   : updateOrder
    Created on : Oct 28, 2023, 2:14:52 PM
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="table-user mt-4 mb-4">
                    <form action="update-order?id=${order.getOrderDetailsId()}" method="POST">
                        <table class="table table-hover table-bordered">
                            <h3 class="mt-3 mb-4">Edit Orders</h3>
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Customer Address</th>
                                    <th scope="col">Customer Email</th>
                                    <th scope="col">Total Value</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set value="${requestScope.order}" var="order"></c:set>
                                <% 
                                    OrderDetails o = (OrderDetails)pageContext.getAttribute("order");
                                    ProductDAO pDAO = new ProductDAO();
                                    Product product = pDAO.getProductById(o.getProductId());
                                    UserDAO uDAO = new UserDAO();
                                    OrderDAO oDAO = new OrderDAO();
                                    Order od = oDAO.getOrderByOrderId(o.getOrderId());
                                    User customer = uDAO.getUserById(od.getUserId());
                                %>
                                <c:set value="<%= product.getPriceAfterDiscount() %>" var="price"></c:set>
                                    <tr>
                                        <td>#${order.getOrderDetailsId()}</td>
                                    <td>
                                        <img src="images/<%= product.getImage() %>" style="width: 80px; height: 100px" alt="alt"/>
                                    </td>
                                    <td><%= customer.getAddress() %></td>
                                    <td><%= customer.getEmail() %></td>
                                    <td>${price * order.quantity}</td>
                                    <td>${order.getDate()}</td>
                                    <% 
                                        OrderDetails od1 = (OrderDetails)pageContext.getAttribute("order");
                                        StatusDAO sDAO = new StatusDAO();
                                        Status status = sDAO.getStatusById(od1.getStatusId());
                                    %>
                                    <td>
                                        <c:if test="${order.getStatusId() != 5}">
                                            <select class="form-select" name="status">
                                                <c:forEach items="${listStatus}" var="status">
                                                    <c:if test="${status.statusId != 5}">
                                                        <option value="status-${status.getStatusId()}" ${order.getStatusId() == status.getStatusId() ? "selected" : ""}>${status.getName()}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                        
                                        <c:if test="${order.getStatusId() == 5}">
                                            <select class="form-select" name="status">
                                                <c:forEach items="${listStatus}" var="status">
                                                    <c:if test="${status.statusId == 5}">
                                                        <option value="status-${status.getStatusId()}" ${order.getStatusId() == status.getStatusId() ? "selected" : ""}>${status.getName()}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                    </td>
                                </tr>   
                            </tbody>
                        </table>
                        <button class="btn btn-primary">Save</button>
                        <a href="orders" class="btn btn-danger">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
