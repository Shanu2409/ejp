<%-- 
    Document   : index
    Created on : Sep 11, 2023, 7:53:52 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mypack.MarksEntryBean"%>
<%@page import="javax.naming.InitialContext"%>
<!DOCTYPE html>
<%!
    private static MarksEntryBean obj;
    public void jspInit(){
        try{
            InitialContext ic = new InitialContext();
        }catch(Exception e){
            
        }
    }
%>
<%
    if(request.getParameter("InsertMarks") != null){
        String sname;
        int marks1,marks2,marks3;
        sname = request.getParameter("name");
        marks1 = Integer.parseInt(request.getParameter("m1"));
        marks2 = Integer.parseInt(request.getParameter("m2"));
        marks3 = Integer.parseInt(request.getParameter("m3"));
        obj.addMarks(sname, marks1, marks2, marks3);
        out.println();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
         <h2>Enter Details</h2>
        <form name="result" method="post">
            Enter student's name: <input type='text' name="sname" /><br>
            Enter subject 1 marks: <input type='text' name="m1" /><br>
            Enter subject 2 marks: <input type='text' name="m2" /><br>
            Enter subject 3 marks: <input type='text' name="m3" /><br>
            <input type='submit' name="InsertMarks" /><br>
        </form>

    </body>
</html>
