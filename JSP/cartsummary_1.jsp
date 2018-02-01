<%-- 
    Document   : cartsummary
    Created on : 21 Apr, 2017, 6:40:15 PM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Summary</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <style>
            body { padding-top: 70px;}
        </style>
        <script>
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;
            }
        </script>

    </head>
    <body>
        <div class="container" id="printableArea">   
            <h2>Pet Store</h2>
            <p><strong>Hello ${sessionScope.cName}</strong></p>  
            <div>
                <h3>Cart</h3>
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
                            <th>QUANTITY</th>

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
                                <td><input type="number" min="1" required="required" name="quantity"></td>
                            </tr>
                        </c:forEach>

                    </tbody>

                </table>

                <fieldset class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">Payment Type</label>
                    <div class="col-sm-10">
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="payment_method"  value="cash" checked>

                                Cash
                            </label>
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="payment_method"  value="card">
                                Card
                            </label>
                        </div>
                    </div>
                </fieldset>
                <br>
                <br>
                <br>
                <div>
                   <button type="submit" class="btn btn-success" value="ordered" name="url">Pay Now</button>-->
                  
                </div>
            </form>

        </div>

        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>
