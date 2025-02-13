package com.LoginControl;

import java.io.IOException;

import com.Dao.LoginDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String username =req.getParameter("username");
		String password =req.getParameter("password");
		HttpSession ses = req.getSession();
		LoginDao LD = new LoginDao();
		try {
			if(LD.check(username,password)){
				ses.setAttribute("Username", username);
				res.sendRedirect("Welcome.jsp");
			}
			else {
				RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
				ses.setAttribute("IdNotFound", "Please Enter Valid UserID and Password!");
				rd.forward(req,res);
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
