<%-- 
    Document   : dashboard
    Created on : Oct 24, 2023, 8:28:38 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>

    </head>
    <body>
        <div class="wrapper d-flex align-items-stretch">
            <jsp:include page="sidebar/sidebar.jsp"></jsp:include>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body" style="height: 200px">
                                <h3 class="card-title text-dark">Products Sold</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-dark">127</h2>
                                    <p class="text-dark mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body"  style="height: 200px">
                                <h3 class="card-title text-dark">Profit</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-dark">$ 18541</h2>
                                    <p class="text-dark mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body"  style="height: 200px">
                                <h3 class="card-title text-dark">Customers</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-dark">6</h2>
                                    <p class="text-dark mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body"  style="height: 200px">
                                <h3 class="card-title text-dark">Satisfaction</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-dark">99%</h2>
                                    <p class="text-dark mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-5">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div>
                                            <h4 class="mb-1">Product Sales</h4>
                                            <p>Total Earnings of the Month</p>
                                            <h3 class="m-0">$ 18,541</h3>
                                        </div>
                                        <div>
                                            <ul>
                                                <li class="d-inline-block mr-3"><a class="text-dark" href="#">Day</a></li>
                                                <li class="d-inline-block mr-3"><a class="text-dark" href="#">Week</a></li>
                                                <li class="d-inline-block"><a class="text-dark" href="#">Month</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="chart-wrapper" onload="drawChart()">
                                        <canvas id="myChart" width="600" height="300"></canvas>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                drawChart();
            });

            function drawChart() {
                var stars = [];
                stars[9] = 18,541;
                var frameworks = ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'];
                new Chart('myChart', {
                    type: 'bar',
                    data: {
                        labels: frameworks,
                        datasets: [{
                                label: `User'orders`,
                                data: stars,
                                backgroundColor: 'rgba(75,192,192,1)'
                            }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            }
        </script>
    </body>
</html>
