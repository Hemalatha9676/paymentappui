package com.hema.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Addbankaccount")
public class Addbankaccount extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		 response.setContentType("text/html");
	        PrintWriter pw = response.getWriter();
	        try {
				Connection con=Dbcon.getcon();
				String Bank_Name=request.getParameter("BankName");
				
				String Account_Number=request.getParameter("AccountNumber");
				String Account_type=request.getParameter("Accounttype");
				String IFSC_CODE=request.getParameter("IFSCCODE");
				String Current_balance=request.getParameter("Currentbalance");
				String Pin=request.getParameter("Pin");
			
				
				String query="insert into bankaccount (BankName,AccountNumber,Accounttype,IFSCCODE,Currentbalance,Pin)values(?,?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, Bank_Name);
				ps.setString(2, Account_Number);
				ps.setString(3, Account_type);
				ps.setString(4, IFSC_CODE);
				ps.setString(5, Current_balance);
				ps.setString(6, Pin);
				
				int i=ps.executeUpdate();
			{
					if(i>0)
					{
						pw.print("data stored ");
						RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
						rd.forward(request, response);
						
					} 
					else{
						pw.print("data not stored");
						RequestDispatcher rd=request.getRequestDispatcher("addbankaccount.jsp");
						rd.forward(request, response);
					}
			}
				
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	}
}
