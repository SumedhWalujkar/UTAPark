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
		<h1>Booking Status</h1>
		<form>
		
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
		<font><strong></strong></font>
	</h2>
	<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>Parking Area</b></td>
			<td><b>Parking Number</b></td>
			
			<td><b>Start time</b></td>
			<td><b>End time</b></td>
			<td><b>Cost in Dollars</b></td>
			<td><b>Booking Status</b></td>
		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				
				String sql = "SELECT parking_Area,parking_Number,starttime_hour,starttime_minutes,endtime_hour,endtime_minutes,status,cost from reservations where username='"+userName+"';";
				
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr bgcolor="#DEB887">

			<td><%=resultSet.getString(1)%></td>
			<td><%=resultSet.getString(2)%></td>
			<td><%=resultSet.getString(3)%>:<%=resultSet.getString(4)%></td>
			<td><%=resultSet.getString(5)%>:<%=resultSet.getString(6)%></td>
			<td><%=resultSet.getString(8)%></td>
			<td><%=resultSet.getString(7)%></td>

		</tr>
		  		

		<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</table>
	<a href="userhome.jsp">Homepage</a><br><br>
  	</form>
</body>
</html>