<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
		c:forEach
			ㄴ items 		반복 배열, 대상 객체(Map, 컬렉션)
			ㄴ var 			변수명
			ㄴ begin 		반복 시작값
			ㄴ end 			반복 끝값
			ㄴ step 		반복 증가치
			ㄴ varStatus	X
	</xmp>
	
	<%
		String msg = "<h3>Hello World</h3><br>홍길동<br>";
		
		// < &lt;
		// > &gt;
		// & &amp;
	%>
	<p id="demo">
		<%=msg %>
		<br>
		<!-- JspWriter 객체에 의해서 출력 -->
		<c:out value="<%=msg %>" escapeXml="true"></c:out>
	</p>
	
	<c:set var="names" value="홍길동, 김길동, 박길동"></c:set>
	<c:forTokens items="${names }" delims=",." var="name">
		${name }<br>
	</c:forTokens>
	
	<hr />
	
	<!-- Map + c:forEach -->
	<%
		Map<String, String> map = new HashMap<>();
		map.put("id","admin");  // entry
		map.put("name","관리자");
		map.put("age","20");
	%>
	<c:set var="map" value="<%= map %>"></c:set>
	<c:forEach items="${map }" var="entry">
		<li>${entry.key } - ${entry.value }</li>
	</c:forEach>
	
	<hr />
	<%
		int[] m = { 3, 5, 2, 4, 1 };
		// 배열을 c:forEach문 사용해서 처리.
	%>
	<c:set var="arr" value="<%= m %>"></c:set>
	<c:forEach items="<%= m %>" var="n" varStatus="s">
		<li>m[${s.index }]=${n }</li>
	</c:forEach>
	
	<hr />
	<!-- 1+2+3+..9+10=55 -->
	<c:set var="sum" value="0"></c:set>
	<c:forEach begin="1" end="10" step="1" var="i" varStatus="status">
		<%-- 
		<c:if test="${i == 10 }">${i }</c:if>
		<c:if test="${i != 10 }">${i } + </c:if>
		 --%>
		 <!-- EL 삼항연산자 -->
		 <%-- ${i += (i == 10 ? "" : " +") } --%>
		 ${i += (status.last ? "" : " +") }
		<c:set var="sum" value="${sum + i }"></c:set>
	</c:forEach> 
    = ${sum }
	 
	
	<hr />
	<c:forEach begin="5" end="13" step="2" var="i" varStatus="status">
		${i } - ${status.index } - ${status.count } - ${status.first } - ${status.last }<br>
	</c:forEach>
</div>

<script>
</script>
</body>
</html>