<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>
<%
	// 1) 세선 강제 종료
	session.invalidate();
	// 2) 세션 자동으로 종료
%>
<script>
	alert("<%= logonID %>님 로그아웃 하셨습니다.");
	location.href = "ex02_default.jsp";
</script>