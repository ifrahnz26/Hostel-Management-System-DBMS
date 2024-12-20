<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F3F0F8; /* Light purple background */
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #4B2840; /* Deep Purple */
            color: white;
            padding: 15px 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 28px;
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

        

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .profile {
            text-align: center;
        }

        .profile h2 {
            margin-bottom: 20px;
            color: #4A3C72;
        }

        .profile-field {
            margin: 20px 0;
            padding: 15px;
            background-color: #F9F9F9;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: left;
        }

        .profile-field h3 {
            margin: 0 0 5px;
            font-size: 18px;
            color: #4B2840;
        }

        .profile-field p {
            margin: 0;
            font-size: 16px;
            color: #555;
        }

        .update-btn {
            background-color: #42033D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        .update-btn:hover {
            background-color: #3A2D59;
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

    String query = "SELECT Name, Email, PhoneNumber, Address FROM User WHERE UserID = ?";
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, user);
    rs = pstmt.executeQuery();

    if (rs.next()) {
%>
<header>
        <h1>User Profile</h1>
    </header>

    <!-- Navigation Bar -->
    <nav>
        <a href="dashboard.jsp" class="active">Dashboard</a>
        <a href="bookroom.jsp">Book Room</a>
        <a href="payment.jsp">Payments</a>
        <a href="profile.jsp">View profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>
<div class="container">
    <div class="profile">
        <div class="profile-field">
            <h3>Name</h3>
            <p><%= rs.getString("Name") %></p>
        </div>
        <div class="profile-field">
            <h3>Email</h3>
            <p><%= rs.getString("Email") %></p>
        </div>
        <div class="profile-field">
            <h3>Phone number</h3>
            <p><%= rs.getString("PhoneNumber") %></p>
        </div>
        <div class="profile-field">
            <h3>Address</h3>
            <p><%= rs.getString("Address") %></p>
        </div>
        <form action="updateProfile.jsp" method="get">
            <button type="submit" class="update-btn">Update Profile</button>
        </form>
    </div>
</div>
<%
    } else {
%>
<div class="container">
    <div class="profile">
        <h2>No User Details Found</h2>
    </div>
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
 <div class="footer">
        <p>&copy; 2024 Serene Stays. All rights reserved.</p>
    </div>
</body>
</html>
