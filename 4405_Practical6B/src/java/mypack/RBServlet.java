package mypack;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.ejb.EJB;
import mybeans.RRBean;
public class RBServlet extends HttpServlet {
@EJB RRBean obj;
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException{
PrintWriter out=response.getWriter();
String rt=request.getParameter("txtType");
String cn=request.getParameter("txtCust");
String cm=request.getParameter("txtMob");
String msg = obj.roomBook(rt, cn, cm);
out.println(msg);
}}
