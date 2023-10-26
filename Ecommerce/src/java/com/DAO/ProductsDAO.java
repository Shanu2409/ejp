/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.ProductDetails;
import java.sql.Connection;
import java.util.List;

public interface ProductsDAO {
    public boolean AddProducts(ProductDetails b);
    
    public List<ProductDetails> getAllProducts();
    
    public ProductDetails getProductDetailById(int ProductId);
    
    public boolean UpdateEditProducts(ProductDetails p);
    
    public boolean DeleteProducts(int id);
    
    public List<ProductDetails> getNewProducts();
    
    public List<ProductDetails> getOldProducts();
    
    public List<ProductDetails> getAllNewProducts();
    
    public List<ProductDetails> getAllOldroducts();
    
}
