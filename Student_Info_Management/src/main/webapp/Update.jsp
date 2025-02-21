<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.Dao.DataControlDao, com.StudentObject, java.sql.ResultSet, java.util.ArrayList"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="UTF-8">
<title>Edit</title>
<script type="text/javascript">
function validateForm() {
    var sname = document.forms["studentForm"]["Sname"].value.trim();
    var rnumber = document.forms["studentForm"]["Rnumber"].value.trim();
    var gender = document.forms["studentForm"]["gender"].value;
    var dob = document.forms["studentForm"]["DateofBirth"].value;
    var department = document.forms["studentForm"]["Department"].value;
    var phnumber = document.forms["studentForm"]["Phnumber"].value.trim();
    var address = document.forms["studentForm"]["Address"].value.trim();

    var nameRegex = /^[A-Za-z\s]+$/;
    if (!nameRegex.test(sname)) {
        alert("Student Name must contain only alphabets and spaces.");
        return false;
    }

    var rnumberRegex = /^\d{5}$/;
    if (!rnumberRegex.test(rnumber)) {
        alert("Register Number must be exactly 5 digits.");
        return false;
    }

    var phoneRegex = /^[6789]\d{9}$/;
    if (!phoneRegex.test(phnumber)) {
        alert("Phone Number must be a 10-digit Indian number starting with 9, 7, 8, or 6.");
        return false;
    }

    if (gender == "") {
        alert("Gender must be selected.");
        return false;
    }

    if (dob == "") {
        alert("Date of Birth must be selected.");
        return false;
    }

    if (department == "") {
        alert("Department must be selected.");
        return false;
    }

    if (address == "") {
        alert("Address must be filled out.");
        return false;
    }

    return true;
}
</script>
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
	 <form action="Update" method="post" onsubmit="return validateForm()" >
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