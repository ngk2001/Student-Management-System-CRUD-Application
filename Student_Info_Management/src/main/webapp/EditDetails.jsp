<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList, com.StudentObject"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Details</title>
</head>
<body>
<% 
	 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	 if(session.getAttribute("Username")==null){
		 session.setAttribute("LoginError", "Please Login to Access!");
	     response.sendRedirect("Login.jsp");
	     }%> 
	<% String NotFound = (String)request.getAttribute("NotFound");
	String ErrorMsg =(String)request.getAttribute("ErrorMsg");
	if(NotFound != null){
		out.print("<h3 style='color:red'>"+ NotFound +"<h3>");
	}
	else if(ErrorMsg!=null){
		out.print("<h3 style='color:red'>"+ ErrorMsg +"<h3>");
	%>
	<%}else{
		ArrayList<StudentObject> Students =(ArrayList<StudentObject>) request.getAttribute("StudentList"); %>
		<table border="1">
		<thead>
		<th>Student Name</th>
		<th>Register Number</th>
		<th>Gender</th>
		<th>Date of Birth</th>
		<th>Department</th>
		<th>Phone Number</th>
		<th>Address</th>
		<th colspan="2">Edit</th>
		</thead>
		<tbody>
		<%for(StudentObject Student: Students){%>
	   <tr><td><%=Student.getStudentName()%>
		<td><%=Student.getRegisterNumber()%>
		<td><%=Student.getGender()%>
		<td><%=Student.getDOB()%>
		<td><%=Student.getDepartment()%>
		<td><%=Student.getPhoneNumber()%>
		<td><%=Student.getAddress()%>
		<td><a href="Update.jsp?Rgnumber=<%=Student.getRegisterNumber()%>"><input type="button" value="Update"></a>
		<td><form action="Delete" onsubmit= "return confirm('Are you want Delete this?');" method="post" >
		<input type="hidden" name="Rgnumber" value="<%=Student.getRegisterNumber()%>">
		<input type="submit" value="Delete"></form>
		<%}%> 
		</tbody>
		</table>
	<%}%>
</body>
</html>