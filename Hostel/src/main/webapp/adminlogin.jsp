<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
          crossorigin="anonymous">
    <title>Serene Stays | Login</title>
    
   <link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    
<link rel="stylesheet" type="text/css" href="adminlogin.css">
</head>
<body>
    <!-- Navigation Bar -->
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
            <a class="navbar-brand" href="#"><b>SERENE STAYS</b></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarCollapse" aria-controls="navbarCollapse"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown03"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown03">
                            <a class="dropdown-item" href="userlogin.jsp">Resident</a>
                            <a class="dropdown-item" href="adminlogin.jsp">Admin</a>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Sign Up</a></li>
                </ul>
            </div>
        </nav>
    </header>
<br><br>
    <!-- Login Form -->
    <div id="logreg-forms">
        <form class="form-signin" action="adminlogin" method="GET">
            <h1>Admin Login</h1>
            <input type="email" class="form-control" placeholder="Email" required autofocus name="email" />
            <input type="password" class="form-control" placeholder="Password" required name="pass" />
            <button class="btn btn-block" type="submit">Login</button>
            
        </form>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container-fluid padding">
            <div class="row text-center">
                <!-- Address Section -->
                <div class="col-md-4">
                    <hr class="light">
                    <h5>Our Address</h5>
                    <hr class="light">
                    <p>+91 9876543210</p>
                    <p>support@serenestays.com</p>
                    <p>City Name, India - 123456</p>
                </div>

                <!-- Hours Section -->
                <div class="col-md-4">
                    <hr class="light">
                    <h5>Office Hours</h5>
                    <hr class="light">
                    <p>Monday to Friday: 9AM - 6PM</p>
                    <p>Saturday: 10AM - 2PM</p>
                    <p>Sunday: Closed</p>
                </div>

                <!-- Service Areas Section -->
                <div class="col-md-4">
                    <hr class="light">
                    <h5>Service Areas</h5>
                    <hr class="light">
                    <p>All major cities in India</p>
                    <p>Support for on-campus hostels</p>
                    <p>Hostel Management System Users</p>
                </div>

                <!-- Footer Text -->
                <div class="col-12">
                    <hr class="light">
                    <h5>&copy; SERENE STAYS</h5>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
