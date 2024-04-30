<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kenik HOme</a></h1>
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
	  http://localhost/jspPro/days02/ex01_ok_02.jsp
	  ?
	  empno=7521&empno=7698&empno=7844
  </xmp> 
</div>

<p id="demo">
  <ul>
    <%    
      String [] empnos = request.getParameterValues("empno");
      for(int i=0; i<empnos.length; i++){
      %><li><%= empnos[i] %></li><%   	   
           }
     %>
  </ul>
</p>

<script>
   // <input type="text" data-loc="seoul">
   // jquery  $(":text").data("loc")
   //         $(":text").data("loc","busan"); 
</script>
</body>
</html>








 