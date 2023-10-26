<%-- 
    Document   : all_recent_products
    Created on : 7 Sep, 2023, 1:58:03 PM
    Author     : shanu
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@page import="com.db.DbConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recent Products</title>
        <%@include file="Component/allCss.jsp" %>
    </head>
    <body>
        <%
            User u = (User) session.getAttribute("userObj");
        %>
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>

            <script type="text/javascript">
                            showToast();
                            function showToast(content)
                            {
                                $('#toast').addClass("display");
                                $('#toast').html(content);
                                setTimeout(()=>{
                                    $("#toast").removeClass("display");
                                },5000)
                            }	
            </script>
            
            <c:remove var="addCart" scope="session" />
        </c:if>
            
        <%@include file="Component/navbar.jsp" %>
        <h3 class="text-center">Recent Products</h3>
        <div class="container-fluid">
            <div class="row p-3">
                    <%
                    ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
                    List<ProductDetails> list2 = dao.getAllProducts();
                    
                    Collections.reverse(list2);
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
        </div>
    </body>
</html>
