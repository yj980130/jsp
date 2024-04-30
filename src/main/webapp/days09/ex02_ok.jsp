<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		ex02_ok.jsp
	</xmp>  
	<%
		// ㄴ.
		String saveDirectory = pageContext.getServletContext().getRealPath("/days09/upload");
		System.out.println(saveDirectory);
		
		File f = new File(saveDirectory);
		if(!f.exists()) f.mkdirs();
		
		// ㄷ.
		int maxPostSize = 5 * 1024 * 1024; // byte(기본단위) 5MB
		
		// ㄹ.
		String encoding = "UTF-8";
		
		// ㅁ.
		// a.txt파일을 업로드 -> upload 폴더 안에 a.txt 저장.
		// 										  a_1.txt or a(1).txt
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multiRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		// 벌써 파일은 업로드 폴더에 저장 완료된 상태
	%>
	
	> 전송된 메시지 : <%= multiRequest.getParameter("msg") %>
	<br />
	<br />
	<%
		Enumeration en = multiRequest.getFileNames();
		while(en.hasMoreElements()){
			String inputNameAttr = (String)en.nextElement(); // file1, file2, file3
			File attachFile = multiRequest.getFile(inputNameAttr);
			if(attachFile != null){
				String fileName = attachFile.getName();	
				// 고객 업로드할 때의 원래 파일명
				String originalFileName = multiRequest.getOriginalFileName(inputNameAttr); 
				// 실제 upload 폴더에 저장된 파일명
				String fileSystemName = multiRequest.getFilesystemName(inputNameAttr);
			
	%>
				>첨부된 파일명 : <%= fileName %><br>
				>첨부된 파일크기 : <%= attachFile.length() %>bytes<br>
				>첨부된 원래 파일명 : <%= originalFileName %><br>
				>실제 저장된 파일명 : <%= fileSystemName %><br>
	<%
			}
		}
	%>
	
</div>

<script>
</script>
</body>
</html>