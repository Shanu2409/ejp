<%-- 
    Document   : index
    Created on : 15 Aug, 2023, 6:05:43 PM
    Author     : shanu
--%>


<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce</title>
        <%@include file="Component/allCss.jsp" %>
        <style>
            body {
                background-color: #f0f1f2;
            }

            .back-img {
                background: url(img/banner.jpeg);
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
                border-top: black 2px solid;
            }
        </style>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("userObj");
        %>
        <%@include file="Component/navbar.jsp" %>
        <div class="container-fluid back-img"></div>




        <!--start recent products-->

        <div class="container-fluid mt-5">
            <h3 class="text-center">Recent Products</h3>
            <div class="row ml-5 mr-5">

                <%
                    ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
                    List<ProductDetails> list2 = dao.getAllProducts();

                    Collections.reverse(list2);
                    list2 = list2.subList(0, Math.min(4, list2.size()));
                    for (ProductDetails p : list2) {
                %>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img alt="${p.getProductname}" src="${pageContext.request.contextPath}/products/<%=p.getPhotoName()%>" width="200px" height="200px" class="img-thumblin"/>
                            <p><%= p.getProductname()%></p>
                            <p><%= p.getOwner()%></p>
                            <p>Category : <%= p.getProductCategory()%></p>
                            <div class="row text-center justify-content-center">
                                <%
                                    if (!p.getStatus().equals("Inactive")) { %>

                                <% if (u == null) { %>
                                <a href="Login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>

                                <% } else { %>
                                <a href="cart?pid=<%= p.getProductId() %>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                <% } %>
                               

                                <%}
                                %>

                                <a href="view_Product.jsp?pid=<%= p.getProductId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p.getPrice()%></a>
                            </div>


                        </div>
                    </div>
                </div>

                <%
                    }
                %>





            </div>
            <div class="text-center my-3">
                <a href="all_recent_products.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>


        <!--end recent products-->

        <hr />

        <!--start new product-->



        <div class="container-fluid mt-5">
            <h3 class="text-center">New Products</h3>
            <div class="row ml-5 mr-5">

                <%
//                    ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
                    List<ProductDetails> list = dao.getNewProducts();

                    for (ProductDetails p : list) {
                %>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img alt="${p.getProductname}" src="${pageContext.request.contextPath}/products/<%=p.getPhotoName()%>" width="200px" height="200px" class="img-thumblin"/>
                            <p><%= p.getProductname()%></p>
                            <p><%= p.getOwner()%></p>
                            <p>Category : <%= p.getProductCategory()%></p>
                            <div class="row text-center justify-content-center">
                                <%
                                    if (!p.getStatus().equals("Inactive")) { %>

                                <% if (u == null) { %>
                                <a href="Login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>

                                <% } else { %>
                                <a href="cart?pid=<%= p.getProductId() %>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                <% } %>
                               

                                <%}
                                %>

                                <a href="view_Product.jsp?pid=<%= p.getProductId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p.getPrice()%></a>
                            </div>


                        </div>
                    </div>
                </div>

                <%
                    }
                %>





            </div>
            <div class="text-center my-3">
                <a href="all_new_products.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>

        <!--end new product-->

        <hr />

        <!--start old product-->

        <div class="container-fluid mt-5">
            <h3 class="text-center">Old Products</h3>
            <div class="row ml-5 mr-5">

                <%
//                    ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
                    List<ProductDetails> list3 = dao.getOldProducts();

                    for (ProductDetails p : list3) {
                %>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img alt="${p.getProductname}" src="${pageContext.request.contextPath}/products/<%=p.getPhotoName()%>" width="200px" height="200px" class="img-thumblin"/>
                            <p><%= p.getProductname()%></p>
                            <p><%= p.getOwner()%></p>
                            <p>Category : <%= p.getProductCategory()%></p>
                            <div class="row text-center justify-content-center">
                                <%
                                    if (!p.getStatus().equals("Inactive")) { %>

                                <% if (u == null) { %>
                                <a href="Login.jsp" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>

                                <% } else { %>
                                <a href="cart?pid=<%= p.getProductId() %>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                <% } %>
                               

                                <%}
                                %>

                                <a href="view_Product.jsp?pid=<%= p.getProductId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                                <a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%= p.getPrice()%></a>
                            </div>


                        </div>
                    </div>
                </div>

                <%
                    }
                %>





            </div>
            <div class="text-center my-3">
                <a href="all_old_products.jsp" class="btn btn-danger btn-sm">View All</a>
            </div>
        </div>


        <!--end old product-->


        <%@include file="Component/footer.jsp" %>
    </body>
</html>
