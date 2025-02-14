<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>AddStudent</title>
</head>
<body>
<h2>Register New Student</h2>
<h4 style="color:red">
<% 
try{
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("Username")==null){
		session.setAttribute("LoginError", "Please Login to Access!");
		  response.sendRedirect("Login.jsp");
	}
	String Errmsg=(String)request.getAttribute("ErrMsg");
if(Errmsg!=null){
	out.print(Errmsg);
}
}catch(Exception e){}
%>
</h4>
<div id="container">
<form action="AddStudent" method="post">
</label><input type="text" name="Sname" required><br>
<input type="number" name="Rnumber" required><br>
<select id="gender" name="gender" required> 
  <option value="" selected hidden></option>
  <option value="Male">Male</option>
  <option value="Female">Female</option>
  <option value="Other">Other</option>
  <option value="Prefer not to say">Prefer not to say</option>
</select>
<br>
<input type="date" name="DateofBirth" required> <br>
<select name="Department" required>
  <option value="" selected hidden></option>
  <option value="Computer Science">Computer Science</option>
  <option value="Mechanical">Mechanical</option>
  <option value="Electrical and Electronics">Electrical and Electronics</option>
  <option value="Electronics and Communication">Electronics and Communication</option>
</select><br>
<input type="number" name="Phnumber" required><br>
<input name="Address" required><br>
<input type="Submit">
</form>
</div>
</body>
</html>