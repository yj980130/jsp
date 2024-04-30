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
@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Edit() {
        super();
    }

	
    // edit.htm?seq=153
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long pseq = Long.parseLong(request.getParameter("seq"));
		
		
		// [해당 글번호의 내용 가져오기]
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		BoardDTO dto = null;
		
		try {
			dto = dao.view(pseq);
		} catch (SQLException e) {
			System.out.println("> Edit.doGet() Exception...");
			e.printStackTrace();
		}
		DBConn.close();
		
		// 1. 
		request.setAttribute("dto", dto);
		
		// 2 포워딩
		String path = "/days04/board/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		// edit.htm?seq=150
		int pseq = Integer.parseInt(request.getParameter("seq"));
		
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));
		
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		int rowCount = 0;
		
		BoardDTO dto = BoardDTO.builder()
								.seq(pseq)
								.pwd(pwd)
								.email(email)
								.title(title)
								.content(content)
								.content(content)
								.tag(tag)
								.build();
						
		try {
			rowCount = dao.update(dto);
		} catch (SQLException e) {
			System.out.println("> Edit.doPost() Exception...");
			e.printStackTrace();
		}
		
		DBConn.close();
		
		//  포워딩, [ 리다이렉트 ]
		String location = "/jspPro/cstvsboard/view.htm?seq=" + pseq;
		location += rowCount == 1 ? "&edit=success":"&edit=fail";
		response.sendRedirect(location);
		
	}

}
