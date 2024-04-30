<%@page import="java.text.DecimalFormat"%>
<%@page import="days07.FormatUtil"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%@ page isELIgnored="true" %> --%>
<!-- EL을 일반 문자열로 처리 
	Servlet 4.0
	JSP 2.3
	EL 3.0
	
	Servlet 2.3 EL 지원X
	Servlet 2.4 #{} 	"
	Servlet 2.5 ${} #{} 지원
-->
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
		[EL 객체의 메서드 호출]
		[EL 객체의 정적(static)메서드 호출]
		
		EL 람다식 ~~		, 스트림API
	</xmp>  
	<%
		long price = 22345;
		request.setAttribute("price", price);
	%>
	
	price(표현식) : <%= price %><br>
	<!--  세자리 마다 콤마를 찍어서 단가 출력 -->
	price(표현식) : <%= String.format("%,d", price) %><br>
	
	<%
		String pattern = "##,###";
		DecimalFormat df = new DecimalFormat(pattern);
	%>
	price(표현식) : <%= df.format(price) %><br>
	<hr />
 	price(EL) : ${requestScope.price }<br>
	price(EL) : ${price }<br>
	
	<!-- 
	FormatUtil.number
	FormatUtil.staticNumber
	 -->
	price(EL) : ${FormatUtil.staticNumber(price, "#,##0") }<br>
	<%
		FormatUtil fu = new FormatUtil();
		request.setAttribute("fu", fu);
	%>
	price(EL) : ${fu.number(price, "#,##0") }<br>
	
	<hr />
	<!-- JSTL : JSP표준 태그 라이브러리
		c 	core 	변수/제어문
		5가지
	-->
	
	price(EL) : <fmt:formatNumber value="${price }" pattern="##,###" /><br>
	
</div>

<script>
</script>
</body>
</html>