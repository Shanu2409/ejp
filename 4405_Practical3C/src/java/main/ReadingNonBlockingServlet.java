package main;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ReadingNonBlockingServlet", urlPatterns = {"/ReadingNonBlockingServlet"}, asyncSupported=true)
public class ReadingNonBlockingServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>File Reading Servlet Using Non Blocking I/O</title>");            
            out.println("</head>");
            out.println("<body>");
            AsyncContext context = request.startAsync();
            ServletInputStream inputStream = request.getInputStream();
            inputStream.setReadListener(new ReadingListener(inputStream, context));
            out.println("</body>");
            out.println("</html>");
        }
    }
}
