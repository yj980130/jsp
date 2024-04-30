<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		[서블릿]
		1. 자바 웹 기술
		2. 서블릿 처리 과정
			- web.xml 서블릿 등록 + URL 매핑
			- @어노테이션 사용       
	</xmp>  
	<xmp>
		***** [URL 패턴 매핑 규칙]
		1. /		웹 사이트(어플리케이션)에서 모든 요청의
					사용되는 기본 서블릿으로 매핑하겠다.
		2. / 시작 ~   /* 끝
		
		3. *. 확장자
		
		4. 위의 (1, 2, 3,) 경우를 제외하고 정확한 URL 매핑
	</xmp>
	
	<a href="/jspPro/hello">hello 요청</a>
	<br>
	<a href="/jspPro/days02/hello.html">/days02/hello.html 요청</a>
	<br>
	
	<a href="/jspPro/days03/board/write">/days03/board/write.html 요청</a>
	<br>
	<a href="/jspPro/days03/board/list">/days03/board/list.do 요청</a>
	<br>
	<a href="/jspPro/days03/board/detail">/days03/board/detail 요청</a>
	<br>
	
	<a href="/jspPro/write.htm">/write.htm 요청</a>
	<br>
	<a href="/jspPro/days03/board/list.htm">/days03/board/list.htm 요청</a>
	<br>
	<a href="/jspPro/days03/detail.htm">/days03/detail.htm 요청</a>
	<br>
	
	
	
</div>

<script>
</script>
</body>
</html>