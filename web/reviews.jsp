<%-- 
    Document   : reviews.jsp
    Created on : Oct 21, 2023, 10:14:31 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.User" %>
<%@page import="models.Review" %>
<%@page import="dal.UserDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"/>
        <link rel="application/javascript" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js/>
              <link rel="application/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

        <style>
            .action .remove-btn:hover, .edit-btn:hover {
                color: #000 !important;
            }

        </style>
    </head>
    <body>
        <div class="container">

            <div class="row  d-flex justify-content-center">

                <div class="col-md-12 mt-5">

                    <div class="headings d-flex justify-content-between align-items-center mb-3">
                        <h3>Comments(${listReviews.size()})</h3>
                    </div>


                    <c:forEach items="${requestScope.listReviews}" var="review">
                        <% 
                            UserDAO uDAO = new UserDAO();
                            Review r = (Review)pageContext.getAttribute("review");
                            User user = uDAO.getUserById(r.getUserId());
                        %>
                        <c:set value="<%= user.getId() %>" var="userId"></c:set>
                            <div class="card p-3 mt-3">

                                <div class="d-flex justify-content-between align-items-center">

                                    <div class="user d-flex flex-row align-items-center">
                                        <img src="images/<%= user.getAvatar() %>" width="30" class="user-img rounded-circle mr-3 d-block">
                                    <div style="font-size: 14px">
                                        <div class="font-weight-bold text-primary"><%= user.getEmail() %></div> 
                                        <div class="font-weight-semibold">
                                            ${review.content}
                                        </div>
                                        <div>
                                            <c:forEach begin="1" end="5" var="i">
                                                <c:if test="${i <= review.rating}">
                                                    <i class="fa fa-star" style="color: orange"></i>
                                                </c:if>
                                                <c:if test="${i > review.rating}">
                                                    <i class="fa fa-star" style="color: grey"></i>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <small style="font-size: 12px">${review.date}</small>
                            </div>

                            <c:if test="${userId == sessionScope.user.id}">
                                <div class="action d-flex justify-content-between mt-2 align-items-center">

                                    <div class="reply px-5" style="font-size: 14px">
                                        <a href="delete-review?reviewId=${review.id}" class="remove-btn" style="color: #ccc; cursor: pointer; text-decoration: none">Remove</a>
                                        <span class="dots"></span>
                                        <a href="edit-review?reviewId=${review.id}" class="edit-btn" style="color: #ccc; cursor: pointer; text-decoration: none">Edit</a>
                                    </div>

                                </div>
                            </c:if>
                        </div>
                    </c:forEach>

                    <div class="mt-3 pb-5">
                        <a class="btn btn-primary" href="detailsProduct?pId=${productId}">
                            <i class="fa fa-arrow-left"></i>
                            Back previous page
                        </a>
                    </div>
                </div>

            </div>

        </div>
    </body>
</html>
