<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.StudentObject, java.util.ArrayList"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Fetching All</title>
</head>
<body style="height: 100vh">
<h2>Student Details</h2>
<% try{
	 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	 if(session.getAttribute("Username")==null){
		 session.setAttribute("LoginError", "Please Login to Access!");
	     response.sendRedirect("Login.jsp");
	     }
	String NotFound = (String)request.getAttribute("NotFound");
	if(NotFound !=null && !NotFound.trim().isEmpty()){ %>
	<h3 style="color:red"> <%= NotFound %> </h3>
	
	<%}else{
		ArrayList<StudentObject> Students =(ArrayList<StudentObject>) request.getAttribute("StudentList"); %>
		<div id="container">
		<table border="1" class="fetch">
		<thead>
		<tr>
		<th>Student Name</th>
		<th>Register Number</th>
		<th>Gender</th>
		<th>Date of Birth</th>
		<th>Department</th>
		<th>Phone Number</th>
		<th>Address</th>
		</tr></thead>
		<tbody>
		<%for(StudentObject Student: Students){%>
	   <tr><td><%=Student.getStudentName()%>
		<td><%=Student.getRegisterNumber()%>
		<td><%=Student.getGender()%>
		<td><%=Student.getDOB()%>
		<td><%=Student.getDepartment()%>
		<td><%=Student.getPhoneNumber()%>
		<td><%=Student.getAddress()%>
		<%}%> 
		</tbody>
		</table>
		</div>
		
	
	<% }
}catch(Exception e){
	
}%>


</body>
</html>