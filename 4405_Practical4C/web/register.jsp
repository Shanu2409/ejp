<%-- 
    Document   : register
    Created on : Sep 10, 2023, 1:20:01 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" import="java.sql.*"%>
<html><body>
        <h1>Registration JSP Page</h1>
        <%
            String uname = request.getParameter("txtName");
            String pass1 = request.getParameter("txtPass1");
            String pass2 = request.getParameter("txtPass2");
            if (pass1.equals(pass2)) {
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/demo", "root", "root");
                    PreparedStatement stmt = con.prepareStatement("insert into users values (?,?)");
                    stmt.setString(1, uname);
                    stmt.setString(2, pass1);
                    int row = stmt.executeUpdate();
                    if (row == 1) {
                        out.println("Registration Successful");
                    } else {
                        out.println("Registration Fail !!!!");
        %>
        <jsp:include page="register.html" ></jsp:include>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        } else {
            out.println("<h1>Password Mismatch</h1>");
        %>
        <jsp:include page="register.html" ></jsp:include>
        <% }
        %>
    </body></html>