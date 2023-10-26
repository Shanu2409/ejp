<%-- 
    Document   : setting
    Created on : 8 Sep, 2023, 7:09:24 PM
    Author     : shanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings</title>
        <%@include file="Component/allCss.jsp" %>
        <style>
            a, a:hover{
                text-decoration: none;
                color:  black;
            }
            
        </style>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="/Login.jsp" />
        </c:if>
        
        <div class="container">
            <h3 class="text-center">Hello user!!</h3>
            <c:if test="${not empty failMsg}">
                                <h5 class="text-center text-danger mb-2">${failMsg}</h5>
                                <c:remove var="failMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty sucsMsg}">
                                <h5 class="text-center text-success mb-2">${sucsMsg}</h5>
                                <c:remove var="sucsMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty PassWrng}">
                                <h5 class="text-center text-warning mb-2">${sucsMsg}</h5>
                                <c:remove var="sucsMsg" scope="session" />
                            </c:if>
            <div class="row p-5">
                
                <!--sell old books-->
                
                
                
                
                <!--Edit profile-->
                
                
                <div class="col-md-12">
                    <a href="editProfile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-pen-to-square fa-3x text-danger"></i>
                                <h3>Edit Profile</h3>
                            </div>
                        </div>
                    </a>
                </div>
                
                
                <!--your orders-->
                
                
                <div class="col-md-6 mt-3">
                    <a href="orders.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-box-open fa-3x text-warning"></i>
                                <h3>Your Orders</h3>
                            </div>
                        </div>
                    </a>
                </div>
                
                <!--need help-->
                
                
                <div class="col-md-6 mt-3">
                    <a href="help.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-handshake-angle fa-3x text-success"></i>
                                <h3>Need Help ?</h3>
                                
                                
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
