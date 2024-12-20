<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Current Room Details</title>
    <link rel="stylesheet" href="confirm.css">
</head>
<body>
    <header>
        <h1>Current Room Details</h1>
    </header>

    <!-- Navigation Bar -->
     <nav>
        <a href="dashboard.jsp" class="active">Dashboard</a>
        <a href="bookroom.jsp">Book Room</a>
        <a href="payment.jsp">Payments</a>
        <a href="profile.jsp">View Profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <div class="container">
        <% 
        HttpSession hs = request.getSession();
        String userID = (String) hs.getAttribute("UserID");

        if (userID == null) {
            // Handle the case where userId is not found in the session
            response.sendRedirect("userlogin.jsp");
            return;
        }
        int user = Integer.parseInt(userID);

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelproj", "root", "");

            String query = "SELECT " +
                "b.BookingID, " +
                "b.BookingDate, " +
                "b.CheckInDate, " +
                "b.CheckOutDate, " +
                "r.RoomNumber, " +
                "r.RoomType, " +
                "r.Price AS RoomPrice, " +
                "r.Availability, " +
                "r.AC, " +
                "r.Balcony, " +
                "r.BuildingName, " +
                "f.mealsPerDay, " +
                "f.costPerDay AS FoodCostPerDay, " +
                "(f.mealsPerDay * f.costPerDay * DATEDIFF(b.CheckOutDate, b.CheckInDate)) AS TotalFoodCost, " +
                "u.UserID, " +
                "u.Name AS UserName, " +
                "u.Email, " +
                "u.PhoneNumber, " +
                "u.Address " +
                "FROM Booking b " +
                "JOIN Room r ON b.RoomNumber = r.RoomNumber " +
                "LEFT JOIN Food f ON b.RoomNumber = f.roomNumber " +  // LEFT JOIN to include users with no food option
                "JOIN User u ON b.UserID = u.UserID " +
                "WHERE u.UserID = ?";

            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, user);
            rs = pstmt.executeQuery();

            if (rs.next()) {
        %>
        <div class="booking-details">
            <h3>Booking Information</h3>
            <p><strong>Booking ID:</strong> <%= rs.getString("BookingID") %></p>
            <p><strong>Booking Date:</strong> <%= rs.getDate("BookingDate") %></p>
            <p><strong>Check-in Date:</strong> <%= rs.getDate("CheckInDate") %></p>
            <p><strong>Check-out Date:</strong> <%= rs.getDate("CheckOutDate") %></p>

            <h3>Room Information</h3>
            <p><strong>Room Number:</strong> <%= rs.getString("RoomNumber") %></p>
            <p><strong>Building Name:</strong> <%= rs.getString("BuildingName") %></p>
            <p><strong>Room Type:</strong> <%= rs.getString("RoomType") %></p>
            <p><strong>Room Price:</strong> ₹<%= rs.getDouble("RoomPrice") %></p>
            <p><strong>AC:</strong> <%= rs.getString("AC") %></p>
            <p><strong>Balcony:</strong> <%= rs.getString("Balcony") %></p>

            <% 
            // Check if Food details exist (mealsPerDay should not be null or 0)
            Integer mealsPerDay = rs.getObject("mealsPerDay", Integer.class);  // Use getObject to handle null values
            if (mealsPerDay != null && mealsPerDay > 0) {
            %>
            <h3>Food Details</h3>
            <p><strong>Meals per Day:</strong> <%= mealsPerDay %></p>
            <p><strong>Cost per Meal (per day):</strong> ₹<%= rs.getDouble("FoodCostPerDay") %></p>
            <p><strong>Total Food Cost:</strong> ₹<%= rs.getDouble("TotalFoodCost") %></p>
            <% 
            } else {
            %>
            <h3>No Food Opted</h3>
            <p>You have not opted for any food service during your stay.</p>
            <% 
            }
            %>
        </div>
        <%
            } else {
        %>
        <div class="booking-details">
            <h3>No Current Booking</h3>
            <p>You don't have any active room bookings at the moment.</p>
        </div>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ex) { ex.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
        }
        %>
    </div>
    <br><br>

    <div class="footer">
        <p>&copy; 2024 Serene Stays. All rights reserved.</p>
    </div>
</body>
</html>
