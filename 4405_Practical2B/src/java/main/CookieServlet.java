package main;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "CookieServlet", urlPatterns = {"/CookieServlet"})
public class CookieServlet extends HttpServlet {
    private int i = 1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String k = String.valueOf(i);
        Cookie c = new Cookie("Visit", k);
        response.addCookie(c);
        int j = Integer.parseInt((c.getValue()));
        if(j == 1){
            out.println("<h1>This is first time you visited</h1>");
        } else {
            out.println("<h1>You have visited " + i + " Times.</h1>");
        }
        i++;
    }
}
