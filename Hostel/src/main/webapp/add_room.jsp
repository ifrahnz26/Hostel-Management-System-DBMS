<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Room - Admin Dashboard</title>

    <!-- External CSS and JS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- Font Awesome Icons -->
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #D4EBF8; /* Light Blue Background */
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #0A3981; /* Deep Blue */
            color: white;
            padding: 15px 20px;
            text-align: center;
        }

        header h1 {
            margin-top: 5px;
            font-size: 35px;
        }

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

        .user-info {
            text-align: right;
            padding: 15px;
            background-color: #0A3981; /* Deep Blue */
            color: white;
        }
        .text-center{
            font-family: 'Roboto', sans-serif; /* Change the font family (you can choose any other font) */
                        font-size: 35px;
            
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
            margin-bottom: 50px
            
        }

        .form-group {
            margin-bottom: 1rem;
            font-size: 20px
        }

        .table th, .table td {
            text-align: center;
            padding: 12px;
        }

        .footer {
            background-color: #80C4E9; /* Light Blue */
            color: white;
            padding: 5px;
            text-align: center;
            position: fixed;
            width: 100%;
            bottom: 0;
            
        }

        .image-row {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .image-row img {
    width: 30%; /* Adjust the width as needed */
    height: 200px; /* Set the height to a fixed value */
    object-fit: cover; /* Ensure the image covers the area and is cropped if necessary */
    margin-top: 15px;
    margin-bottom: 15px;
    border-radius: 8px; /* Optional: adds rounded corners to the image */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Optional: adds a shadow effect */
}


        .image-row img:hover {
            transform: scale(1.05);
            transition: 0.3s ease;
        }

        @media (max-width: 768px) {
            .container {
                padding: 0;
            }

            .image-row {
                flex-direction: column;
                align-items: center;
            }

            .image-row img {
                width: 80%;
                height: 50px;
                margin-top: 15px;
                margin-bottom: 15px
            }
        }
        
        -shadow: 0 0 5px 2px rgba(212, 77, 98, 0.5); /* Add a glow effect when focused */
}
    </style>
</head>
<body>

    <!-- Include Navbar -->
    <jsp:include page="adminnavbar.jsp" />
    
    <header>
    <br><br>
        <h1>Add New Room</h1>
    </header>

<div class="image-row">
        <img src="images/room1.jpg" alt="Room 1">
        <img src="images/room2.jpg" alt="Room 2">
        <img src="images/bg2.jpg" alt="Room 3">
    </div>
    <!-- Main Content -->
    <main role="main">
        <div class="container">
            <h2 class="text-center">Room Details Form</h2>
            <form action="AddRoomServlet" method="post">
                <div class="form-group">
                    <label for="roomNumber">Room Number</label>
                    <input type="text" class="form-control" id="roomNumber" name="roomNumber" required>
                </div>
                <div class="form-group">
                    <label for="roomType">Room Type</label>
                    <select class="form-control" id="roomType" name="roomType" required>
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        <option value="Dormitory">Dormitory</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price (₹)</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
                <div class="form-group">
                    <label for="availability">Availability</label>
                    <select class="form-control" id="availability" name="availability" required>
                        <option value="Available">Available</option>
                        <option value="Occupied">Occupied</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="ac">AC</label>
                    <select class="form-control" id="ac" name="ac" required>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="balcony">Balcony</label>
                    <select class="form-control" id="balcony" name="balcony" required>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="buildingName">Building Name</label>
                    <input type="text" class="form-control" id="buildingName" name="buildingName" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Add Room</button>
            </form>
        </div>
    </main>

    <!-- Image Section -->
    

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 SERENE STAYS. All Rights Reserved.</p>
    </footer>

</body>
</html>
