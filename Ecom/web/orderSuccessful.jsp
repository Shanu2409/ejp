<%-- 
    Document   : orderSuccessful
    Created on : 9 Sep, 2023, 12:26:51 AM
    Author     : shanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Successful</title>
        <%@include file="Component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <div class="text-center">
            <i class="fa-solid fa-circle-check fa-6x my-5" style="color: #27d363;"></i>
            <p>🎉🎉🎉🎉</p>
            <h1>Order successful</h1>
            <a href="/E_Com" class="btn btn-primary mt-4"><i class="fa-solid fa-house"></i> Home</a>
            <a href="orders.jsp" class="btn btn-secondary mt-4"><i class="fa-solid fa-house"></i> View Orders</a>
        </div>
    </body>
</html>
