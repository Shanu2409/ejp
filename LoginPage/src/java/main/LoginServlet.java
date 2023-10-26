package main;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("txtId");
        String upass = request.getParameter("txtPass");
        if(uname.equals("admin") && upass.equals("12345")){
            out.println("<h1> Welcome !!! "+uname+"</h1>");
        }
        else{
            out.println("<h1> Login Fail !!! </h1>");
        }
    }
}
