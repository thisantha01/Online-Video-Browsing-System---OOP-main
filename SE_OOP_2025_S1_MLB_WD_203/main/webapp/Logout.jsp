<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // This clears all session data
    response.sendRedirect("GuestHome.jsp"); // Redirect to login page or homepage
%>