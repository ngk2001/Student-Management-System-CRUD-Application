package com.Fetching;

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

@WebServlet("/FetchServlet")
public class FetchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String Stname = request.getParameter("Stname");
		String Rgnumber = request.getParameter("Rgnumber");
		String FetchAll = request.getParameter("FetchAll");
		StudentObject Fetch = new StudentObject();
		DataControlDao dcd = new DataControlDao();
		ArrayList<StudentObject> StudentList = new ArrayList<>();

		if(PassNullandNotEmptyVerification(Stname)) {
			Fetch.setStudentName(Stname);
			try {
				StudentList = dcd.FetchByStudentName(Fetch);
				if(!StudentList.isEmpty()){
				request.setAttribute("StudentList", StudentList);
				request.getRequestDispatcher("FetchedStudent.jsp").forward(request, response);
			}else {
				    request.setAttribute("NotFound","Did not found or not match with any Student Details by Given Name!");
			    	request.getRequestDispatcher("FetchStudent.jsp").forward(request, response);
				}

			} catch (Exception e) {
				request.setAttribute("ErrorMsg", e.getMessage());
				request.getRequestDispatcher("FetchStudent.jsp").forward(request, response);
			}

		}else if(PassNullandNotEmptyVerification(Rgnumber)){
			Fetch.setRegisterNumber(Rgnumber);
			try {
				StudentList = dcd.FetchByRegisterNumber(Fetch);
				if(!StudentList.isEmpty()) {
			    request.setAttribute("StudentList", StudentList);
			    request.getRequestDispatcher("FetchedStudent.jsp").forward(request, response);
				}else {
					request.setAttribute("NotFound","Did not found or not match with any Student Details by Given Register Number!");
					request.getRequestDispatcher("FetchStudent.jsp").forward(request, response);
				}
			}catch(Exception e) {
				request.setAttribute("ErrorMsg", e.getMessage());
				request.getRequestDispatcher("FetchStudent.jsp").forward(request, response);
			}
		}
		else if(FetchAll!=null) {
			try {
			StudentList = dcd.FetchByAll();
			if(!StudentList.isEmpty()) {
			    request.setAttribute("StudentList", StudentList);
				request.getRequestDispatcher("FetchedAll.jsp").forward(request, response);
			}
			else{
			request.setAttribute("NotFound","Cant Retrive Any Details at this Time. Try Again Later!");
			RequestDispatcher rd = request.getRequestDispatcher("FetchStudent.jsp");
			rd.forward(request, response);
			}
			}catch(Exception e) {
				request.setAttribute("ErrorMsg", e.getMessage());
				request.getRequestDispatcher("FetchStudent.jsp").forward(request, response);
			}
			}else {
				request.setAttribute("NotFound","Enter Valid Input!");
				request.getRequestDispatcher("FetchStudent.jsp").forward(request, response);
			}
		}
	public static boolean PassNullandNotEmptyVerification(String txt) {
		if(txt==null || txt.trim().isEmpty()) {
			return false;
		}else {
			return true;
		}
	}
}
