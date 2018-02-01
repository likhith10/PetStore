<%-- 
    Document   : email
    Created on : 23 Apr, 2017, 12:02:06 PM
    Author     : CHINNAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="emailList" method="post">
       <input type="hidden" name="action" value="add"> 
        <label class="pad_top">Email:</label>
        <input type="email" name="email" ><br> <br><br>      
        <input type="submit" value="Send Mail & Logout" class="margin_left">
    </form>
    </body>
</html>
