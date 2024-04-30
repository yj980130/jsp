<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion();
		$("#tabs").tabs();
	});
</script>
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
		<!-- private static void dispSalgrade(
		LinkedHashMap<SalgradeVO , ArrayList
			<DeptEmpSal>> map) {
		Set<Entry<SalgradeVO, ArrayList<DeptEmpSal>>> set = map.entrySet();
		Iterator<Entry<SalgradeVO, ArrayList<DeptEmpSal>>> ir = set.iterator();
		while (ir.hasNext()) {
			Entry<SalgradeVO, ArrayList<DeptEmpSal>> entry = 
					ir.next();
			SalgradeVO vo =  entry.getKey();
			ArrayList<DeptEmpSal> list = entry.getValue();
			// 출력
			System.out.printf("%d등급	( %d~%d ) - %d명\n"
					, vo.getGrade()
					, vo.getLosal()
					, vo.getHisal()
					, vo.getCnt());
			// 사원 출력
			Iterator<DeptEmpSal> ir2 = list.iterator();
			while (ir2.hasNext()) {
				DeptEmpSal empvo = ir2.next();
				System.out.printf(
						"\t\t%s\t%d\t%s\t%.2f\n"
						, empvo.getDname()
						, empvo.getEmpno()
						, empvo.getEname()
						, empvo.getSal());
			}
		} // while
	} --> </xmp>

		<div id="accordion">
			<!-- 	<h3>Section 1</h3>
	<div>
	  <p>
	  Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
	  ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
	  amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
	  odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
	  </p>
	</div> -->

			<!-- Entry<SalgradeVO, ArrayList<DeptEmpSalgradeVO>> entry -->
			<c:forEach items="${map }" var="entry">
				<h3>${entry.key }</h3>
				<!-- 1등급	(     700~1200 ) - 2명 -->
				<%-- <h3>${entry.key.grade}등급 (${entry.key.losal} ~ ${entry.key.hisal}) - ${entry.key.cnt}</h3> --%>
				<div>
					<p>
						<!--  entry.value == ArrayList<DeptEmpSalgradeVO> -->
						<c:forEach items="${entry.value }" var="vo">
							<li>${vo }</li>
						</c:forEach>
					</p>
				</div>
			</c:forEach>

		</div>

		<hr />

		<div id="tabs">
			<ul>
				<c:forEach items="${map}" var="entry">
					<li><a href="#tabs-${entry.key.grade}">${entry.key.grade}등급</a></li>
				</c:forEach>
			</ul>
			<c:forEach items="${map}" var="entry">
				<div id="tabs-${entry.key.grade}">
					<p>
						<!--  entry.value == ArrayList<DeptEmpSalgradeVO> -->
						<c:forEach items="${entry.value}" var="vo">
							<li>${vo}</li>
						</c:forEach>
					</p>
				</div>
			</c:forEach>
		</div>

	</div>

	<script>
		
</script>
</body>
</html>