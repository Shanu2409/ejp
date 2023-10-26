/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.DAO.ProductsDAOImpl;
import com.db.DbConnect;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/delete")
public class DeleteProducts extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("Pid"));
            
             ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
             
             boolean f = dao.DeleteProducts(id);
             HttpSession sesstion = req.getSession();
            
            if(f) {
                sesstion.setAttribute("sucsMsg", "Book Deleted successfully!!");
                resp.sendRedirect("Admin/AllProducts.jsp");
            } else {
                sesstion.setAttribute("failMsg", "Something went wrong");
                resp.sendRedirect("Admin/AllProducts.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
