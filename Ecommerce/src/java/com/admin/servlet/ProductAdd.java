/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.DAO.ProductsDAOImpl;
import com.db.DbConnect;
import com.entity.ProductDetails;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author shanu
 */
@WebServlet("/AddProducts")
@MultipartConfig
public class ProductAdd extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String pname = req.getParameter("pname");
            String powner = req.getParameter("powner");
            String price = req.getParameter("price");
            String pcategory = req.getParameter("pcategory");
            String pstatus = req.getParameter("pstatus");

            if (pstatus != null && pstatus.equals("2")) {
                pstatus = "Inactive";
            } else {
                pstatus = "Active";
            }

            Part part = req.getPart("bimg"); // to collec the binary data (img)

            String fileName = part.getSubmittedFileName();

            ProductDetails b = new ProductDetails(pname, powner, price, pcategory, pstatus, fileName, "admin@test.com");
//            System.out.println(b);

            ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());

            System.out.println("Status : " + pstatus + "---------------------------------------");
            
//            System.out.println(b);

            boolean f = dao.AddProducts(b);
            
            System.out.println(f + "2345678902345678923456789");

            HttpSession sesstion = req.getSession();

            if (f) {
                String path = getServletContext().getRealPath("") + File.separator + "products"; // Use File.separator for cross-platform compatibility

// Create the directory if it doesn't exist
                File directory = new File(path);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                String filePath = path + File.separator + fileName;

                File targetFile = new File(filePath);
                if (targetFile.exists()) {
                    // Generate a unique file name to avoid overwriting
                    int counter = 1;
                    String baseFileName = fileName.substring(0, fileName.lastIndexOf('.'));
                    String fileExtension = fileName.substring(fileName.lastIndexOf('.'));
                    while (targetFile.exists()) {
                        fileName = baseFileName + "_" + counter + fileExtension;
                        filePath = path + File.separator + fileName;
                        targetFile = new File(filePath);
                        counter++;
                    }
                }

                try (InputStream inputStream = part.getInputStream()) {
                    Files.copy(inputStream, targetFile.toPath());
                    // Now the file is saved in the specified path
                } catch (IOException e) {
                    // Handle the exception appropriately
                    e.printStackTrace();
                }

                sesstion.setAttribute("sucsMsg", "Product Added Successfully");
                resp.sendRedirect("Admin/AddProducts.jsp");
            } else {
                sesstion.setAttribute("failMsg", "Something went wrong");
                resp.sendRedirect("Admin/AddProducts.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
