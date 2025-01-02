<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Remove Room - Admin Dashboard</title>

    <!-- External CSS and JS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- Font Awesome Icons -->
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

    <style>
        /* Same CSS from Add Room Page */
        body {
            font-family: Arial, sans-serif;
            background-color: #D4EBF8;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #0A3981;
            color: white;
            padding: 15px 20px;
            text-align: center;
        }

        header h1 {
            margin-top: 5px;
            font-size: 35px;
        }

        nav {
            background-color: #80C4E9;
            border-bottom: 3px solid #0A3981;
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
            background-color: #0A3981;
            color: white;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            width: 100%;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .form-group {
            margin-bottom: 1rem;
            font-size: 20px;
        }

        .btn {
            font-size: 18px;
        }

        .footer {
            background-color: #80C4E9;
            color: white;
            padding: 5px;
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        @media (max-width: 768px) {
            .container {
                padding: 0;
            }
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="adminnavbar.jsp" />

    <header>
        <br><br>
        <h1>Remove Room</h1>
    </header>

    <!-- Main Content -->
    <main role="main">
        <div class="container">
            <h2 class="text-center">Select Room to Remove</h2>
            <form action="RemoveRoomServlet" method="post">
                <div class="form-group">
                    <label for="roomNumber">Room Number</label>
                    <select class="form-control" id="roomNumber" name="roomNumber" required>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hostelproj", "root", "");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT RoomNumber FROM Room");

                                while (rs.next()) {
                                    String roomNumber = rs.getString("RoomNumber");
                                    out.println("<option value='" + roomNumber + "'>" + roomNumber + "</option>");
                                }
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-danger btn-block">Remove Room</button>
            </form>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 SERENE STAYS. All Rights Reserved.</p>
    </footer>
</body>
</html>
