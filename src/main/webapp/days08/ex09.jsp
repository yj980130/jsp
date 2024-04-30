<%@page import="java.util.Date"%>
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
		emp 테이블의 사원정보를 jquery alax 요청으로 json형태의 결과물을 받아서 웹페이지에 출력.
		
		ex09_empjson.jsp 
	</xmp>  
	<h3><%=new Date().toLocaleString() %></h3>
	<input type="button" id="btn1" value="jquery ajax + json" />
	<br />
	<select id="cmbDept"></select>
	<p id="demo"></p>
</div>

<script>
	$(function(){
		$("#btn1").on("click", function(){
			$.ajax({
				// url:"ex09_empjson.jsp",
				url:"ex09_empjson_lib.jsp",
				dataType:"json",
				type:"GET",
				cache: false,
				success:function(data, textStatus, jqXHR){
					// alert(data.emp); 	// js Object Array[{}, {}]
					$(data.emp).each(function(index, element){
						$("#cmbDept").append(`<option value=\${element.empno}>\${element.ename}</option>`);
						$("#demo").append(`<li>\${element.empno} : \${element.ename}</li>`);
					});
				}, error:function(){
					alert("error");	
				}
			});	// ajax		
		}); // btn1
	}); // function
</script>
</body>
</html>