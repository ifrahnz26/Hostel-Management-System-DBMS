package com.hostelmanagement.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.*;
import jakarta.servlet.http.*;


public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        
        try {
            // JDBC connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/hostelproj";
            String dbUser = "root";
            String dbPassword = "";

            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Prepare SQL statement
            String sql = "INSERT INTO user (name, email, phoneNumber, address, password) "
            		+ "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, phone);
            statement.setString(4, address);
            statement.setString(5, password);
            statement.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
            rd.forward(request, response);

            // Close resources
            statement.close();
            connection.close();
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}