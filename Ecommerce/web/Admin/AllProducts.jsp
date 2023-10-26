<%-- 
    Document   : AllBoooks
    Created on : 18 Aug, 2023, 8:04:20 PM
    Author     : shanu
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.db.DbConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@page import="com.DAO.ProductsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce All Products</title>
        <%@include file="allCssAdmin.jsp" %>
        <style>
            thead {
                color: white;
            }
        </style>
    </head>
    <body>

        <%@include file="navbarAdmin.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="../Login.jsp" />
        </c:if>
        <h3 class="text-center">All Products</h3>

        <c:if test="${not empty sucsMsg }">
            <p class="text-center text-success mb-2">${sucsMsg}</p>
            <c:remove var="sucsMsg" scope="session" />
        </c:if>

        <c:if test="${not empty failMsg }">
            <p class="text-center text-danger mb-2">${failMsg}</p>
            <c:remove var="failMsg" scope="session" />
        </c:if> 

        <table class="table table-striped">
            <thead class="bg-primary">
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Owner Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
                    String path = getServletContext().getRealPath("") + File.separator + "products";
                    List<ProductDetails> list = dao.getAllProducts();

                    for (ProductDetails p : list) {
                %>
                <tr>
                    <td><%= p.getProductId()%></td>
                    <td><img alt="${pageContext.request.contextPath}/products/<%=p.getPhotoName()%>" src="${pageContext.request.contextPath}/products/<%=p.getPhotoName()%>" width="50px" height="50px"/></td>
                    <td><%= p.getProductname()%></td>
                    <td><%= p.getOwner()%></td>
                    <td><%= p.getPrice()%></td>
                    <td><%= p.getProductCategory()%></td>
                    <td><%= p.getStatus()%></td>
                    <td>

                        <a href="./Edit_products.jsp?Pid=<%= p.getProductId()%>"
                           class="btn btn-sm btn-primary"><i class="fa-regular fa-pen-to-square"></i> Edit</a>
                        <a href="../delete?Pid=<%= p.getProductId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
