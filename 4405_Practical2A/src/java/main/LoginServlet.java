package main;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("t1");
        String upass = request.getParameter("t2");
        if(uname.equals("admin") && upass.equals("password")){
            RequestDispatcher rd = request.getRequestDispatcher("/WelcomeServlet");
            rd.forward(request, response);
        } else {
            out.println("<h1> Login Fail !!! </h1>");
            RequestDispatcher rd = request.getRequestDispatcher("/index.html");
            rd.include(request, response);
        }
    }
}
