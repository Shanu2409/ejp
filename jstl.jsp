<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP</title>
    </head>
    <body>
        <c:set var="a" value="${20}" />


        <c:choose>
            <c:when test="${11 < 2}">
                <c:out value="${a}" />
            </c:when>
            <c:otherwise>
                <c:out value="${a + a}" />
            </c:otherwise>
        </c:choose>

        <c:forEach begin="1" end="3" var="i">
            <p> count : <c:out value="${i}" /> </p> 
        </c:forEach>
    </body>
</html>
