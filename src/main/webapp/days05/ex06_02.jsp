<%@page import="java.net.URLDecoder"%>
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
		[ex06_02.jsp]
	</xmp>
	
	<form action="">
		<!-- 모든 쿠키정보를 얻어와서 체크박스로 만들어 출력 -->
		<!-- js document.cookie 속성 -->
		<%
			Cookie[] cookieArr = request.getCookies();
			for(Cookie cookie : cookieArr) {
				String cookieName = cookie.getName();
				// 디코딩 (주의사항)
				String cookieValue = URLDecoder.decode(cookie.getValue(), "UTF-8");
				
				// cookie.getDomain();
				// cookie.getMaxAge();
				// cookie.getPath();
		%>
				<input type="checkbox" name="ckbCookie" value="<%= cookieName %>"/>
				<%= cookieName %> - <%=cookieValue %>
				<br>		
		<%
			}
		%>		 
	</form>  
	
	<a href="ex06.jsp">쿠키 Home</a><br><br>
  
	<a href="ex06_01.jsp">쿠키 생성</a><br>
	수정,삭제할 쿠키를 체크 한 후 쿠키 수정, 삭제<br>
	<a href="ex06_03.jsp">쿠키 삭제</a><br>
	<a href="ex06_04.jsp">쿠키 수정</a><br>
  
</div>

<script>
	$("a").on("click", function(event){
		event.preventDefault();
		let url = $(this).attr("href");
		// (기억)
		let queryString = $("form").serialize();
		// alert(queryString);
		
		location.href = `\${url}?\${queryString}`;
	});
</script>
</body>
</html>