<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Student Info Management</title>
</head>
<body>
<h1>Student Info Management</h1>
 <%  
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 if(session.getAttribute("Username")==null){
	 session.setAttribute("LoginError", "Please Login to Access!");
     response.sendRedirect("Login.jsp");
 }
 %>
 <div id="container">
<table>
<tr><td><a href="AddStudent.jsp"><input type="button" value="Add Student"></a>
<tr><td><a href="FetchStudent.jsp"><input type="button" value="Fetch Student"></a>
<tr><td><form action="EditStudent" method="post"><input type="submit" value="Edit Details"></form>
<tr><td><form action="Logout" method="post"><input type="submit" value="Log out"></form>
</table>
</div>
</body>
</html>