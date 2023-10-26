package main;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "FileUploadServlet", urlPatterns = {"/FileUploadServlet"})
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String path=request.getParameter("destination");
        Part filePart=request.getPart("file");
        String filename=filePart.getSubmittedFileName().toString();
        out.print("<br><br><hr> file name: "+filename);
        OutputStream os=null;
        InputStream is=null;
        try {
            os=new FileOutputStream(new File(path+File.separator+filename));
            is=filePart.getInputStream();
            int read=0;
            while ((read = is.read()) != -1) {
                os.write(read);
            }
            out.println("<br>file uploaded sucessfully...!!!");
        }
        catch(FileNotFoundException e){out.print(e);}
    }
}
