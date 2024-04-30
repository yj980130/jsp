package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistence.BoardDAOImpl;



public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();	// GET	POST
		
		if (method.equals("GET")) {	// List.java doGet() 복사 붙이기
			return "/days06/board/write.jsp";
		}
		else { // List.java doPost() 복사 붙이기
			request.setCharacterEncoding("UTF-8");
			
			String writer = request.getParameter("writer");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt( request.getParameter("tag") );
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			int rowCount = 0;
			
			BoardDTO dto = new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);
			
			try {
				rowCount = dao.insert(dto);
			} catch (SQLException e) {
				System.out.println("> Write.doPost() Exception...");
				e.printStackTrace();
			}
			
			conn.close();
			
			//  포워딩, [ 리다이렉트 ]
			String location = "/jspPro/board/list.do";
			location += rowCount == 1 ? "?write=success":"?write=fail";
			response.sendRedirect(location);
		}
		
		return null;
	}

}
