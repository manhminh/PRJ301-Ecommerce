<%-- 
    Document   : checkout
    Created on : Oct 10, 2023, 7:42:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.Product" %>
<%@page import="models.CartItem" %>
<%@page import="dal.ProductDAO" %>
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
            .disable {
                pointer-events: none ;
                cursor: default;
            }
        </style>
    </head>
    <body class="cnt-home">
        <jsp:include page="menu.jsp"></jsp:include>

            <div class="breadcrumb">
                <div class="container">
                    <div class="breadcrumb-inner">
                        <ul class="list-inline list-unstyled">
                            <li><a href="home">Home</a></li>
                            <li class='active'>Shopping Cart</li>
                        </ul>
                    </div><!-- /.breadcrumb-inner -->
                </div><!-- /.container -->
            </div><!-- /.breadcrumb -->

            <div class="body-content outer-top-xs">
                <div class="container">
                    <div class="row ">
                        <div class="shopping-cart">
                            <div class="shopping-cart-table" style="border-bottom: 1px solid #ddd !important">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="cart-romove item">Remove</th>
                                                <th class="cart-description item">Image</th>
                                                <th class="cart-product-name item">Product Name</th>
                                                <th class="cart-qty item">Quantity</th>
                                                <th class="cart-total last-item">Grandtotal</th>
                                            </tr>
                                        </thead><!-- /thead -->
                                        <tbody>
                                        <c:forEach items="${requestScope.items}" var="item">
                                            <% 
                                                ProductDAO pDAO = new ProductDAO();
                                                CartItem ci = (CartItem)pageContext.getAttribute("item");
                                                Product product = pDAO.getProductById(ci.getProductId());
                                            %>
                                            <c:set value="<%= product.getRating() %>" var="rate"></c:set>
                                                <tr>
                                                    <td class="romove-item"><a href="delete-item?id=<%= ci.getCiId() %>" title="cancel" class="icon"><i class="fa fa-trash-o"></i></a></td>
                                                <td class="cart-image">
                                                    <div class="entry-thumbnail">
                                                        <img src="images/<%= product.getImage() %>" alt="">
                                                    </div>
                                                </td>
                                                <td class="cart-product-name-info">
                                                    <h4 class='cart-product-description'><a href="edit-item?pId=<%= product.getId() %>"><%= product.getName() %></a></h4>
                                                    <div>
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <c:if test="${i <= rate}">
                                                                <i class="fa fa-star" style="color: orange"></i>
                                                            </c:if>
                                                            <c:if test="${i > rate}">
                                                                <i class="fa fa-star" style="color: grey"></i>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </td>
                                                <td class="cart-product-quantity">
                                                    <div class="col-sm-2">
                                                        <span class="label">Quantity :</span>
                                                    </div>

                                                    <div class="cart-quantity">
                                                        <div class="quant-input">
                                                            <div class="arrows">
                                                                <a href="edit-item?action=asc&id=<%= ci.getCiId() %>" class="arrow plus gradien <%= ci.getQuantity() < product.getQuantity() ? "": "disable" %>t"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></a>
                                                                <a href="edit-item?action=desc&id=<%= ci.getCiId() %>" class="arrow minus gradient  <%= ci.getQuantity() > 1 ? "": "disable" %>"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></a>
                                                            </div>
                                                            <input type="text" value="<%= ci.getQuantity() %>">
                                                        </div>
                                                    </div>
                                                </td>
                                                <c:set value="<%= ci.getQuantity() * product.getPriceAfterDiscount() %>" var="price"></c:set>
                                                <td class="cart-product-grand-total"><span class="cart-grand-total-price">$${price}</span></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody><!-- /tbody -->
                                    <tfoot>
                                        <tr>
                                            <td colspan="7">
                                                <div class="shopping-cart-btn">
                                                    <span class="">
                                                        <a href="category?cId=1" class="btn btn-upper btn-primary outer-left-xs">Continue Shopping</a>
                                                    </span>
                                                </div><!-- /.shopping-cart-btn -->
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table><!-- /table -->
                            </div>
                        </div>

                        <div class="col-md-8 col-sm-12 estimate-ship-tax">
                            <h3 style="margin: 0">Checkout here</h3>
                            <form class="register-form outer-top-xs" id="checkout-form" >
                                <div class="form-group">
                                    <label class="info-title" for="exampleOrderId1">Username</label>
                                    <input value="${sessionScope.user.username}" disabled="true" type="text" class="form-control unicase-form-control text-input" id="exampleOrderId1">
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleBillingEmail1">Email address</label>
                                    <input value="${sessionScope.user.email}" disabled="true" type="email" class="form-control unicase-form-control text-input" id="exampleBillingEmail1">
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleBillingEmail1">Province</label>
                                    <select name="province" required="true" class="form-select form-select-sm mb-3 form-control" id="city" aria-label=".form-select-sm">
                                        <option value="" selected>Choose your province</option>           
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="info-title" for="exampleBillingEmail1">District</label>
                                    <select name="district" required="true" class="form-select form-select-sm mb-3 form-control" id="district" aria-label=".form-select-sm">
                                        <option value="" selected>Choose your district</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="info-title" for="exampleBillingEmail1">Wards</label>
                                    <select name="wards" required="true" class="form-select form-select-sm form-control" id="ward" aria-label=".form-select-sm">
                                        <option value="" selected>Choose your wards</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="info-title" for="exampleBillingEmail1">Shipping</label>
                                    <select id="shipping-select" name="shipping" required="true" class="form-select form-select-sm form-control" id="ward" aria-label=".form-select-sm">
                                        <option selected="true">Choose your shipping</option>
                                        <c:forEach items="${listShipping}" var="shipping">
                                            <option value="shipping-${shipping.getShippingId()}">${shipping.getName()} (${shipping.getTime()} days - $${shipping.getPrice()})</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" id="selected-shipping" name="selected-shipping" value="">
                                </div>
                                <div class="cart-checkout-btn" style="margin-top:20px">
                                    <button type="button" class="btn btn-primary checkout-btn">CHEKOUT</button>
                                </div>
                            </form>	
                        </div><!-- /.estimate-ship-tax -->

                        <div class="col-md-4 col-sm-12 cart-shopping-total">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="border:none">
                                            <div class="cart-sub-total">
                                                Shipping Cost<span id="shipping-cost" class="inner-left-md">$0</span>
                                            </div>
                                            <div class="cart-sub-total">
                                                Total Value<span id="total-value" class="inner-left-md">$${totalPrice}</span>
                                            </div>
                                            <hr>
                                            <div class="cart-grand-total">
                                                Grand Total<span id="grand-total" class="inner-left-md">$${totalPrice}</span>
                                            </div>
                                        </th>
                                    </tr>
                                </thead><!-- /thead -->
                            </table><!-- /table -->
                        </div><!-- /.cart-shopping-total -->			</div><!-- /.shopping-cart -->
                </div> <!-- /.row -->
                <!-- ============================================== BRANDS CAROUSEL ============================================== -->
                <div id="brands-carousel" class="logo-slider wow fadeInUp">

                    <div class="logo-slider-inner">	

                    </div><!-- /.logo-slider-inner -->

                </div><!-- /.logo-slider -->
                <!-- ============================================== BRANDS CAROUSEL : END ============================================== -->	</div><!-- /.container -->
        </div><!-- /.body-content -->

        <jsp:include page="footer.jsp"></jsp:include>

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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            var citis = document.getElementById("city");
            var districts = document.getElementById("district");
            var wards = document.getElementById("ward");
            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };
            var promise = axios(Parameter);
            promise.then(function (result) {
                console.log(result);
                renderCity(result.data);
            });

            let cityName = "";
            let districtName = "";
            let wardName = "";
            let dataWards;
            function normalizeText(text) {
                text = text.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                return text.replace(/Đ/g, "D").replace(/đ/g, "d");
            }
            function renderCity(data) {
                for (const x of data) {
                    citis.options[citis.options.length] = new Option(x.Name, x.Id);
                }
                citis.onchange = function () {
                    district.length = 1;
                    ward.length = 1;
                    if (this.value !== "") {
                        const result = data.filter(n => n.Id === this.value);
                        cityName = normalizeText(result[0].Name);
                        for (const k of result[0].Districts) {
                            district.options[district.options.length] = new Option(k.Name, k.Id);
                        }
                    }
                };
                district.onchange = function (value) {
                    ward.length = 1;
                    const dataCity = data.filter((n) => n.Id === citis.value);
                    dataCity[0].Districts.forEach((item) => {
                        if (item.Id === value.target.value) {
                            districtName = normalizeText(item.Name);
                        }
                    });
                    if (this.value !== "") {
                        dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;
                        for (const w of dataWards) {
                            wards.options[wards.options.length] = new Option(w.Name, w.Id);
                        }
                    }
                };
                wards.onchange = function (event) {
                    dataWards.forEach((value) => {
                        if (value.Id === event.target.value) {
                            wardName = normalizeText(value.Name);
                        }
                    })
                }
            }


            let checkoutBtn = document.querySelector(".cart-checkout-btn button");
            checkoutBtn.onclick = (e) => {
                const city = document.querySelector("#city");
                let idCity = city.options[city.selectedIndex].value;
                city.options[city.selectedIndex].value = cityName;
                const district = document.querySelector("#district");
                let idDistrict = district.options[district.selectedIndex].value;
                district.options[district.selectedIndex].value = districtName;
                const ward = document.querySelector("#ward");
                let idWard = ward.options[ward.selectedIndex].value;
                ward.options[ward.selectedIndex].value = wardName;
                const checkOutForm = document.querySelector("#checkout-form");
                const data = new FormData(checkOutForm);
                $.ajax({
                    type: "post",
                    url: "/AssignmentPRJ301/checkout",
                    processData: false,
                    contentType: false,
                    enctype: "multipart/form-data",
                    data: data,
                    cache: false,
                    success: function (response)
                    {
                        console.log(response);
                        switch (response) {
                            case 'Failed':
                                Swal.fire({
                                    title: 'Checkout failed',
                                    icon: 'error',
                                    confirmButtonText: 'OK',
                                })
                                break;
                            case 'OK':
                                city.options[city.selectedIndex].value = idCity;
                                district.options[district.selectedIndex].value = idDistrict;
                                ward.options[ward.selectedIndex].value = idWard;
                                Swal.fire({
                                    title: 'Check out successfully',
                                    icon: 'success',
                                    showCancelButton: true,
                                    confirmButtonText: 'Go to homepage',
                                    cancelButtonText: 'See orders details'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.open("home", "_self");
                                    } else {
                                        window.open("order-details", "_self");
                                    }
                                }).then(() => {
                                    
                                })
                                break;
                        }
                    }
                });
            }

            document.getElementById('shipping-select').addEventListener('change', function () {
                document.getElementById('selected-shipping').value = this.value;
                shippingCost = document.querySelector("#shipping-cost");
                totalValue = document.querySelector("#total-value");
                grandTotal = document.querySelector("#grand-total");
                switch (this.value) {
                    case "shipping-1":
                        shippingCost.innerText = "$50";
                        grandTotal.innerText = "$" + "" + (+totalValue.innerText.split("$")[1] + +shippingCost.innerText.split("$")[1]);
                        break;
                    case "shipping-2":
                        shippingCost.innerText = "$100";
                        grandTotal.innerText = "$" + "" + (+totalValue.innerText.split("$")[1] + +shippingCost.innerText.split("$")[1]);
                        break;
                    case "shipping-3":
                        shippingCost.innerText = "$200";
                        grandTotal.innerText = "$" + "" + (+totalValue.innerText.split("$")[1] + +shippingCost.innerText.split("$")[1]);
                        break;
                    default:
                        shippingCost.innerText = "$0";
                        grandTotal.innerText = "$" + "" + (+totalValue.innerText.split("$")[1] + +shippingCost.innerText.split("$")[1]);
                }
            });
            
            
        </script>
    </body>
</html>
