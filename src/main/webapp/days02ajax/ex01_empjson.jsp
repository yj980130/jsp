<%@page import="com.util.ConnectionProvider"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page trimDirectiveWhitespaces="true" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String pDeptno = request.getParameter("deptno");

if(pDeptno == null || pDeptno.equals("")) pDeptno = "10";

int deptno = Integer.parseInt(pDeptno);

String sql =  "SELECT empno, ename, job, mgr, to_char(hiredate,'yyyy-MM-dd') hiredate, sal, comm , deptno "
            + " FROM emp "
            + " WHERE deptno = ? ";

JSONObject jsonData = new JSONObject();
JSONArray jsonEmpArray = new JSONArray();

try{
    conn = ConnectionProvider.getConnection();
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, deptno);
    rs = pstmt.executeQuery();

    while(rs.next()){
        int empno = rs.getInt("empno");
        String ename = rs.getString("ename");
        String job = rs.getString("job");
        int mgr = rs.getInt("mgr");
        String hiredate = rs.getString("hiredate");
        double sal = rs.getDouble("sal");
        double comm = rs.getDouble("comm");

        JSONObject jsonEmp = new JSONObject();
        jsonEmp.put("empno", empno);
        jsonEmp.put("ename", ename);
        jsonEmp.put("job", job);
        jsonEmp.put("mgr", mgr);
        jsonEmp.put("hiredate", hiredate);
        jsonEmp.put("sal", sal);
        jsonEmp.put("comm", comm);
        jsonEmp.put("deptno", deptno);

        jsonEmpArray.add(jsonEmp);
    }

    jsonData.put("emp", jsonEmpArray);

} catch(Exception e){
    e.printStackTrace();
} finally{
    JdbcUtil.close(rs);
    JdbcUtil.close(pstmt);
    JdbcUtil.close(conn);
}

%>
<%= jsonData %>

