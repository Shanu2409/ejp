/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.ProductDetails;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author shanu
 */
public class ProductsDAOImpl implements ProductsDAO {

    private Connection con;

    public ProductsDAOImpl(Connection con) {
        super();
        this.con = con;
    }

    @Override
    public boolean AddProducts(ProductDetails p) {
        boolean f = false;

        System.out.println(p);
        try {
            String sql = "insert into product_details(productname, owner, price, productCategory, status, photo, email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getProductname());
            ps.setString(2, p.getOwner());
            ps.setString(3, p.getPrice());
            ps.setString(4, p.getProductCategory());
            ps.setString(5, p.getStatus());
            ps.setString(6, p.getPhotoName());
            ps.setString(7, p.getEmail());

//            ps.setString(1, "1");
//            ps.setString(2,"1");
//            ps.setString(3, "1");
//            ps.setString(4,"1");
//            ps.setString(5, "1");
//            ps.setString(6, "1");
//            ps.setString(7, "1");
            int i = ps.executeUpdate();
            
            System.out.println(i);

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<ProductDetails> getAllProducts() {

        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "select * from product_details";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p = new ProductDetails();
                p.setProductId(rs.getInt(1));
                p.setProductname(rs.getString(2));
                p.setOwner(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProductCategory(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));

                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean UpdateEditProducts(ProductDetails p) {
        boolean f = false;
        try {
            String sql = "update product_details set productname = ?, owner = ?, price = ?, status = ? where productid = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getProductname());
            ps.setString(2, p.getOwner());
            ps.setString(3, p.getPrice());
            ps.setString(4, p.getStatus());
            ps.setInt(5, p.getProductId());

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
    public ProductDetails getProductDetailById(int ProductId) {
        ProductDetails p = null;

        try {
            String sql = "select * from product_details where productid = ?";
            PreparedStatement pt = con.prepareStatement(sql);
            pt.setInt(1, ProductId);
            ResultSet rs = pt.executeQuery();

            while (rs.next()) {
                p = new ProductDetails();
                p.setProductId(rs.getInt(1));
                p.setProductname(rs.getString(2));
                p.setOwner(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProductCategory(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    @Override
    public boolean DeleteProducts(int id) {
        boolean f = false;

        try {
            String sql = "delete from product_details where productid = ?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
        }

        return f;
    }

    @Override
    public List<ProductDetails> getNewProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "select * from product_details where productCategory = 'New'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() & i <= 4) {
                p = new ProductDetails();
                p.setProductId(rs.getInt(1));
                p.setProductname(rs.getString(2));
                p.setOwner(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProductCategory(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));

                list.add(p);
                i++;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<ProductDetails> getOldProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "select * from product_details where productCategory = 'Old'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() & i <= 4) {
                p = new ProductDetails();
                p.setProductId(rs.getInt(1));
                p.setProductname(rs.getString(2));
                p.setOwner(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProductCategory(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));

                list.add(p);
                i++;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<ProductDetails> getAllNewProducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "select * from product_details where status = 'Active' and productCategory = 'New'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductDetails();
                p.setProductId(rs.getInt(1));
                p.setProductname(rs.getString(2));
                p.setOwner(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProductCategory(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));

                list.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<ProductDetails> getAllOldroducts() {
        List<ProductDetails> list = new ArrayList<ProductDetails>();
        ProductDetails p = null;

        try {
            String sql = "select * from product_details where status = 'Active' and productCategory = 'Old'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new ProductDetails();
                p.setProductId(rs.getInt(1));
                p.setProductname(rs.getString(2));
                p.setOwner(rs.getString(3));
                p.setPrice(rs.getString(4));
                p.setProductCategory(rs.getString(5));
                p.setStatus(rs.getString(6));
                p.setPhotoName(rs.getString(7));
                p.setEmail(rs.getString(8));

                list.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
