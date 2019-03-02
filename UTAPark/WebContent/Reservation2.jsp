<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking A Spot</title>
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
<body>
	<div align="center">
		<h1>Please select the parking area</h1>
		<form name="booking2" action="Bookslots?bookspots" method="post">
		
	</div>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

	<%
		String id = request.getParameter("userId");
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "utapark";
		String userId = "root";
		String password = "Sumedh95";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
	<h2 align="center">
		<font><strong>Available parking slots</strong></font>
	</h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>Parking Area</b></td>
			<td><b>Slots Available</b></td>
		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sql = "SELECT parking_Area,Count(parking_Area) from parkingspots where (parking_Area,parking_Number) NOT IN (SELECT parking_Area,parking_Number FROM reservations) AND membership_type='basic' Group by parking_Area;";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr bgcolor="#DEB887">

			<td><%=resultSet.getString(1)%></td>
			<td><%=resultSet.getString(2)%></td>

		</tr>
		  		

		<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		<tr>
  			
  			<td>
  				<input type="radio" name="parkings" id="parkings" value="Davis Floor 1" checked="checked">Davis Floor 1
  				<input type="radio" name="parkings" id="parkings" value="Maverick Floor 1">Maverick Floor 1
  				<input type="radio" name="parkings" id="parkings" value="Neddderman Floor 1">Neddderman Floor 1
  				<input type="radio" name="parkings" id="parkings" value="West Garage Floor 5">West Garage Floor 5
  			</td>
  		</tr>
	</table>
	<input name="action" value="bookspots" type="hidden">
  	<input type="submit" value="Continue">
  	</form>
</body>
</html>