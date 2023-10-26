package main;

import java.io.*;
import java.net.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.*;

@WebServlet(name = "NonBlockingServlet", urlPatterns = {"/NonBlockingServlet"})
public class NonBlockingServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String filename = "/WEB-INF/booklist.txt";
        ServletContext context = getServletContext();
        InputStream inputStream = context.getResourceAsStream(filename);
        try (PrintWriter out = response.getWriter()) {
            String path = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/ReadingNonBlockingServlet";
            out.println("<html>");
            out.println("<head>");
            out.println("<title>File Reader to demonstrate a Non Blocking I/O Servlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>File Reader</h1>");
            out.flush();
            URL url = new URL(path);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setChunkedStreamingMode(2);
            conn.setDoOutput(true);
            conn.connect();
            if (inputStream != null) {
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
                BufferedReader bufferReader = new BufferedReader(inputStreamReader);
                String text = "";
                System.out.println("Reading started...");
                try (BufferedWriter bufferWriter = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()))) {
                    out.println("<div style='width=100%;height:450px;overflow:scroll;'>");
                    while ((text = bufferReader.readLine()) != null) {
                        out.println("<div style='background-color:lavender;width=100%;'>");
                        out.println(text);
                        out.println("</div><br/>");
                        out.flush();
                        bufferWriter.write(text);
                        Thread.sleep(1000);
                        out.flush();
                    }
                    out.println("</div>");
                    System.out.println("Reading completed...");
                    bufferWriter.flush();
                    bufferWriter.close();
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (InterruptedException | IOException ex) {
            Logger.getLogger(NonBlockingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
