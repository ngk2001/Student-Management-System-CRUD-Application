package com.Adding;

import java.io.IOException;
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


@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		DataControlDao add = new DataControlDao();
		StudentObject AddObj = new StudentObject();
		try {

			AddObj.setStudentName(req.getParameter("Sname"));
			AddObj.setRegisterNumber(req.getParameter("Rnumber"));
			AddObj.setGender(req.getParameter("gender"));
			String AfterFinalFormat = controlDateFormat(req.getParameter("DateofBirth"));
			if(!AfterFinalFormat.isEmpty()) {
				java.sql.Date DOB = java.sql.Date.valueOf(AfterFinalFormat);
				AddObj.setDOB(DOB);
			}
			AddObj.setDepartment(req.getParameter("Department"));
			AddObj.setPhoneNumber(req.getParameter("Phnumber"));
			AddObj.setAddress(req.getParameter("Address"));

			int y = add.AddDetails(AddObj);
			if(y>0) {
				req.setAttribute("Success", "Student Details Added Succesfully!");
				req.getRequestDispatcher("Success.jsp").forward(req, res);

			}else {
				RequestDispatcher rd = req.getRequestDispatcher("AddStudent.jsp");
				req.setAttribute("ErrMsg","Enter Valid Input! or Try again Later");
				rd.forward(req, res);
			}

		}catch(Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("AddStudent.jsp");
			req.setAttribute("ErrMsg","Enter Valid Input! or Avoid Duplicate Details");
			rd.forward(req, res);
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

