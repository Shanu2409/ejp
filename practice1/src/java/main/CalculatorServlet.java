package main;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(urlPatterns = {"/CalculatorServlet"})
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        double n1 = Double.parseDouble(request.getParameter("t1"));
        double n2 = Double.parseDouble(request.getParameter("t2"));
        double result =0;
        String option=request.getParameter("option");
        if(option.equals("+")) result=n1+n2;
        if(option.equals("-")) result=n1-n2;
        if(option.equals("*")) result=n1*n2;
        if(option.equals("/")) result=n1/n2;
        out.println("<h1> Result = "+result+"</h1>");
    }
}
