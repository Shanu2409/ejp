<%-- 
    Document   : view_Product
    Created on : 7 Sep, 2023, 3:22:42 PM
    Author     : shanu
--%>

<%@page import="java.util.Collections"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.ProductDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Product</title>
        <%@include file="Component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="Component/navbar.jsp" %>
        <%
            int pid = Integer.parseInt(request.getParameter("pid"));
            ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
            ProductDetails p = dao.getProductDetailById(pid);
        %>
        
        <%
            User u = (User) session.getAttribute("userObj");
        %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 p-5 text-center border bg-white">
                    <!--product details--> 
                    <img src="${pageContext.request.contextPath}/products/<%=p.getPhotoName()%>" height="150px" width="150px" /> <br/>
                    <h4 class="mt-3">Product Name : <span class="text-success"> <%= p.getProductname() %></span> </h4>
                    <h4>Owner Name : <span class="text-success"> <%= p.getOwner() %></span></h4>
                    <h4>Category : <span class="text-success"> <%= p.getProductCategory()%></span></h4>
                </div>
                <div class="col-md-6 p-5 text-center border bg-white">
                    <!--shipping option-->
                    <h2><%= p.getProductname().toUpperCase() %></h2>
                    <h4>Contact the Seller</h4>
                    <h4><%= p.getOwner() %> - <span class="text-success"> <%= p.getEmail()%></span></h4>
                    <h4></h4>
                    <div class="row mt-4">
                        <div class="col-md-4 text-danger text-center">
                            <i class="fa-solid fa-money-check-dollar fa-2x"></i>
                            <p>Cash on Delivery</p>
                        </div>

                        <div class="col-md-4 text-danger text-center ">
                            <i class="fa-solid fa-rotate-left fa-2x"></i>
                            <p>Return Order</p>
                        </div>

                        <div class="col-md-4 text-danger text-center">
                            <i class="fa-solid fa-truck-ramp-box fa-2x"></i>
                            <p>Free Delivery</p>
                        </div>

                    </div>

                    <div class="text-center p-3">
                        <h4>Product is <%= p.getStatus()%></h4>
                        <%
                            if(p.getStatus().equals("Inactive")){ %>
                            
                                <a href="/E_Com" class="btn btn-secondary"><i class="fa-solid fa-house"></i> Home</a>
                            <%} else { %>
                                <a href="cart?pid=<%= p.getProductId() %>&&uid=<%= u.getId()%>" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add to Cart</a>
                            <% }
                        %>
                        
                        <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p.getPrice() %></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
