package com.DAO;

import com.entity.Cart;
import com.entity.ProductDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
public class CartDAOImpl implements CartDAO{
    private Connection con;

    public CartDAOImpl(Connection con) {
        this.con = con;
    }
    
    

    @Override
    public boolean addCard(Cart c) {
        boolean f = false;
        try {
            String sql = "insert into cart(pid,uid,pname,owner,price,total) values(?,?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, c.getPid());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getProductName());
            ps.setString(4, c.getOwner());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotal());
            
            int i = ps.executeUpdate();
            
            
            
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<Cart> getBookByUser(int uid) {
        List<Cart> plist = new ArrayList<Cart>();
        double total = 0;
        
        try {
            String sql = "select * from cart where uid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, uid);
            ResultSet rs =  ps.executeQuery();
            
            while(rs.next()){
                Cart p = new Cart();
                
                p.setCid(rs.getInt(1));
                p.setPid(rs.getInt(2));
                p.setUserId(rs.getInt(3));
                p.setProductName(rs.getString(4));
                p.setOwner(rs.getString(5));
                p.setPrice(rs.getDouble(6));
                
                total = total + rs.getDouble(7);
                
                p.setTotal(total);
                
                
                plist.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return plist;
    }

    @Override
    public boolean deleteProduct(int pid, int cid) {
        boolean f = false;
        
        try {
            String sql = "delete from cart where pid = ? and cid = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setInt(1, pid);
            ps.setInt(2, cid);
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
