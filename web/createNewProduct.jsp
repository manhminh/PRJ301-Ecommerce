<%-- 
    Document   : createNewProduct
    Created on : Oct 9, 2023, 6:21:53 PM
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
            <h3>Create New Product</h3>
            <form class="row g-3" method="POST">
                <div class="col-md-6">
                    <label for="inputEmail4" class="form-label">Name</label>
                    <select name="name" id="inputState" class="form-select" required="true">
                        <option value="Denim shirt">Denim shirt</option>
                        <option value="Sweatshirt">Sweatshirt</option>
                        <option value="Grey blouse">Grey blouse</option>
                        <option value="Black jacket">Black jacket</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">Quantity</label>
                    <input name="quantity" type="text" class="form-control" id="inputPassword4" required="true">
                </div>
                <div class="col-12">
                    <label for="inputAddress" class="form-label">Price</label>
                    <input name="price" type="text" class="form-control" id="inputAddress" required="true">
                </div>
                <div class="col-12">
                    <label for="inputAddress2" class="form-label">Description</label>
                    <input name="description" type="text" class="form-control" id="inputAddress2" required="true">
                </div>
                <div class="col-md-4">
                    <label for="inputState" class="form-label">Rating</label>
                    <select name="rating" id="inputState" class="form-select" required="true">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="inputState" class="form-label">Discount</label>
                    <select name="discount" id="inputState" class="form-select" required="true">
                        <option value="0.1">10%</option>
                        <option value="0.2">20%</option>
                        <option value="0.3">30%</option>
                        <option value="0.4">40%</option>
                        <option value="0.5">50%</option>
                        <option value="0.6">60%</option>
                        <option value="0.7">70%</option>
                        <option value="0.8">80%</option>
                        <option value="0.9">90%</option>
                        <option value="1.0">100%</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="inputState" class="form-label">Category</label>
                    <select name="category" id="inputState" class="form-select" required="true">
                        <option value="1">Adidas</option>
                        <option value="2">Nike</option>
                        <option value="3">Uniqlo</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label for="inputZip" class="form-label">Image</label>
                    <input name="image" type="file" class="form-control" id="inputZip" required="true" onchange="loadFile(event)">
                    <img id="output" style="width: 80px; height: 100px; display: block; margin-top: 8px"/>            
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>

        <script>
            var loadFile = function (event) {
                var output = document.getElementById('output');
                output.src = URL.createObjectURL(event.target.files[0]);
                output.onload = function () {
                    URL.revokeObjectURL(output.src);
                }
            };
        </script>
    </body>
</html>
