package com.ntl.diamond.model;

import javax.xml.crypto.Data;
import java.math.BigDecimal;
import java.sql.Date;

public class Product {
    private long id;
    private String productName;
    private BigDecimal price;
    private String productDescribe;

    private Date createdAt;

    private String image;


    public Product() {
    }

    public Product(String productName, BigDecimal price, String productDescribe, String image) {
        this.productName = productName;
        this.price = price;
        this.productDescribe = productDescribe;
        this.image = image;
    }

    public Product(String productName, BigDecimal price, String productDescribe, Date createdAt, String image) {
        this.productName = productName;
        this.price = price;
        this.productDescribe = productDescribe;
        this.createdAt = createdAt;
        this.image = image;
    }

    public Product(long id, String productName, BigDecimal price, String productDescribe, Date createdAt, String image) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.productDescribe = productDescribe;
        this.createdAt = createdAt;
        this.image = image;
    }
    public Product(long id, String productName, BigDecimal price, String productDescribe, String image) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.productDescribe = productDescribe;
        this.image = image;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getProductDescribe() {
        return productDescribe;
    }

    public void setProductDescribe(String productDescribe) {
        this.productDescribe = productDescribe;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


}
