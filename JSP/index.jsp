<%-- 
    Document   : index
    Created on : 23 Apr, 2017, 8:10:23 PM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title> 
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <style>
            body { padding-top: 270px; background-image: url(images/logo2.png); background-repeat: no-repeat; background-position: right}
        </style>  
    </head>
    <body>

        <div class="container">
            <h2>Pet Store</h2> 
            <h4>${message}</h4>
            <form action="petstore" method="post">

                <div class="form-group row" >
                    <label for="userName" class="col-sm-2 col-form-label">Customer ID</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control"  name="customerId" placeholder="Customer ID" style="width:300px">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" style="width:300px">
                    </div>
                </div>     

                <div class="form-group row" align="center">
                    <div class="offset-sm-2 col-sm-10">
                        <button type="submit" class="btn btn-primary" style="" name="url" value="login">Login</button>
                        <button type="submit" class="btn btn-primary" name="url" value="index_register">Register</button>
                    </div>
                </div>

            </form>




        </div>    

        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
