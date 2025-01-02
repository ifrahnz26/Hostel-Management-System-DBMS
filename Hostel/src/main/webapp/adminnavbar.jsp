<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #0A3981;">
		<a class="navbar-brand" href="#"><b>SERENE STAYS</b></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="admindashboard.jsp">DashBoard</a></li>
				<li class="nav-item"><a class="nav-link" href="view_residents.jsp">View Residents</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manage Rooms</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="add_room.jsp">Add Room</a>
						<a class="dropdown-item" href="removeroom.jsp">Remove Room</a>
						<a class="dropdown-item" href="roomdetails.jsp">Room Details</a>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
			</ul>
		</div>
	</nav>
</header>
