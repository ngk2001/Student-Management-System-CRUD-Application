package com.Editing;

import java.io.IOException;
import java.util.ArrayList;

import com.StudentObject;
import com.Dao.DataControlDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditStudent")
public class EditStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataControlDao dcd = new DataControlDao();
		try {
		ArrayList<StudentObject> studentlist = dcd.FetchByAll();
		if (!studentlist.isEmpty()) {
		    request.setAttribute("StudentList", studentlist);
			request.getRequestDispatcher("EditDetails.jsp").forward(request, response);
		}
		else {
			request.setAttribute("NotFound", "Cought not Found Details!");
			RequestDispatcher rd = request.getRequestDispatcher("EditDetails.jsp");
			rd.forward(request, response);
		}
		}
	   catch(Exception e) {
			request.setAttribute("ErrorMsg", e.getMessage());
			request.getRequestDispatcher("EditDetails.jsp").forward(request, response);
		}
	}

}
