<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT deptno, dname, loc "
				+"FROM dept ";
	int deptno;
	String dname, loc;
	
	DeptVO vo = null;
	ArrayList<DeptVO> list = null;
	
	try{
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			list = new ArrayList<>();
			do{
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				vo = new DeptVO(deptno, dname, loc);
				list.add(vo);
			}while(rs.next());
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			rs.close();
			pstmt.close();
			DBConn.close();			
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

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
	 	dept 테이블을 select  
	 	1) domain 패키지 추가
	 	2) DeptVO.java
	 	
	 	부서 선택 -> 서브밋(제출)
	 				ex06_emp.jsp                
	</xmp>  
   <select id="deptno" name="deptno">    
    <option>선택하세요.</option>    
    <!-- 
    <option value="10">ACCOUNTING</option>
    <option value="20">RESEARCH</option>
    <option value="30">SALES</option>
    <option value="40">OPERATIONS</option>
     -->
    <%
      Iterator<DeptVO> ir = list.iterator();
      while( ir.hasNext() ){
    	 vo = ir.next();
    	 //out.print(vo);
    %>
    <option value="<%= vo.getDeptno() %>"><%= vo.getDname() %></option>
    <%	 
      } // while
    %>
   </select>
</div>

<script>
$("#deptno").change(function(event){
	let deptno = $(this).val();	// 10 ~ 40
	location.href = `ex06_emp.jsp?deptno=\${deptno}`;
});
</script>
</body>
</html>