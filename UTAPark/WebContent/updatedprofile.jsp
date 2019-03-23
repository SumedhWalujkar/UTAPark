<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Update Profile</title>
</head>
<body>
<h2>UPDATE PROFILE</h2>
<p>${message}</p>
<c:remove var="message" scope="session" /> 
<form name="updateForm" action="./UserController?updateUser" method="post">
	<table class="updatetable">
	<c:forEach items="${profile}" var="item">
		<tr>
			<td> Prefix: </td>
			<td>
				<select name="prefix" id="prefix">
					<option value="${item.prefix}" ${item.prefix == item.prefix ? 'selected="selected"' : ''}>${item.prefix}</option>
					<option value="Mr.">Mr.</option>
					<option value="Mrs.">Mrs.</option>
					<option value="Master">Master</option>
					<option value="Miss">Miss</option>
				</select>
			</td>
		</tr>
		<tr>
  			<td> First Name: </td>
  			<td><input name="firstname" id="firstname" type="text" value='${item.firstname}' disabled></td>
  		</tr>
  		<tr>
  			<td> Last Name: </td>
  			<td><input name="lastname" id="lastname" type="text" value='${item.lastname}' disabled></td>
  		</tr>
  		<tr>
  			<td> UTA ID: </td>
  			<td> <input name="utaid" id="utaid" type="number" value='${item.utaid}' disabled></td>
    	</tr>
  		<tr>
  			<td> Username: </td>
  			<td><input name="username" id="username" type="text" value='${item.username}' disabled></td>
  		</tr>
  		<tr>
  			<td> Email: </td>
  			<td><input name="email" id="email" type="text" value='${item.email}' disabled></td>
  		</tr>
  		<tr>
  			<td> Password: </td>
  			<td><input name="password" id="password" type="password" value='${item.password}' disabled></td>
  		</tr>
  		<tr>
  			<td> Confirm Password: </td>
  			<td><input name="cnfpassword" id="cnfpassword" type="password"  value='${item.cnfpassword}' disabled></td>
  		</tr>
  		<tr>
  			<td> Phone: </td>
  			<td><input name="phone" id="phone" type="number" placeholder="1234567890"  value='${item.phone}' disabled></td>
  		</tr>
  		<tr>
  			<td> Date of Birth: </td>
  			<td><input name="dob" id="dob" type="text" placeholder="YYYY-MM-DD" value='${item.dob}' disabled></td>
  	</tr>
  		<tr>
  			<td> Age: </td>
  			<td><input name="age" id="age" type="number" value='${item.age}' disabled></td>
  		</tr>
  		<tr>
  			<td> Country of Residence: </td>
  			<td><input name="country" id="country" type="text" value='${item.country}' disabled></td>
  		</tr>
  		<tr>
  			<td> Street Address: </td>
  			<td><input name="address" id="address" type="text" value='${item.address}' disabled></td>
  		</tr>
  		<tr>
  			<td> City: </td>
  			<td><input name="city" id="city" type="text" value='${item.city}' disabled></td>
  		</tr>
  		<tr>
  			<td> State: </td>
  			<td><input name="state" id="state" type="text" value='${item.state}' disabled></td>
  		</tr>
  		<tr>
  			<td> PIN Code: </td>
  			<td><input name="pin" id="pin" type="number" value='${item.pin}' disabled></td>
  		</tr>
  		<tr>
  			<td> Driving License Number: </td>
  			<td><input name="dlnumber" id="dlnumber" type="text" value='${item.dlnumber}' disabled></td>
  		</tr>
  		<tr>
  			<td> Driving License Expiry Date: </td>
  			<td><input name="dlexp" id="dlexp" type="text" placeholder="YYYY-MM-DD"  value='${item.dlexp}' disabled></td>
  		</tr>
  		<tr>
  			<td> Issuing Country: </td>
  			<td><input name="dlcountry" id="dlcountry" type="text" value='${item.dlcountry}' disabled></td>
  		</tr>
  		<tr>
  			<td> Permit Type: </td>
  			<td>
  				<input type="radio" name="usertype" id="usertype" value="basic" checked="checked">Basic
  				<input type="radio" name="usertype" id="usertype" value="premium">Premium
  				<input type="radio" name="usertype" id="usertype" value="midrange">Mid-Range
  				<input type="radio" name="usertype" id="usertype" value="access">Access
  			</td>
  		</tr>
  		<tr>
  			<td> User Type: </td>
  			<select disabled>
  				<option value="User">User</option>
					<option value="Manager">Manager</option>
					<option value="Admin">Admin</option>
  			</select>
  		</tr>
  		
  		<tr>
  			<td></td>
  			<td><input name="status" id="status" type="hidden" value="Enabled"></td>
  		</tr>
  		<tr>
    		<td colspan="2"></td>
		</tr>
		<tr>
    		<td colspan="2"></td>
		</tr>
  		<tr>
  			<td></td>
  		</tr>
  		</c:forEach>
  	</table>
  	<input name="action" value="updateUser" type="hidden">
  	</form>
  	<form name="returnHomeForm" action="userhome.jsp" method="post">
  	
  	<input name="action" value="returnHome" type="hidden">
  	<input type="submit" value="Return to Home">
  	</form>
  	
</body>
</html>