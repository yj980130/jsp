<%@page import="java.io.UnsupportedEncodingException"%>
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
		[ex06_04.jsp]
		ex06_04.jsp?ckbCookie=age&ckbCookie=name
	</xmp>  
	
	<%!
	public String getCookieValue(String cname,HttpServletRequest request){
	     Cookie [] cookieArr = request.getCookies();
	     for( Cookie cookie : cookieArr){
	        if( cookie.getName().equals(cname)){
	           try{
	              return URLDecoder.decode( cookie.getValue() , "UTF-8");
	           }catch(UnsupportedEncodingException e){} 
	        }
	     }// for     
	     return null;
	  }
	%>
	
	<form action="ex06_04_ok.jsp">
	<%
		String[] updCookieNames = request.getParameterValues("ckbCookie");
	    if(updCookieNames != null){
			for(int i = 0; i < updCookieNames.length; i++){
				String cookieName = updCookieNames[i];
				String cookieValue = getCookieValue(cookieName, request);
	%>
				<p><%=cookieName %> : <input type="text" name="<%=cookieName %>" value="<%= cookieValue %>" ></p>
	<%
			}
		}
	    else {
	%>
			<script>alert("체크해주세요")</script>
	<%  	
	    }
	%>
	
	<input type="submit" value="쿠키 수정" />
	</form>
</div>

<script>
</script>
</body>
</html>