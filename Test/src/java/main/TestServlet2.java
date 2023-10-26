package main;

import java.io.*;
import jakarta.servlet.*;

public class TestServlet2 extends GenericServlet {

    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        System.out.println("This is Generic Servlet");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<h2>This is My Generic Servlet</h2>");
    }
}
