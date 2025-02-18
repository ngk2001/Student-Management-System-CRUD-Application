<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Admin Access</title>  
</head>
<body style="height: 100vh;">
    <h2>Welcome</h2>
	<h4 style="color: red">
		<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String LoginError = (String) session.getAttribute("LoginError");
		String IdNotFound = (String) request.getAttribute("IdNotFound");
		if (LoginError != null) {
		out.print(LoginError);
		session.removeAttribute("LoginError");
		}
		if(IdNotFound != null){
			out.print(IdNotFound);
		}
		%>
	</h4>
	<div id="container">
	<h2>Admin Login</h2>
	<div class="login">
	<form action="Login" method="post">
		<input type="text" name="username" placeholder="Username"><br><br>
		<input type="password" name="password" placeholder="Password"><br>
		<br><input type="submit" value="Sign in">
	</form>
	</div>
	</div>
</body>
</html>