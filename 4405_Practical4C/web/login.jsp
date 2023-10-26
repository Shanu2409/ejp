<%-- 
    Document   : login
    Created on : Sep 10, 2023, 1:22:58 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" import="java.sql.*"%>
<html><body>
        <h1>Registration JSP Page</h1>
        <%
            String uname = request.getParameter("txtName");
            String pass = request.getParameter("txtPass");
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/demo", "root", "root");
                PreparedStatement stmt = con.prepareStatement("select password from users where username=?");
                stmt.setString(1, uname);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    if (pass.equals(rs.getString(1))) {
                        out.println("<h1>LOGIN SUCCESSFULLL</h1>");
                    }
                } else {
                    out.println("<h1>User Name not exist!!</h1>");
        %>
        <jsp:include page="register.html" ></jsp:include>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body></html>
