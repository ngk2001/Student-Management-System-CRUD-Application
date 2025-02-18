<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.ArrayList" import="com.StudentObject"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Fetched Student</title>
</head>
<body style="height: 100vh;">
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("Username") == null) {
		session.setAttribute("LoginError", "Please Login to Access!");
		response.sendRedirect("Login.jsp");
	}
	ArrayList<StudentObject> StudentList = (ArrayList<StudentObject>) request.getAttribute("StudentList");
	%>
	<h2>Student Details</h2>
	<div id="container" style="display: flex; , flex-direction: row;">
		<%
		for (StudentObject Details : StudentList) {
		%>
		<table border="1" class="fetched" style="margin: 10px;">
			<tbody>
				<tr>
					<th><b>Student Name</b>
					<td><%=Details.getStudentName()%></td>
				</tr>
				<tr>
					<th><b>Register Number</b>
					<td><%=Details.getRegisterNumber()%>
				</tr>
				<tr>
					<th><b>Gender</b></th>
					<td><%=Details.getGender()%>
				</tr>
				<tr>
					<th><b>Date of Birth</b>
					<td><%=Details.getDOB()%>
				</tr>
				<tr>
					<th><b>Department</b>
					<td><%=Details.getDepartment()%>
				</tr>
				<tr>
					<th><b>Phone Number</b>
					<td><%=Details.getPhoneNumber()%>
				</tr>
				<tr>
					<th><b>Address</b>
					<td><%=Details.getAddress()%>
				</tr>
				<tr>
					<td><a
						href="Update.jsp?Rgnumber=<%=Details.getRegisterNumber()%>"><input
							type="button" value="Update"></a>
					<td><form action="Delete"
							onsubmit="return confirm('Are you want Delete this?');"
							method="post">
							<input type="hidden" name="Rgnumber"
								value="<%=Details.getRegisterNumber()%>"> <input
								type="submit" value="Delete">
						</form>
				</tr>
			</tbody>
		</table>
		<br>
		<%
			}
			%>

	</div>
</body>
</html>