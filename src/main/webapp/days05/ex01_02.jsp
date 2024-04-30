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
		[jsp 예외처리 방법]
		1. try-catch-finally 문 사용
		2. 예외 발생하면 -> 예외 페이지를 지정 -> 응답
			WEB-INF
				ㄴ error 폴더 생성
		3. [WEB-INF > web.xml]
			1) 응답 상태 코드별로 예외 페이지 지정(설정)
		[응답 상태 코드]
          404 : 요청URL을 처리하기 위한 자원이 존재하지 않음
          500 : 서버 내부 에러가 발생( 자바 코딩 X )
          200 : 요청을 정상적으로 처리
          401 : 접근을 허용하지 않음
          400 : 클라이언트의 요청이 잘못된 구문으로 구성.
          403 : PUT 요청 X 
          등등
          
          ex01.jsp
          	a href = "ex1000.jsp"		404
          	
			2) 예외 타입별로 예외 페이지 지정.
			NullPointerException
			SQLException
			등등
		
		4. 에러 페이지 우선순위
			1) page errorPage (1)
			2) 예외 타입별로 설정(2)
			3) 상태 코드별로 설정(3)
			4) 웹 컨테이너 제공하는 기본 에러
	</xmp>
	
	<%
		String name = null;
			   // ex01.jsp?name=hong
		   
		name = request.getParameter("name");	// null
		name = name.toUpperCase();	// 대문자로 변환
		// NullPointerException

	%>  
	name = <%= name %><br>
</div>

<script>
</script>
</body>
</html>