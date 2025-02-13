
<title>FetchStudent</title>
<body>
<h3 style= "color:red">
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
catch(Exception e){response.sendRedirect("Error.jsp");}%></h3>
<form action="FetchServlet" method="post">
<label for="Stname">Search by Name:</label>
<input type="text" name="Stname">
<input type="submit"  value="Search"></form><br> 
<h3>OR</h3><br>
<form action="FetchServlet" method="post">
<label for="Rgnumber">Search by Register Number:</label><input type="text" name="Rgnumber">
<input type="submit" value="Search"></form><br>
<h3>OR</h3><br>
<form action="FetchServlet" method="post">
<input type="submit" name="FetchAll" value="Fetch All">
</form>
</body>
