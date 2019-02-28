<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<center>
		<h1>Welcome to UTA Park</h1>
		<h2>Login to continue</h2>
		<form name="loginForm" action="LoginController" method="post">
			<table class="Logintable">
				<tr>
					<td>Username:</td>
					<td><input name="username" id="username" type="text"
						value="${user.username}"></td>
					<td><input name="userNameError"
						value="${errorMsgs.userNameError}" type="text"
						style="background-color: white; color: red; border: none; width: 800px"
						disabled="disabled" maxlength="60"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input name="password" id="password" type="password"
						value="${user.password}"></td>
					<td><input name="passwordError"
						value="${errorMsgs.passwordError}" type="text"
						style="background-color: white; color: red; border: none; width: 800px"
						disabled="disabled" maxlength="60"></td>
				</tr>
				<tr>
					<td></td>
					<td><input name="action" value="loginUser" type="hidden">
						<input type="submit" value="Login"></td>
				</tr>
				<tr>
					<td>New User?</td>
					<td><button type="button"
							onclick="window.location.href='register.jsp'">Register
							Now</button></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
