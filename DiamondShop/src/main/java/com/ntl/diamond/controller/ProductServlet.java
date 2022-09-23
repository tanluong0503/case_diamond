package com.ntl.diamond.controller;

import com.ntl.diamond.dao.ProductDAO;
import com.ntl.diamond.model.Product;
import com.ntl.diamond.model.User;
import com.ntl.diamond.utils.ValidateUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/products"})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "update":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "info":
                    showInfoProduct(request, response);
                    break;
                default:
                    listProduct(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }


    private void listProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        long id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productDAO.selectProduct(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/update.jsp");
        request.setAttribute("product", existingProduct);
        dispatcher.forward(request, response);

    }

    private void showInfoProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        long id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productDAO.selectProduct(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/info.jsp");
        request.setAttribute("product", existingProduct);
        dispatcher.forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response)

            throws SQLException,IOException,ServletException {
        List<String> errors = new ArrayList<>();

        String productName = request.getParameter("productName");
        String price = request.getParameter("productPrice");
        String productDescribe = request.getParameter("productDescribe");
        String image = request.getParameter("productImage");
        BigDecimal newPrice = new BigDecimal(Long.parseLong(price));
        Date createAt = Date.valueOf(LocalDate.now());
        boolean isPrice = ValidateUtils.isPriceValid(price);
        Product newProduct = new Product(productName, newPrice, productDescribe, createAt, image);

        if (price.isEmpty()) {
            errors.add("Giá không được để trống");
        }
        double checkPrice=1.0;
        try {
            if (isPrice)
                checkPrice = Double.parseDouble(price);
        } catch (Exception e) {
            errors.add("Định dạng giá không hợp lệ");
        }
        if (!isPrice || checkPrice<=1000 || checkPrice>100000) {
            errors.add("Giá phải là số thực lớn hơn 1000 và nhỏ hơn 100000");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/create.jsp");
            request.setAttribute("errors", errors);
            dispatcher.forward(request, response);
            return;
        }else

        productDAO.insertProduct(newProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/create.jsp");
        request.setAttribute("message", "Thêm thành công!");
        dispatcher.forward(request, response);

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<String> errors = new ArrayList<>();
        long id = Integer.parseInt(request.getParameter("id"));
        String productName = request.getParameter("productNameUpdate").trim();
        String price = request.getParameter("productPriceUpdate").trim();
        String productDescribe = request.getParameter("productDescribeUpdate").trim();
        String image = request.getParameter("productImageUpdate").trim();
        boolean isPrice = ValidateUtils.isPriceValid(price);
        Boolean flag = null;
        double checkPrice=1.0;
        try {
            if (isPrice) {
                checkPrice = Double.parseDouble(price);
            }
            else {
                errors.add("Giá sản phẩm phải là một số");
            }
        } catch (Exception e) {
            errors.add("Định dạng giá không hợp lệ");
            flag = false;
        }
        BigDecimal newPrice = new BigDecimal(Long.parseLong(price));
        Product product = new Product(id, productName, newPrice, productDescribe, image);
        if (productName.isEmpty()) {
            errors.add("Name không được để trống");
            flag = false;
        }
        if (newPrice.toString().isEmpty()) {
            errors.add("Giá không được để trống");
            flag = false;
        }

        if (!isPrice || checkPrice<=1000 || checkPrice>100000) {
            errors.add("Giá phải là số thực lớn hơn 1000 và nhỏ hơn 100000");
            flag = false;
        }

        if (!flag ) {
            Product existingProduct = productDAO.selectProduct(id);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/update.jsp");
            request.setAttribute("errors", errors);
            request.setAttribute("product", existingProduct);
            dispatcher.forward(request, response);
        } else {
            productDAO.updateProduct(product);
            Product existingProduct = productDAO.selectProduct(id);
            request.setAttribute("product", existingProduct);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/update.jsp");
            request.setAttribute("message", "Đã chỉnh sửa!");
            dispatcher.forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        long id = Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(id);
        List<Product> listProduct = productDAO.selectAllProducts();
        request.setAttribute("listProduct", listProduct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/product/list.jsp");
        dispatcher.forward(request, response);

    }

}