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
		[프로젝트 사용할 실제 예제 : jquery ajax 처리]
		jquery ajax 함수 :
			get  방식 - getJSON(), getScript(), get()
			post 방식 - post()
			get/post 방식 - load() 		[$.ajax()]
			
			회원가입
			id : [   ]  [ID중복체크 버튼] jquery ajax
			ex08_idcheck.jsp
	</xmp>  
	
	<h2>회원 가입 페이지</h2>
	<form action="" method="get">
		deptno : <input type="text" name="deptno" value="10" /><br>
		empno : <input type="text" name="empno" value="7369" />
		<input type="button" id="btnEmpnoCheck" value="empno 중복체크 = jquery" />
		<p id="notice"></p>
		<br>
		ename : <input type="text" name="ename" value="" /><br>
		job : <input type="text" name="job" value="" /><br>
		
		<input type="submit" value="회원(emp) 가입" />
	</form>
	
</div>

<script>
	$(function (){
		$("#btnEmpnoCheck").on("click", function(){
			// ajax params= ?[empno=7369]
			let params = $("form").serialize();
			// alert(params);
			$.ajax({
				url:"ex08_idcheck.jsp",
				dataType:"json",		// text, json, xml, jsonp 등등
				type:"GET",
				data:params,
				cache:false, 	// ***** 캐시 X (꼭)
				success:function(data, textStatus, jqXHR){ // jqXHR : 비동기객체
					// {count:1}
					// jquery ajax 함수에서는 전달된 data JSON 데이터를 자동으로 js 객체로 변환을 한다.
					// JSON.parse()  json=> js Object 변환할 필요가 없다.
					// alert(data.count);
					if(data.count == 1){
						$("#notice").css("color", "red").text("이미 사용중인 ID 입니다");
					} else{
						$("#notice").css("color", "blue").text("사용 가능한 ID 입니다");
					}
				}, error: function(){
					alert("error");
				}
			});
		}); // click
	}); // function
</script>
</body>
</html>