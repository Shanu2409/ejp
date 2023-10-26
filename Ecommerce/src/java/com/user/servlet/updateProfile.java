package com.user.servlet;


import com.DAO.UserDAOImpl;
import com.db.DbConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author shanu
 */

@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            PrintWriter out = resp.getWriter();
            User us = new User();
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String password = req.getParameter("pass");
            int id = Integer.parseInt(req.getParameter("id"));
            
            us.setId(id);
            us.setEmail(email);
            us.setName(name);
            us.setPhone(phone);
            
//            out.println(name + id);
            
            UserDAOImpl dao = new UserDAOImpl(DbConnect.getCon());
            
            boolean f = dao.checkPassword(id, password);
            
            
            
            HttpSession sesstion = req.getSession();
            if(f) {
                boolean check = dao.updateProfile(us);
                
                if(check){
//                System.out.println("success");
                sesstion.setAttribute("sucsMsg", "User Successfuly Updated.");
                User uss = dao.userLogin(email, password);
                sesstion.setAttribute("userObj", uss);
                resp.sendRedirect("editProfile.jsp");
            } else {
//                System.out.println("Error");
                sesstion.setAttribute("failMsg", "Something went Wrong");
                resp.sendRedirect("editProfile.jsp");
            }
            } else {
                sesstion.setAttribute("PassWrng", "Password Incorrect");
                resp.sendRedirect("editProfile.jsp");
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
}
