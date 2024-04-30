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
	</xmp>
	  
	<form action="/jspPro/days09/upload" method="post" enctype="multipart/form-data">
		메시지 : <input type="text" name="msg" value="hello world~" />
		<br />
		<button type="button">첨부 파일 추가</button>
		<div id="filebox">
			첨부파일 1 : <input type="file" name="file1" /><br />
		</div>
		<input type="submit" />
	</form>
</div>

<script>
	$(function(){
		$("button").on("click", function(){
			let no = $("#filebox :file").length + 1; 	// no = 2
			$("#filebox").append(`첨부파일 \${no} : <input type="file" name="file\${no}" /><br />`);
		})
	})
</script>
</body>
</html>