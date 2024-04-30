<%-- <%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		[EL 연산자]
		
		[삼항연산자] ? : 
		
		[emptㅛ 연산자 정리]
		값 null 		true
		${empty list}
		값 "" 			true
		값 0 			true
		빈 Collection, 	true
		빈 Map
		
		ArrayList<BoardDTO> list = null;
		
		외의 모든 경우는 false 이다.
		
	</xmp>  
	${10 + 3 }<br>
	${10 - 3 }<br>
	${10 * 3 }<br>
	${10 / 3 }<br>	<!-- div -->
	${10 % 3 }<br>  <!-- mod -->
	
	<hr />
	${"10" + 3 }<br> <!-- 13 -->
	${null + 3 }<br> <!-- null일경우 long 0으로 처리된다. 3 -->
	<!-- java + 덧센연산자, 문자열 연결 연산자 -->
	${"한글" + 3 }<br> <!-- NumberFormatException -->
	 
	 <hr />
	 ${100 == 10 }<br>
	 ${100 eq 10 }<br>
	 ${100 != 10 }<br>
	 ${100 ne 10 }<br>
	 <br>
	 ${100 > 10 }<br>
	 ${100 gt 10 }<br>
	 ${100 < 10 }<br>
	 ${100 lt 10 }<br>
	 <br>
	 ${100 >= 10 }<br>
	 ${100 ge 10 }<br>
	 ${100 <= 10 }<br>
	 ${100 le 10 }<br>
	 
	 <hr />
	 <!-- EL 논리연산자 : && and , || or, ! not -->
	 <hr />
	 
	 <%
	 	String title = "JSP-EL 수업 중";
	 	request.setAttribute("title", title);
	 %>
	 제목 : <%= title %><br>
	 <%="제목 : " + title %><br>
	 제목 : ${requestScope.title }<br>
	 ${"제목 : " += title }<br>
	 
	 <hr />
	 
	 <!-- EL 3.0 도입 - EL n 변수를 생성하고 10값을 할당 + 출력 -->
	 ${n = 10 }<br>
	 <!-- EL 3.0 도입 - 두 개의 수식을 ;으로 연결할 수 있다. 뒤에거 출력 -->
	 ${1 + 1; 10 + 10 }<br>
	 
	 
</div>

<script>
</script>
</body>
</html> --%>