
<%@page import="com.entity.ProductDetails"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@page import="java.awt.print.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce Add Books</title>
        <%@include file="allCssAdmin.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <%@include file="navbarAdmin.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="../Login.jsp" />
        </c:if>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-2">
                        <div class="card-body">
                            <h4 class="text-center">Edit Products</h4>


                            <%
                                int id = Integer.parseInt(request.getParameter("Pid"));
                                ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());

                                ProductDetails p = dao.getProductDetailById(id);

                            %>

                            <form action="../EditProducts" method="get" enctype="multipart/form-data">
                                <input type="hidden" name="id" value="<%= p.getProductId()%>" />
                                <div class="form-group">
                                    <label for="exampleInputName">Products Name</label>
                                    <input type="text" class="form-control" id="exampleInputName" required aria-describedby="emailHelp" name="pname" value="<%= p.getProductname()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Owner Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" required aria-describedby="emailHelp" name="powner"  value="<%= p.getOwner()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhone">Price</label>
                                    <input type="number" class="form-control" required id="exampleInputPhone" aria-describedby="emailHelp" name="price"  value="<%= p.getPrice()%>">
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Product Status</label>
                                    <select name="status" id="category" class="form-control">
                                        <%
                                            if (p.getStatus().equals("Inactive")) {
                                        %>
                                        <option value="Inactive" selected>Inactive</option>
                                        <option value="Active">Active</option>   
                                        <%
                                        } else {
                                        %>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active" selected>Active</option>  
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>


                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary mt-4"><i class="fa-solid fa-plus"></i> Edit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
