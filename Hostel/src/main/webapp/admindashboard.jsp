<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Serene Stays Admin Dashboard</title>

<!-- External CSS and JS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
    height: 100vh; /* Ensure the body takes full height of the viewport */
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
    margin: 0;
    font-size: 28px;
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

nav a.active {
    background-color: #0A3981; /* Deep Blue for active link */
}

.user-info {
    text-align: right;
    padding: 15px;
    background-color: #0A3981; /* Deep Blue */
    color: white;
}

main {
    flex: 1; /* Take up all available space */
    display: flex;
    justify-content: center;
    align-items: center;
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
    width: full;
    height: 350px;
    object-fit: cover;
}

.card h2 {
    margin: 15px 0;
    font-size: 25px;
    color: #0A3981; /* Deep Blue */
}

.card p {
    font-size: 16px;
    color: #555;
    margin: 10px 20px;
}

.card a {
    display: inline-block;
    background-color: #0A3981; /* Deep Blue */
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    margin: 15px 0;
    border-radius: 5px;
}

.card a:hover {
    background-color: #80C4E9; /* Light Blue */
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
        <br>
            <h1>Serene Stays Admin Dashboard</h1>
        </header>
        
        <!-- Main Content -->
        <main role="main">
            <div id="cardCarousel" class="carousel slide" data-ride="carousel" style="max-width: 900px; width: 100%;">
                <div class="carousel-inner">
                    <!-- Card 1: View Current Residents -->
                    <div class="carousel-item active">
                        <div class="card">
                            <img src="images/user.jpg" alt="Residents">
                            <h2>View Current Residents</h2>
                            <p>View the residents living in the hostel.</p>
                            <a href="view_residents.jsp">View Residents</a>
                        </div>
                    </div>
                    
                    <!-- Card 2: Add New Room -->
                    <div class="carousel-item">
                        <div class="card">
                            <img src="images/room1.jpg" alt="Add Room">
                            <h2>Add New Room</h2>
                            <p>Add new rooms to the hostel system.</p>
                            <a href="add_room.jsp">Add Room</a>
                        </div>
                    </div>
                    
                    <!-- Card 3: Remove Room -->
                    <div class="carousel-item">
                        <div class="card">
                            <img src="images/room2.jpg" alt="Remove Room">
                            <h2>Remove Room</h2>
                            <p>Remove details an existing room.</p>
                            <a href="removeroom.jsp">Remove Room</a>
                        </div>
                    </div>
                    <!-- Card 4: Room details -->
                    <div class="carousel-item">
                        <div class="card">
                            <img src="images/bg2.jpg" alt="Room Details">
                            <h2>Room Details</h2>
                            <p>Details of all the room.</p>
                            <a href="roomdetails.jsp">Room Details</a>
                        </div>
                    </div>
                </div>
                <!-- Carousel controls -->
                <a class="carousel-control-prev" href="#cardCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#cardCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </main>
        
        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2024 SERENE STAYS. All Rights Reserved.</p>
        </footer>
</body>
</html>
