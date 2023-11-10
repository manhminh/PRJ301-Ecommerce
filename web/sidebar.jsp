<%-- 
    Document   : sidebar
    Created on : Oct 1, 2023, 10:33:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-xs-12 col-sm-12 col-md-3 sidebar"> 
    <!-- ================================== TOP NAVIGATION ================================== -->
    <div class="side-menu animate-dropdown outer-bottom-xs">
        <div class="head"><i class="icon fa fa-align-justify fa-fw"></i> Categories</div>
        <nav class="yamm megamenu-horizontal">
            <ul class="nav">
                <c:forEach items="${listCategories}" var="category">
                    <li class="dropdown menu-item">
                        <a href="category?cId=${category.category_id}">
                            ${category.name}
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <!-- /.nav --> 
        </nav>
    </div>
    <div class="sidebar-widget wow fadeInUp"  style="border-bottom: 1px solid #ddd">
        <div class="widget-header">
            <h4 class="widget-title" style="font-weight: 600">Price</h4>
        </div>
        <div class="sidebar-widget-body">
            <ul class="list">
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="price" class="destination-radio" value="${rating}" max="100" ${maxValue == 100 ? "checked" : ""}/>
                    <label style="margin: 0">
                        <= 100$
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="price" class="destination-radio" value="${rating}" min="100" max="300" ${minValue == 100 && maxValue == 300 ? "checked" : ""}/>
                    <label style="margin: 0">
                        > 100 & <= 300$
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="price" class="destination-radio" value="${rating}" min="300" max="400" ${minValue == 300 && maxValue == 400 ? "checked" : ""}/>
                    <label style="margin: 0">
                        > 300 & <= 400$
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="price" class="destination-radio" value="${rating}" min="400" max="500" ${minValue == 400 && maxValue == 500 ? "checked" : ""}/>
                    <label style="margin: 0">
                        > 400 & <= 500$
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="price" class="destination-radio" value="${rating}" min="500" ${minValue == 500 ? "checked" : ""}/>
                    <label style="margin: 0">
                        >= 500$
                    </label>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-widget-body --> 
    </div>
    <div class="sidebar-widget wow fadeInUp">
        <div class="widget-header">
            <h4 class="widget-title" style="font-weight: 600">Rating</h4>
        </div>
        <div class="sidebar-widget-body">
            <ul class="list">
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="radioStar" class="destination-radio" value="1" min="${minValue}" max="${maxValue}" ${rating == 1 ? "checked" : ""}/>
                    <label style="margin: 0">
                        <c:forEach begin="1" end="5" var="i">
                            <c:if test="${i <= 1}">
                                <i class="fa fa-star" style="color: orange"></i>
                            </c:if>
                            <c:if test="${i > 1}">
                                <i class="fa fa-star" style="color: grey"></i>
                            </c:if>
                        </c:forEach>
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="radioStar" class="destination-radio" value="2" min="${minValue}" max="${maxValue}"  ${rating == 2 ? "checked" : ""}/>
                    <label style="margin: 0">
                        <c:forEach begin="1" end="5" var="i">
                            <c:if test="${i <= 2}">
                                <i class="fa fa-star" style="color: orange"></i>
                            </c:if>
                            <c:if test="${i > 2}">
                                <i class="fa fa-star" style="color: grey"></i>
                            </c:if>
                        </c:forEach>
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="radioStar" class="destination-radio" value="3" min="${minValue}" max="${maxValue}"  ${rating == 3 ? "checked" : ""}/>
                    <label style="margin: 0">
                        <c:forEach begin="1" end="5" var="i">
                            <c:if test="${i <= 3}">
                                <i class="fa fa-star" style="color: orange"></i>
                            </c:if>
                            <c:if test="${i > 3}">
                                <i class="fa fa-star" style="color: grey"></i>
                            </c:if>
                        </c:forEach>
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="radioStar" class="destination-radio" value="4" min="${minValue}" max="${maxValue}"  ${rating == 4 ? "checked" : ""}/>
                    <label style="margin: 0">
                        <c:forEach begin="1" end="5" var="i">
                            <c:if test="${i <= 4}">
                                <i class="fa fa-star" style="color: orange"></i>
                            </c:if>
                            <c:if test="${i > 4}">
                                <i class="fa fa-star" style="color: grey"></i>
                            </c:if>
                        </c:forEach>
                    </label>
                </li>
                <li style="display: flex; margin-bottom: 4px">
                    <input style="margin: 0; margin-right: 4px" type="radio" name="radioStar" class="destination-radio" value="5" min="${minValue}" max="${maxValue}"  ${rating == 5 ? "checked" : ""}/>
                    <label style="margin: 0">
                        <c:forEach begin="1" end="5" var="i">
                            <c:if test="${i <= 5}">
                                <i class="fa fa-star" style="color: orange"></i>
                            </c:if>
                            <c:if test="${i > 5}">
                                <i class="fa fa-star" style="color: grey"></i>
                            </c:if>
                        </c:forEach>
                    </label>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-widget-body --> 
    </div>
    <!-- /.side-menu --> 
    <!-- ================================== TOP NAVIGATION : END ================================== --> 

    <script>
        window.onload = function () {
            var radioRatingButtons = document.querySelectorAll('.destination-radio');
            for (var i = 0; i < radioRatingButtons.length; i++) {
                radioRatingButtons[i].addEventListener('click', function (e) {
                    var rate = this.value;
                    var min = this.min;
                    var max = this.max;

                    console.log(rate + " " + min + " " + max);
                    window.location.href = `product-filter?rating=\${rate}&minPrice=\${min}&maxPrice=\${max}`;
                });
            }
        };
    </script>
</div>
