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
		[파일 업로드]
		1. [업로드] : client -> server
		   다운로드 : server -> client
		2. 쇼핑몰사이트 : 상품 정보 등록
		   자료실 : 첨부파일 등록
		   회원가입 : 회원이미지 등록 등등
		3. (꼭 기억) 실제 파일 업로드 할때
			1) 스트림 기반의 전송 방식인 form method="post" 설정.
			2) 인코딩 설정
			   기본 : enctype="application/x-www-form-urlencoded"
			   		  enctype="multipart/form-data" 
		4. 실습
			1) days08 > upload 폴더 추가
			2) ex11.jsp
			   ex11_ok.jsp
			
	</xmp>  
</div>

<script>
</script>
</body>
</html>