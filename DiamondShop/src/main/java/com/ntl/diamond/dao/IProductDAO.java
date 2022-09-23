package com.ntl.diamond.dao;

import com.ntl.diamond.model.Product;
import com.ntl.diamond.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
    public void insertProduct(Product product) throws SQLException;

    public Product selectProduct(long id);

    public List<Product> selectAllProducts();

    public boolean deleteProduct(long id) throws SQLException;

    public boolean updateProduct(Product product) throws SQLException;
}

