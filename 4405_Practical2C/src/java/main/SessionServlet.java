package main;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "SessionServlet", urlPatterns = {"/SessionServlet"})
public class SessionServlet extends HttpServlet {
    private int counter;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("t1");
        String upass = request.getParameter("t2");
        HttpSession session = request.getSession(true);
        if(uname.equals("admin") && upass.equals("password")){
            out.println("<h2>Welcome " + uname + "</h2>");
            counter++;
            if (session.isNew() && counter == 1){
                session.setAttribute("user", uname);
                out.println("You have visited this page first time");
            } else {
                out.println("You have visited this page " + counter + " times");
            }
            out.println("<br><a href='LogoutServlet'> LogOut </a>");
        } else {
            out.println("<h2>Your credential are invalid</h2>");
        }
    }
}
