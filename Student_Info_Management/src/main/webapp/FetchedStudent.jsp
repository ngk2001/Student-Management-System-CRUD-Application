<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.ArrayList" import="com.StudentObject"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fetched Student</title>
</head>
<body>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("Username")==null){
	session.setAttribute("LoginError", "Please Login to Access!");
    response.sendRedirect("Login.jsp");
    }
ArrayList<StudentObject> StudentList = (ArrayList<StudentObject>)request.getAttribute("StudentList");%>
<h2>Student Details</h2>
<%for(StudentObject Details:StudentList){ %> 
<b> Student Name: </b> <%=Details.getStudentName()%> <br>
<b> Register Number: </b> <%=Details.getRegisterNumber()%><br>
<b>Gender: </b><%=Details.getGender() %><br>
<b>Date of Birth: </b> <%=Details.getDOB() %><br>
<b>Department: </b> <%=Details.getDepartment() %><br>
<b>Phone Number: </b> <%=Details.getPhoneNumber() %><br>
<b>Address: </b> <%=Details.getAddress() %><br>
<br><br> <%} %>
</body>
</html>