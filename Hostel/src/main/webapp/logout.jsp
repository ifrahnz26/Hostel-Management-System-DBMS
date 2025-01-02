<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
</head>
<body>
    <%
        // Invalidate the session to log the user out
        HttpSession hs = request.getSession(false); 
        if (hs != null) {
            hs.invalidate(); // Invalidate the session
        }

        response.sendRedirect("index.jsp");
    %>
</body>
</html>
