<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Information Management</title>
</head>
<body>

 <%  
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 if(session.getAttribute("Username")==null){
	 session.setAttribute("LoginError", "Please Login to Access!");
     response.sendRedirect("Login.jsp");
 }
 %>
<h1>Student Info Management System</h1>
<table border="1">
<tr><td><a href="AddStudent.jsp"><input type="button" value="Add Student"></a>
<tr><td><a href="FetchStudent.jsp"><input type="button" value="Fetch Student"></a>
<tr><td><form action="EditStudent" method="post"><input type="submit" value="Edit Details"></form>
<tr><td><form action="Logout" method="post"><input type="Submit" value="Log out"></form>
</table>
</body>
</html>