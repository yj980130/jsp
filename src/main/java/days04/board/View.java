package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

/**
 * Servlet implementation class List
 */
@WebServlet("/cstvsboard/view.htm")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public View() {
        super();
    }

	// 글목록 -> 제목을 클릭해서 상세보기 - view.htm?seq=158
    // 상세보기 -> 수정하기 버튼을 클릭 - view.htm?seq=158&edit
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long pseq = Long.parseLong(request.getParameter("seq"));
		String pedit = request.getParameter("edit");
		
		// [해당 글번호의 상세보기]
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		
		try {
			if(pedit == null) dao.increaseReaded(pseq);
			
			dto = dao.view(pseq);
		} catch (SQLException e) {
			System.out.println("> View.doGet() Exception...");
			e.printStackTrace();
		}
		DBConn.close();
		
		// 1. 
		request.setAttribute("dto", dto);
		
		// 2 포워딩
		String path = "/days04/board/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
