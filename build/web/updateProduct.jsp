<%-- 
    Document   : updateProduct
    Created on : Oct 9, 2023, 9:03:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h3>Update Product</h3>
            <form class="row g-3" method="POST">
                <div class="col-md-6">
                    <label for="inputEmail4" class="form-label">Name</label>
                    <select value="${product.name}" name="name" id="inputState" class="form-select" required="true">
                        <option value="Denim shirt" ${product.name.equals("Denim shirt") ? "selected" : ""}>Denim shirt</option>
                        <option value="Sweatshirt" ${product.name.equals("Sweatshirt") ? "selected" : ""}>Sweatshirt</option>
                        <option value="Grey blouse" ${product.name.equals("Grey blouse") ? "selected" : ""}>Grey blouse</option>
                        <option value="Black jacket" ${product.name.equals("Black jacket") ? "selected" : ""}>Black jacket</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">Quantity</label>
                    <input value="${product.quantity}" name="quantity" type="text" class="form-control" id="inputPassword4" required="true">
                </div>
                <div class="col-12">
                    <label for="inputAddress" class="form-label">Price</label>
                    <input value="${product.price}" name="price" type="text" class="form-control" id="inputAddress" required="true">
                </div>
                <div class="col-12">
                    <label for="inputAddress2" class="form-label">Description</label>
                    <input value="${product.description}" name="description" type="text" class="form-control" id="inputAddress2" required="true">
                </div>
                <div class="col-md-4">
                    <label for="inputState" class="form-label">Rating</label>
                    <select name="rating" id="inputState" class="form-select" required="true">
                        <option value="1" ${product.rating == 1 ? "selected" : ""}>1</option>
                        <option value="2" ${product.rating == 2 ? "selected" : ""}>2</option>
                        <option value="3" ${product.rating == 3 ? "selected" : ""}>3</option>
                        <option value="4" ${product.rating == 4 ? "selected" : ""}>4</option>
                        <option value="5" ${product.rating == 5 ? "selected" : ""}>5</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="inputState" class="form-label">Discount</label>
                    <select name="discount" id="inputState" class="form-select" required="true">
                        <option value="0.1" ${product.discount == 0 ? "selected" : ""}>0%</option>
                        <option value="0.1" ${product.discount == 0.1 ? "selected" : ""}>10%</option>
                        <option value="0.2" ${product.discount == 0.2 ? "selected" : ""}>20%</option>
                        <option value="0.3" ${product.discount == 0.3 ? "selected" : ""}>30%</option>
                        <option value="0.4" ${product.discount == 0.4 ? "selected" : ""}>40%</option>
                        <option value="0.5" ${product.discount == 0.5 ? "selected" : ""}>50%</option>
                        <option value="0.6" ${product.discount == 0.6 ? "selected" : ""}>60%</option>
                        <option value="0.7" ${product.discount == 0.7 ? "selected" : ""}>70%</option>
                        <option value="0.8" ${product.discount == 0.8 ? "selected" : ""}>80%</option>
                        <option value="0.9" ${product.discount == 0.9 ? "selected" : ""}>90%</option>
                        <option value="1.0" ${product.discount == 1.0 ? "selected" : ""}>100%</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="inputState" class="form-label">Category</label>
                    <select name="category" id="inputState" class="form-select" required="true">
                        <option value="1" ${product.categoryId == 1 ? "selected" : ""}>Adidas</option>
                        <option value="2" ${product.categoryId == 2 ? "selected" : ""}>Nike</option>
                        <option value="3" ${product.categoryId == 3 ? "selected" : ""}>Uniqlo</option>
                    </select>
                </div>
                <div class="form-group col-md-2">
                    <div class="my-1">
                        <label>Image</label>
                        <input value="${product.image}" name="image" type="file" class="form-control" id="inputZip" onchange="loadFile(event)">
                        <img src="images/${product.image}" id="output" style="width: 100px; height: 100px; display: block; margin-top: 8px; object-fit: contain"/>      
                    </div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>

        <script>
            var loadFile = function (event) {
                var output = document.getElementById('output');
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function () {
                    URL.revokeObjectURL(output.src);
                };
            };
        </script>
    </body>
</html>
