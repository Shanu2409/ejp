/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.DAO;

import com.entity.Product_order;
import java.util.List;

/**
 *
 * @author shanu
 */
public interface ProductOrderDAO {
    public int getOrderNumber();
    
    public boolean saveOrder(List<Product_order> p);
    
    public List<Product_order> getOrders(String email);
    
    public List<Product_order> getOrders();
}
