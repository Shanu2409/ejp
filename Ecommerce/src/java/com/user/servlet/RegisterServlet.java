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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            PrintWriter out = resp.getWriter();
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("pass");
            
            
//            out.println(name + email + phone + password);
            
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPassword(password);
            us.setPhone(phone);
            
            HttpSession sesstion = req.getSession();
            
            // --------------------------------------------- add a phnoe number and password validation -------------------------------------------------------------
            
            Connection con = DbConnect.getCon();
            
            UserDAOImpl dao = new UserDAOImpl(con);
            boolean f = dao.userRegister(us);
            
            if (f) {
//                System.out.println("success");
                sesstion.setAttribute("sucsMsg", "User Successfuly Registered.");
                resp.sendRedirect("Register.jsp");
            } else {
//                System.out.println("Error");
                sesstion.setAttribute("failMsg", "Something went Wrong");
                resp.sendRedirect("Register.jsp");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
