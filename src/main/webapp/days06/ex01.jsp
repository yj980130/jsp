<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		웹 처리 과정
						상태관리
			클라이언트 -> 요청 -> 서버
					   <- 응답 <-
	
		1. 쿠키 - 클라이언트(브라우저) + 텍스트 파일형식
				- js(클라이언트) + jsp(서버)
				- 쿠키를 사용하는 인증처리
			 
		2. [세션(session)]
			처음으로 웹 페이지를 요청		[세션]
								 응답		키 : JSESSIONID 쿠키값
			다른 / 다른 / 다른 웹 페이지 이동 => 라운드트립
			12:00 마지막 요청 대충 20분 후에 세션 종료
			예) 교육원 상담 + 수강 신청 + 입학.
				첫 수업 날 + 매니저님이 캐비넷[이름]==세션
				
		JSP Scope 4가지
		p s
		r s
		[s s]	setAttribute(), getAttribute()
		a s
	</xmp>

	<%
		String sid = session.getId();
		long l = session.getCreationTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = new Date();
		d.setTime(1);
	%>  
	
		세션 ID = <%= sid %><br>
		세션 생성 날짜 = <%= sdf.format(d) %><br>
	
	<%
		long last = session.getLastAccessedTime();
		d.setTime(last);
	%>
	
	세션 마지막 접속 날짜 = <%= sdf.format(last) %>
</div>

<script>
</script>
</body>
</html>