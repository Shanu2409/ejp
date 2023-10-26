<%-- 
    Document   : UpdateEmp
    Created on : Sep 10, 2023, 1:46:26 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" import="java.sql.*" %>
<html><body>
<h1>Employee Record Update</h1>
<%
    String eno=request.getParameter("txtEno");
    String name=request.getParameter("txtName");
    String age = request.getParameter("txtAge");
    String sal = request.getParameter("txtSal");
    try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/demo","root","root");
        PreparedStatement stmt = con.prepareStatement("select * from emp where empid=?");
        stmt.setString(1, eno);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            out.println("<h1>Employee "+name+" Exists</h1>");
            PreparedStatement pst1= con.prepareStatement("update emp set salary=? where empid=?");
            PreparedStatement pst2= con.prepareStatement("update emp set age=? where empid=?");
            pst1.setString(1, sal); pst1.setString(2, eno);
            pst2.setString(1, age); pst2.setString(2, eno);
            pst1.executeUpdate(); pst2.executeUpdate();
        }
        else{
            out.println("<h1>Employee Record not exist !!</h1>");
    }
    }catch(Exception e){out.println(e);}
%>
</body></html>
