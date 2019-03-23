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
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
if(userName == null) response.sendRedirect("index.jsp");
%>
<ul>
  <li><h3>Hi <%=userName %></h3></li>
  <li><form action="LogoutController" method="post"><input type="submit" value="Logout" ></form></li>
</ul>
</head>
<body>
<div align="left">
<h1>Enter the following details to book a spot</h1>
	<form name="booking1" action="Bookslots?findspots" method="post">
	
		
			<br>
			<br>
				Select Time : 
				<select name="hour" id="hour">
						<option value="1"> 1 </option>
						<option value="2"> 2 </option>
						<option value="3"> 3 </option>
						<option value="4"> 4 </option>
						<option value="5"> 5 </option>
						<option value="6"> 6 </option>
						<option value="7"> 7 </option>
						<option value="8"> 8 </option>
						<option value="9"> 9 </option>
						<option value="11"> 11 </option>
						<option value="12"> 12 </option>
						<option value="13"> 13 </option>
						<option value="14"> 14 </option>
						<option value="15"> 15 </option>
						<option value="16"> 16 </option>
						<option value="17"> 17 </option>
						<option value="18"> 18 </option>
						<option value="19"> 19 </option>
						<option value="20"> 20 </option>
						<option value="21"> 21 </option>
						<option value="22"> 22 </option>
						<option value="23"> 23 </option>
						<option value="00"> 00 </option>
				</select>
				<select name="minutes" id="minutes">
						<option value="00"> 00 </option>
						<option value="15"> 15 </option>
						<option value="30"> 30 </option>
						<option value="45"> 45 </option>
				</select>
				 hours
			<input name="FirstNameError"  value="${errormessage}" type="text"  style ="background-color: white; color: red; border: none; width: 800px"  disabled="disabled" maxlength="60">
			<br>
			<br>
			
			Select number of minutes : 
				<select name="time" id="time">
						<option value="15"> 15 </option>
						<option value="30"> 30 </option>
						<option value="45"> 45 </option>
						<option value="60"> 60 </option>
						<option value="75"> 75 </option>
						<option value="90"> 90 </option>
						<option value="105"> 105 </option>
						<option value="120"> 120 </option>
						<option value="135"> 135 </option>
						<option value="150"> 150 </option>
						<option value="165"> 165 </option>
						<option value="180"> 180 </option>
				</select>
			<br>
			<br>
			 Cart: 
  				<input type="radio" name="cart" id="cart" value="YES" >YES
  				<input type="radio" name="cart" id="cart" value="NO" checked="checked">NO
  				
  				<br>
  				<br>
			Camera: 
  				<input type="radio" name="camera" id="camera" value="YES" >YES
  				<input type="radio" name="camera" id="camera" value="NO" checked="checked">NO  		
  			<br>
  			<br>
			History: 
  				<input type="radio" name="history" id="history" value="YES" >YES
  				<input type="radio" name="history" id="history" value="NO" checked="checked">NO  			
			
			<br>
			<br>
			<br>
			<br>
			  	<input name="action" value="findspots" type="hidden">
  				<input type="submit" value="Find Spots">

	</form>
</div>
</body>
</html>