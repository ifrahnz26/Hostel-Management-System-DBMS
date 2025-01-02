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
    <!-- Registration Form -->
    <div id="logreg-forms">
        <form class="form-signin" action="RegisterServlet" method="POST">
            <h1>Register</h1>
            <input type="text" class="form-control" placeholder="Name" required name="name" />
            <input type="email" class="form-control" placeholder="Email" required name="email" />
            <input type="text" class="form-control" placeholder="Phone Number" required name="phone" />
            <input type="text" class="form-control" placeholder="Address" required name="address" />
            <input type="password" class="form-control" placeholder="Password" required name="password" />
            <button class="btn btn-block" type="submit">Register</button>
            <a href="userlogin.jsp">Already have an account? Login</a>
        </form>
    </div>
</body>
</html>
