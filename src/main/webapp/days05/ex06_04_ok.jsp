<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ex06_04_ok.jsp?age=30&color=black -->
<%
	Enumeration<String> en = request.getParameterNames();
	
	while(en.hasMoreElements()){
		String cookieName = en.nextElement();
		String cookieValue = request.getParameter(cookieName);
		
		// 새로 쿠키 생성 응답.
		
		Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
		cookie.setMaxAge(-1); // session 끊어지면 자동 쿠키 삭제
		response.addCookie(cookie);
	}
	
	
	String location = "ex06_02.jsp";
	response.sendRedirect(location);
	
%>