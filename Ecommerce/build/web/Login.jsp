<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Commerce Login</title>
        <%@include file="Component/allCss.jsp" %>
        <style>
            body {
                background-color: #f0f1f2;
            }
        </style>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>

        <div class="container p-4">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center my-2">Login Page</h4>
                            <c:if test="${not empty failMsg}">
                                <h5 class="text-center text-danger mb-2">${failMsg}</h5>
                                <c:remove var="failMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty sucsMsgLotout}">
                                <h5 class="text-center text-success mb-2">${sucsMsgLotout}</h5>
                                <c:remove var="sucsMsgLotout" scope="session" />
                            </c:if>

                            <form action="login" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" required aria-describedby="emailHelp" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" required id="exampleInputPassword1" name="pass">
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="checkbox">
                                    <label class="form-check-label" for="exampleCheck1">Keep you sign in forever ?</label>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary mt-4"><i class="fa-solid fa-right-to-bracket"></i> Login</button>
                                </div>
                                <div class="text-center mt-2">
                                    <a href="Register.jsp">Create Account </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="Component/footer.jsp" %>
    </body>
</html>
