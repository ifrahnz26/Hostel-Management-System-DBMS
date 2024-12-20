s<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Room</title>
    <link rel="stylesheet" href="booking.css"> 
    <!-- Assuming your CSS is in booking.css -->
</head>
<body>

    <!-- Header -->
    <header>
        <h1>Book Your Room</h1>
    </header>

    <!-- Navigation Bar -->
    <nav>
        <a href="dashboard.jsp" class="active">Dashboard</a>
        <a href="bookroom.jsp">Book Room</a>
        <a href="payment.jsp">Payments</a>
        <a href="profile.jsp">View Profile</a>
        <a href="logout.jsp">Logout</a>
    </nav>
    

    <!-- Main Content -->
    <div class="container">
        <div class="booking-form">
            <h2>Complete Your Booking</h2>

            <form action="RoomBookingServlet" method="POST">
                <!-- Room Number -->
                <div class="form-group">
                    <label for="roomNumber">Room Number</label>
                    <input type="text" id="roomNumber" name="roomNumber" 
                           value="<%= request.getParameter("roomNumber") != null ? request.getParameter("roomNumber") : "" %>" readonly>
                </div>

                <!-- Check-in Date -->
                <div class="form-group">
                    <label for="checkInDate">Check-in Date</label>
                    <input type="date" id="checkInDate" name="checkInDate" required>
                </div>

                <!-- Duration -->
                <div class="form-group">
                    <label for="duration">Duration (in days)</label>
                    <input type="number" id="duration" name="duration" required min="1">
                </div>

                <!-- Food Selection -->
                <div class="form-group">
                    <label>Would you like to include food?</label>
                    <div class="food-options">
                        <input type="radio" id="foodYes" name="foodOption" value="yes" required>
                        <label for="foodYes">Yes</label>

                        <input type="radio" id="foodNo" name="foodOption" value="no" required>
                        <label for="foodNo">No</label>
                    </div>
                </div>

                <!-- Meals Per Day -->
                <div class="form-group" id="mealsPerDay" style="display: none;">
                    <label for="meals">Meals per day</label>
                    <select id="meals" name="meals">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                    <input type="submit" value="Confirm Booking">
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Serene Stays. All rights reserved.</p>
    </div>

    <script>
        // Toggle visibility of the meals per day selection
        const foodYes = document.getElementById('foodYes');
        const foodNo = document.getElementById('foodNo');
        const mealsPerDay = document.getElementById('mealsPerDay');

        foodYes.addEventListener('change', () => mealsPerDay.style.display = 'block');
        foodNo.addEventListener('change', () => mealsPerDay.style.display = 'none');

        // Initialize the visibility based on the selected food option
        document.addEventListener('DOMContentLoaded', function() {
            if (foodYes.checked) {
                mealsPerDay.style.display = 'block';
            } else {
                mealsPerDay.style.display = 'none';
            }
        });
    </script>
</body>
</html>
