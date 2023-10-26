package com.logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/register"})
public class Register extends HttpServlet {
    
    public static void getDb(String name, String email, String pass) {
        Connection con = null;
         try {
//            Class.forName("org.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/4455?autoReconnect=true&useSSL=false", "root", "root");
            
//             String pass = "67897";
//        String name = "hnseori";
//        String email = "of98wy8";
        
//        PrintWriter out = response.getWriter();
        
            String sql = "insert into users values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            
            int i = ps.executeUpdate();
            
        
        if(i == 1) System.out.println("Successfully Created");
            else System.out.println("something went wrong");
            

        } catch (SQLException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
//        return con;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        int i = 0;

//        String name = request.getParameter("username");
//        String pass = request.getParameter("password");
//        String email = request.getParameter("email");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection con = null;
        try {
//            Class.forName("org.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/4455?autoReconnect=true&useSSL=false", "root", "root");


             String pass = "67897";
            String name = "hnseori";
            String email = "of98wy8";
//        PrintWriter out = response.getWriter();
//            String sql = "insert into users values(?,?,?)";
//            String sql = "select * form users";
//            
//            PreparedStatement ps = con.prepareStatement(sql);
//            
//            ResultSet rs = ps.executeQuery();
//            
//            while(rs.next()) {
//                System.out.println(rs.getString(1));
//                System.out.println(rs.getString(2));
//                System.out.println(rs.getString(3));
//            }
            
            getDb("nu", "h", u);
            
//            PreparedStatement ps = con.prepareStatement(sql);
//
//            ps.setString(1, name);
//            ps.setString(2, email);
//            ps.setString(3, pass);
//
//            int i = ps.executeUpdate();
//
//            if (i == 1) {
//                out.println("Successfully Created");
//            } else {
//                out.println("something went wrong");
//            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } 

//        PreparedStatement ps = con.
    }

}
