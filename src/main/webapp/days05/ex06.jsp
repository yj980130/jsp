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
		js  쿠키	document.cookie 속성
		[jsp 쿠키]
		- 쿠키?
			클라이언트(브라우저) + 텍스트 형식
		- 클라 -> 요청(쿠키) -> 서버
				   path
				   				JSP 쿠키 사용.
		- 쿠키 생성
			1) js 클라이언트 저장 ***
			쿠키이름=쿠키값;_만료시간=10일후;_도메인=;_경로;_보안
			
			2) jsp 서버 저장
				쿠키생성, 수정, 삭제 -> 클라 응답
		클라		서버
					쿠키 생성, 수정, 삭제
				<- 응답
		쿠키생성
			수정
			삭제
			
			1) Cookie 클래스 -> 객체생성(쿠키 생성)
			2) response.addCookie(생성 쿠키)
			
			만료시점 -1 브라우저가 닫을 때 자동 쿠키 제거
					 0  쿠키제거
					 별도로 만료시점을 지정하지 않으면 브라우저가 닫힐 때 쿠키 제거
					 
			실습)
			ex06_02.jsp
			ex06_02_ok.jsp
	</xmp>  
</div>

<script>
</script>
</body>
</html>