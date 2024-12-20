<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Serene Stays Dashboard</title>

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


        .user-info {
            text-align: right;
            padding: 15px;
            background-color: #4B2840; /* Deep Purple */
            color: white;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* Two cards per row */
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
            height: 150px;
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
            background-color: #42033D; /* Deep Purple */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            margin: 15px 0;
            border-radius: 5px;
        }

        .card a:hover {
            background-color: #3A2D59; /* Darker Purple */
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
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Serene Stays</h1>
    </header>

    <!-- Navigation Bar -->
     <nav>
        <a href="dashboard.jsp" class="active">Dashboard</a>
        <a href="bookroom.jsp">Book Room</a>
        <a href="payment.jsp">Payments</a>
        <a href="profile.jsp">View Profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>

    <!-- User Info Section -->
    <div class="user-info">
        
        <span>Welcome, ${sessionScope.name} (${sessionScope.email})</span>
    </div>

    <!-- Main Content Section -->
    <div class="container">
        <!-- Card 1 -->
        <div class="card">
            <img src="images/bg2.jpg" alt="Room Image">
            <h2>Explore Rooms</h2>
            <p>See available rooms and choose the one that suits you best.</p>
            <a href="bookroom.jsp">Book Now</a>
        </div>

        <!-- Card 2 -->
        <div class="card">
            <img src="images/bg1.jpg" alt="Occupied Rooms">
               <h2>Current Room Details</h2>
    			<p>Check the details of your currently assigned room.</p>
   			 <a href="currentroomdetails.jsp">View Details</a>
		</div>

        <!-- Card 3 -->
        <div class="card">
            <img src="images/payment.jpg" alt="Payment">
            <h2>Payments</h2>
            <p>Check your payment history and make new payments.</p>
            <a href="payment.jsp">Go to Payments</a>
        </div>

        <!-- Card 4 -->
        <div class="card">
            <img src="images/complaint.jpg" alt="Profile">
            <h2>View Profile</h2>
            <p>Check out your details and update them.</p>
            <a href="profile.jsp">View Profile</a>
        </div>
    </div>
<br><br><br><br>
    <!-- Footer -->
    <div class="footer">
        <p>&copy; Serene Stays. All rights reserved.</p>
    </div>

</body>
</html>
