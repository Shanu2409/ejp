<%-- 
    Document   : editProfile
    Created on : 8 Sep, 2023, 7:32:34 PM
    Author     : shanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
        <%@include file="Component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="Component/navbar.jsp" %>
        <c:if test="${empty userObj}">
            <c:redirect url="/Login.jsp" />
        </c:if>

        <div class="container p-4">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center mb-4 text-primary">Edit Profile</h4>
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
                            <form action="updateProfile" method="post">
                                <input hidden="" name="id" value="${userObj.id}" />
                                <div class="form-group">
                                    <label for="exampleInputName">Enter full Name</label>
                                    <input type="text" class="form-control" id="exampleInputName" required aria-describedby="emailHelp" name="fname" value="${userObj.name}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" required aria-describedby="emailHelp" name="email" value="${userObj.email}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPhone">Phone number</label>
                                    <input type="number" class="form-control" required id="exampleInputPhone" aria-describedby="emailHelp" name="phone" value="${userObj.phone}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password <span class="text-danger">(Verify)</span></label>
                                    <input type="password" class="form-control" required id="exampleInputPassword1" name="pass">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary mt-4"><i class="fa-solid fa-pen-to-square"></i> Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
