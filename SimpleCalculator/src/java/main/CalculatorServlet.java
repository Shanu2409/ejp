package main;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        double n1 = Double.parseDouble(request.getParameter("txtN1"));
        double n2 = Double.parseDouble(request.getParameter("txtN2"));
        double result =0;
        String opr=request.getParameter("opr");
        if(opr.equals("+")) result=n1+n2; if(opr.equals("-")) result=n1-n2;
        if(opr.equals("*")) result=n1*n2; if(opr.equals("/")) result=n1/n2;
        out.println("<h1> Result = "+result+"</h1>");
    }
}
