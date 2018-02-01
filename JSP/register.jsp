<%-- 
    Document   : register
    Created on : 24 Apr, 2017, 10:55:39 AM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <style>
            body { padding-top: 70px; background-image: url(images/logo2.png); background-repeat: no-repeat; background-position: right}
        </style>
    </head>
    <body>
        <div class="container">
            <form action="petstore" method="post">

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">First Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" name="firstName" placeholder="First Name" style="width:300px" required="required">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Last Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputPassword3" name="lastName" placeholder="Last Name" style="width:300px" required="required">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" style="width:300px" required="required">
                    </div>
                </div>     

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Phone Number</label>
                    <div class="col-sm-10">
                        <input type="tel" class="form-control" maxlength="10" id="phoneNumber" name="phoneNumber" placeholder="5555555555"  style="width:120px" required="required">
                    </div>
                </div>

                
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" style="width:300px" required="required">
                    </div>
                </div>      

                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Address</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="address" name="address" placeholder="Address" style="width:500px" required="required">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Credit Card Number</label>
                    <div class="col-sm-10">
                        <input type="tel" class="form-control" maxlength="10" id="phoneNumber" name="cardNumber" placeholder="5555-5555-5555-5555"  style="width:120px" required="required">
                    </div>
                </div>

                <fieldset class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Gender</label>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="gender" id="gender" value="yes" checked>
                                Male
                            </label>
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="gender" id="gender" value="no">
                                Female
                            </label>
                        </div>
                    </div>
                </fieldset>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Date of Birth</label>
                    <div class="col-sm-10">
                        <input class="form-check-input" type="date" name="dateOfBirth" id="dateOfBirth" value="yes" required="required">
                    </div>
                </div>



                <div class="form-group row">
                    <div class="offset-sm-2 col-sm-10">
                        <button type="submit" class="btn btn-primary" name="url" value="register_customer">Sign Up</button>
                    </div>
                </div>
            </form>
        </div>  




        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
