<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid p-3">
    <div class="row">
        <div class="mr-5 text-center">
            <h3><a href="/ECom" class="text-secondary">Kitaab</a></h3>
        </div>
        <div class="">

            <c:if test="${not empty userObj}">
                <a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa-solid fa-arrow-up-right-from-square"></i> Log Out</a>
            </c:if>

            <c:if test="${empty userObj}">
                <a href="Login.jsp" class="btn btn-danger"> Login</a>
                <a href="Register.jsp" class="btn btn-secondary"> Register</a>
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
                <a href="logout" type="button"  class="btn btn-secondary">Haan!!! abhi ke abhi</a>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/E_Com"> Home <span class="sr-only">(current)</span></a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item active">
                    <a class="nav-link" href="all_recent_products.jsp">All Books</a>
                </li>
            </ul>
            <a href="setting.jsp" class="btn btn-light my-2 my-sm-0 ml-5" type="submit">Support Us</a>
        </form>
    </div>
</nav>