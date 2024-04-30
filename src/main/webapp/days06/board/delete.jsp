<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">Jindol Home</a>
	</h1>
	<ul>
		<li><a href="#">로그인</a></li>
		<li><a href="#">회원가입</a></li>
	</ul>
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
	<xmp class="code"> delete.jsp </xmp>
	<h2>삭제하기</h2>
	<form method="post">
		<table>
			<tr>
				<td colspan="2" align="center"><b>글을 삭제합니다.</b></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" size="15"
					autofocus="autofocus"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="삭제">
					&nbsp;&nbsp; <input type="button" value="취소" id="cancel">
				</td>
			</tr>
		</table>
	</form>

</div>

<script>
	// list.htm?write=success or fail
	if('<%=request.getParameter("write") %>'=="success"){
		alert("글 쓰기 완료!!!");
	}
	else if('<%=request.getParameter("write") %>'=="fail"){
		alert("글 쓰기 실패 :( ");
	}
	else if('<%=request.getParameter("delete") %>'=="fail"){
		alert("비밀번호가 틀립니다!!! :( ");
	}
	
</script>
</body>
</html>