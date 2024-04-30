<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	span.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>
</head>
<body>
<header>
    <h1 class="main"><a href="#" style="position: absolute;top:30px;">Jindol Home</a></h1>
    <ul>
    	<li><a href="#">로그인</a></li>
	    <li><a href="#">회원가입</a></li>
    </ul>
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
	<xmp class="code">
	                   
	</xmp>
	
	<%
		String strNow = "2023년 11월 01일";
		// 1) year, month, day
		// Date now = new Date( 2023-1900, 11-1, 1 )
		
		// 2) 
		/* 
		String pattern = "yyyy년 MM월 dd일";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date now = sdf.parse(strNow);
		*/
		// 3
		/* 
		String pattern = "yyyy년 MM월 dd일";
		DateTimeFormatter df = 
		DateTimeFormatter.ofPattern(pattern);
		LocalDate now = LocalDate.parse(strNow, df); 
		*/
	%>
	<fmt:parseDate value="<%=strNow %>" var="pnow" pattern="yyyy년 MM월 dd일"/>
	<!-- Wed Nov 01 00:00:00 GMT+09:00 2023 -->
	pnow = ${pnow }<br>
	
	<hr />  
	<%
		Date now = new Date();
	%>
	now = <%= now %>
	<c:set var="now" value="<%= now %>"></c:set>
	
	<p><fmt:formatDate value="${now }" /> </p>
	<p><fmt:formatDate value="${now }" type="date"/> </p>
	<p><fmt:formatDate value="${now }" type="time"/> </p>
	<p><fmt:formatDate value="${now }" type="both"/> </p>
	<hr />
	<p><fmt:formatDate value="${now }" dateStyle="default"/> </p>
	<p><fmt:formatDate value="${now }" dateStyle="full"/> </p>
	<p><fmt:formatDate value="${now }" dateStyle="short"/> </p>
	<p><fmt:formatDate value="${now }" dateStyle="medium"/> </p>
	<p><fmt:formatDate value="${now }" dateStyle="long"/> </p>
	
	<p><fmt:formatDate value="${now }" pattern="yyyy년 MM.dd일 E a hh:mm"/> </p>
</div>

<script>
</script>
</body>
</html>