<%@page import="com.util.DBConn"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Connection conn = DBConn.getConnection();
    
    PreparedStatement pstmt = null;
    ResultSet rs = null;    
    String sql = "SELECT deptno, dname, loc FROM dept";
        
    int deptno = 0;
    String dname =  null; 
    String loc =   null;
    
    DeptVO dvo = null;
    ArrayList<DeptVO> dlist = null;
    
    try {
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        
        if( rs.next() ) {
            dlist = new ArrayList<>();
            do {
                deptno = rs.getInt("deptno");
                dname = rs.getString("dname");
                loc = rs.getString("loc");    
                
                dvo = new DeptVO(deptno, dname, loc);    
                
                dlist.add(dvo);
            } while (rs.next());                
        } // if 
        
        
    } catch (SQLException e) { 
        e.printStackTrace();
    } finally {
        try {
            pstmt.close();
            rs.close();
            // DBConn.close();
        } catch (SQLException e) { 
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
  </xmp> 
  
  <select id="deptno" name="deptno">
    <%
        Iterator<DeptVO> ir = dlist.iterator();
        while (ir.hasNext()) {
            dvo = ir.next();
    %>
    <option value="<%= dvo.getDeptno() %>" data-loc="<%= dvo.getLoc() %>" <%= deptno == dvo.getDeptno() ? "selected" : "" %>><%= dvo.getDname() %></option>
    <%
        } // while
    %>  
  </select>
  <br>
  <br>
  
<table id="empTable">
  <thead>
    <tr>
      <td>empno</td>
      <td>ename</td>
      <td>job</td>
      <td>mgr</td>
      <td>hiredate</td>
      <td>sal</td>
      <td>comm</td>
      <td>deptno</td>
    </tr>
  </thead>
  <tbody>
  
  </tbody>
  <tfoot>
  
  </tfoot>
</table>
  
</div>

<script>
  $(function (){
      $("#deptno").on("change", function(){
          let selectedDept = $(this).val(); // 선택한 부서번호 가져오기
          $.ajax({
             url: "ex01_empjson.jsp", 
             dataType: "json",
             type: "GET", 
             data: { deptno: selectedDept }, // 선택한 부서번호를 전달
             cache: false,
             success: function(data){
                 $("#empTable tbody").empty(); // 테이블 내용 초기화
                 $(data.emp).each(function(index, element){
                     // 직원 정보를 테이블에 추가
                     $("#empTable tbody").append(`<tr>
                                                 <td>\${element.empno}</td>
                                                 <td>\${element.ename}</td>
                                                 <td>\${element.job}</td>
                                                 <td>\${element.mgr}</td>
                                                 <td>\${element.hiredate}</td>
                                                 <td>\${element.sal}</td>
                                                 <td>\${element.comm}</td>
                                                 <td>\${element.deptno}</td>
                                             </tr>`);
                     
                 });
             },
             error: function(){
                 alert("error");
             }
             
             
          });
      });
  });
  
</script>
</body>
</html>
