<%-- 
    Document   : editComment
    Created on : Oct 21, 2023, 9:43:21 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
        <link rel="application/javascript" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"/>
        <link rel="application/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="assets/css/comment.css"/>
        <style>
            body {
                padding-top: 100px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="col-md-10">

                <div class="row">
                    

                    <div class="col-2">


                        <img src="images/${user.avatar}" width="70" class="rounded-circle mt-2">


                    </div>

                    <div class="col-10">

                        <div class="comment-box ml-2">

                            <h4>Edit comment</h4>

                            <form id="form-reviews">
                                <div>
                                    <input type="text" name="reviewId" value="${review.id}" hidden="true">
                                </div>
                                <div>
                                    <input type="text" name="productId" value="${review.productId}" hidden="true">
                                </div>
                                <div>
                                    <input type="text" name="userId" value="${review.userId}" hidden="true">
                                </div>

                                <div class="rating"> 
                                    <input type="radio" name="rating" value="5" id="5" ${review.rating == 5 ? "checked" : ""}><label for="5">☆</label>
                                    <input type="radio" name="rating" value="4" id="4" ${review.rating == 4 ? "checked" : ""}><label for="4">☆</label> 
                                    <input type="radio" name="rating" value="3" id="3" ${review.rating == 3 ? "checked" : ""}><label for="3">☆</label>
                                    <input type="radio" name="rating" value="2" id="2" ${review.rating == 2 ? "checked" : ""}><label for="2">☆</label>
                                    <input type="radio" name="rating" value="1" id="1" ${review.rating == 1 ? "checked" : ""}><label for="1">☆</label>
                                </div>

                                <div class="comment-area">

                                    <textarea name="content" id="content" class="form-control" placeholder="what is your view?" rows="4">${review.content}</textarea>

                                </div>

                                <div class="comment-btns mt-2">

                                    <div class="row">
                                        <div class="col-6">
                                            <div class="pull-left">
                                                <button  type="button" class="btn btn-success send btn-sm">Send <i class="fa fa-arrow-right ml-1"></i></button>      
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </form>

                            <div class="pull-left mt-2">
                                <a href="reviews?pId=${review.productId}"" class="btn btn-success btn-sm">Cancel</a>      
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            let stars = null;

            function renderStars() {
                const ratingInputs = document.querySelectorAll(".rating input");
                ratingInputs.forEach(input => {
                    input.addEventListener("click", (e) => {
                        stars = e.target.value;
                    });
                });
                return stars;
            }
            renderStars();

            let sendBtn = document.querySelector(".send");
            sendBtn.onclick = (e) => {
                let content = document.querySelector("#content").value;
                const reviewsForm = document.querySelector("#form-reviews");
                const data = new FormData(reviewsForm)
                $.ajax({
                    type: "POST",
                    url: "/AssignmentPRJ301/edit-review",
                    processData: false,
                    contentType: false,
                    enctype: "multipart/form-data",
                    data: data,
                    cache: false,
                    success: function (response) {
                        console.log(response);
                        if (response === "OK") {
                            Swal.fire({
                                title: 'Add comment success',
                                icon: 'success',
                                confirmButtonText: 'OK',
                            }).then(() => {
                                window.open("reviews?pId=${review.productId}", "_self");
                            })
                        }
                    }
                });
            }
        </script>
    </body>
</html>

