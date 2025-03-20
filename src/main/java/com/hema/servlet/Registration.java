package com.hema.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con=Dbcon.getcon();
			PrintWriter pw=response.getWriter();
			String uname=request.getParameter("username");
		    String fname=request.getParameter("firstname");
			String lname=request.getParameter("lastname");
			String pass=request.getParameter("password");
			String email=request.getParameter("email");
			String phno=request.getParameter("phonenumber");
	
			String address=request.getParameter("address");
			String query="insert into Registrations(username ,firstname,lastname,password ,email, phonenumber,Address) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,uname);
			ps.setString(2,fname);
			ps.setString(3,lname);
			ps.setString(4,pass);
		    ps.setString(5,email);
			ps.setString(6,phno);
			ps.setString(7,address);
			int i=ps.executeUpdate();
			if(i>0) {
				pw.print("insertion successfull");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			else {
				pw.print("insertion not successfull");
				RequestDispatcher rd=request.getRequestDispatcher("Registartion.jsp");
				rd.forward(request, response);
				
			}
			
			} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
