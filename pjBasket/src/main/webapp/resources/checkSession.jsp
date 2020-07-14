<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sto_name = null;
	String sto_code = null;
	if(request.getSession().getAttribute("sto_code") != null) {
		sto_name = (String)request.getSession().getAttribute("sto_name");
		sto_code = (request.getSession().getAttribute("sto_code")).toString();
	} else {
		response.sendRedirect("../main/login.jsp");
	}
%>
