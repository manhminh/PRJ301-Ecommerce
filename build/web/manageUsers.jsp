<%-- 
    Document   : manageUsers
    Created on : Sep 27, 2023, 8:13:41 PM
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
    </head>
    <body>
        <div class="wrapper d-flex align-items-stretch">
            <jsp:include page="sidebar/sidebar.jsp"></jsp:include>
                <div id="content" class="p-4 p-md-5 pt-5">
                    <div class="container">
                        <div class="row">
                            <div class="table-user mt-4 mb-4">
                                <table class="table table-hover table-bordered">
                                    <h3 class="mt-3 mb-4">Table users:</h3>
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">No</th>
                                            <th scope="col">Username</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Role</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listUsers}" var="user">
                                        <tr>
                                            <td>
                                                ${user.id}
                                            </td>   
                                            <td>
                                                ${user.username}
                                            </td>
                                            <td>
                                                ${user.email}
                                            </td>       
                                            <td>
                                                <c:if test="${user.role == 0}">Admin</c:if>
                                                <c:if test="${user.role == 1}">User</c:if>
                                                <c:if test="${user.role == 2}">Staff</c:if>
                                            </td>
                                            <td>
                                                <c:if test="${user.gender == 0}">Male</c:if>
                                                <c:if test="${user.gender == 1}">Female</c:if>
                                                <c:if test="${user.gender == 2}">Others</c:if>
                                            </td>
                                                <td>
                                                    <a class="btn btn-warning small" href="update-user?id=${user.id}">
                                                    Edit
                                                </a>
                                                <form style='display:inline;' method="POST" action="delete-user?id=${user.id}">
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
                                <li class="page-item ${page <= 1 ? "disabled" : ""}"><a class="page-link" href="users?page=${page-1}">Previous</a></li>
                                    <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class="page-item ${page == i ? "active" : ""}">
                                        <a class="page-link" href="users?page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item ${page >= endPage ? "disabled" : ""}"><a class="page-link" href="users?page=${page+1}" class="">Next</a></li>
                            </ul>
                        </nav>   
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
