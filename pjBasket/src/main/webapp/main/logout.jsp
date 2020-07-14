<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getSession().getAttribute("sto_code") != null) {
		session.invalidate();
		response.sendRedirect("login.jsp");
	} else {
		response.sendRedirect("login.jsp");
	}
%>