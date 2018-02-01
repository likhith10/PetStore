<%-- 
    Document   : category
   Created on : 21 Apr, 2017, 7:15:30 PM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <style>
            body { padding-top: 10px;}

        </style>        
    </head>
    <body>
        
        
        <div class="container">
            <h2>Pet Store</h2>
            <p><strong>Hello ${sessionScope.cName}</strong></p>                       
            <p>Please select the pet category</p>  
            <form action="petstore" method="POST">
            
            
            <div style="height:350">
                <div class="col-sm-4"><img src="images/dog.jpg" height="220" width="320"/>

                    <button class="btn btn-danger btn-sm" value="dog" type="submit" name="url">
                        Dog
                    </button>
                </div>

                <div class="col-sm-4" ><img src="images/horse.png" height="220" width="320"/>
                    <button class="btn btn-danger btn-sm" value="horse" type="submit" name="url">
                        Horse
                    </button>
                </div>

                <div class="col-sm-4"><img src="images/rabbit.jpg" height="220" width="320"/>

                    <button class="btn btn-danger btn-sm" value="rabbit" type="submit" name="url">
                        Rabbit
                    </button>
                </div>



            </div>



            <div style="height:350">

                <div class="col-sm-4"><img src="images/fish.png" height="220" width="320"/>

                    <button class="btn btn-danger btn-sm" value="fish" type="submit" name="url">
                        Fish
                    </button>
                </div>

                <div class="col-sm-4"><img src="images/cat.png" height="220" width="320"/>

                    <button class="btn btn-danger btn-sm" value="cat" type="submit" name="url">
                        Cat
                    </button>
                </div>



            </div>
                
                
                </form>

        </div>



        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
