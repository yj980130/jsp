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
    <h1 class="main"><a href="${pageContext.request.contextPath }/days07/ex07.jsp" style="position: absolute;top:30px;">Jindol Home</a></h1>
    <ul>
    	<c:choose>
    		<c:when test="${empty auth }">
    			<li><a href="${pageContext.request.contextPath }/days07/member/logon.jsp">로그인</a></li>		
    		</c:when>
    		<c:otherwise>
    			<li><a href="${pageContext.request.contextPath }/days07/member/logout.jsp">[${auth }]로그아웃</a></li>
    		</c:otherwise>
    	</c:choose>
    	
	    <li><a href="${pageContext.request.contextPath }/days07/member/addmember.jsp">회원가입</a></li>
    </ul>
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
	<xmp class="code">
		[필터 실제 예제]
		
		days07
			ㄴ admin 폴더
				ㄴ 회원관리페이지(membermanage.jsp)
				ㄴ 급여관리페이지(paymanage.jsp)
				
				필터 : 관리자 + 인증/권한 체크
				( LoginCheckFilter.java )
				
			ㄴ board 폴더
				ㄴ 글 목록 페이지 (list.jsp)  인증 X
				ㄴ 글 쓰기 페이지 (write.jsp) 인증 O
			
			ㄴ member 폴더
				ㄴ 회원가입페이지(addmember.jsp)
				ㄴ 로그인 페이지(logon.jsp) + lonon_ok.jsp
				ㄴ 로그아웃 페이지(logout.jsp)
	</xmp>  
	
	<!-- 인증 X -->
	<a href="${pageContext.request.contextPath }/days07/board/list.jsp">글 목록</a><br>
	<!-- 인증 O -->
	<a href="${pageContext.request.contextPath }/days07/board/write.jsp">글 쓰기</a><br>
	<!-- 인증 O + 관리자 계정 -->
	<a href="${pageContext.request.contextPath }/days07/admin/membermanage.jsp">회원관리</a><br>	
</div>

<script>
</script>
</body>
</html>