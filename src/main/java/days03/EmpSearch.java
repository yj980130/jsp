package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptVO;
import domain.EmpVO;

/**
 * Servlet implementation class EmpSearch
 */
@WebServlet("/days03/empsearch.htm")
public class EmpSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmpSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1.
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT deptno, dname, loc "
				+" FROM dept ";
		int deptno;
		String dname, loc;

		DeptVO vo = null;
		ArrayList<DeptVO> dlist = null;

		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				dlist = new ArrayList<>();
				do{
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");			  
					vo = new DeptVO(deptno, dname, loc);
					dlist.add(vo);
				}while(rs.next());
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				// DBConn.close();
			}catch(SQLException e){
				e.printStackTrace();
			} //try	  
		} // try 

		
		// 2.
		sql = "SELECT DISTINCT job "
				+"FROM emp "
				+"ORDER BY job ASC ";
		String job;
		
		ArrayList<String> jlist = null;

		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				jlist = new ArrayList<>();
				do{
					job = rs.getString("job");
					jlist.add(job);
				}while(rs.next());
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				// DBConn.close();
			}catch(SQLException e){
				e.printStackTrace();
			} //try	  
		} // try 
		
		// 3. 검색조건 선택 후
		// days03/empsearch.htm
		// ?
		// deptno=10&deptno=30		IN ("10,30")
		// &
		// job=ANALYST&job=MANAGER&job=PRESIDENT
		String pdeptno = null;	// "10,30"
		String pjob = null;	// ANALYST, MANAGER

		try {
			String[] pdeptnos = request.getParameterValues("deptno");
			if(pdeptnos != null) {
				pdeptno = String.join(", ", pdeptnos);	// "10, 30"
			}
			
			String[] pjobs = request.getParameterValues("job");
			if(pjobs != null) {
				pjob = String.join("', '", pjobs);	// "ANALYST', 'MANAGER"
				pjob = String.format("'%s'", pjob);
			}
		} catch (Exception e) {
			System.out.println("> EmpSearch.doGet() - [3]");
		}
		
		sql = " SELECT empno, ename, job, mgr, to_char(hiredate, 'yyyy-MM-dd') hiredate, sal,comm, deptno "
				+" FROM emp ";
		
		if(pdeptno != null) {
			sql += String.format(" WHERE deptno IN (%S) ", pdeptno);
		}
		
		if(pjob != null) {
			sql += String.format(" %s job IN (%S) ", pdeptno!=null ? "AND" : "WHERE", pjob);
		}
		
		sql += "ORDER BY deptno ASC ";
		
		int empno;
		String ename;
		int mgr; 
		Date hiredate;  
		double sal;
		double comm;

		EmpVO evo = null;
		ArrayList<EmpVO> elist = null;

		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				elist = new ArrayList<>();
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
					elist.add(evo);
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
		
		request.setAttribute("dlist", dlist);
		request.setAttribute("jlist", jlist);
		request.setAttribute("elist", elist);

		// 포워딩
		String path = "/days03/ex01_empsearch_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
