package com.hostelmanagement.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

public class RemoveRoomServlet extends HttpServlet {

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hostelproj";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetch selected room number
        String roomNumber = request.getParameter("roomNumber");

        // Load JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<h2>Error: JDBC Driver not found.</h2>");
            return;
        }

        // JDBC connection and query execution
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM Room WHERE RoomNumber = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, roomNumber);
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