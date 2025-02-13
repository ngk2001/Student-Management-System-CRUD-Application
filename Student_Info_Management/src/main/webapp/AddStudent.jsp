<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddStudent</title>
</head>
<body>
<h3 style="color:red">
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
</h3>
<h2>Register New Student</h2>
<form action="AddStudent" method="post"><br>
<label for="Sname">Student Name:</label><input type="text" name="Sname" required><br>
<label for="Rnumber">Register Number</label><input type="number" name="Rnumber" required><br>
<label for="gender">Gender:</label>
<select id="gender" name="gender" required> 
  <option value="" selected hidden></option>
  <option value="Male">Male</option>
  <option value="Female">Female</option>
  <option value="Other">Other</option>
  <option value="Prefer not to say">Prefer not to say</option>
</select>
<br>
<label for="DateofBirth">Date of Birth:</label><input type="date" name="DateofBirth" required> <br>
<label for="Department">Department:</label>
<select name="Department" required>
  <option value="" selected hidden></option>
  <option value="Computer Science">Computer Science</option>
  <option value="Mechanical">Mechanical</option>
  <option value="Electrical and Electronics">Electrical and Electronics</option>
  <option value="Electronics and Communication">Electronics and Communication</option>
</select><br>
<label for="Phnumber">Phone Number:</label><input type="number" name="Phnumber" required><br>
<label for="Address">Address:</label> <input name="Address" required><br>
<input type="Submit">
</form>
</body>
</html>