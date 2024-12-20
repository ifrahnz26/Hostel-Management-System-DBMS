<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Room</title>
    <link rel="stylesheet" href="style.css"> <!-- Assuming your CSS is in styles.css -->
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #F3F0F8;
    margin: 0;
    padding: 0;
}

header {
    background-color: #4B2840;
    color: white;
    padding: 20px;
    text-align: center;
}

nav {
    background-color: #704C5E; /* Dark Purple */
    overflow: hidden;
    border-bottom: 3px solid #C799A6; /* Soft pink border for a neat look */
}

nav a {
    color: white;
    padding: 14px 20px;
    float: left;
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

.container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Ensure 3 cards in a row */
    gap: 20px;
    padding: 20px;
}

.card {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    text-align: center;
    transition: transform 0.3s ease-in-out;
}

.card:hover {
    transform: translateY(-10px);
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card h2 {
    margin: 15px 0;
    font-size: 20px;
    color: #4A3C72;
}

.card p {
    font-size: 16px;
    color: #555;
    margin: 10px 20px;
}

.card a {
    display: inline-block;
    background-color: #42033D;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    margin: 15px 0;
    border-radius: 5px;
}

.card a:hover {
    background-color: #3A2D59;
}

.card .book-now, .card .occupied {
    display: inline-block;
    padding: 10px 20px;
    margin-top: 10px;
    text-decoration: none;
    border-radius: 5px;
}

.card .book-now {
    background-color: #A888B5;
    color: white;
}

.card .occupied {
    background-color: #823038;
    color: white;
}

.footer {
    background-color: #704C5E; /* Deep Purple */
    color: white;
    padding: 5px;
    text-align: center;
    position: fixed;
    width: 100%;
    bottom: 0;
}

@media (max-width: 768px) {
    .container {
        grid-template-columns: 1fr; /* Single column for smaller screens */
    }
}


.booking-form {
    display: grid;
    gap: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
}

label {
    font-size: 16px;
    color: #4A3C72;
    margin-bottom: 8px;
}

input {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #42033D;
    color: white;
    cursor: pointer;
    border: none;
    padding: 12px;
    border-radius: 5px;
}

input[type="submit"]:hover {
    background-color: #3A2D59;
}

        
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Book Your Room</h1>
    </header>

    <!-- Navigation Bar -->
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="bookroom.jsp" class="active">Book Room</a>
        <a href="payment.jsp">Payments</a>
        <a href="profile.jsp">View Profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <!-- User Info Section -->
    <div class="user-info">
        <span>Welcome, ${sessionScope.name} (${sessionScope.email}) </span>
    </div>

    <!-- Main Content Section: Display Rooms -->
    <div class="container">
        <% 
            // Step 1: Establish a connection to the database
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Database connection (replace with your database credentials)
                String url = "jdbc:mysql://localhost:3306/hostelproj";
                String username = "root";
                String password = "";
                conn = DriverManager.getConnection(url, username, password);
                stmt = conn.createStatement();
                
                // Step 2: Query to fetch rooms
                String query = "SELECT * FROM Room";
                rs = stmt.executeQuery(query);
                
                // Step 3: Loop through the result set and display room details
                while (rs.next()) {
                    String roomNumber = rs.getString("RoomNumber");
                    String roomType = rs.getString("RoomType");
                    String price = rs.getString("Price");
                    String availability = rs.getString("Availability");
                    String ac = rs.getString("AC");
                    String balcony = rs.getString("Balcony");
                    
                    // Step 4: Check if the room is available
                    String buttonText = (availability.equalsIgnoreCase("Available")) ? "Book Now" : "Occupied";
                    String buttonClass = (availability.equalsIgnoreCase("Available")) ? "book-now" : "occupied";
                    
        %>
                    <!-- Card for each room -->
                    <div class="card">
                        <h2>Room Number: <%= roomNumber %></h2>
                        <p>Room Type: <%= roomType %></p>
                        <p>Price: ₹<%= price %></p>
                        <p>AC: <%= ac %></p>
                        <p>Balcony: <%= balcony %></p>
                        <p>Availability: <%= availability %></p>
                        
                        <% if (availability.equalsIgnoreCase("Available")) { %>
                            <form action="bookroomaction.jsp" method="POST">
                                <input type="hidden" name="roomNumber" value="<%= roomNumber %>">
                                <input type="submit" value="Book Now" class="book-now">
                            </form>
                        <% } else { %>
                            <p class="occupied">Room is Occupied</p>
                        <% } %>
                        <br>
                    </div>
        <% 
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
    <br><br><br>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Serene Stays. All rights reserved.</p>
    </div>

</body>
</html>
