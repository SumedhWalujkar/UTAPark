<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<body>
<center>
<h2>Payment</h2>
<form name="paymentForm" action="PaymentController?payahead" method="post">
	<table class="paytable">
		<tr>
  			<td> Name on Card: </td>
  			<td><input name="name" id="name" type="text" value="${payment.name}"></td>
  			 <td> <input name="namError"  value="${error.namError}" type="text"  style ="background-color: white; color: red; border: none; width: 800px"  disabled="disabled" maxlength="60"> </td>
  		</tr>
  		
  		<tr>
  			<td> Card Number: </td>
  			<td><input name="cardnumber" id="cardnumber" type="text" value="${payment.cardnumber}"></td>
  			<td> <input name="cardnumberError"  value="${error.cardnumberError}" type="text"  style ="background-color: white; color: red; border: none; width: 800px"  disabled="disabled" maxlength="60"> </td>
  		</tr>
  		<tr>
  			<td> Card Type: </td>
  			<td>
				<select name="userrole" id="userrole" value="${payment.cardtype}">
					<option value="VISA">VISA</option>
					<option value="MasterCard">MasterCard</option>
					<option value="AMEX">AMEX</option>
					<option value="Discover">Discover</option>
				</select>
			</td>
			
  		</tr>
  		<tr>
  			<td> CVV: </td>
  			<td><input name="cvv" id="cvv" type="text" value="${payment.cvv}"></td>
  			<td> <input name="cvvError"  value="${error.cvvError}" type="text"  style ="background-color: white; color: red; border: none; width: 800px"  disabled="disabled" maxlength="60"> </td>
  		</tr>
  		
  		<tr>
  			<td> Expiry Date: </td>
  			<td><input name="expirydate" id="expirydate" type="text" placeholder="YYYY-MM" value="${payment.expirydate}"></td>
  			<td> <input name="expirydateError"  value="${error.expirydateError}" type="text"  style ="background-color: white; color: red; border: none; width: 800px"  disabled="disabled" maxlength="60"> </td>
  		</tr>
		
	</table>
	  	<input name="action" value="payahead" type="hidden">
  	<input type="submit" value="Register">
</form>

</center>
</body>
</html>