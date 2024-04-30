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
		xml -> json 형식을 ajax 더 많이 사용.
		ex07_dept.json
		ex07_dept.xml
		
		[JSON]
		1. [J]ava [S]cript [O]bject [N]otation
		2. 가벼운 데이터 교환 형식
		3. 인간이 읽기 쉽고 쓰기 쉽다.
		4. 기계가 구문분석, 생성, 사용 쉽다.
		
		쿠키
		로컬 저장소
			
	</xmp>
	
	<button onclick="getPersonJson()">로컬 저장소의 personJson</button>
	
	<p id="demo"></p>
	
</div>

<script>
	var person = {
		name:"jindol"
		, age:25
		, city:"seoul"
	};
	
	// 2. js Object -> json 변환 	JSON.stringify()
	let personJson = JSON.stringify(person);
	// console.log(personJson);	// ""
	
	// 3. 로컬 저장소에 저장
	localStorage.setItem("personJson", personJson);
	
	function getPersonJson(){
		// 4. 로컬 저장소에 저장된 값을 얻어와서 출력
		let personJson2 = localStorage.getItem("personJson");
		
		let person2 = JSON.parse(personJson2);
		
		$("#demo").html(person2.name + " / " + person2["age"]);
		
		// 5. 로컬 저장소 제거
		localStorage.removeItem("personJson");
	}
	
</script>
</body>
</html>