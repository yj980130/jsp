package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptEmpSal;
import domain.SalgradeVO;

/**
 * Servlet implementation class SalGradeEmp
 */
@WebServlet("/days03/salgradeemp.htm")
public class SalGradeEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalGradeEmp() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// days03.Ex03_01.java의 main 함수 코딩
		String sql = 
				"SELECT grade, losal, hisal "
						+ "     , COUNT(*) cnt "
						+ "FROM salgrade s JOIN emp e ON e.sal BETWEEN s.losal AND s.hisal "
						+ "GROUP BY grade, losal, hisal "
						+ "ORDER BY grade ASC";
		String empSql = "SELECT d.deptno, dname, empno, ename, sal  "
				+ "FROM dept d RIGHT JOIN emp e ON d.deptno = e.deptno "
				+ "            JOIN salgrade s  ON sal BETWEEN losal AND hisal "
				+ "WHERE grade = ?   ";

		Connection conn = null;
		PreparedStatement pstmt = null, empPstmt = null;
		ResultSet rs = null, empRs = null;
		SalgradeVO vo = null;                         // key
		ArrayList<DeptEmpSal> empList = null;  // value		
		DeptEmpSal empVo = null;

		LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSal>> map = new LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSal>>();

		conn = DBConn.getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				do {
					int grade = rs.getInt("grade");
					vo = new SalgradeVO( 
							grade 
							, rs.getInt("losal")
							, rs.getInt("hisal")
							, rs.getInt("cnt")
							);
					//
					empPstmt = conn.prepareStatement(empSql);
					empPstmt.setInt(1, grade);
					empRs = empPstmt.executeQuery();

					if (empRs.next()) {
						empList = new ArrayList<DeptEmpSal>();
						do {
							//d.deptno, dname, empno, ename, sal
							empVo = DeptEmpSal
									.builder()
									.deptno(empRs.getInt("deptno"))
									.empno(empRs.getInt("empno"))
									.dname(empRs.getString("dname"))
									.ename(empRs.getString("ename"))
									.sal(empRs.getDouble("sal"))
									.build();
							empList.add(empVo);
						} while (empRs.next());
					} // if

					map.put(vo, empList);

					empRs.close();
					empPstmt.close();

				} while (rs.next());
			} // if


			// dispSalgrade(map); 출력함수

		} catch (SQLException e) { 
			e.printStackTrace();
		} catch (Exception e) { 
			e.printStackTrace();
		} finally {
			try {				
				rs.close();
				pstmt.close();
				DBConn.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		// 1. request scope(영역) 
		request.setAttribute("map", map);

		// 2. 포워딩
		String path = "/days03/salgradeemp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
