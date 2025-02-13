package com;
import java.sql.Date;

public class StudentObject {
	private String StudentName;
	private String RegisterNumber;
	private String Gender;
	private Date DOB;
	private String Department;
	private String PhoneNumber;
	private String Address;

	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getStudentName() {
		return StudentName;
	}
	public void setStudentName(String studentName) {
		StudentName = studentName;
	}
	public String getRegisterNumber() {
		return RegisterNumber;
	}
	public void setRegisterNumber(String registerNumber) {
		RegisterNumber = registerNumber.trim();
	}
	public String getGender(){
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dob) {
	    DOB=dob;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}




}
