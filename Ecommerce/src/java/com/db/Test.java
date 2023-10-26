/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author shanu
 */
public class Test {
    public static boolean test(){
        try {
//        Class.forName("org.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "notadmin");
            
            return con.isReadOnly();
            
            
            
//            System.out.println(con);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
        
    }
    
    
    public static void main(String a[]) throws SQLException {
        System.out.println(test());
    }
}
