package com.Editing;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.StudentObject;
import com.Dao.DataControlDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		StudentObject UpObj = new StudentObject();
		DataControlDao update = new DataControlDao();
		StudentObject OldRgnumber = new StudentObject();

			try {
				OldRgnumber.setRegisterNumber(req.getParameter("OldRgnumber"));
				UpObj.setStudentName(req.getParameter("Sname"));
				UpObj.setRegisterNumber(req.getParameter("Rnumber"));
				UpObj.setGender(req.getParameter("gender"));
				String AfterFinalFormat = controlDateFormat(req.getParameter("DateofBirth"));
				if(!AfterFinalFormat.isEmpty()) {
					java.sql.Date DOB = java.sql.Date.valueOf(AfterFinalFormat);
					UpObj.setDOB(DOB);
				}
				UpObj.setDepartment(req.getParameter("Department"));
				UpObj.setAddress(req.getParameter("Address"));
				UpObj.setPhoneNumber(req.getParameter("Phnumber"));

				int z = update.UpdateDetails(UpObj, OldRgnumber);
				if(z>0){
					RequestDispatcher rd = req.getRequestDispatcher("Success.jsp");
					req.setAttribute("UpdateSuccess","Student Detail Updated Successfully!");
					rd.forward(req, res);

				}else {
					RequestDispatcher rd = req.getRequestDispatcher("Error.jsp");
					req.setAttribute("ErrMsg","Can't update, Please Check!");
					rd.forward(req, res);
				}
			}catch(Exception e) {
				res.sendRedirect("Error.jsp?E="+URLEncoder.encode(e.getMessage(),"UTF-8"));
			}
	}
	public static String controlDateFormat(String dob) {
		String inputdate = dob;
		ArrayList <String> FormatList = new ArrayList<>();
		FormatList.add("dd-MM-yyyy");
		FormatList.add("yyyy-MM-dd");
		FormatList.add("dd/MM/yyyy");
		FormatList.add("yyyy/MM/dd");

		for(String D : FormatList){
			try{
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern(D);
				LocalDate localDate=LocalDate.parse(inputdate, formatter);

				if(localDate!=null) {
					DateTimeFormatter formatterFinal = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					return localDate.format(formatterFinal);
				}
			}catch(Exception e) {}
		}
		return null;
	}
}