<%@page import="domain.EmpVO"%>
<%@page import="java.util.Date"%>
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
	String deptSql = "SELECT deptno, dname, loc "
				+"FROM dept ";
	String empSql = " SELECT empno, ename, job, mgr, to_char(hiredate, 'yyyy-MM-dd') hiredate, sal,comm, deptno "
	            +" FROM emp "
	            +" WHERE deptno = ? ";
	int deptno;
	String dname, loc;
	
	int empno;
	String ename;
	String job;
	int mgr; 
	Date hiredate;  
	double sal;
	double comm;
	
	DeptVO dvo = null;
	EmpVO evo = null;
	ArrayList<DeptVO> deptList = null;
	ArrayList<EmpVO> empList = null;
	
	try{
		pstmt = conn.prepareStatement(deptSql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			deptList = new ArrayList<>();
			do{
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				dvo = new DeptVO(deptno, dname, loc);
				deptList.add(dvo);
			}while(rs.next());
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	try{
	     pstmt = conn.prepareStatement(empSql);
	     rs = pstmt.executeQuery();
	     if( rs.next() ){
	        empList = new ArrayList<>();
	        do{
	           empno = rs.getInt("empno");
	           ename = rs.getString("ename");
	           job = rs.getString("job");
	           mgr = rs.getInt("mgr");
	           hiredate = rs.getDate("hiredate");
	           sal = rs.getDouble("sal");
	           comm = rs.getDouble("comm");
	           deptno = rs.getInt("deptno");
	           evo = new EmpVO(empno, ename, job, mgr, hiredate
	                 , sal, comm, deptno);
	           empList.add(evo);
	        }while(rs.next());
	     } // if
	  }catch(Exception e){
	     e.printStackTrace();
	  }finally{
	     try{
	        pstmt.close();
	        rs.close();
	        DBConn.close();
	     }catch(SQLException e){
	        e.printStackTrace();
	     } //try     
	  } // try 

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
<div id="dept">
	<xmp class="code">
                
	</xmp>  
   <select id="deptno" name="deptno">    
    <option>선택하세요.</option>    

    <%
      Iterator<DeptVO> ir = deptList.iterator();
      while( ir.hasNext() ){
    	 dvo = ir.next();
    	 //out.print(vo);
    %>
    <option value="<%= dvo.getDeptno() %>"><%= dvo.getDname() %></option>
    <%	 
      } // while
    %>
   </select>
</div>

<div id="emp">
	<h2>emp list</h2>
      <table>
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
          <%
             if( empList == null ){
          %>
              <tr>
                <td colspan="8">사원 존재 X</td>
              </tr>
          <%      
             }else{
                
              Iterator<EmpVO> eir = empList.iterator();
              while( ir.hasNext() ){
                 evo = eir.next();
              %>
               <tr>
                 <td><%= evo.getEmpno() %></td>
                 <td><%= evo.getEname() %></td>
                 <td><%= evo.getJob() %></td>
                 <td><%= evo.getMgr() %></td>
                 <td><%= evo.getHiredate() %></td>
                 <td><%= evo.getSal() %></td>
                 <td><%= evo.getComm() %></td>
                 <td><%= evo.getDeptno() %></td>
               </tr>
              <%       
              } // while
             } // if
          %>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="8">
              <span class="badge left red">
                <%= empList==null ? 0 : empList.size() %>
              </span>
              명.d
              
            </td>
          </tr>
        </tfoot>
      </table>
</div>

<script>
$("#deptno").change(function(event){
    let deptno = $(this).val(); // 선택된 부서 번호 가져오기
    // 선택된 부서 번호를 URL에 추가하여 페이지를 다시 로드
    window.location.href = "test01.jsp?deptno=" + deptno;
});

</script>
</body>
</html>