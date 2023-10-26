<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3">
            <h3><a href="/E_Com">E-Commerce</a></h3>
        </div>
        <div class="col-md-6">
            
        </div>
        <div class="col-md-3">

            <c:if test="${not empty userObj}">
                <a href="checkout.jsp"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>
                <a href="/E_Com" class="btn btn-success"><i class="fas fa-user"></i> ${userObj.name}</a>
                <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa-solid fa-arrow-up-right-from-square"></i> Log Out</a>
            </c:if>

            <c:if test="${empty userObj}">
                <a href="Login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="Register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
            </c:if>
        </div>
    </div>
</div>


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
                <a href="logout" type="button"  class="btn btn-primary">Haan!!! abhi ke abhi</a>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/E_Com"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_recent_products.jsp">Recent Product</a>
            </li>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_products.jsp">New Product</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link disabled" href="all_old_products.jsp">Old product</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i>Setting</a>
            <a class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-address-book"></i> Contact Us</a>
        </form>
    </div>
</nav>