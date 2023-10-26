/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.db.DbConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**

 * @author shanu
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private String adminEmail = "admin@test.com";
    private String adminPassword = "N0tadmin";

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            PrintWriter out = resp.getWriter();
            String email = req.getParameter("email");
            String password = req.getParameter("pass");
            String ch = req.getParameter("checkbox") == null ? "no" : "yes";
            Connection con = DbConnect.getCon();
            UserDAOImpl dao = new UserDAOImpl(con);
            HttpSession session = req.getSession();
//            out.println(email+password+ch);
            if (email.equals(adminEmail) && password.equals(adminPassword)) {
                User us = new User();
                us.setName("Admin");
                session.setAttribute("userObj", us);
                resp.sendRedirect("Admin/AdminHome.jsp");
            } else {
                // not admin

                User us = dao.userLogin(email, password);

                if (us != null) {
                    session.setAttribute("userObj", us);
                    resp.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("failMsg", "User & Passwordre Invaild");
                    resp.sendRedirect("Login.jsp");
                }

            }

        } catch (Exception e) {

        }
    }

}
