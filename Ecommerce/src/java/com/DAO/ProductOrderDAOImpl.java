/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Product_order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author shanu
 */
public class ProductOrderDAOImpl implements ProductOrderDAO{
    private Connection con;

    public ProductOrderDAOImpl(Connection con) {
        this.con = con;
    }


    @Override
    public boolean saveOrder(List<Product_order> p) {
        boolean f = false;
        
        try {
            String sql = "insert into product_order(order_id, user_name, email, address, phone, product_name, owner, price, payment) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            con.setAutoCommit(false);
            PreparedStatement ps = con.prepareStatement(sql);
            
            for(Product_order po : p){
                ps.setString(1, po.getOrder_id());
                ps.setString(2, po.getUserName());
                ps.setString(3, po.getEmail());
                ps.setString(4, po.getFullAddress());
                ps.setString(5, po.getPhone());
                ps.setString(6, po.getProductName());
                ps.setString(7, po.getOwner());
                ps.setString(8, po.getPrice());
                ps.setString(9, po.getPayment());
                
                ps.addBatch();
            }
            
            int[] checks = ps.executeBatch();
            
            con.commit();
            f = true;
            
            con.setAutoCommit(true);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
//        System.out.println(f);
        return f;
    }

    @Override
    public int getOrderNumber() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Product_order> getOrders(String email) {
        List<Product_order> pOrder = new ArrayList<Product_order>();
        
        Product_order po = null;
        
        try {
            String sql = "select * from product_order where email = ?";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                po = new Product_order();
                
                po.setId(rs.getInt(1));
                po.setOrder_id(rs.getString(2));
                po.setUserName(rs.getString(3));
                po.setEmail(rs.getString(4));
                po.setFullAddress(rs.getString(5));
                po.setPhone(rs.getString(6));
                po.setProductName(rs.getString(7));
                po.setOwner(rs.getString(8));
                po.setPrice(rs.getString(9));
                po.setPayment(rs.getString(10));
                
                pOrder.add(po);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return pOrder;
    }

    @Override
    public List<Product_order> getOrders() {
        List<Product_order> pOrder = new ArrayList<Product_order>();
        
        Product_order po = null;
        
        try {
            String sql = "select * from product_order";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                po = new Product_order();
                
                po.setId(rs.getInt(1));
                po.setOrder_id(rs.getString(2));
                po.setUserName(rs.getString(3));
                po.setEmail(rs.getString(4));
                po.setFullAddress(rs.getString(5));
                po.setPhone(rs.getString(6));
                po.setProductName(rs.getString(7));
                po.setOwner(rs.getString(8));
                po.setPrice(rs.getString(9));
                po.setPayment(rs.getString(10));
                
                pOrder.add(po);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return pOrder;
    }
    
}
