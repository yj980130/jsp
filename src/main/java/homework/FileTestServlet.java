package homework;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FileTestServlet() {
		super(); 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI(); // list.ss, write.ss, update.ss 등등

		Connection conn = null;
		String saveDirectory = null;

		// MVC 패턴
		// commandHandler.properties   list.ss => ListHandler.java X
		// init()      commandHalderMap <url, Handler> 
		try {
			conn = ConnectionProvider.getConnection();
			ImageListDAO dao = ImageListDAO.getInstance(); // 싱글톤
			// ㄴ
			saveDirectory = request.getRealPath("/homework/upload");
			System.out.println(saveDirectory);

			if( uri.endsWith("list.ss") ) { // 자료실 목록 보기            
				ArrayList<ImageListDTO>  list =  dao.selectFileList(conn);
				request.setAttribute("list", list);

				String path = "/homework/list.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}else if( uri.endsWith("write.ss") ) {   // 글쓰기 + write.jsp

				String path = "/homework/write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}else if( uri.endsWith("write_ok.ss") ) { // 글쓰기 저장
				// 12:01 수업시작~~
				File f = new File(saveDirectory);
				if( ! f.exists() ) f.mkdirs();  
				// ㄷ.
				int maxPostSize = 5 * 1024 * 1024 ;
				// ㄹ.
				String encoding = "UTF-8";
				// ㅁ.    _(1)
				FileRenamePolicy policy = new DefaultFileRenamePolicy(); 

				MultipartRequest multiRequest = new MultipartRequest(
						request
						, saveDirectory 
						, maxPostSize 
						, encoding
						, policy
						);
				// 벌써 첨부파일은 upload 폴더에 저장 완료!!!
				ImageListDTO dto = new ImageListDTO();
				String subject = multiRequest.getParameter("product_name");
				dto.setProduct_name(subject);

				File attachFile = multiRequest.getFile("attachFile");
				if (attachFile != null) {  // 첨부파일이 있을 경우에만
					String product_name  = attachFile.getName();//getName은 해당 파일의 이름을 가져온다.
					

					String product_detail = multiRequest.getOriginalFileName("attachFile");
					String filesystemName = multiRequest.getFilesystemName("attachFile");

					dto.setProduct_detail(product_detail);
					
				} // if

				int rowCount = dao.insert(conn, dto);

				response.sendRedirect("list.ss");

			}else if( uri.endsWith("delete.ss") ) { // 삭제
				int num = Integer.parseInt(request.getParameter("product_id") );
				String filesystemname = request.getParameter("filesystemname");  // ""      
				// 1. DB 삭제 
				int rowCount = dao.delete(conn, num);
				// 2. upload 폴더 안에 파일도 삭제.
				String pathname = String.format("%s\\%s", saveDirectory, filesystemname);
				File deleteFile = new File(pathname);   
				if ( deleteFile.exists() ) {
					deleteFile.delete();
				} 
				response.sendRedirect("/jspPro/homework/list.ss");   

			}else if( uri.endsWith("update.ss") ) { // 수정 + update.jsp
				//[문제] 첨부파일이 있는 경우
				//       제목만 수정하고 저장하면
				//       첨부파일 없음 - 첨부파일삭제 X

				int num = Integer.parseInt(request.getParameter("product_id"));
				ImageListDTO dto = dao.selectOne(conn, num);
				request.setAttribute("dto", dto); 

				String path = "/homework/update.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);

			}else if( uri.endsWith("update_ok.ss") ) { // 수정 저장.
				// ㄷ.
				int maxPostSize = 5 * 1024 * 1024 ;
				// ㄹ.
				String encoding = "UTF-8";
				// ㅁ.    _(1)
				FileRenamePolicy policy = new DefaultFileRenamePolicy(); 

				MultipartRequest multiRequest = new MultipartRequest(
						request
						, saveDirectory 
						, maxPostSize 
						, encoding
						, policy
						);
				// 수정할 때 첨부파일 있다면 벌써 upload 폴더 저장 완료!!!
				int num = Integer.parseInt(multiRequest.getParameter("product_id") );
				String delete_filesystemname =
						multiRequest.getParameter("filesystemname");

				ImageListDTO dto = new ImageListDTO();             
				String Product_name = multiRequest.getParameter("Product_name(");
				dto.setProduct_name(Product_name);
				dto.setProduct_id(num);

				File attachFile = multiRequest.getFile("attachFile");
				if ( attachFile != null ) {  // 첨부파일이 있을 경우에만
					String fileName  = attachFile.getName();
					

					// 이전 첨부파일이 있다면 삭제..

					String deleteFilePath = 
							String.format("%s\\%s"
									,saveDirectory , delete_filesystemname);
					File deleteFile = new File(deleteFilePath);
					if( deleteFile.exists() ) deleteFile.delete();
				} 

				int rowCount = dao.update(conn, dto);

				response.sendRedirect("list.ss");

			} // if


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn); 
		} // try

	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request, response);
	}

}