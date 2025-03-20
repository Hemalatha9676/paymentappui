package com.hema.servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbcon {
	static String url="jdbc:mysql://localhost:3306/paymentapp";
	static String username="root";
	static String password="root";
	public static Connection getcon() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,username,password);
		return con;
		
	}

}