package main;

import java.io.*;
import jakarta.servlet.*;
import java.util.Date;

public class TestServlet implements Servlet {

    //Life Cycle Methods
    ServletConfig conf;

    public void init(ServletConfig conf) {
        this.conf = conf;
        System.out.println("Creating object.....");
    }

    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        System.out.println("Servicing.....");
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        out.println("<h2>This is my output fromm servlet</h2>");
        out.println("<h3>Todays Date and Time is " + new Date().toString() + "</h3>");
    }

    public void destroy() {
        System.out.println("Destroying.....");
    }

    //Non-Life Cycle Methods
    public ServletConfig getServletConfig() {
        return this.conf;
    }

    public String getServletInfo() {
        return "This Servlet is Created by Niraj";
    }
}
