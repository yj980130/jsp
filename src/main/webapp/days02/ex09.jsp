<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");

%>
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
		[로그인 페이지]
	</xmp>  
	<form action="ex09_ok.jsp" method="get">
		아이디 : <input type="text"  name="id"  value="admin"><br>
		비밀번호 : <input type="password"  name="passwd"  value="1234"><br>
		<input type="submit"  value="logon"> 
	</form>
</div>

<%-- 	<%
	// ex09.jsp?error 로그인 실패 후 다시 서버에 리다이렉트
	if(error.equals("") && error != null){
	%>
		<script>
			alert("로그인 실패 후 다시 ex09.jsp 리다이렉트");
		</script>	
	<%
	}
	%> --%>
<script>
	
</script>
</body>
</html>