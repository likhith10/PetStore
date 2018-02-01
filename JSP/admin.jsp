<%-- 
    Document   : admin
    Created on : 21 Apr, 2017, 4:23:26 PM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <style>
            body { padding-top: 70px;}
        </style>
    </head>
    <body>
        <div class="container">      
            <div>

                <h3>Welcome Admin!!!</h3><br>
                <h4>Please select the items and enter the updated price of the items</h4>
                <h4>${message}</h4>
            </div>
            <form action="petstore" method="POST">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>ITEM ID</th>
                            <th>CTGY ID</th>
                            <th>PROD ID</th>
                            <th>ITEM NAME</th>
                            <th>ITEM DESCRIPTION</th>
                            <th>OLD PRICE</th>
                            <th>NEW PRICE</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${Items}" var="item">
                            <tr>
                                <td><input type="checkbox" name="updated_price" value="${item.itemId}"/></td>
                                <td>${item.itemId}</td>
                                <td>${item.categoryId}</td>
                                <td>${item.productId}</td>
                                <td>${item.itemName}</td>
                                <td>${item.itemDescription}</td>
                                <td>${item.price}</td>
                                <td><input type="number" min="1" name="new_priceList"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


                <br>
                <br>
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-success" value="admin_update" name="url">Update</button>
                    <button type="submit" class="btn btn-success" value="check_out" name="url">Log Out</button>
                </div>
            </form>

        </div>

        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
