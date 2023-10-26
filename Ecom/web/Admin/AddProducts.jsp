<%-- 
    Document   : allBooks
    Created on : 18 Aug, 2023, 7:54:53 PM
    Author     : shanu
--%>

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
                            <h4 class="text-center">Add Products</h4>
                            <c:if test="${not empty sucsMsg }">
                                <p class="text-center text-success mb-2">${sucsMsg}</p>
                                <c:remove var="sucsMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty failMsg }">
                                <p class="text-center text-danger mb-2">${failMsg}</p>
                                <c:remove var="failMsg" scope="session" />
                            </c:if>   
                            <form action="../AddProducts" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputName">Products Name</label>
                                    <input type="text" class="form-control" id="exampleInputName" required aria-describedby="emailHelp" name="pname">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Owner Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" required aria-describedby="emailHelp" name="powner">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhone">Price</label>
                                    <input type="number" class="form-control" required id="exampleInputPhone" aria-describedby="emailHelp" name="price">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Products Category</label>
                                    <select class="form-control" name="pcategory" id="exampleFormControlSelect1">
                                        <option selected="">----Select Option-----</option>
                                        <option value="New">New Product</option>
                                        <option value="Old">Old Product</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlSelect1">Product Status</label>
                                    <div class="radio-group">
                                        <label>
                                            <input type="radio" name="pstatus" value="1" checked>
                                            Active
                                        </label>
                                        <label>
                                            <input type="radio" name="pstatus" value="2">
                                            Inactive
                                        </label>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input type="file" name="bimg" class="form-control-file" id="exampleFormControlFile1">
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary mt-4"><i class="fa-solid fa-plus"></i> Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
