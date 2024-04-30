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
		[JSP 웹 애플리케이션 4가지 영역(scope)]
		1. 하나의 페이지에서 사용할 수 있는 영역 : page scope 					범위 작음
											pageContext 기본객체
		2. 하나의 요청에 사용할 수 있는 영역 : request scope
										request 기본객체
									예) request.setAttribute("list", list); 
									예) request.setAttribute("dto", dto); 
		3. 하나의 웹 브라우저에서 사용되는 영역 : session scope
										session 기본 객체
		4. 하나의 웹 애플리케이션에서 사용되는 영역 : application scope 		범위 넓음
											application 기본 객체
											
											setAttribute();
											getAttribute();
											removeAttribute();
											getAttributeNames();
	</xmp>  
</div>

<script>
</script>
</body>
</html>