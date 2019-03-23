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
		<h1>You have been currently revoked</h1>
		<h1>Reason for revokation can be found in the table bellow</h1>
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
			<td><b>Status</b></td>
			<td><b>Reason</b></td>
	
		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				
				String sql = "SELECT message from userstatus where username='"+userName+"';";
				
				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr bgcolor="#DEB887">

			<td>Revoked</td>
			<td><%=resultSet.getString(1)%></td>


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