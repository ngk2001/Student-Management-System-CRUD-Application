package com.Dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.StudentObject;

import jakarta.servlet.http.HttpServlet;


public class DataControlDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";

   public int AddDetails(StudentObject addObj) throws SQLException, ClassNotFoundException, Exception{
	   String AddSql ="INSERT into Student_DataBase(Student_Name, Register_Number, Gender, Date_of_Birth, Department, Phone_Number, Address) values(?,?,?,?,?,?,?)";
	    Class.forName("oracle.jdbc.driver.OracleDriver");
		try(Connection con = DriverManager.getConnection(url,"admin","admin");
		PreparedStatement pst = con.prepareStatement(AddSql)) {
		pst.setString(1,addObj.getStudentName());
		pst.setString(2, addObj.getRegisterNumber());
		pst.setString(3, addObj.getGender());
		pst.setDate(4, addObj.getDOB());
		pst.setString(5, addObj.getDepartment());
		pst.setString(6, addObj.getPhoneNumber());
		pst.setString(7, addObj.getAddress());
		return pst.executeUpdate();
		}
   }

   public ArrayList<StudentObject> FetchByStudentName(StudentObject FetchBy) throws ClassNotFoundException, SQLException{
	   String FetchByNameSQL ="SELECT * FROM Student_Database WHERE Student_Name=?";
	   ArrayList <StudentObject> StudentList = new ArrayList<>();
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   try(Connection con = DriverManager.getConnection(url,"admin","admin");
	   PreparedStatement pst= con.prepareStatement(FetchByNameSQL)){
	   pst.setString(1, FetchBy.getStudentName());
	   ResultSet rst = pst.executeQuery();
	   while(rst.next()) {
				   StudentObject FetchedDetails = new StudentObject();
				   FetchedDetails.setStudentName(rst.getString("Student_Name"));
				   FetchedDetails.setRegisterNumber(rst.getString("Register_Number"));
				   FetchedDetails.setGender(rst.getString("Gender"));
				   FetchedDetails.setDOB(rst.getDate("Date_of_Birth"));
				   FetchedDetails.setDepartment(rst.getString("Department"));
				   FetchedDetails.setPhoneNumber(rst.getString("Phone_Number"));
				   FetchedDetails.setAddress(rst.getString("Address"));
			       StudentList.add(FetchedDetails);
			}
	   }
			return StudentList;

	   }

   public ArrayList<StudentObject> FetchByRegisterNumber(StudentObject FetchBy) throws ClassNotFoundException, SQLException{
	   String FetchByNumberSQL ="SELECT * FROM Student_Database WHERE Register_Number=?";
	   ArrayList<StudentObject> Student = new ArrayList<>();
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   try(Connection con = DriverManager.getConnection(url,"admin","admin");
	   PreparedStatement pst= con.prepareStatement(FetchByNumberSQL)){
	   pst.setString(1, FetchBy.getRegisterNumber());
	   ResultSet rst = pst.executeQuery();
	   if(rst.next()){
		   StudentObject FetchedDetails = new StudentObject();
		   FetchedDetails.setStudentName(rst.getString("Student_Name"));
		   FetchedDetails.setRegisterNumber(rst.getString("Register_Number"));
		   FetchedDetails.setGender(rst.getString("Gender"));
		   FetchedDetails.setDOB(rst.getDate("Date_of_Birth"));
		   FetchedDetails.setDepartment(rst.getString("Department"));
		   FetchedDetails.setPhoneNumber(rst.getString("Phone_Number"));
		   FetchedDetails.setAddress(rst.getString("Address"));
		   Student.add(FetchedDetails);
   }
	   }
	   return Student;
   }

   public ArrayList<StudentObject> FetchByAll() throws ClassNotFoundException, SQLException {
	   String FetchAll = "SELECT * FROM Student_Database";
	   ArrayList <StudentObject> StudentList = new ArrayList<>();
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   try(Connection con =DriverManager.getConnection(url, "admin","admin");
	   PreparedStatement pst = con.prepareStatement(FetchAll)){
	   ResultSet rst = pst.executeQuery();
	   while(rst.next()){
				   StudentObject FetchedDetails = new StudentObject();
				   FetchedDetails.setStudentName(rst.getString("Student_Name"));
				   FetchedDetails.setRegisterNumber(rst.getString("Register_Number"));
				   FetchedDetails.setGender(rst.getString("Gender"));
				   FetchedDetails.setDOB(rst.getDate("Date_of_Birth"));
				   FetchedDetails.setDepartment(rst.getString("Department"));
				   FetchedDetails.setPhoneNumber(rst.getString("Phone_Number"));
				   FetchedDetails.setAddress(rst.getString("Address"));
				   StudentList.add(FetchedDetails);
		}
	   }
	   return StudentList;
   }

   public int UpdateDetails(StudentObject UpObject, StudentObject OldRnumber ) throws ClassNotFoundException, SQLException{
	   String UpdateSQL = "UPDATE Student_Database SET Student_Name=?, Register_Number=?, Gender=?, Date_of_Birth=?, Department=?, Phone_Number=?, Address=? WHERE Register_Number=?";
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   try(Connection con = DriverManager.getConnection(url,"admin", "admin");
	   PreparedStatement pst =con.prepareStatement(UpdateSQL)){
	   pst.setString(1, UpObject.getStudentName());
	   pst.setString(2, UpObject.getRegisterNumber());
	   pst.setString(3, UpObject.getGender());
	   pst.setDate(4, UpObject.getDOB());
	   pst.setString(5, UpObject.getDepartment());
	   pst.setString(6, UpObject.getPhoneNumber());
	   pst.setString(7, UpObject.getAddress());
	   pst.setString(8, OldRnumber.getRegisterNumber());
	   return pst.executeUpdate();
	  }
   }

   public int DeleteStudent(StudentObject DeleteObject) throws ClassNotFoundException, SQLException {
	   String DeleteSQL = "DELETE Student_Database WHERE Register_Number=?";
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   try(Connection con = DriverManager.getConnection(url, "admin", "admin");
	   PreparedStatement pst = con.prepareStatement(DeleteSQL)){
	   pst.setString(1, DeleteObject.getRegisterNumber());
	return pst.executeUpdate();
   }
   }
}
