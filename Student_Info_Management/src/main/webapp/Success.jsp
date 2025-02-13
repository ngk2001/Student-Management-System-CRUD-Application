<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<% String Success = (String)request.getAttribute("Success");
   String UpdateSuccess =(String)request.getAttribute("UpdateSuccess");
   String DeleteConfirm =(String)request.getAttribute("DeleteConfirm");
if(Success!=null){ %>
<h2><%=Success%></h2>
If you want Add another Student?<a href="AddStudent.jsp">Click Here</a> <br>
or Go to <a href="Welcome.jsp">Home Page</a>
<%} %>
<% if(UpdateSuccess != null){%>
<h2><%=UpdateSuccess%></h2>
<form action="EditStudent" method="post"><input type="submit" value="Go back"></form>
<%} %>
<% if(DeleteConfirm!=null){ %>
	<h2><%=DeleteConfirm%></h2>
	<form action="EditStudent" method="post"><input type="submit" value="Go back"></form>
<%}%>
	
</body>
</html>