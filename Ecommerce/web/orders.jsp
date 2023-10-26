<%-- 
    Document   : orders
    Created on : 8 Sep, 2023, 7:39:14 PM
    Author     : shanu
--%>

<%@page import="java.util.List"%>
<%@page import="com.DAO.ProductOrderDAOImpl"%>
<%@page import="com.DAO.ProductOrderDAO"%>
<%@page import="com.entity.Product_order"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ALL Orders</title>
        <%@include file="Component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>

        <div class="container">
            <div class="">
                <div class="p-4">
                    <div class="card mt-2">
                        <div class="p-2">
                            <h4 class="text-center">Your Orders</h4>
                            <table class="table table-striped mt-3">
                                <thead class="bg-secondary text-white">
                                    <tr>
                                        <th scope="col">Order Id</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Owner</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Payment Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>

                                        <%
                                            User u = (User) session.getAttribute("userObj");
                                            ProductOrderDAOImpl dao = new ProductOrderDAOImpl(DbConnect.getCon());
                                            
                                            List<Product_order> plist = dao.getOrders(u.getEmail());
                                            
                                            for(Product_order p : plist) {
                                        %>
                                        <th scope="row"><%= p.getOrder_id()%></th>
                                        <td><%= p.getUserName()%></td>
                                        <td><%= p.getProductName()%></td>
                                        <td><%= p.getOwner()%></td>
                                        <td><%= p.getPrice()%></td>
                                        <td><%= p.getPayment()%></td>
                                    </tr>
                                    <% } %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
