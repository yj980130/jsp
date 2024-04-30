package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days06.mvc.domain.BoardDTO;
import days06.mvc.persistence.BoardDAOImpl;



public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();	// GET	POST
		
		if (method.equals("GET")) {	
			long pseq = Long.parseLong(request.getParameter("seq"));
			
			
			// [해당 글번호의 내용 가져오기]
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);
			BoardDTO dto = null;
			
			try {
				dto = dao.view(pseq);
			} catch (SQLException e) {
				System.out.println("> EditHandler.doGet() Exception...");
				e.printStackTrace();
			}
			conn.close();
			
			// 1. 
			request.setAttribute("dto", dto);
			
			return "/days06/board/edit.jsp";
		}
		else { 
			request.setCharacterEncoding("UTF-8");
			
			// edit.htm?seq=150
			int pseq = Integer.parseInt(request.getParameter("seq"));
			
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt(request.getParameter("tag"));
			
			Connection conn = ConnectionProvider.getConnection();
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
				System.out.println("> EditHandler.doPost() Exception...");
				e.printStackTrace();
			}
			
			conn.close();
			
			//  포워딩, [ 리다이렉트 ]
			String location = "/jspPro/board/view.do?seq=" + pseq;
			location += rowCount == 1 ? "&edit=success":"&edit=fail";
			response.sendRedirect(location);
		}
		
		return null;
	}

}
