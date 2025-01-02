<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ page import="java.sql.*, java.util.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Residents</title>

    <!-- <!-- External CSS and JS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
    <link rel="stylesheet" type="text/css" href="/admin/admin.css">
    <style>
    
    /* General body and layout styling */
/* General body and layout styling */
body {
    font-family: Arial, sans-serif;
    background-color: #D4EBF8; /* Light Blue Background */
    margin: 0;
    padding: 0;
    box-sizing: border-box; /* Ensure padding and margin do not affect element size */
}

/* Header Styling */
header {
    background-color: #0A3981; /* Deep Blue */
    color: white;
    padding: 15px 20px;
    text-align: center;
}

header h1 {
    margin: 0;
    font-size: 28px;
}

/* Navbar styling */
nav {
    background-color: #80C4E9; /* Light Blue */
    border-bottom: 3px solid #0A3981; /* Deep Blue border */
    display: flex;
    justify-content: center;
    padding: 0;
}

nav a {
    color: white;
    padding: 14px 20px;
    text-decoration: none;
    text-align: center;
}

nav a:hover {
    background-color: #0A3981; /* Deep Blue */
    color: white;
}

nav a.active {
    background-color: #0A3981; /* Deep Blue for active link */
}

/* User Info (e.g., Logged in User) */
.user-info {
    text-align: right;
    padding: 15px;
    background-color: #0A3981; /* Deep Blue */
    color: white;
}

/* Main container for content */
.container {
    padding: 10px;
}
.footer {
    background-color: #80C4E9; /* Light Blue */
    color: white;
    padding: 5px;
    text-align: center;
    width: full; 
    position: relative; 
    bottom: 0;
    left: 0;
}
@media (max-width: 768px) {
    .container {
        padding: 0;
    }
}

/* Table Styling */
table {
    width: 100%;
    margin-top: 30px;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

table th, table td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
}

table th {
    background-color: #0A3981; /* Deep Blue */
    color: white;
    font-weight: bold;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #e9ecef;
}

/* Responsive table for smaller screens */
@media (max-width: 768px) {
    table th, table td {
        padding: 10px;
    }

    header h1 {
        font-size: 24px;
    }

    .user-info {
        font-size: 14px;
    }

    nav a {
        padding: 10px 15px;
    }
}

/* Footer Styling */

  
    </style>
</head>
<body>

<!-- Include Navbar -->
        <jsp:include page="adminnavbar.jsp" />
        
        <header>
        <br>
            <h1>Resident Log</h1>
        </header>
        
    <div class="container">
        <h2 class="mt-5 mb-4 text-center">All Users</h2>

        <!-- Table showing all users -->
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">User Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone Number</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:mysql://localhost:3306/hostelproj"; 
                    String user = "root"; 
                    String password = ""; 
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Establishing the connection to the database
                        conn = DriverManager.getConnection(url, user, password);
                        
                        // Query to fetch all users
                        String sql = "SELECT name, email, phoneNumber FROM user";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        // Loop through the result set and display data in the table
                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("phoneNumber") %></td>
                            </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
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
            </tbody>
        </table>

        <h2 class="mt-5 mb-4 text-center">Users Who Booked Rooms</h2>

        <!-- Table showing users who have booked rooms -->
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Room Number</th>
                    <th scope="col">Booking ID</th>
                    <th scope="col">Payment Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        conn = DriverManager.getConnection(url, user, password);

                        // Query to fetch users who have booked rooms
                        String sqlBooking = "SELECT u.name, u.email, r.roomnumber, b.bookingid, p.paymentstatus " +
                    "FROM user u " +
                    "JOIN booking b ON u.userid = b.userid " +
                    "JOIN room r ON b.roomnumber = r.roomnumber " +
                    "JOIN payment p ON b.bookingid = p.bookingid";

                        stmt = conn.prepareStatement(sqlBooking);
                        rs = stmt.executeQuery();

                        // Loop through the result set and display data in the table
                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getString("name") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("roomnumber") %></td>
                                <td><%= rs.getInt("bookingid") %></td>
                                <td><%= rs.getString("paymentstatus") %></td>
                            </tr>
                <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
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
            </tbody>
        </table>
        <br><br>
        <footer class="footer">
            <p>&copy; 2024 Serene Stays. All Rights Reserved.</p>
        </footer>
    </div>
</body>
</html>
