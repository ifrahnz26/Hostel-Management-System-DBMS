<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
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
            padding: 15px 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 28px;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn {
            background-color: #42033D;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #3A2D59;
        }

        .message {
            text-align: center;
            font-size: 18px;
            color: green;
            margin-top: 20px;
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

Connection conn = null;
PreparedStatement pstmt = null;

if (request.getMethod().equalsIgnoreCase("POST")) {
    // Process form submission
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelproj", "root", "");

        String query = "UPDATE User SET Name = ?, Email = ?, PhoneNumber = ?, Address = ? WHERE UserID = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, name);
        pstmt.setString(2, email);
        pstmt.setString(3, phone);
        pstmt.setString(4, address);
        pstmt.setString(5, userID);

        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            // Display success message and redirect
%>
            <header>
                <h1>Profile Updated</h1>
            </header>
            <div class="container">
                <div class="message">
                    <p>Your profile has been successfully updated!</p>
                    <p>You will be redirected to the dashboard in 10 seconds.</p>
                </div>
            </div>
            <script>
                setTimeout(function () {
                    window.location.href = "dashboard.jsp";
                }, 5000);
            </script>
<%
        } else {
            out.println("<p>Failed to update profile. Please try again.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { ex.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
    }
} else {
    // Display the form
%>
<header>
    <h1>Update Profile</h1>
</header>
<div class="container">
    <form action="updateProfile.jsp" method="post">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" required>
        </div>
        <button type="submit" class="btn">Update Profile</button>
    </form>
</div>
<%
}
%>
 <div class="footer">
        <p>&copy; 2024 Serene Stays. All rights reserved.</p>
    </div>
</body>
</html>
