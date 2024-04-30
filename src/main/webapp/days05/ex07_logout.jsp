<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	String cookieName = "auth";
	String logonID = null;
	
	Cookies cookies = new Cookies(request);
	if(cookies.exists(cookieName)){
		logonID = cookies.getValue(cookieName);
		// 쿠키 삭제
		Cookie cookie = Cookies.createCookie(cookieName, "", "/", 0);
		response.addCookie(cookie);
	}
	
%>

<script>
	alert("<%= logonID %>님 로그아웃 하셨습니다.");
	location.href = "ex07_default.jsp";
</script>