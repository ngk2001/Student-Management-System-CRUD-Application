<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.Dao.DataControlDao, com.StudentObject, java.sql.ResultSet, java.util.ArrayList"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>Edit</title>
</head>
<body style="height: 100vh;">
   <h2>Edit Student</h2>
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
	<div id="container" class="update">
	 <form action="Update" method="post" >
        <input type="hidden" name="OldRgnumber" value="<%=studentup.getRegisterNumber()%>" required>

         <table>
            <tr>
                <td><label for="Sname">Student Name:</label></td>
                <td><input type="text" name="Sname" value="<%=StudentName%>" required></td>
            </tr>

            <tr>
                <td><label for="Rnumber">Register Number:</label></td>
                <td><input type="number" name="Rnumber" value="<%=RegisterNumber%>" required></td>
            </tr>

            <tr>
                <td><label for="gender">Gender:</label></td>
                <td><input type="text" name="gender" value="<%=Gender%>" required></td>
            </tr>

            <tr>
                <td><label for="DateofBirth">Date of Birth:</label></td>
                <td><input type="date" name="DateofBirth" value="<%=DOB%>" required></td>
            </tr>

            <tr>
                <td><label for="Department">Department:</label></td>
                <td><input type="text" name="Department" value="<%=Department%>" required></td>
            </tr>

            <tr>
                <td><label for="Phnumber">Phone Number:</label></td>
                <td><input type="number" name="Phnumber" value="<%=PhoneNumber%>" required></td>
            </tr>

            <tr>
                <td><label for="Address">Address:</label></td>
                <td><input type="text" name="Address" value="<%=Address%>" required></td>
            </tr> 

            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit" onclick='confirm("Are you sure?")'>
                </td>
            </tr>
        </table>
    </form>
</div>
		<%
		} else{ RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
		        request.setAttribute("ErrMsg", "Can't Fetch Details of Student, Please Check!!");
		        rd.forward(request,response);		
		        }
		}else{%>
			<h3> "Did not Fetch Student Details! </h3><form action="EditStudent" method="post"> <input type="submit" value="Just Retry"></form>
	<%}%>
</body>
</html>