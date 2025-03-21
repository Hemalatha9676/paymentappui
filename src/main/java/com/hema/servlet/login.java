package com.hema.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Step 1: Establish Database Connection
            con = Dbcon.getcon();
            if (con == null) {
                pw.print("Database connection failed!");
                return;
            }

            // Step 2: Get User Inputs
            String uname = request.getParameter("username");
            String pass = request.getParameter("password");

            // Step 3: Validate User from Database
            String query = "SELECT * FROM Registrations WHERE username=? AND password=?";
            ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            // Step 4: If User Exists, Create Session and Redirect to Dashboard
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("uname", uname);
                session.setAttribute("firstname", rs.getString(2));
                session.setAttribute("email", rs.getString(5));
                session.setAttribute("phonenumber", rs.getString(6));
                
                response.sendRedirect("Dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid Credentials");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            pw.print("Error: " + e.getMessage());
        } finally {
            // Step 5: Close database resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                pw.print("Error closing resources: " + e.getMessage());
            }
        }
    }
}
