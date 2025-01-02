package com.hostelmanagement.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.*;
import java.sql.*;
import java.text.*;
import java.util.*;

public class RoomBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        // Retrieve parameters from the form
        String roomNumber = request.getParameter("roomNumber");
        String checkInDate = request.getParameter("checkInDate");
        String durationStr = request.getParameter("duration");
        String foodOption = request.getParameter("foodOption");
        String meals = request.getParameter("meals");
        
        HttpSession session = request.getSession();
        String userID = (String) session.getAttribute("UserID");

        if (userID == null) {
            response.sendRedirect("userlogin.jsp");
            return;
        }
        int user = Integer.parseInt(userID);

        // Error handling
        int duration = 0;
        if (durationStr == null || durationStr.trim().isEmpty()) {
            out.println("Duration is missing.");
            return;
        }

        try {
            duration = Integer.parseInt(durationStr);
        } catch (NumberFormatException e) {
            out.println("Invalid duration format.");
            return;
        }

        if (roomNumber == null || roomNumber.trim().isEmpty()) {
            out.println("Room number is missing.");
            return;
        }

        if (checkInDate == null || checkInDate.trim().isEmpty()) {
            out.println("Check-in date is missing.");
            return;
        }

        // Process food options only if option is selected
        int mealsPerDay = 0;
        int foodCostPerDay = 0;
        if ("yes".equalsIgnoreCase(foodOption)) {
            if (meals == null || meals.trim().isEmpty()) {
                out.println("Please select the number of meals per day.");
                return;
            }
            try {
                mealsPerDay = Integer.parseInt(meals); 
                foodCostPerDay = mealsPerDay * 50; 
            } catch (NumberFormatException e) {
                out.println("Invalid meals selection.");
                return;
            }
        }

        Connection connection = null;
        PreparedStatement bookingInsertStmt = null;
        PreparedStatement foodInsertStmt = null;
        PreparedStatement updateRoomStatusStmt = null;
        PreparedStatement getRoomCostStmt = null;
        PreparedStatement paymentInsertStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelproj", "root", "");

            // Retrieve the room cost from the Room table
            String roomCostQuery = "SELECT price FROM Room WHERE RoomNumber = ?";
            getRoomCostStmt = connection.prepareStatement(roomCostQuery);
            getRoomCostStmt.setString(1, roomNumber);
            ResultSet roomResult = getRoomCostStmt.executeQuery();

            double roomPrice = 0;
            if (roomResult.next()) {
                roomPrice = roomResult.getDouble("price");
            }

            // Insert the booking details into Booking table
            String bookingQuery = "INSERT INTO Booking (UserID, RoomNumber, BookingDate, CheckInDate, CheckOutDate) VALUES (?, ?, NOW(), ?, DATE_ADD(?, INTERVAL ? DAY))";
            bookingInsertStmt = connection.prepareStatement(bookingQuery, Statement.RETURN_GENERATED_KEYS);
            bookingInsertStmt.setInt(1, user);
            bookingInsertStmt.setString(2, roomNumber);
            bookingInsertStmt.setString(3, checkInDate);
            bookingInsertStmt.setString(4, checkInDate); 
            bookingInsertStmt.setInt(5, duration);

            int bookingResult = bookingInsertStmt.executeUpdate();

            int bookingID = 0;
            if (bookingResult > 0) {
                ResultSet generatedKeys = bookingInsertStmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    bookingID = generatedKeys.getInt(1); 
                }
            } else {
                out.println("Failed to book room.");
                return;
            }

            // If food option is selected, insert into Food table
            if ("yes".equalsIgnoreCase(foodOption)) {
                String foodQuery = "INSERT INTO Food (roomNumber, mealsPerDay, costPerDay) VALUES (?, ?, ?)";
                foodInsertStmt = connection.prepareStatement(foodQuery);
                foodInsertStmt.setString(1, roomNumber);
                foodInsertStmt.setInt(2, mealsPerDay);
                foodInsertStmt.setInt(3, foodCostPerDay); 

                int foodResult = foodInsertStmt.executeUpdate();

                if (foodResult > 0) {
                } else {
                    out.println("Failed to add food preference.");
                }
            }

            // Update room status to 'occupied'
            String updateRoomStatusQuery = "UPDATE Room SET Availability = 'Occupied' WHERE RoomNumber = ?";
            updateRoomStatusStmt = connection.prepareStatement(updateRoomStatusQuery);
            updateRoomStatusStmt.setString(1, roomNumber);
            int roomStatusUpdateResult = updateRoomStatusStmt.executeUpdate();

            if (roomStatusUpdateResult > 0) {
                
            } else {
                out.println("Failed to update room status.");
            }

            // Calculate final total cost (room cost + food cost)
            double totalFoodCost = foodCostPerDay * duration; 
            double finalTotalCost = roomPrice * duration + totalFoodCost; 

            // Insert payment record into Payment table with status 'Pending'
            String paymentQuery = "INSERT INTO Payment (BookingID, Amount, PaymentDate, PaymentMode, PaymentStatus) VALUES (?, ?, NOW(), 'Card', 'Pending')";
            paymentInsertStmt = connection.prepareStatement(paymentQuery);
            paymentInsertStmt.setInt(1, bookingID); 
            paymentInsertStmt.setDouble(2, finalTotalCost); 
            int paymentResult = paymentInsertStmt.executeUpdate();

            if (paymentResult > 0) {
                // Payment inserted successfully
            } else {
                out.println("Failed to insert payment record.");
            }

            session.setAttribute("roomNumber", roomNumber);
            session.setAttribute("roomCost", roomPrice);
            session.setAttribute("foodCost", totalFoodCost);

            RequestDispatcher rd = request.getRequestDispatcher("confirmation.jsp");
            rd.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("Database error occurred.");
        } finally {
            try {
                if (bookingInsertStmt != null) {
                    bookingInsertStmt.close();
                }
                if (foodInsertStmt != null) {
                    foodInsertStmt.close();
                }
                if (updateRoomStatusStmt != null) {
                    updateRoomStatusStmt.close();
                }
                if (getRoomCostStmt != null) {
                    getRoomCostStmt.close();
                }
                if (paymentInsertStmt != null) {
                    paymentInsertStmt.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
