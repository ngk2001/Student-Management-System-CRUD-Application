<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>AddStudent</title>
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
<h2>Register New Student</h2>
<h4 style="color:red">
<% 
try{
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if(session.getAttribute("Username")==null){
        session.setAttribute("LoginError", "Please Login to Access!");
        response.sendRedirect("Login.jsp");
    }
    String Errmsg=(String)request.getAttribute("ErrMsg");
    if(Errmsg!=null){
        out.print(Errmsg);
    }
}catch(Exception e){}
%>
</h4>
<div id="container" class="register">
<form name="studentForm" action="AddStudent" method="post" onsubmit="return validateForm()">
    <input type="text" name="Sname" placeholder="Enter Student Name" required><br>
    <input type="number" name="Rnumber" required placeholder="Enter Register Number"><br>
    <select name="gender" required> 
        <option value="" disabled selected>Select Gender</option>
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="Other">Other</option>
    </select>
    <br>
    <input type="text" name="DateofBirth" onfocus="(this.type='date')" required placeholder="Select Date of Birth"><br>
    <select name="Department" required>
        <option value="" disabled selected>Select Department</option>
        <option value="Computer Science">Computer Science</option>
        <option value="Mechanical">Mechanical</option>
        <option value="Electrical and Electronics">Electrical and Electronics</option>
        <option value="Electronics and Communication">Electronics and Communication</option>
    </select><br>
    <input type="number" name="Phnumber" placeholder="Enter Phone number" required><br>
    <input type="text" name="Address" placeholder="Enter Address" required><br>
    <input type="Submit">
</form>
</div>

</body>
</html>