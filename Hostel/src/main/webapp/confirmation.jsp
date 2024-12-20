<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
<!--     <link rel="stylesheet" href="style.css">
 -->    <link rel="stylesheet" href="confirm.css"> <!-- Link to confirm.css -->
    <script>
        // Redirect to dashboard after 15 seconds
        setTimeout(function() {
            window.location.href = "dashboard.jsp";
        }, 15000);
    </script>
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Booking Confirmation</h1>
    </header>

    <!-- Navigation Bar -->
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="bookroom.jsp">Book Room</a>
        <a href="payment.jsp">Payments</a>
        <a href="profile.jsp">View Profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <!-- Main Content Section: Booking Details -->
    <div class="container">
        <% 
            // Establish connection to the database
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                // Database connection
                String url = "jdbc:mysql://localhost:3306/hostelproj";
                String username = "root";
                String password = "";
                conn = DriverManager.getConnection(url, username, password);
                
                // Query to fetch the current room and food details for the logged-in user
                String query = "SELECT DISTINCT " +
                    "r.RoomNumber, " +
                    "r.RoomType, " +
                    "r.BuildingName, " +
                    "r.AC, " +
                    "r.Balcony, " +
                    "r.Price AS RoomPrice, " +
                    "CASE WHEN f.roomNumber IS NOT NULL THEN 'Yes' ELSE 'No' END AS FoodOption, " +
                    "IFNULL(f.mealsPerDay, 0) AS MealsPerDay, " +
                    "IFNULL(f.costPerDay, 0) AS FoodCost, " +
                    "(r.Price + IFNULL(f.costPerDay * IFNULL(f.mealsPerDay, 0), 0)) AS TotalCost, " +
                    "DATEDIFF(b.CheckOutDate, b.CheckInDate) AS Duration " +
                    "FROM Room r " +
                    "JOIN Booking b ON r.RoomNumber = b.RoomNumber " +
                    "LEFT JOIN Food f ON r.RoomNumber = f.roomNumber " +
                    "WHERE b.UserID = ? ";

                stmt = conn.prepareStatement(query);
                String userID = (String) session.getAttribute("UserID");
                int user = Integer.parseInt(userID);
                stmt.setInt(1, user); // Use UserID from session
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    String roomNumber = rs.getString("RoomNumber");
                    String roomType = rs.getString("RoomType");
                    String buildingName = rs.getString("BuildingName");
                    String ac = rs.getString("AC");
                    String balcony = rs.getString("Balcony");
                    double roomPrice = rs.getDouble("RoomPrice");
                    String foodOption = rs.getString("FoodOption");
                    int mealsPerDay = rs.getInt("MealsPerDay");
                    double foodCost = rs.getDouble("FoodCost");
                    double totalCost = rs.getDouble("TotalCost");
        %>

        <div class="booking-details">
            <h3>Room Details</h3>
            <p><strong>Room Number:</strong> <%= roomNumber %></p>
            <p><strong>Room Type:</strong> <%= roomType %></p>
            <p><strong>Building Name:</strong> <%= buildingName %></p>
            <p><strong>AC:</strong> <%= ac %></p>
            <p><strong>Balcony:</strong> <%= balcony %></p>
            <p><strong>Room Price:</strong> ₹<%= roomPrice %></p>
            
            <h3>Food Option</h3>
            <p><strong>Food Selected:</strong> <%= foodOption %></p>
            <% if (foodOption.equals("Yes")) { %>
                <p><strong>Meals Per Day:</strong> <%= mealsPerDay %></p>
                <p><strong>Food Cost:</strong> ₹<%= foodCost %></p>
            <% } %>
            
            <h3>Total Cost</h3>
            <p class="total-cost">₹<%= totalCost %></p>
        </div>

        <% 
                } else {
                    out.println("<p>No current bookings found.</p>");
                }
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Serene Stays. All rights reserved.</p>
    </div>

</body>
</html>
