<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Serene Stays | Home</title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link rel="canonical"
    href="https://getbootstrap.com/docs/4.5/examples/carousel/">

<style>
.bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

@media ( min-width : 768px) {
    .bd-placeholder-img-lg {
        font-size: 3.5rem;
    }
}
footer {
    background-color: #A888B5; /* Muted lavender background */
    color: #ffffff; /* White text for better contrast */
    padding-top: 2rem;
    padding-bottom: 1rem;
    text-align: center;
    font-size: 14px;
    margin-top: auto; /* Push footer to the bottom */
}

hr.light {
    border-top: 1px solid #FFD2A0; /* Light orange color for the separator */
    width: 75%;
    margin-top: 0.8rem;
    margin-bottom: 1rem;
}

footer a {
    color: #FFD2A0; /* Light orange for links */
    text-decoration: none;
    transition: color 0.3s ease;
}

footer a:hover {
    color: #ffffff; /* White on hover */
}

footer h5 {
    font-weight: bold;
    text-transform: uppercase;
    margin-bottom: 1rem;
}

footer p {
    margin-bottom: 0.5rem;
}

footer .social-icons a {
    margin: 0 10px;
    font-size: 20px;
    color: #FFD2A0; /* Match link color */
    transition: color 0.3s ease, transform 0.3s ease;
}

footer .social-icons a:hover {
    color: #ffffff;
    transform: scale(1.2); /* Zoom effect on hover */
}

footer .address,
footer .hours,
footer .service-areas {
    margin-bottom: 1rem;
}

footer .container-fluid {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 15px;
}

@media (max-width: 768px) {
    footer h5 {
        font-size: 16px;
    }

    footer p {
        font-size: 14px;
    }
}


/* Updated Color Scheme */

</style>
<link rel="stylesheet" type="text/css" href="index.css">

</head>
<body>
    <form id="form1">
        <header>
            <!--Navigation Bar-->
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <a class="navbar-brand" href="#"><b>SERENE STAYS</b></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarCollapse" aria-controls="navbarCollapse"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a class="nav-link"
                            href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="aboutus.jsp">About</a></li>
                        <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#" id="dropdown03"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown03">
                                <a class="dropdown-item" href="userlogin.jsp">Resident</a>
                                <a class="dropdown-item" href="adminlogin.jsp">Admin</a>
                            </div></li>
                        <li class="nav-item"><a class="nav-link" href="register.jsp">Sign
                                Up</a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <!--Image Carousel (Unchanged)-->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <svg class="bd-placeholder-img" width="100%" height="100%"
                        xmlns="http://www.w3.org/2000/svg"
                        preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                        <rect width="100%" height="100%" fill="#777" /></svg>
                    <img src="images/bg1.jpg" />
                    <div class="container">
                        <div class="carousel-caption text-left">
                            <h1><b>Manage with Ease.</b></h1>
                            <p>An Efficient and User-Friendly Hostel Management Solution.</p>
                            <p>
                                <a class="btn btn-lg btn-primary" href="register.jsp"
                                    role="button">Get Started</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <svg class="bd-placeholder-img" width="100%" height="100%"
                        xmlns="http://www.w3.org/2000/svg"
                        preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                        <rect width="100%" height="100%" fill="#777" /></svg>
                    <img src="images/bg2.jpg" />
                    <div class="container">
                        <div class="carousel-caption">
                            <h1><b>Organized and Secure.</b></h1>
                            <p>Streamline Student and Staff Data with Robust Security.</p>
                            <p>
                                <a class="btn btn-lg btn-primary" href="aboutus.jsp"
                                    role="button">Learn More</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <svg class="bd-placeholder-img" width="100%" height="100%"
                        xmlns="http://www.w3.org/2000/svg"
                        preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                        <rect width="100%" height="100%" fill="#777" /></svg>
                    <img src="images/bg3.jpg" />
                    <div class="container">
                        <div class="carousel-caption text-right">
                            <h1><b>Seamless Management.</b></h1>
                            <p>A Centralized System for All Hostel Operations.</p>
                            <p>
                                <a class="btn btn-lg btn-primary" href="userlogin.jsp"
                                    role="button">Login</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#myCarousel" role="button"
                data-slide="prev"> <span class="carousel-control-prev-icon"
                aria-hidden="true"></span> <span class="sr-only">Previous</span>
            </a> <a class="carousel-control-next" href="#myCarousel" role="button"
                data-slide="next"> <span class="carousel-control-next-icon"
                aria-hidden="true"></span> <span class="sr-only">Next</span>
            </a>
        </div>

        <!--Updated Jumbotron-->
        <div class="container-fluid padding">
            <div class="row welcome text-center">
                <div class="col-12">
                    <h1 class="display-4">Simplify Hostel Life.</h1>
                </div>
                <hr />
                <div class="col-12">
                    <p class="lead">A Modern Solution to Manage Hostel Rooms, Residents, and Staff Efficiently.</p>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row text-center padding">
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <h3>Convenient</h3>
                    <p>Streamlined Room Allocation and Staff Management.</p>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <i class="fa fa-lock" aria-hidden="true"></i>
                    <h3>Secure</h3>
                    <p>Data Privacy and Robust Security Measures.</p>
                </div>
                <div class="col-sm-12 col-md-4">
                    <i class="fa fa-calendar-check" aria-hidden="true"></i>
                    <h3>Reliable</h3>
                    <p>Ensure Smooth Day-to-Day Operations.</p>
                </div>
            </div>
            <hr class="my-4" />
        </div>

        <!--Connect Section-->
        <div class="container-fluid padding">
			<div class="row text-center padding">
				<div class="col-12">
					<h2>Connect</h2>
				</div>
				<div class="col-12 social padding">
					<a href="https://www.facebook.com/"><i class="fab fa-facebook"></i></a>
					<a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
					<a href="https://www.instagram.com/"><i
						class="fab fa-instagram"></i></a> <a
						href="https://myaccount.google.com/intro/personal-info"><i
						class="fab fa-google-plus-g"></i></a> <a href="https://twitter.com/"><i
						class="fab fa-twitter"></i></a>
				</div>
			</div>
		</div>

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
				<hr class="light" />
				<h5>Office Hours</h5>
				<hr class="light" />
				<p>Monday to Friday: 9AM - 6PM</p>
				<p>Saturday: 10AM - 2PM</p>
				<p>Sunday: Closed</p>
			</div>

			<!-- Service Areas Section -->
			<div class="col-md-4">
				<hr class="light">
				<h5>Service Areas</h5>
				<hr class="light" />
				<p>All major cities in India</p>
				<p>Support for on-campus hostels</p>
				<p>Hostel Management System Users</p>
			</div>

			<!-- Footer -->
			<div class="col-12">
				<hr class="light" />
				<h5>&copy; Serene Stays</h5>
			</div>
		</div>
	</div>
</footer>

</body>
</html>
