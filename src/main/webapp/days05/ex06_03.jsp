<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 새로운 쿠키 생성 + setMaxAge(0) -->
<!-- ex06_03.jsp?ckbOokie=name&ckbCookie=age -->
<%
	String[] delCookieNames = request.getParameterValues("ckbCookie");
	for(int i = 0; i < delCookieNames.length; i++){
		String cookieName = delCookieNames[i];
		String cookieValue = "";
		Cookie cookie = new Cookie(cookieName, cookieValue);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
%>

<script>
	alert("쿠키 삭제 완료!!!");
	location.href = "ex06_02.jsp";
</script>