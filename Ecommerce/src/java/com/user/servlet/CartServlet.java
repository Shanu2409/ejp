/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.CartDAOImpl;
import com.DAO.ProductsDAOImpl;
import com.db.DbConnect;
import com.entity.Cart;
import com.entity.ProductDetails;
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
@WebServlet("/cart")
public class CartServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int pid = Integer.parseInt(req.getParameter("pid"));
            int uid = Integer.parseInt(req.getParameter("uid"));
            
            PrintWriter out = resp.getWriter();
            
//            out.println(pid);
//            out.println(uid);
            
            ProductsDAOImpl dao = new ProductsDAOImpl(DbConnect.getCon());
            ProductDetails p = dao.getProductDetailById(pid);
            
            Cart c = new Cart();
            c.setPid(pid);
            c.setUserId(uid);
            c.setProductName(p.getProductname());
            c.setOwner(p.getOwner());
            c.setPrice(Double.parseDouble(p.getPrice()));
            c.setTotal(Double.parseDouble(p.getPrice()));
            
            CartDAOImpl cartDao = new CartDAOImpl(DbConnect.getCon());
            boolean f = cartDao.addCard(c);
            
            HttpSession session = req.getSession();
            if (f) {
//                out.println("sucessful");
                session.setAttribute("addCart", "Product added to cart");
                resp.sendRedirect("all_recent_products.jsp");
            } else {
                session.setAttribute("failed", "Something went wrong");
                resp.sendRedirect("all_recent_product.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
