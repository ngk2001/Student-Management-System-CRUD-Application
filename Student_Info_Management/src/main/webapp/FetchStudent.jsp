<head>
<link rel="stylesheet" href="style.css">
<title>FetchStudent</title>
</head>
<body style="height: 100vh;">
<h2>Search Student</h2>
<h4 style= "color:red">
<%try{
	 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	 if(session.getAttribute("Username")==null){
		 session.setAttribute("LoginError", "Please Login to Access!");
	     response.sendRedirect("Login.jsp");
	 }
	String NotFound = (String)request.getAttribute("NotFound");
	String ErrorMsg = (String)request.getAttribute("ErrorMsg");
	if(NotFound != null){
		out.print(NotFound);
	}
	else if(ErrorMsg!=null){
		out.print(ErrorMsg);
	}
}
catch(Exception e){response.sendRedirect("Error.jsp");}%></h4>
<div id="container" class="register">
<form  action="FetchServlet" method="post">
<input type="search" name="Stname" placeholder="Search by Name"><br>
<input type="submit"  value="Search"></form> 
<h3 style="color:black">OR</h3>
<form action="FetchServlet" method="post" >
<input type="search" name="Rgnumber" placeholder="Search by Register Number"><br>
<input type="submit" value="Search"></form>
<h3 style="color:black">OR</h3>
<form action="FetchServlet" method="post">
<input type="submit" name="FetchAll" value="Fetch All">
</form>
</div>
</body>
