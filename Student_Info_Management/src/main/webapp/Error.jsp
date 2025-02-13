<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <h2>Oops! Something went wrong.</h2>
    <%if(request.getParameter("E")!=null){
    	out.print((String)request.getParameter("E"));
    }
    if(request.getAttribute("ErrMsg")!=null){
    	out.print((String)request.getAttribute("ErrMsg"));
    }
    if(request.getAttribute("NumberNotFound")!=null){
    	out.print((String)request.getAttribute("NumberNotFound"));
    }%>
    <p><a href="Welcome.jsp">Go Back</a></p>
</body>
</html>
