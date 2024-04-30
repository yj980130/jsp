<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>
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
<!-- webapp>layout>top.jsp -->
<jsp:include page="/layout/top.jsp" flush="false"></jsp:include>

<h3>
	<span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
	<xmp class="code">
		action tag 사용, 처리 과정 이해	                   
	</xmp>
	
	<table>
	    <tr>
	      <td>
	       <jsp:include page="/days05/layout/left.jsp"></jsp:include>
	      </td>
	      <td>
	        회원 관리 Content 부분<br>
	        회원 관리 Content 부분<br>
	        회원 관리 Content 부분<br>
	        회원 관리 Content 부분<br>
	        회원 관리 Content 부분<br>
	      </td>
	      <td>
	        <jsp:include page="/days05/layout/right.jsp"></jsp:include>
	      </td>
	    </tr>
	  </table>
	  
</div>

<jsp:include page="/layout/bottom.jsp">
	<jsp:param value="진돌" name="name"/>
</jsp:include>

<script>
</script>
</body>
</html>