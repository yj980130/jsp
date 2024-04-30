<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String location = "";
	
	// DB 인증처리
	if(id.equals("admin") && passwd.equals("1234")){
		String name = "관리자";
		location = "ex10.jsp?ok&name=" + URLEncoder.encode(name, "UTF-8");;
		// 인증된 정보 저장 - DB, 쿠키, 세션
	}
	else{
		location = "ex10.jsp?error";	
	}
	
	// [1] 리다이렉트 
	response.sendRedirect(location);
	

%>