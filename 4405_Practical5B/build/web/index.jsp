<%-- 
    Document   : index
    Created on : Sep 10, 2023, 1:59:06 PM
    Author     : Lenovo
--%>

<%@ page language="java" contentType="text/html"pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html><body>
<h1>Expression Language</h1>  
<%  
Cookie ck=new Cookie("name","Demo");  
response.addCookie(ck);  
%>  
<a href="exp.jsp">Click Here</a>  
</body></html>
