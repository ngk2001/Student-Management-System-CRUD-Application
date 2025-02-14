<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
</style>
<link rel="stylesheet" href="style.css">
<title>Admin Access</title>
</head>
<body>
	<h3 style="color: red">
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
	</h3>
	<h2>Welcome </h2>
	<div>
	<form action="Login" method="post">
	
		<lable><b>UserName:</b></lable><input type="text" name="username"><br>
		<lable><b>Password:</b></lable><input type="password" name="password"><br>
		<br><input type="submit" value="Login">
	</form>
	</div>
</body>
</html>