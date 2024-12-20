package com.hostelmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.*;

public class adminlogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Get user credentials from request
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");

            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            // Database connection details
            String driverName = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/hostelproj";
            String dbuser = "root";
            String dbpass = "";

            // SQL query to validate user credentials
            String sql = "SELECT * FROM Admin WHERE email = ? AND password = ?";

            // User details
            String name = "";
            String emailid = "";
            String adminID = ""; // Variable to store userId

            try {
                if (email != null) {
                    // Establish database connection
                    Class.forName(driverName);
                    conn = DriverManager.getConnection(url, dbuser, dbpass);
                    ps = conn.prepareStatement(sql);
                    ps.setString(1, email);
                    ps.setString(2, pass);

                    rs = ps.executeQuery();

                    // Check if user credentials are valid
                    if (rs.next()) {
                        // Get user details from the result set
                        name = rs.getString("name");
                        emailid = rs.getString("email");
                        adminID = rs.getString("AdminID"); // Assuming 'userId' is a column in the 'User' table

                        // Create a new session and store user information
                        HttpSession hs = request.getSession();
                        hs.setAttribute("name", name);
                        hs.setAttribute("email", emailid);
                        hs.setAttribute("AdminID", adminID); // Store userId in session


                        // Forward the request to the next page (e.g., dashboard)
                        RequestDispatcher rd = request.getRequestDispatcher("admindashboard.jsp");
                        rd.forward(request, response);
                    } else {
                        // Invalid credentials - send error message
                        HttpSession hs = request.getSession();
                        RequestDispatcher d = request.getRequestDispatcher("adminlogin.jsp");
                        hs.setAttribute("err", "Invalid username or password");
                        d.forward(request, response);
                    }
                    rs.close();
                    ps.close();
                }
            } catch (Exception e) {
                // Handle any exceptions
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Admin Login Servlet for Hostel Management System";
    }
}
