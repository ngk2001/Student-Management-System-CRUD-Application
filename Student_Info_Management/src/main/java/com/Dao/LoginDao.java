package com.Dao;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/LoginDao")
public class LoginDao extends HttpServlet {

	private static final long serialVersionUID = 1L;
	String sql="select * from Admin where USERNAME=? and PASSWORD=?";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
		public boolean check(String uname, String psw) throws Exception, IOException, SQLException {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			try(Connection con=DriverManager.getConnection(url,"admin","admin");
			PreparedStatement pst = con.prepareStatement(sql)){
			pst.setString(1, uname);
			pst.setString(2, psw);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
			return true;
			}else {
				return false;
			}
			}
		}
	}