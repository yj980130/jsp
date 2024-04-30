<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cookieName = request.getParameter("cookieName");
	String cookieValue = request.getParameter("cookieValue");
	
	// jsp 쿠키 생성
	// (주의사항) 쿠키의 값이 한글인 경우 반드시 인코딩 필요
	Cookie cookie = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
	
	cookie.setMaxAge(-1); // 브라우저가 닫히면 자동 쿠키 제거
	// cookie.setDomain(domain)  localhost
	// c.setPath(url) 			/jspPro/days05 		"/"
	
	response.addCookie(cookie);
	
	String location = "ex06_02.jsp";
	response.sendRedirect(location);
	
%>