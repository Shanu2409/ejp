<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce User</title>
    </head>
    <body>
        <h1>User Home</h1>
        <c:if test="${not empty useObj}">
            <h5 class="text-center text-danger mb-2">${useObj.name}</h5>
        </c:if>
    </body>
</html>
