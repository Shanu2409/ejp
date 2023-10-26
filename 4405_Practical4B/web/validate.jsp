<%-- 
    Document   : validate
    Created on : Sep 10, 2023, 1:09:06 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="mypack.*" %>
<html><body>
<h1>Validation Page</h1>
<jsp:useBean id="obj" scope="request"
class="mypack.CheckerBean" >
<jsp:setProperty name="obj" property="*"/>
</jsp:useBean>
<%if (obj.validate())
{ %>
<jsp:forward page="successful.jsp"/>
<% }
else {%>
<jsp:include page="index.html"/>
<%}%>
<%=obj.getError() %>
</body></html>
