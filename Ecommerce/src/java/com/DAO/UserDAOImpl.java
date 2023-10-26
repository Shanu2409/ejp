/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.User;
import java.sql.*;

/**
 *
 * @author shanu
 */
public class UserDAOImpl implements UserDAO{
    private Connection con;

    public UserDAOImpl(Connection con) {
        super();
        this.con = con;
    }

    @Override
    public boolean userRegister(User us) {
        
        boolean f = false;
        
        try {
            String sql = "insert into user(name, email, phone, password) values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());
            
            int i = ps.executeUpdate();
            
            if(i == 1) return true;
            
         } catch (Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }

    @Override
    public User userLogin(String email, String password) {
        User us = null;
        
        try {
            String sql = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));
                us.setLandmark(rs.getString(7));
                us.setCity(rs.getString(8));
                us.setState(rs.getString(9));
                us.setPincoe(rs.getString(10));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return us;
    }

    @Override
    public boolean checkPassword(int id, String pass) {
        boolean f = false;
        try {
            String sql = "select * from user where id = ? and password = ?";
            
            System.out.println(id + pass + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            
            PreparedStatement ps = con.prepareCall(sql);
            
            ps.setInt(1, id);
            ps.setString(2, pass);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println(f);
        return f;
    }

    @Override
    public boolean updateProfile(User us) {
        boolean f = false;
        
        try {
            String sql = "update user set name = ?, email = ?, phone = ? where id = ?";
            
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setInt(4, us.getId());
            
            int i = ps.executeUpdate();
            
            if (i == 1) {
                f = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
}
