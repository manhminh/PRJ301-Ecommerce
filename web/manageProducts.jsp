<%-- 
    Document   : manageProducts.jsp
    Created on : Oct 5, 2023, 3:08:07 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User</title>
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
                            <form method="GET" action="create-new-product">
                                <button class="btn btn-secondary" type="submit">
                                    <i class="fas fa-plus-circle mx-1"></i>
                                    Add New Product
                                </button>
                            </form>
                            <div class="table-user mt-4 mb-4">
                                <table class="table table-hover table-bordered">
                                    <h3 class="mt-3 mb-4">Table Products</h3>
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">SoldOut</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listProducts}" var="product">
                                        <tr>
                                            <td>
                                                ${product.id}
                                            </td>
                                            <td>
                                                <img src="images/${product.image}" style="height: 100px; width: 80px;object-fit: cover "; />
                                            </td>   
                                            <td>
                                                ${product.name}
                                            </td>
                                            <td>
                                                ${product.quantity}
                                            </td>    
                                            <td>
                                                ${product.price}
                                            </td>  
                                            <td>
                                                <c:if test="${product.categoryId == 1}">
                                                    Adidas
                                                </c:if>
                                                <c:if test="${product.categoryId == 2}">
                                                    Nike
                                                </c:if>
                                                <c:if test="${product.categoryId == 3}">
                                                    Uniqlo
                                                </c:if>
                                            </td>
                                            <td>
                                                ${product.soldOut}
                                            </td> 
                                            <td>
                                                <a class="btn btn-warning small" href="edit-product?id=${product.id}">
                                                    Edit
                                                </a>
                                                <form style='display:inline;' method="POST" action="delete-product?id=${product.id}">
                                                    <button type="submit" class="btn  btn-danger small">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item ${page <= 1 ? "disabled" : ""}"><a class="page-link" href="products?page=${page-1}">Previous</a></li>
                                    <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class="page-item ${page == i ? "active" : ""}">
                                        <a class="page-link" href="products?page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${page >= endPage ? "disabled" : ""}"><a class="page-link" href="products?page=${page+1}" class="">Next</a></li>
                            </ul>
                        </nav>   
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>