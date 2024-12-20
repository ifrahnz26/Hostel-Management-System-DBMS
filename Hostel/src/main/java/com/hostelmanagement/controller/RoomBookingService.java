package com.hostelmanagement.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//Update Room Availability and Remove Booking
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RoomBookingService {
 public void checkAndUpdateRoomStatus() {
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;

     try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelproj", "root", "");

         Date today = new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         String currentDate = sdf.format(today);

         // Query to get bookings with expired check-out dates
         String query = "SELECT BookingID, RoomNumber, UserID, CheckOutDate FROM Booking WHERE CheckOutDate <= ?";
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, currentDate);
         rs = pstmt.executeQuery();

         while (rs.next()) {
             int bookingID = rs.getInt("BookingID");
             int roomNumber = rs.getInt("RoomNumber");
             int userID = rs.getInt("UserID");

             // Set the room as available (using ENUM)
             String updateRoomQuery = "UPDATE Room SET Availability = 'available' WHERE RoomNumber = ?";
             PreparedStatement updateRoomStmt = conn.prepareStatement(updateRoomQuery);
             updateRoomStmt.setInt(1, roomNumber);
             updateRoomStmt.executeUpdate();
             updateRoomStmt.close();

             // Delete the booking record
             String deleteBookingQuery = "DELETE FROM Booking WHERE BookingID = ?";
             PreparedStatement deleteBookingStmt = conn.prepareStatement(deleteBookingQuery);
             deleteBookingStmt.setInt(1, bookingID);
             deleteBookingStmt.executeUpdate();
             deleteBookingStmt.close();

             // Optionally, delete food record associated with this booking if no food was opted for
             String deleteFoodQuery = "DELETE FROM Food WHERE RoomNumber = ?";
             PreparedStatement deleteFoodStmt = conn.prepareStatement(deleteFoodQuery);
             deleteFoodStmt.setInt(1, roomNumber);
             deleteFoodStmt.executeUpdate();
             deleteFoodStmt.close();
         }

     } catch (Exception e) {
         e.printStackTrace();
     } finally {
         try {
             if (rs != null) rs.close();
             if (pstmt != null) pstmt.close();
             if (conn != null) conn.close();
         } catch (SQLException e) {
             e.printStackTrace();
         }
     }
 }
}

