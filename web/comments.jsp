<%-- 
    Document   : comments
    Created on : Oct 20, 2023, 7:06:16 PM
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


                        <img src="images/${user.getAvatar()}" width="70" class="rounded-circle mt-2">


                    </div>

                    <div class="col-10">

                        <div class="comment-box ml-2">

                            <h4>Add a comment</h4>

                            <form id="form-reviews">
                                <div>
                                    <input type="text" name="productId" value="${productId}" hidden="true">
                                </div>
                                <div>
                                    <input type="text" name="userId" value="${user.getId()}" hidden="true">
                                </div>

                                <div class="rating"> 
                                    <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                                    <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
                                    <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                                    <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                                    <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                                </div>

                                <div class="comment-area">

                                    <textarea name="content" id="content" class="form-control" placeholder="what is your view?" rows="4"></textarea>

                                </div>

                                <div class="comment-btns mt-2">

                                    <div class="row">
                                        <div class="col-6">
                                            <div class="pull-left">
                                                <button  type="button" class="btn btn-success send btn-sm">Send <i class="fa fa-arrow-right ml-1"></i></button> 
                                                <h4 class="send-success" style="color: green"></h4>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </form>

                            <div class="pull-left mt-2">
                                <a href="reviews?pId=${productId}"" class="btn btn-secondary btn-sm">Cancel</a>      
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="text/javascript">
            let sendBtn = document.querySelector(".send");
            sendBtn.onclick = (e) => {
                const reviewsForm = document.querySelector("#form-reviews");
                const data = new FormData(reviewsForm);
                $.ajax({
                    type: "POST",
                    url: "/AssignmentPRJ301/add-review",
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
//                                window.open("reviews?pId=${productId}", "_self");
                                sendNotification();
                            });
                        }
                    }
                });
            }

            var websocket = new WebSocket("ws://localhost:9999/AssignmentPRJ301/notification");
            websocket.onopen = function (message) {
                processOpen(message);
            };
            websocket.onclose = function (message) {
                processClose(message);
            };
            websocket.onerror = function (message) {
                processError(message);
            };
            websocket.onmessage = function (message) {
                processMessage(message);
            };
            function processMessage(message) {
                var toastObj = JSON.parse(event.data);
                console.log(toastObj.rating);

                let content = document.querySelector("#content");
                let rating = document.querySelector(".rating");
                content.value = toastObj.content;
                rating.innerHTML = `<input type="radio" name="rating" value="5" id="5" \${toastObj.rating == 5 ? "checked" : ""}><label for="5">☆</label>
                                    <input type="radio" name="rating" value="4" id="4" \${toastObj.rating == 4 ? "checked" : ""}><label for="4">☆</label> 
                                    <input type="radio" name="rating" value="3" id="3" \${toastObj.rating == 3 ? "checked" : ""}><label for="3">☆</label>
                                    <input type="radio" name="rating" value="2" id="2" \${toastObj.rating == 2 ? "checked" : ""}><label for="2">☆</label>
                                    <input type="radio" name="rating" value="1" id="1" \${toastObj.rating == 1 ? "checked" : ""}><label for="1">☆</label>`;

                let toastMixin = Swal.mixin({
                    toast: true,
                    icon: 'success',
                    title: 'General Title',
                    animation: false,
                    position: 'top-right',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                });
                toastMixin.fire({
                    animation: true,
                    title: 'Send comment successfully'
                });
            }
            function processOpen(message) {
                console.log("Server connect... \n");
            }
            function processClose(message) {
                console.log("Server Disconnect... \n");
            }
            function processError(message) {
                console.log("Error... " + message + " \n");
            }

            const userId = ${sessionScope.user.id};

            function sendNotification() {
                websocket.send(JSON.stringify({
                    action: "review-toast",
                    userId: userId
                }));
            }

        </script>
    </body>
</html>
