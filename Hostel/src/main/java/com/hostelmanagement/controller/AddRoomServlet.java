package com.hostelmanagement.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

public class AddRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hostelproj"; 
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetch form data
        String roomNumber = request.getParameter("roomNumber");
        String roomType = request.getParameter("roomType");
        String price = request.getParameter("price");
        String availability = request.getParameter("availability");
        String ac = request.getParameter("ac");
        String balcony = request.getParameter("balcony");
        String buildingName = request.getParameter("buildingName");

        // Load the JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h2>Error: JDBC Driver not found.</h2>");
            return;
        }

        // JDBC connection and query execution
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO Room (RoomNumber, RoomType, Price, Availability, AC, Balcony, BuildingName) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, roomNumber);
                pstmt.setString(2, roomType);
                pstmt.setBigDecimal(3, new java.math.BigDecimal(price));
                pstmt.setString(4, availability);
                pstmt.setString(5, ac);
                pstmt.setString(6, balcony);
                pstmt.setString(7, buildingName);
                pstmt.executeUpdate();

                RequestDispatcher rd = request.getRequestDispatcher("admindashboard.jsp");
                rd.forward(request, response);

            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            out.close();
        }
    }
}