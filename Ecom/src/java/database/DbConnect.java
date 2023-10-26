/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;

/**
 *
 * @author shanu
 */
public class DbConnect {

    public static Connection getCon() {
        try {
            //Class.forName("org.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?autoReconnect=true&useSSL=false", "root", "notadmin");
            
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * from User");
            
            while(rs.next()) {
                System.out.println(rs.getString(1));
            }

            return con;
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e.getMessage());
        }
        
        return null;
    }
    
    
    
    public static void main(String[] args) {
        System.out.println(getCon());
    }
}
