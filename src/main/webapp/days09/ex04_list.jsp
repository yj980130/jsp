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
	<xmp class="code"> </xmp>
	<table align="center">
		<tr>
			<td align="right" colspan="4"><a href="write.ss">WRITE</a></td>
		</tr>
		<tr>
			<td align="center" width="50">글번호</td>
			<td align="left">제목</td>
			<td align="center" width="200">첨부파일</td>
			<td align="center" width="50">삭제</td>
		</tr>
		<c:if test="${ empty list }">
			<tr>
				<td colspan="4">게시글이 존재 X</td>
			</tr>
		</c:if>
		<c:forEach items="${ list }" var="dto">
			<tr>
				<td align="center" width="50">${ dto.num }</td>
				<td align="left">${ dto.subject }</td>
				<td align="center" width="200"><a
					href="/jspPro/days09/upload/${ dto.filesystemname }"> ${ empty dto.originalfilename ? "없음" :  dto.originalfilename}</a>
				</td>
				<td align="center" width="50"><a
					href="delete.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">삭제</a>
					<a
					href="update.ss?num=${ dto.num }&filesystemname=${ dto.filesystemname}">수정</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<script>
</script>
</body>
</html>