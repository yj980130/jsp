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
		list.jsp
	</xmp>
	
	<h2>목록 보기</h2>
	<a href="<%= contextPath%>/cstvsboard/write.htm">글쓰기</a>
	<select id="cmbNumberPerPage" name="cmbNumberPerPage">
	</select>
 	<script>
	    for (var i = 10; i <= 50; i+=5) {
	     $("#cmbNumberPerPage").append(`<option>\${i}</option>`);      
	    }
	    
	    $("#cmbNumberPerPage").on("change", function (){

	    	let numberPerPage=$(this).val();
	        let url = `/jspPro/cstvsboard/list.htm?currentpage=1&numberPerPage=`+numberPerPage;       
	        location.href = url;    
  

	     });

				
	</script>  
	<table>
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="45%">제목</th>
				<th width="17%">작성자</th>
				<th width="20%">등록일</th>
				<th width="10%">조회</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.seq }</td>
							<td class="title"><a href="<%=contextPath %>/cstvsboard/view.htm?seq=${dto.seq}">${dto.title}</a></td>
							<td>${dto.writer }</td>
							<td>${dto.writeDate }</td>
							<td>${dto.readed }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">
				<!-- prev [1start] 2 3 4 5 6 7 8 9 10end >next  pDto -->
				<div class="pagination">
					<c:if test="${pDto.prev }">
					 	<a href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${pDto.start-1 }">&lt</a>
					</c:if>
					<c:forEach var="i" begin="${pDto.start }" end="${pDto.end }" step="1">
						<c:choose>
							<c:when test="${i eq pDto.currentPage }">
								<%-- <a class="active" href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${i}">${i }</a> --%>
								<a class="active" href="#">${i }</a>
							</c:when>
							<c:otherwise>
								<a href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${i }">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pDto.next }">
						<a href="<%= contextPath %>/cstvsboard/list.htm?currentpage=${pDto.end+1 }">&gt</a>
					</c:if>
				</div>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<!-- list.htm?searchCondition=1&searchWord=검색어 -->
					<form method="get">
						<select name="searchCondition" id="searchCondition">
							<option value="1">제목</option>
							<option value="2">내용</option>
							<option value="3">작성자</option>
							<option value="4">제목+내용</option>
						</select>
						<input type="text" name="searchWord" id="searchWord"/>
						<input type="submit" value="search"/>
					</form>
				</td>
			</tr>
		</tfoot>
	</table>  
</div>

<script>
	// list.htm?write=success or fail
	if('<%=request.getParameter("write") %>'=="success"){
		alert("글 쓰기 완료!!!");
	}
	else if('<%=request.getParameter("write") %>'=="fail"){
		alert("글 쓰기 실패 :( ");
	}
	else if('<%=request.getParameter("delete") %>'=="success"){
		alert("게시글 삭제 완료 ;) ");
	}
	
	// 검색어, 검색조건 상태유지
	// list.htm?searchCondition=3&searchWord=ji
	$("#searchCondition").val(${param.searchCondition});
   	$("#searchWord").val("${param.searchWord}");
	
   	// 검색 후 1 [2] 페이지 번호를 클릭
   	$(".pagination a:not(.active)").attr("href", function (index, oldHref){
      return `\${oldHref}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}&numberPerPage=${param.numberPerPage}`;
    });

   	
 	// 검색 후 1 [2] 게시글의 제목을 클릭
 	// oldHref == view.htm?seq=57
   	$(".title a").attr("href", function (index, oldHref){
      return `\${oldHref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}&numberPerPage=${param.numberPerPage}`;
    });

 	
   	$("#cmbNumberPerPage").val(${param.numberPerPage});  

 	
</script>
</body>
</html>