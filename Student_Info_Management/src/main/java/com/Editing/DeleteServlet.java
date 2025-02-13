package com.Editing;
import java.io.IOException;
import java.net.URLEncoder;

import com.StudentObject;
import com.Dao.DataControlDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("null")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Rgnumber = request.getParameter("Rgnumber");
		if(Rgnumber !=null) {
		StudentObject DeleteObject = new StudentObject();
		DeleteObject.setRegisterNumber(Rgnumber);
		DataControlDao dcdD = new DataControlDao();
		try {
		int	d = dcdD.DeleteStudent(DeleteObject);
		if(d>0){
			RequestDispatcher rd = request.getRequestDispatcher("Success.jsp");
			request.setAttribute("DeleteConfirm", "Student Detail Deleted Successfully!");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
			request.setAttribute("ErrMsg", "Can't Fetch by RegisterNumber, Please try again Later!");
			rd.forward(request, response);
		}
		} catch (Exception e) {
			response.sendRedirect("Error.jsp?E="+URLEncoder.encode(e.getMessage(),"UTF-8"));
		}
	}else{
		RequestDispatcher rd =request.getRequestDispatcher("Error.jsp");
		request.setAttribute("NumberNotFound", "Can't fetch Register Number");
		rd.forward(request, response);
	}
}
}
