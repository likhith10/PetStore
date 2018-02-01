<%-- 
    Document   : purchasesummary
   Created on : 24 Apr, 2017, 12:18:56 PM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <div>

                <h3>PURCHASE SUMMARY</h3>

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
                            <th>Quantity</th>


                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${cartItemList}" var="cartItem">
                            <tr>
                                <td>${cartItem.item.itemId}</td>
                                <td>${cartItem.item.categoryId}</td>
                                <td>${cartItem.item.productId}</td>
                                <td>${cartItem.item.itemName}</td>
                                <td>${cartItem.item.itemDescription}</td>
                                <td>${cartItem.item.price}</td>
                                <td>${cartItem.quantity}</td>


                            </tr>
                        </c:forEach>
                    </tbody>
                </table>


                <br>
                <br>
                <br>
                <div>
                    <fieldset class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">Payment Type</label>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="payment_method" id="newsLetter" value="cash" checked disabled="disabled">

                                    ${payment_method}
                                </label>

                            </div>
                        </div>
                    </fieldset>
                                   
                              
                    <div>
                        Total : ${total}
                    </div>
                    <br>
                    <br>
                    <br>
                    <p>Payment received successfully successfully!!!! Thank You!!</p>
                    <div align="center">
                        <button type="submit" class="btn btn-success" name="url" value="check_out">Log Out</button>
                        <input type="button" class="btn btn-success" onclick="printDiv('printableArea')" value="Print" />
                        
                    </div>
                </div>
            </form>
        </div>
        <!-- Latest compiled and minified JavaScript -->
        <script src="jquery-3.1.1/jquery-3.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </body>
</html>

