<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.ConnectionProvider"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String pDeptno = request.getParameter("deptno");

	if(pDeptno == null || pDeptno.equals("")) pDeptno = "10";

	int deptno = Integer.parseInt(pDeptno);
	
	String sql = "SELECT COUNT(*) AS line_count "
	        + "FROM emp "
	        + "WHERE deptno = ? "; 
	int lineCount = 0; // 라인 개수를 저장할 변수
	
	try {
	 conn = ConnectionProvider.getConnection();
	 pstmt = conn.prepareStatement(sql);
	 pstmt.setInt(1, deptno);
	 rs = pstmt.executeQuery();
	
	 // COUNT(*)로 조회한 결과가 1행이므로, 반복문을 사용하지 않고 한 번만 처리합니다.
	 if (rs.next()) {
	     lineCount = rs.getInt("line_count"); // 라인 개수를 변수에 저장
	 }
	 
	 // 나머지 코드는 그대로 유지됩니다.
	
	} catch(Exception e){
	 e.printStackTrace();
	} finally{
	 JdbcUtil.close(rs);
	 JdbcUtil.close(pstmt);
	 JdbcUtil.close(conn);
	}
	
	//라인 개수 출력
	out.print(lineCount);
%>