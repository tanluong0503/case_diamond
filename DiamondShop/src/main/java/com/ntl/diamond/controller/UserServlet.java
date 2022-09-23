package com.ntl.diamond.controller;

import com.ntl.diamond.dao.UserDAO;
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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = {"/users"})
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "info":
                    showInfoUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }


    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/update.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void showInfoUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/info.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<String> errors = new ArrayList<>();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        boolean flag = true;
        if(ValidateUtils.isUserNameValid(username)==false){
            errors.add("Username không đúng định dạng (8 đến 20 kí tự)");
            flag = false;
        }
        if(ValidateUtils.isPasswordValid(password)==false){
            errors.add("Password không đúng định dạng");
            flag = false;
        }
        if(fullName.isEmpty()){
            errors.add("Họ tên không được để trống");
            flag = false;
        }
        if (ValidateUtils.isPhoneValid(phone)==false){
            errors.add("Số điện thoại không hợp lệ");
            flag= false;
        }
        if (ValidateUtils.isEmailValid(email)==false){
            errors.add("Email không hợp lệ");
            flag = false;
        }
        if (address.isEmpty()){
            errors.add("Địa chỉ không được để trống");
            flag = false;
        }


        User newUser = new User(username, password, fullName, phone, email, address);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/create.jsp");

        if (flag == true) {
            userDAO.insertUser(newUser);
            request.setAttribute("message", "Thêm thành công!");

        }else{
            request.setAttribute("errors", errors);
            request.setAttribute("user", newUser);
        }
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<String> errors = new ArrayList<>();
        int id = Integer.parseInt(request.getParameter("id"));
        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        boolean flag = true;
        if(fullName.isEmpty()){
            errors.add("Họ tên không được để trống");
            flag = false;
        }
        if (ValidateUtils.isPhoneValid(phone)==false){
            errors.add("Số điện thoại không hợp lệ");
            flag= false;
        }
        if (ValidateUtils.isEmailValid(email)==false){
            errors.add("Email không hợp lệ");
            flag = false;
        }
        if (address.isEmpty()){
            errors.add("Địa chỉ không được để trống");
            flag = false;
        }
        User newUser = new User(id, fullName, phone, email, address);
        if (flag == true) {
            userDAO.updateUser(newUser);
            User existingUser = userDAO.selectUser(id);
            request.setAttribute("user", existingUser);
            request.setAttribute("message", "Sửa thành công!");

        }else{
            request.setAttribute("errors", errors);
            request.setAttribute("user", newUser);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/update.jsp");

        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);

        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/user/list.jsp");
        dispatcher.forward(request, response);
    }

}