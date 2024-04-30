package days02;

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

import domain.EmpVO;

/**
 * Servlet implementation class ScottEmp
 */
@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ScottEmp() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT empno, ename, job, mgr, to_char(hiredate, 'yyyy-MM-dd') hiredate, sal,comm, deptno "
				+" FROM emp "
				+" WHERE deptno = ? ";

		int empno;
		String ename;
		String job;
		int mgr; 
		Date hiredate;  
		double sal;
		double comm;
		int deptno;

		// ?deptno=20
		String pdeptno = request.getParameter("deptno");
		if( pdeptno == null || pdeptno.equals("")) pdeptno="10";   
		deptno = Integer.parseInt(pdeptno);

		EmpVO vo = null;
		ArrayList<EmpVO> list = null;

		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			if( rs.next() ){
				list = new ArrayList<>();
				do{
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					vo = new EmpVO(empno, ename, job, mgr, hiredate
							, sal, comm, deptno);
					list.add(vo);
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
		
		request.setAttribute("list", list);

		// 포워딩 
		String path = "/days02/ex12_emp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
