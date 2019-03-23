<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<link rel="stylesheet" href="stylesheet.css">
<%
	String userName = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user"))
				userName = cookie.getValue();
		}
	}
	if (userName == null)
		response.sendRedirect("index.jsp");
%>
<ul>
	<li><h3>
			Hi
			<%=userName%></h3></li>
	<li><form action="LogoutController" method="post">
			<input type="submit" value="Logout">
		</form></li>
</ul>
</head>
<center>
	<body class="center">

		<h1>Profile Status</h1>
		<h2 style="background-color: white; color: green";>CONGRATULATIONS!!!
			</h2>
		<h2 style="background-color: white; color: green";>YOUR RESERVATION IS CONFIRMED. YOU CAN VIEW, EDIT OR DELETE YOUR RESERVATION IN THE HOMEPAGE 
			</h2>
		<a href="userhome.jsp">Homepage</a>
		
		<br>
		<br>
	</body>
</html>