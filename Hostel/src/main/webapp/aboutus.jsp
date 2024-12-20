<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Serene Stays | About Us</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

<style>
body {
    font-family: Arial, sans-serif;
    background-color: #DAB1DA;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Ensures the page takes full height */
}


        header .navbar {
            background-color: #6A669D !important; /* Purple background */
        }

        header .navbar-nav .nav-link {
            color: #ffffff !important; /* White text */
        }

        header .navbar-nav .nav-link:hover, 
        header .navbar-nav .nav-item.active .nav-link {
            color: #EFB6C8 !important; /* Soft pink */
        }

        header .navbar .dropdown-menu {
            background-color: #A888B5; /* Light purple */
        }

        header .navbar .dropdown-item {
            color: #ffffff;
        }

        header .navbar .dropdown-item:hover {
            background-color: #FBF4DB; /* Light orange */
            color: #000000; /* Black */
        }

        #logreg-forms {
            width: 400px;
            margin: 12vh auto;
            background-color: #ffffff;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            overflow: hidden;
            padding: 20px;
        }

        #logreg-forms h1 {
            font-size: 24px;
            font-weight: 700;
            color: #4A4747;
            text-align: center;
            margin-bottom: 20px;
        }

        #logreg-forms .form-control {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            font-size: 14px;
            margin-bottom: 15px;
        }

        #logreg-forms .btn {
            background-color: #6A669D;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
        }

        #logreg-forms .btn:hover {
            background-color: #4A4747;
        }

        #logreg-forms a {
            text-align: center;
            color: #6A669D;
            font-size: 14px;
            text-decoration: none;
            display: block;
            margin-top: 10px;
        }

        #logreg-forms a:hover {
            color: #4A4747;
        }

        #logreg-forms h5 {
            color: red;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }

        @media (max-width: 576px) {
            #logreg-forms {
                width: 90%;
            }
        }
        .jumbotron {
    padding: 1rem;
    background-color: #EEE1FF; /* Light pink for the jumbotron */
    border-radius: 0;
}
         

        footer {
            background-color: #6A669D;
            color: white;
            padding: 10px 0;
            text-align: center;
        }

/* About Us Section */
.about-us {
    background-color: #ffffff;
    margin: 3rem auto;
    padding: 2rem;
    max-width: 800px;
    border-radius: 10px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
}

/* Section Title */
.about-us h1 {
    font-size: 28px;
    font-weight: 700;
    color: #4A4747;
    text-align: center;
    margin-bottom: 1.5rem;
}

/* About Us Content */
.about-us p {
    font-size: 16px;
    color: #4A4747;
    line-height: 1.6;
    margin-bottom: 1rem;
}

/* Team Section */
.about-us .team {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    margin-top: 2rem;
}

.about-us .team .member {
    background-color: #ffffff;
    padding: 1rem;
    width: 30%;
    border-radius: 10px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-bottom: 1.5rem;
}

.about-us .team .member img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    margin-bottom: 1rem;
}

.about-us .team .member h3 {
    font-size: 18px;
    font-weight: 600;
    color: #6A669D;
}

.about-us .team .member p {
    font-size: 14px;
    color: #4A4747;
}
#content {
    flex: 1; /* Pushes footer to the bottom if content is short */
}

/* Footer */
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

</style>
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

		<main role="main">

			<div class="jumbotron">
				<div class="container">
				<br><br><br><br>
					<h1 class="display-4"><b>About Our Hostel</b></h1>
					<p>Serene Stays Hostel Management System is designed to streamline hostel operations by providing a comprehensive platform for room bookings, payments, and overall administration. Our system ensures transparency and convenience for both hostel residents and administrators.</p>
					<p>With features like online booking, payment integration, and room management, the system aims to provide a seamless experience for users. Security, reliability, and user-friendliness are at the heart of our design philosophy.</p>
					
				</div>
			</div>

			<div class="container">
    <div class="row text-center"> <!-- Added text-center for alignment -->
        <div class="col-md-4">
            <h2><b>Admin</b></h2>
            <p>Admins can manage room allocations, monitor payments, and oversee booking activities with ease.</p>
            <img src="images/admin.jpg" alt="Admin" class="img-fluid" style="max-height: 200px;"> <!-- Admin Image -->
        </div>
        <div class="col-md-4">
            <h2><b>Residents</b></h2>
            <p>Residents can book rooms, choose meal plans, and make payments online, ensuring convenience and transparency.</p>
            <img src="images/resident.jpg" alt="Residents" class="img-fluid" style="max-height: 200px;"> <!-- Residents Image -->
        </div>
        <div class="col-md-4">
            <h2><b>Why Choose Us?</b></h2>
            <p>We provide a reliable, secure, and user-friendly system to make hostel management simple and efficient.</p>
            <img src="images/hostel.jpg" alt="Why Choose Us" class="img-fluid" style="max-height: 200px;"> <!-- Why Choose Us Image -->
        </div>
    </div>
    <hr>
</div>


		</main>

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
				<h5>&copy; SERENE STAYS</h5>
			</div>
		</div>
	</div>
</footer>

	</form>
</body>
</html>
