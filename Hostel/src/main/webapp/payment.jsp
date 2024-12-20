<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Details</title>
<!--     <link rel="stylesheet" href="confirm.css">
 -->    <style>
    /* General body styling */
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
    width: 100%;
    padding: 15px;
    text-align: center;
    position: sticky;
    top: 0;
    z-index: 100;
    background-color: #704C5E; /* Dark Purple */
    overflow: hidden;
    border-bottom: 3px solid #C799A6;
}

nav a {
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    font-weight: bold;
    margin: 0 10px;
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
    width:100%;
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

/* Styling the payment details box */
.payment-details {
    background-color: #F8F8F8;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    text-align: left;
    width: 100%; /* Ensure the payment details box takes up full width of container */
    box-sizing: border-box; /* Include padding in width calculation */
}

/* Title styling */
.payment-details h3 {
    color: #4B2840;
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 15px;
}

/* Paragraph styling */
.payment-details p {
    font-size: 16px;
    color: #333;
    margin-bottom: 10px;
}

/* Footer styling */
.footer {
    background-color: #704C5E;
    color: white;
    padding: 5px;
    text-align: center;
    position: fixed;
    width: 100%;
    bottom: 0;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    .container {
        padding: 15px;
    }

    .payment-details {
        padding: 20px;
    }
}
/* Button Styling */
button {
    background-color: #D44D62; /* Gradient color for the button */
    color: white;
    font-size: 16px;
    font-weight: bold;
    padding: 12px 30px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth transition for hover */
}

button:hover {
    background-color: #C799A6; /* Lighter shade of pink for hover */
    transform: scale(1.05); /* Slight zoom effect on hover */
}

button:active {
    background-color: #42033D; /* Darker purple when the button is pressed */
    transform: scale(1); /* Reset scale on click */
}

button:focus {
    outline: none; /* Remove the default focus outline */
    box-shadow: 0 0 5px 2px rgba(212, 77, 98, 0.5); /* Add a glow effect when focused */
}

/* Style for the form button container */
form {
    text-align: center; /* Center the button */
    margin-top: 20px;
}


    
    </style>
</head>
<body>
    <header>
        <h1>Payment Details</h1>
    </header>

    <!-- Navigation Bar -->
     <nav>
        <a href="dashboard.jsp" >Dashboard</a>
        <a href="bookroom.jsp">Book Room</a>
        <a href="payment.jsp" class="active">Payments</a>
        <a href="profile.jsp">View Profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <div class="container">
    <% 
    HttpSession hs = request.getSession();
    String userID = (String) hs.getAttribute("UserID");

    if (userID == null) {
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

        String query = "SELECT p.PaymentID, p.Amount, p.PaymentDate, p.PaymentMode, p.PaymentStatus " +
            "FROM Payment p " +
            "JOIN Booking b ON p.BookingID = b.BookingID " +
            "JOIN User u ON b.UserID = u.UserID " +
            "WHERE u.UserID = ?";

        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, user);
        rs = pstmt.executeQuery();

        if (rs.next()) {
    %>
    <div class="payment-details">
        <h3>Payment Information</h3>
        <p><strong>Payment ID:</strong> <%= rs.getString("PaymentID") %></p>
        <p><strong>Amount:</strong> ₹<%= rs.getDouble("Amount") %></p>
        <p><strong>Payment Date:</strong> <%= rs.getDate("PaymentDate") %></p>
        <p><strong>Payment Mode:</strong> <%= rs.getString("PaymentMode") %></p>
        <p><strong>Payment Status:</strong> <%= rs.getString("PaymentStatus") %></p>


<% 
            // Check if payment status is pending, and if so, display a button to proceed with payment
            String paymentStatus = rs.getString("PaymentStatus");
            if ("Pending".equalsIgnoreCase(paymentStatus)) {
            %>
            <form action="processpayment.jsp" method="POST">
                <input type="hidden" name="paymentID" value="<%= rs.getString("PaymentID") %>">
                <button type="submit">Proceed to Payment</button>
            </form>
            <% 
            }
            %>
    </div>
    <% 
        } else {
    %>
    <div class="payment-details">
        <h3>No Payment Found</h3>
        <p>You have no payment records associated with your current booking.</p>
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
