<%-- 
    Document   : sidebar
    Created on : Oct 8, 2023, 3:10:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="sidebar/css/style.css">
    </head>

    <body>
        <nav id="sidebar" class="active">
            <div class="custom-menu">
                <button type="button" id="sidebarCollapse" class="btn btn-primary">
                    <i class="fa fa-bars"></i>
                    <span class="sr-only">Toggle Menu</span>
                </button>
            </div>
            <div class="p-4">
                <h3 style="color: white; text-align: center">
                    Hello, ${sessionScope.user.username != null ? sessionScope.user.username : "User"}${sessionScope.user.username == null ? sessionScope.user.id : ""}
                </h3>
                <div class="avatar" style="margin: 20px 0 24px">
                    <img style="border-radius: 50%; width: 100px; height: 100px; margin: auto; display: block" src="images/${user.avatar}"/>
                </div>
                </c:if>
                <ul class="list-unstyled components mb-5">
                    <li>
                        <a href="home"><span class="fa fa-home mr-3"></span> Home</a>
                    </li>
                    <li>
                        <a href="dashboard.jsp"><span class="fa fa-dashboard mr-3"></span>Dashboard</a>
                    </li>
                    <c:if test="${sessionScope.user.getRole() == 0}">
                        <li>
                            <a href="users"><span class="fa fa-user mr-3"></span>Manage Users</a>
                        </li>
                    </c:if>
                    <li>
                        <a href="products"><span class="fa fa-briefcase mr-3"></span>Manage Products</a>
                    </li>
                    <li>
                        <a href="orders"><span class="fa fa-bookmark mr-3"></span>Manage Orders</a>
                    </li>
                    <li>
                        <a href="logout"><span class="fa fa-outdent mr-3"></span>Exit</a>
                    </li>
                </ul>
            </div>
        </nav>

        <script src="sidebar/js/jquery.min.js"></script>
        <script src="sidebar/js/popper.js"></script>
        <script src="sidebar/js/bootstrap.min.js"></script>
        <script src="sidebar/js/main.js"></script>
    </body>

</html>