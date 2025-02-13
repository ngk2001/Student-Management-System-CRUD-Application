<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.Dao.DataControlDao, com.StudentObject, java.sql.ResultSet, java.util.ArrayList"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("Username") == null) {
		session.setAttribute("LoginError", "Please Login to Access!");
		response.sendRedirect("Login.jsp");
	}

	StudentObject studentup = new StudentObject();
	DataControlDao dcd = new DataControlDao();
	String OldRgnumber = request.getParameter("Rgnumber");
	if (OldRgnumber != null) {
		studentup.setRegisterNumber(OldRgnumber);
		ArrayList<StudentObject> Student = dcd.FetchByRegisterNumber(studentup);
		if (!Student.isEmpty()) {
			StudentObject FetchedStudent = Student.get(0);
			String StudentName = FetchedStudent.getStudentName();
			String RegisterNumber = FetchedStudent.getRegisterNumber();
			String Gender = FetchedStudent.getGender();
			java.sql.Date DOB = FetchedStudent.getDOB();
			String Department = FetchedStudent.getDepartment();
			String PhoneNumber = FetchedStudent.getPhoneNumber();
			String Address = FetchedStudent.getAddress();
	%>
	<h2>Edit Student</h2>
	<form action="Update" method="post">
	    <input type="hidden" name="OldRgnumber" value="<%=studentup.getRegisterNumber()%>" required>
		<label for="Sname">Student Name:</label><input type="text" name="Sname" placeholder="old:<%=StudentName%>" value='<%=StudentName%>' required><br>
		<label for="Rnumber">Register Number</label><input type="number" name="Rnumber" placeholder="old:<%=RegisterNumber%>" value='<%=RegisterNumber%>' required><br>
		<label for="gender">Gender:</label> <input type="text" name="gender" placeholder="old:<%=Gender%>" value='<%=Gender%>' required><br> 
		<label for="DateofBirth">Date of Birth:</label><input type="date" name="DateofBirth" placeholder="old:<%=DOB%>" value='<%=DOB%>' required><br>
		<label for="Department">Department:</label> <input type="text" name="Department" placeholder="old:<%=Department%>" value='<%=Department%>' required><br>
		<label for="Phnumber">Phone Number:</label><input type="number" name="Phnumber" placeholder="old:<%=PhoneNumber%>" value='<%=PhoneNumber%>' required><br>
		<label for="Address">Address:</label> <input name="Address" placeholder="old:<%=Address%>" value='<%=Address%>' required><br>
		<input type="Submit">
    </form>
		<%
		}// else{ RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
		      //  request.setAttribute("ErrMsg", "Can't Fetch Details of Student, Please Check!!");
		    //    rd.forward(request,response);		
		      //  }
		}else{%>
			<h3> "Did not Fetch Student Details! </h3><form action="EditStudent" method="post"> <input type="submit" value="Just Retry"></form>
	<%}%>
</body>
</html>