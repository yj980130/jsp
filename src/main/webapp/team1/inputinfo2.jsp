<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<xmp class="code"> 
		</xmp>

		<form action="outputinfo.jsp" method="get">
			Address: <input type="text" id="address" name="address"><br> 
			PhoneNumber: <input type="text" id="phoneNumber" name="phoneNumber"><br> 
			<input type="submit" value="Next">
		</form>
		<%
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		
		Cookie addressCookie = new Cookie("address", address);
		Cookie phoneNumberCookie = new Cookie("phoneNumber", phoneNumber);
		
		response.addCookie(addressCookie);
		response.addCookie(phoneNumberCookie);
		%>
		
	</div>
</body>
</html>