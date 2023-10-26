/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.DAO.ProductsDAOImpl;
import com.db.DbConnect;
import com.entity.ProductDetails;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shanu
 */
@WebServlet("/EditProducts")
public class EditProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
//            String id = req.getParameter("Pid");
            
            System.out.println(id);
            String pname = req.getParameter("pname");
            String powner = req.getParameter("powner");
            String price = req.getParameter("price");
            String pcategory = req.getParameter("status").equals(null) ? "Unactive" : req.getParameter("status") ;
            
            

            ProductDetails p = new ProductDetails();

            p.setProductId(id);
            p.setProductname(pname);
            p.setPrice(price);
            p.setOwner(powner);
            p.setStatus(pcategory);

            ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
            boolean f = dao.UpdateEditProducts(p);
            
            HttpSession sesstion = req.getSession();
            
            if(f) {
                sesstion.setAttribute("sucsMsg", "Book Updated successfully!!");
                resp.sendRedirect("Admin/AllProducts.jsp");
            } else {
                sesstion.setAttribute("failMsg", "SOmething went wrong");
                resp.sendRedirect("Admin/AllProducts.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
