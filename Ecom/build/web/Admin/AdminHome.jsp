<%-- 
    Document   : AdminHome
    Created on : 17 Aug, 2023, 8:38:30 PM
    Author     : shanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="allCssAdmin.jsp" %>
        <title>E-Commerce Admin</title>
        <style>
            a, a:hover {
                cursor: pointer;
                text-decoration: none;
                color: black;
            }

            .bottomFooter {
                position: absolute;
                bottom: 0;
                width: 100%;
                text-align: center;
                background-color: #f0f0f0;
                padding: 10px;
            }

        </style>
    </head>
    <body>
        <%@include file="navbarAdmin.jsp" %>

        <c:if test="${empty userObj}">
            <c:redirect url="../Login.jsp" />
        </c:if>

        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="AddProducts.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-square-plus text-primary fa-3x"></i> <br />
                                <h4>Add Products</h4>
                            </div>
                        </div>
                    </a>

                </div>

                <div class="col-md-3">
                    <a href="AllProducts.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-brands fa-shopify text-danger fa-3x"></i> <br />
                                <h4>All Products</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="Orders.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-truck-fast text-warning fa-3x"></i> <br />
                                <h4>Orders</h4>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a  data-toggle="modal" data-target="#exampleModalCenter"> 
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-arrow-up-right-from-square fa-3x"></i> <br />
                                <h4>Log Out</h4>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <!--logout modal-->


        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Bhai ek bar aur sochle</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Pakka log out karna hai na ????
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">chal jaane de</button>
                        <a href="../logout" type="button"  class="btn btn-primary">Haan!!! abhi ke abhi</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="bottomFooter">
            <%@include file="../Component/footer.jsp" %>
        </div>
    </body>
</html>
