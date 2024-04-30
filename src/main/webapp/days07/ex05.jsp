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
		JSP 필터(filter)
		Ajax
		실제 예제 분석 + 설명                
			ㄴ http 요청/응답을 할 때
					ㄴ request 정보를 필터링
								필수입력
								currentPage=1
					ㄴ response 정보를 가공(암호화)
								xml -> json 형변한
								등등
			ㄴ 인증(로그인) 필터 -> 요청할 수 있는 페이지
							승인 -> 요엋ㅇ페이지로 이동
							 X   -> 로그인페이지로 이동.
			
			예)
			list.do(글 목록)
			list.jsp 응답
			[글쓰기] ------------------- write.do [로그인 페크 필터]--------- WriteHandler
																세션 auth 체크
										승인 글쓰기 가능		write.jsp 이동
			
			[필터 구현시 핵심 3개 타입]
			1) javax.servlet.Filter 인터페이스 구현.
				(1) init()
				(2) destroy()
				(3) **** doFilter() ***
							인증 체크
							인코딩 체크
							등등
							chain.doFilter()
			2) ServletRequestWrapper
				ㄴ 요청 포장(가공, 변경) 하는 객체
			3) ServletResponseWrapper
				ㄴ 응답 포장(가공,변경)하는 객체
					ㄴ 암호화(응답데이터)
						(xml -> json 변경)
			
			[lib 폴더에 servlet-api.jar 파일을 추가]
				ㄴ 이클립스 개발할 경우에는 추가할 필요가없다.
				
			[필터 사용하는 순서]
			1) 필터 클래스 선언
			2) web.xml 로 필터 등록
			  또는
			   @WebFilter 어노테이션 등록
			   
			실습)
			ex06.jsp 	form method="post" 	한글 깨짐
			ex06_01.jsp
			
			com.filter 패키지
				ㄴ CharacterEncodingFilter.java
	</xmp>  
</div>

<script>
</script>
</body>
</html>