<%-- 
    Document   : index
    Created on : Sep 10, 2023, 1:04:17 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html><body>
<h1>Intrinsic Objects in JSP</h1>
<h1>Request Object </h1>
Query String : <%=request.getQueryString() %><br>
Context Path : <%=request.getContextPath() %><br>
Remote Host : <%=request.getRemoteHost() %><br>
<h1>Response Object </h1>
Character Encoding Type : <%=response.getCharacterEncoding() %><br>
Content Type : <%=response.getContentType() %><br>
Locale : <%=response.getLocale() %><br>
<h1>Session Object </h1>
ID : <%=session.getId() %><br>
Creation Time : <%=new java.util.Date(session.getCreationTime()) %><br>
Last Access Time : <%=new java.util.Date(session.getLastAccessedTime()) %><br>
</body></html>
