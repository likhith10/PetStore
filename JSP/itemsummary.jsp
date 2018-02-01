<%-- 
    Document   : itemsummary
    Created on : 24 Apr, 2017, 10:12:35 AM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Summary</title>
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

                <h3>ITEM SUMMARY</h3>

            </div>
            <form action="petstore" method="POST">
                <table class="table table-striped">
                    <thead>

                        <tr>

                            <th>ITEM ID</th>
                            <th>CAT ID</th> 
                            <th>PROD ID</th>
                            <th>ITEM NAME</th>
                            <th>ITEM DESCRIPTION</th>
                            <th>PRICE</th>
                            <th>#</th>

                        </tr>

                    </thead>
                    <tbody>
                        <c:forEach items="${itemList}" var="item">
                            <tr>
                                <td>${item.itemId}</td>
                                <td>${item.categoryId}</td>
                                <td>${item.productId}</td>
                                <td>${item.itemName}</td>
                                <td>${item.itemDescription}</td>
                                <td>${item.price}</td>
                                <td><input type="checkbox" name="itemselection" value="${item.itemId}" />&nbsp;</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


                <br>
                <br>
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-success" value="cart" name="url">Add to Cart</button>
                    <button type="button" class="btn btn-success" value="backtoproducts" name="url" onclick="history.go(-1);">Back</button>
                    
                </div>
            </form>

        </div>

        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
