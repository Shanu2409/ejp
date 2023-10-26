package main;

import javax.ejb.EJB;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import pack1.CurrencyBeanLocal;

@WebServlet(name = "ConverterServlet", urlPatterns = {"/ConverterServlet"})
public class ConverterServlet extends HttpServlet {
    @EJB
    CurrencyBeanLocal obj;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        double amount = Double.parseDouble(request.getParameter("amount"));
        if(request.getParameter("type").equals("inrToDlr"))
        {
            out.println(amount  + " Rupees = " + obj.inrToDlr(amount) + " Dollors");
        } else if (request.getParameter("type").equals("dlrToInr"))
        {
            out.println(amount  + " Dollors = " + obj.dlrToInr(amount) + "  Rupees");
        }
    }
}
