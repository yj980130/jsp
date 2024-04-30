<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	span.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://www.jquery.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		view.jsp
	</xmp>  
	
	<h2>글 상세 보기</h2>
	
	<table>
		<tbody>
			<tr>
				<td>이름</td>
				<td>${dto.writer }</td>
				<td>등록일</td>
				<td>${dto.writeDate }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${dto.email }</td>
				<td>조회수</td>
				<td>${dto.readed }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${dto.title }</td>
			</tr>
			<tr>
				<td colspan="4" class="full" style="height:200px;vertical-align: top">${dto.content }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4" align="center">
					<a href="<%= contextPath %>/board/edit.do?seq=${dto.seq}">수정하기</a>
					<a href="<%= contextPath %>/board/delete.do?seq=${dto.seq}">삭제하기</a>
					<input type="button" id="btnModalDelete" value="모달 삭제" />
					<a href="<%= contextPath %>/board/list.do">HOME</a>
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<!-- 삭제 모달 창 -->
<div id="dialog-form" align="center" title="삭제 모달창">
	<h2>삭제하기</h2>
	<form action="<%=contextPath %>/board/delete.do?seq=${param.seq}" method="post">
		<table>
			<tr>
				<td colspan="2" align="center"><b>글을 삭제합니다.</b></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" size="15"
					autofocus="autofocus"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="삭제">
					&nbsp;&nbsp; <input type="button" value="취소" id="cancel">
				</td>
			</tr>
		</table>
		<span style="color:red;display: none" id="spn">비밀번호가 잘못되었습니다.</span>
	</form>
</div>

<script>
	let dialog;
	
	dialog = $( "#dialog-form" ).dialog({
	    autoOpen: false,
	    height: 400,
	    width: 350,
	    modal: true,
	    buttons: {
	      Cancel: function() {
	        dialog.dialog( "close" );
	      }
	    },
	    close: function() {
	      form[ 0 ].reset();
	    }

	});
	
	$("#btnModalDelete").on("click", function(){
		dialog.dialog("open");
	})
	
	$("#cancel").on("click", function(){
		dialog.dialog("close");
	})
	
	form = dialog.find("form");
	
	// 삭제 실패 후 리다이렉트되었을 경우
	// 모달창을 미리 열어두자.
	if (${param.delete eq "fail"}) {
		dialog.dialog( "open" );
	    $("#spn").show().slideToggle(3000);
	}
	
	// 예) writer = 권맑음 검색 1 [2] 의 57게시글을 클릭한 후
	// view.jsp -> Home 버튼을 클릭할 때
	$("tfoot a:last-of-type").attr("href", function(index, oldHref){
		return `\${oldHref}?currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
	});
	
	
	if (${param.delete eq "success"}) {
		$("tfoot a:nth-of-type(2)").attr("href", function(index, oldHref){
			return `<%= contextPath %>/board/list.do?currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
		})
	}
	
	// 삭제 후 검색결과의 페이지로 이동.
	$("#dialog-form form").attr("action", function (index, oldHref){
	   return `\${oldHref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
	});
	
	// [삭제하기]***
	$("tfoot a").eq(1).attr("href", function (index, oldHref){
		  return `\${oldHref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
	  });
	
</script>
</body>
</html>