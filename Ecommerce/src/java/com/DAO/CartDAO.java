package com.DAO;

import com.entity.Cart;
import com.entity.ProductDetails;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author shanu
 */
public interface CartDAO {
    public boolean addCard(Cart c);
    
    public List<Cart> getBookByUser(int uid);
    
    public boolean deleteProduct(int pid, int cid);
}
