    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author shanu
 */
public class ProductDetails {
    private int productId;
    private String productname;
    private String owner;
    private String price;
    private String productCategory;
    private String status;
    private String photoName;
    private String email;

    public ProductDetails() {
        super();
    }

    public ProductDetails(String productname, String author, String price, String productCategory, String status, String photoName, String email) {
        this.productname = productname;
        this.owner = author;
        this.price = price;
        this.productCategory = productCategory;
        this.status = status;
        this.photoName = photoName;
        this.email = email;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "BookDetails{" + "productname=" + productname + ", author=" + owner + ", price=" + price + ", productCategory=" + productCategory + ", status=" + status + ", photoName=" + photoName + ", email=" + email + '}';
    }
    
    
    
}
