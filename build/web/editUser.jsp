<%-- 
    Document   : editUser
    Created on : Sep 28, 2023, 6:16:14 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="edit-user-infor-container mt-5">
                <h3>Edit User</h3>
                <form action="update-user?id=${user.id}" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Email</label>
                            <input value="${user.email}" type="email" class="form-control" id="inputEmail4" placeholder="Email" disabled="true">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Password</label>
                            <input value="${user.password}" type="text" class="form-control" id="inputPassword4" disabled="true">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="username">Username</label>
                            <input name="username" value="${user.username}" type="text" class="form-control" id="username">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="inputState">Role</label>
                            <select name="role" id="inputState" value="${user.role}" class="form-control">
                                <option value="0" ${user.role == 0 ? "selected" : ""}>Admin</option>
                                <option value="1" ${user.role == 1 ? "selected" : ""}>User</option>
                                <option value="2" ${user.role == 2 ? "selected" : ""}>Staff</option>
                            </select>
                        </div>
                        <div name="gender" class="form-group col-md-3">
                            <label for="inputState">Gender</label>
                            <select name="gender" id="inputState" value="${user.gender}" class="form-control">
                                <option value="0" ${user.gender == 0 ? "selected" : ""}>Male</option>
                                <option value="1" ${user.gender == 1 ? "selected" : ""}>Female</option>
                                <option value="2" ${user.gender == 2 ? "selected" : ""}>Others</option>
                            </select>
                        </div>
                    </div>
                    <div  class="form-row">
                        <div class="form-group col-md-12">
                            <label for="inputAddress">Address</label>
                            <input name="address" type="text" class="form-control" id="inputAddress" value="${user.address}">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <div class="my-3">
                                <label>Avatar</label>
                                <input name="avatar" type="file" value="${user.avatar}" />
                            </div>
                            <img src="images/${user.avatar}" style="height: 100px; width: 100px; border-radius: 50%;border: 1px solid #ccc" />
                        </div>
                    </div>   
                    <button type="submit" class="btn btn-primary my-3">Save</button>
                </form>
            </div>
        </div>
    </body>
</html>
