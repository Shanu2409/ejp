/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.CartDAOImpl;
import com.db.DbConnect;
import com.sun.net.httpserver.HttpServer;
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

@WebServlet("/removeProduct")
public class RemoveProductServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pid = Integer.parseInt(req.getParameter("pid"));
        int cid = Integer.parseInt(req.getParameter("cid"));
        
        CartDAOImpl dao = new CartDAOImpl(DbConnect.getCon());
        
        boolean f = dao.deleteProduct(pid, cid);
        HttpSession session = req.getSession();
        
        if(f){
            session.setAttribute("succMsg", "Book Removed form the Cart");
            resp.sendRedirect("checkout.jsp");
        } else {
            session.setAttribute("failed", "Something went wrong");
            resp.sendRedirect("checkout.jsp");
        }
    }
    
}
