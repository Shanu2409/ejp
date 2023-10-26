/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

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
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();   
            session.removeAttribute("userObj");
            
            HttpSession session2 = req.getSession();
            session2.setAttribute("sucsMsgLotout", "LogOut Successfully");
            
            resp.sendRedirect("Login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
