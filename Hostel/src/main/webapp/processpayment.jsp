<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Payment</title>
    
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #F3F0F8;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    min-height: 100vh;
}
header {
    background-color: #4B2840;
    color: white;
    padding: 20px;
    text-align: center;
    width: 100%;
}


nav {
    background-color: #704C5E; /* Dark Purple */
    border-bottom: 3px solid #C799A6; /* Soft pink border for a neat look */
    display: flex; /* Use flexbox layout */
    justify-content: center; /* Center the navigation links horizontally */
    align-items: center; /* Center vertically (optional if needed for larger nav links) */
    padding: 0; /* Remove default padding */
}

nav a {
    color: white;
    padding: 14px 20px;
    text-decoration: none;
    text-align: center;
}

nav a:hover {
    background-color: #C799A6; /* Soft pink */
    color: white;
}

nav a.active {
    background-color: #42033D; /* Darker purple for active link */
}


.user-info {
            text-align: right;
            padding: 15px;
            background-color: #4B2840; /* Deep Purple */
            color: white;
        }


/* The container that holds the main content */
.container {
    display: flex;
    flex-direction: column;
    gap: 20px;
    padding: 30px;
    max-width: 900px;
    width: 100%; /* Full width with max-width constraint */
    background: linear-gradient(to right, #D44D62, #F8A2C7); /* Gradient background */
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2); /* Soft shadow */
    margin-top: 20px; /* Margin below the navigation */
    transition: transform 0.3s ease-in-out; /* Smooth hover effect */
    box-sizing: border-box; /* Ensure padding is included in width/height calculations */
}

.container:hover {
    transform: scale(1.02); /* Slightly zooms the container on hover */
}
.footer {
    background-color: #704C5E;
    color: white;
    padding: 5px;
    text-align: center;
    position: fixed;
    width: 100%;
    bottom: 0;
}

    
    </style>
</head>
<body>
<header>
        <h1>Processing Your Payment</h1>
    </header>
    <nav>
        <a href="dashboard.jsp" >Dashboard</a>
        <a href="bookroom.jsp">Book Room</a>
        <a href="payment.jsp" class="active">Payments</a>
        <a href="profile.jsp">View Profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>
    <div class="container">

    <%
    String paymentID = request.getParameter("paymentID");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelproj", "root", "");

        // Update payment status to 'Completed' or handle the payment logic
        String updateQuery = "UPDATE Payment SET PaymentStatus = 'Paid' WHERE PaymentID = ?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, paymentID);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
    %>
        <h2>Your payment has been successfully processed!</h2>
    <%
        } else {
    %>
        <h2>Failed to process the payment. Please try again later.</h2>
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
     <div class="footer">
        <p>&copy; 2024 Serene Stays. All rights reserved.</p>
    </div>
</body>
</html>
