/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.logic;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class db {
    public static void getDb(String name, String email, String pass) {
        Connection con = null;
         try {
//            Class.forName("org.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/4455", "root", "root");
            
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
    
    
    public static void main(String[] args) {
//        System.out.println();
        getDb("2345672345678", "jho", "ibnoiu");
    }
}
