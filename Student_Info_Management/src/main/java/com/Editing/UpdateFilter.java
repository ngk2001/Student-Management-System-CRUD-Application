package com.Editing;
import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter("/Update")
public class UpdateFilter implements Filter {

    @Override
	public void init(FilterConfig fConfig) throws ServletException {}

    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

    	HttpServletRequest req = (HttpServletRequest) request;
    	HttpServletResponse res = (HttpServletResponse) response;

    	if(req.getParameter("OldRgnumber")!=null && req.getParameter("Sname")!=null && req.getParameter("Rnumber")!=null && req.getParameter("gender")!=null &&
    			req.getParameter("DateofBirth")!=null && req.getParameter("Department")!=null && req.getParameter("Address")!=null &&
    			req.getParameter("Phnumber")!=null && !req.getParameter("OldRgnumber").trim().isEmpty()&& !req.getParameter("Sname").trim().isEmpty() && !req.getParameter("Rnumber").trim().isEmpty() &&
    			!req.getParameter("gender").trim().isEmpty() && !req.getParameter("DateofBirth").trim().isEmpty() && !req.getParameter("Department").trim().isEmpty() &&
    			!req.getParameter("Address").trim().isEmpty() && !req.getParameter("Phnumber").trim().isEmpty())
    	{
 		  chain.doFilter(request, response);
 	   }else {
 		   res.sendRedirect("Update.jsp?Rgnumber="+ URLEncoder.encode(req.getParameter("OldRgnumber"), "UTF-8"));
 		   return;
    }
    }

    @Override
	public void destroy() {}
}
