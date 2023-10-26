<%-- 
    Document   : cart
    Created on : 8 Sep, 2023, 2:46:01 PM
    Author     : shanu
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <%@include file="Component/allCss.jsp" %>
    </head>
    <body style="background-color: #f0f1f2">
        <c:if test="${empty userObj}">
            <c:redirect url="Login.jsp"></c:redirect>
        </c:if>
        <%@include file="Component/navbar.jsp" %>

        <% Double total = 0.0; %>



        <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">
                Successfully deleted from the Cart
            </div>

            <c:remove var="succMsg" scope="session" />
        </c:if>

        <c:if test="${not empty failed}">
            <div class="alert alert-danger" role="alert">
                Something went wrong
            </div>

            <c:remove var="failed" scope="session" />
        </c:if>

        <c:if test="${not empty OrderFailMsg}">
            <h5 class="text-center text-danger mb-2">${OrderFailMsg}</h5>
            <c:remove var="OrderFailMsg" scope="session" />
        </c:if>

        <div class="container">
            <div class="row p-2">
                <div class="col-md-6">
                    <div class="card bg-white mt-5">
                        <h3 class="text-center text-success">Your Product</h3>
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Owner</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        User u = (User) session.getAttribute("userObj");
                                        CartDAOImpl dao = new CartDAOImpl(DbConnect.getCon());

                                        List<Cart> cList = dao.getBookByUser(u.getId());

                                        for (Cart c : cList) {
                                            total = c.getTotal();
                                    %>
                                    <tr>
                                        <th scope="row"><%= c.getProductName()%></th>
                                        <td><%= c.getOwner()%></td>
                                        <td><%= c.getPrice()%></td>
                                        <td>
                                            <a href="removeProduct?pid=<%= c.getPid()%>&&cid=<%= c.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
                                        </td>
                                    </tr>

                                    <% }%>

                                    <tr>
                                        <td>Total Price</td>
                                        <td></td>
                                        <td></td>
                                        <td><i class="fa-solid fa-rupee-sign"></i> <span class="fa-solid">  <%= total%></span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card bg-white mt-5">
                        <h3 class="text-center text-success">Your details</h3>
                        <div class="card-body">
                            <form action="order" method="post">

                                <input required="" hidden="" name="id" value="${userObj.id}" />

                                <!--name and email--> 
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Name</label>
                                        <input required="" type="text" class="form-control" name="name" id="inputEmail4" value="${userObj.name}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Email</label>
                                        <input required="" type="email" class="form-control" name="email" id="inputPassword4" value="${userObj.email}">
                                    </div>
                                </div>


                                <!--mobile and address--> 


                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Mobile No.</label>
                                        <input required="" type="number" class="form-control" name="phone" id="inputEmail4" value="${userObj.phone}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input required="" type="text" class="form-control" name="adrs" id="inputPassword4">
                                    </div>
                                </div>

                                <!--landmark and city-->



                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">LandMark</label>
                                        <input required="" type="text" class="form-control" name="land" id="inputEmail4">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">City</label>
                                        <input required="" type="text" class="form-control" name="city" id="inputPassword4">
                                    </div>
                                </div>

                                <!--state and pin code-->


                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">State</label>
                                        <select name="state" id="inputState" class="form-control">
                                            <option value="Andhra Pradesh">Andhra Pradesh</option>
                                            <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                            <option value="Assam">Assam</option>
                                            <option value="Bihar">Bihar</option>
                                            <option value="Chhattisgarh">Chhattisgarh</option>
                                            <option value="Goa">Goa</option>
                                            <option value="Gujarat">Gujarat</option>
                                            <option value="Haryana">Haryana</option>
                                            <option value="Himachal Pradesh">Himachal Pradesh</option>
                                            <option value="Jharkhand">Jharkhand</option>
                                            <option value="Karnataka">Karnataka</option>
                                            <option value="Kerala">Kerala</option>
                                            <option value="Madhya Pradesh">Madhya Pradesh</option>
                                            <option value="Maharashtra">Maharashtra</option>
                                            <option value="Manipur">Manipur</option>
                                            <option value="Meghalaya">Meghalaya</option>
                                            <option value="Mizoram">Mizoram</option>
                                            <option value="Nagaland">Nagaland</option>
                                            <option value="Odisha">Odisha</option>
                                            <option value="Punjab">Punjab</option>
                                            <option value="Rajasthan">Rajasthan</option>
                                            <option value="Sikkim">Sikkim</option>
                                            <option value="Tamil Nadu">Tamil Nadu</option>
                                            <option value="Telangana">Telangana</option>
                                            <option value="Tripura">Tripura</option>
                                            <option value="Uttar Pradesh">Uttar Pradesh</option>
                                            <option value="Uttarakhand">Uttarakhand</option>
                                            <option value="West Bengal">West Bengal</option>
                                            <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                            <option value="Chandigarh">Chandigarh</option>
                                            <option value="Dadra and Nagar Haveli and Daman and Diu">Dadra and Nagar Haveli and Daman and Diu</option>
                                            <option value="Lakshadweep">Lakshadweep</option>
                                            <option value="Delhi">Delhi</option>
                                            <option value="Puducherry">Puducherry</option>
                                            <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                            <option value="Ladakh">Ladakh</option>
                                        </select>

                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Pin code</label>
                                        <input required="" type="text" class="form-control" name="pin" id="inputPassword4">
                                    </div>
                                </div>


                                <!--payment type--> 


                                <div class="form-group">
                                    <label>Payment Mode</label>
                                    <select class="form-control" name="pay">
                                        <option>Cash on delivery</option>
                                        <option>Kidney</option>
                                        <option>Byte-Coin</option>
                                        <option>Joke</option>
                                    </select>
                                </div>

                                <!--order now and continue shopping-->

                                <div class="text-center">

                                    <button type="submit" class="btn btn-primary">Order Now</button>
                                    <a href="/E_Com/" class="btn btn-secondary">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
