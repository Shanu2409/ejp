<%-- 
    Document   : guestbookview
    Created on : Oct 2, 2023, 8:36:27 PM
    Author     : Lenovo
--%>

<%@page import="org.hibernate.boot.registry.StandardServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.SessionFactory"%> 
<%@page import="org.hibernate.Session"%> 
<%@page import="org.hibernate.cfg.Configuration"%> 
<%@page import="org.hibernate.Transaction"%> 
<%@page import="java.util.List"%> 
<%@page import="java.util.Iterator"%> 
<%@page import="hibernate.Gb"%> 
<%! 
    SessionFactory sf; 
    org.hibernate.Session ss; 
    List<hibernate.Gb>gbook; 
%>

<%
   Configuration cf = new Configuration();   
   cf.configure("hibernate.cfg.xml");
   ServiceRegistry  serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cf.getProperties()).build();        
   sf = cf.buildSessionFactory(serviceRegistry);
   ss= sf.openSession(); 
   Transaction tx=null;
   Gb gb=new Gb(); 
    try 
    { 
        tx=ss.beginTransaction(); 
        int id=Integer.parseInt(request.getParameter("id")); 
        String uname=request.getParameter("name"); 
        String msg=request.getParameter("msg");
        gb.setUname(uname); 
        gb.setMsg(msg); 
        gb.setId(id); 
        ss.save(gb); 
        tx.commit(); 
        out.println("thank you for your feedback<br><br>");
        ss.close();
        
        ss= sf.openSession(); 
        tx=ss.beginTransaction(); 
        gbook=ss.createQuery("from Gb").list(); 
        Iterator it=gbook.iterator(); 
        while(it.hasNext()) 
            { 
                Gb eachrecord=(Gb)it.next(); 
                out.println("<br>GUEST BOOK VIEWS<br>");
                out.println(eachrecord.getId()+" "); 
                out.println(eachrecord.getUname()+"<br>"); 
                out.println(eachrecord.getMsg()+"<br><hr>"); 
            }
    } 
    catch(Exception e)
    { 
        out.println("Error "+e.getMessage()); 
    }
    
    %>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Guest View <br><br>
        Click here to go <a href="index.html"> BACK </a> 
        <br><br> 
        <% 
            /*Iterator it=gbook.iterator(); 
            out.println(it.hasNext());
            while(it.hasNext()) 
            { 
                Gb eachrecord=(Gb)it.next(); 
                out.println(eachrecord.getId()+" "); 
                out.println(eachrecord.getUname()+"<br>"); 
                out.println(eachrecord.getMsg()+"<br><hr>"); 
            }     */
        %>
    </body>
</html>

