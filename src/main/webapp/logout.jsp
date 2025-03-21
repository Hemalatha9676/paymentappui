<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%
    // Invalidate the session to log the user out
    session.invalidate();
    
    // Redirect to home page after logout
    response.sendRedirect("index.jsp");
%>
