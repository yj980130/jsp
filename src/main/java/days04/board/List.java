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
import days04.board.domain.PageDTO;
import days04.board.persistence.BoardDAOImpl;

/**
 * Servlet implementation class List
 */

// @WebServlet("/cstvsboard/list.htm")
public class List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public List() {
        super();
    }

	
    // list.htm?currentpage=3
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;		// 현재 페이지 번호
		int numberPerPage = 10;		// 한 페이지에 출력할 게시글 수
		
		int numberOfPageBlock = 10;	// [1] 2 3 4 5 6 7 8 9 10 >
		int totalRecords = 0;	// 총 레코드 수
		int totalPages = 0;		// 총 페이지 수
		
		// 검색 파라미터 시작
		int searchCondition = 1;
		try {
			searchCondition = Integer.parseInt(request.getParameter("searchCondition"));
		} catch (Exception e) {
			// 넘어오지 않으면 기본값 1
		}
		
		String searchWord = request.getParameter("searchWord");	// null
		// 검색 파라미터 끝
		
		try {
			currentPage = Integer.parseInt(request.getParameter("currentpage"));
		} catch (Exception e) {
			// 넘어오지 않으면 기본값 1
		}
		
		try {
			numberPerPage = Integer.parseInt(request.getParameter("numberPerPage"));
		} catch (Exception e) {
			// 넘어오지 않으면 기본값 10
		}
		
		// [검색 기능 + 페이징 처리]
		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);
		ArrayList<BoardDTO> list = null;
		PageDTO pDto = null;
		
		try {
			if(searchWord == null || searchWord.equals("")) {
				list = dao.select(currentPage, numberPerPage);
				// totalRecords = dao.getTotalRecords();
				totalPages = dao.getTotalPages(numberPerPage);
				pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
			}
			else {
				list = dao.search(searchCondition, searchWord, currentPage, numberPerPage);
				totalPages = dao.getTotalSearchPages(numberPerPage, searchCondition, searchWord);
			}
			pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
			
		} catch (SQLException e) {
			System.out.println("> List.doGet() Exception...");
			e.printStackTrace();
		}
		DBConn.close();
		
		// 1. 
		request.setAttribute("list", list);
		request.setAttribute("pDto", pDto);
		request.setAttribute("numberPerPage", numberPerPage);
		
		// 2 포워딩
		String path = "/days04/board/list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
