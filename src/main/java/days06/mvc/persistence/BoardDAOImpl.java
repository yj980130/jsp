package days06.mvc.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

import days06.mvc.domain.BoardDTO;

public class BoardDAOImpl implements BoardDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	Scanner scanner = new Scanner(System.in);

	// 1. 생성자를 통한 DI
	public BoardDAOImpl(Connection conn) {
		this.conn = conn;
	}

	// 2. Setter를 통한 DI
	public void setConn(Connection conn) {
		this.conn = conn;
	}

	// 2-2 Getter
	public Connection getConn() {
		return this.conn;
	}

	@Override
	public ArrayList<BoardDTO> select() throws SQLException {
		ArrayList<BoardDTO> list = null;

		long seq;
		String title;
		String writer;
		String email;
		Date writeDate;
		int readed;

		String sql = "SELECT seq, title, writer, email, writeDate, readed "
				+ "FROM tbl_cstvsboard "
				+ "ORDER BY seq DESC";
		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					seq = rs.getLong(1);
					title = rs.getString(2);
					writer = rs.getString(3);
					email = rs.getString(4);
					writeDate = rs.getDate(5);
					readed = rs.getInt(6);

					BoardDTO dto = BoardDTO.builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.writeDate(writeDate)
							.readed(readed)
							.build();
					list.add(dto);

				} while (rs.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return list;
	} // select


	@Override
	public int insert(BoardDTO dto) throws SQLException {

		// writedate  default  sysdate
		// readed     default  0
		int rowCount = 0;
		String sql = "INSERT INTO tbl_cstvsboard "
				+ " (seq, writer, pwd, email, title, tag, content ) "
				+ "VALUES "
				+ " (seq_tbl_cstvsboard.NEXTVAL, ?, ?, ?, ?, ?, ? ) ";

		this.pstmt = conn.prepareStatement(sql);      
		pstmt.setString(1,  dto.getWriter() );
		pstmt.setString(2,  dto.getPwd() );
		pstmt.setString(3,  dto.getEmail() );
		pstmt.setString(4,  dto.getTitle() );
		pstmt.setInt(5, dto.getTag());
		pstmt.setString(6,  dto.getContent() );
		rowCount = this.pstmt.executeUpdate();
		this.pstmt.close();

		return rowCount;

	} // insert

	@Override
	public int increaseReaded(long seq) throws SQLException {
		String sql = "UPDATE tbl_cstvsboard "
				+ "SET readed = readed + 1 "
				+ "WHERE seq = ? ";
		int rowCount = 0;

		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setLong(1, seq);
		rowCount = this.pstmt.executeUpdate();

		return rowCount;
	}

	@Override
	public BoardDTO view(long seq) throws SQLException {

		BoardDTO dto = null;

		String title;
		String writer;
		String email;
		Date writeDate;
		int readed;
		String content;
		int tag;

		String sql = "SELECT seq, title, writer, email, writeDate, readed, content, tag "
				+ "FROM tbl_cstvsboard "
				+ "WHERE seq = ?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, seq);
			rs = pstmt.executeQuery();



			if(rs.next()) {
				seq = rs.getLong(1);
				title = rs.getString(2);
				writer = rs.getString(3);
				email = rs.getString(4);
				writeDate = rs.getDate(5);
				readed = rs.getInt(6);
				content = rs.getString(7);
				tag = rs.getInt(8);

				dto = BoardDTO.builder()
						.seq(seq)
						.title(title)
						.email(email)
						.writer(writer)
						.writeDate(writeDate)
						.readed(readed)
						.content(content)
						.tag(tag)
						.build();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return dto;

	}

	@Override
	public int delete(long seq) throws SQLException {

		int rowCount = 0;
		String sql = "DELETE FROM tbl_cstvsboard "
				+ "WHERE seq = ? ";

		this.pstmt = conn.prepareStatement(sql);
		this.pstmt.setLong(1, seq);
		rowCount = this.pstmt.executeUpdate();

		this.pstmt.close();
		return rowCount;
	}

	@Override
	public int update(BoardDTO dto) throws SQLException {

		int rowCount = 0;
		String sql = "UPDATE tbl_cstvsboard "
				+ "SET email=?, title=?, content=?, tag=? "
				+ "WHERE seq = ? AND pwd = ? ";

		this.pstmt = conn.prepareStatement(sql);      
		pstmt.setString(1,  dto.getEmail() );
		pstmt.setString(2,  dto.getTitle() );
		pstmt.setString(3,  dto.getContent() );
		pstmt.setInt(4, dto.getTag());
		pstmt.setLong(5,  dto.getSeq() );
		pstmt.setString(6, dto.getPwd());
		rowCount = this.pstmt.executeUpdate();
		this.pstmt.close();

		return rowCount;
		
	}

	@Override
	public ArrayList<BoardDTO> search(int searchCondition, String searchWord) {
		ArrayList<BoardDTO> list = null;

		long seq;
		String title;
		String writer;
		String email;
		Date writeDate;
		int readed;

		String sql = "SELECT seq, title, writer, email, writeDate, readed "
				+ "FROM tbl_cstvsboard ";

		// WHERE 검색조건 STARTswitch ( searchCondition) {
		switch ( searchCondition) {
		case 1:  // 제목
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') ";
			break;
		case 2: // 내용
			sql += " WHERE REGEXP_LIKE( content, ?, 'i') ";
			break;
		case 3: // 작성자
			sql += " WHERE REGEXP_LIKE( writer, ?, 'i') ";
			break;         
		case 4: // 제목 + 내용 
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') OR  REGEXP_LIKE( content, ?, 'i') ";
			break;
		} // switch

		sql += "ORDER BY seq ASC ";
		try {

			pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, searchWord);
			if (searchCondition == 4) {
				this.pstmt.setString(2, searchWord);
			}

			rs = pstmt.executeQuery();

			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					seq = rs.getLong(1);
					title = rs.getString(2);
					writer = rs.getString(3);
					email = rs.getString(4);
					writeDate = rs.getDate(5);
					readed = rs.getInt(6);

					BoardDTO dto = BoardDTO.builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.writeDate(writeDate)
							.readed(readed)
							.build();
					list.add(dto);

				} while (rs.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return list;
	}

	@Override
	public ArrayList<BoardDTO> popular() throws SQLException {

		ArrayList<BoardDTO> list = null;
		long seq;
		String title;
		String writer;
		String email;
		Date writeDate;
		int readed;

		String sql = "SELECT seq, title, writer, email, writeDate, readed "
				+ "FROM tbl_cstvsboard "
				+ "WHERE readed >= 1 "
				+ "ORDER BY readed DESC ";
		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					seq = rs.getLong(1);
					title = rs.getString(2);
					writer = rs.getString(3);
					email = rs.getString(4);
					writeDate = rs.getDate(5);
					readed = rs.getInt(6);

					BoardDTO dto = BoardDTO.builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.email(email)
							.writeDate(writeDate)
							.readed(readed)
							.build();
					list.add(dto);

				} while (rs.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return list;
	}

	@Override
	public ArrayList<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException {

		ArrayList<BoardDTO> list = null;

		long seq;
		String title;
		String writer;
		String email;
		Date writeDate;
		int readed;

		String sql = "SELECT * "
				+ "FROM( "
				+ "    SELECT ROWNUM no,t.* "
				+ "    FROM ( "
				+ "        SELECT seq, title, writer, email, writeDate, readed "
				+ "        FROM tbl_cstvsboard "
				+ "        ORDER BY seq DESC "
				+ "        ) t "
				+ "    ) b "
				+ "WHERE no BETWEEN ? AND ?";
		try {

			int end = currentPage * numberPerPage;
			int start = end - (numberPerPage-1);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					seq = rs.getLong("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writeDate = rs.getDate("writeDate");
					readed = rs.getInt("readed");

					BoardDTO dto = BoardDTO.builder()
							.seq(seq)
							.title(title)
							.writer(writer)
							.writeDate(writeDate)
							.readed(readed)
							.build();
					list.add(dto);

				} while (rs.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return list;
	}
	
	@Override
	public ArrayList<BoardDTO> search(
	           int searchCondition, String searchWord
	         , int currentPage, int numberPerPage)
	         throws SQLException {
	      
	      ArrayList<BoardDTO> list = null;

	      long    seq;
	      String    title;
	      String    writer;
	      String    email;
	      Date    writedate;
	      int    readed;

	      String sql = "SELECT * "
	            + "FROM ( "
	            + "        SELECT ROWNUM no, t.* "
	            + "        FROM ( "
	            + "                SELECT seq, title, writer, email, writedate, readed  "
	            + "                FROM tbl_cstvsboard  ";
	            
	            // WHERE 검색조건 START
	            switch ( searchCondition) {
	            case 1:  // 제목
	               sql += " WHERE REGEXP_LIKE( title, ?, 'i') ";
	               break;
	            case 2: // 내용
	               sql += " WHERE REGEXP_LIKE( content, ?, 'i') ";
	               break;
	            case 3: // 작성자
	               sql += " WHERE REGEXP_LIKE( writer, ?, 'i') ";
	               break;         
	            case 4: // 제목 + 내용 
	               sql += " WHERE REGEXP_LIKE( title, ?, 'i') OR  REGEXP_LIKE( content, ?, 'i') ";
	               break;
	            } // switch
	            // END
	            
	         sql += "                ORDER BY seq DESC "
	            + "             ) t "
	            + "     ) b "
	            + "WHERE no BETWEEN ? AND ? ";
	      
	      

	      try {
	         int start = (currentPage-1)*numberPerPage +1;
	           int end = start + numberPerPage-1;
	           
	         pstmt = conn.prepareStatement(sql);
	         
	         this.pstmt.setString(1, searchWord);
	         if (searchCondition == 4) { // ? ? ? ? 
	            this.pstmt.setString(2, searchWord);
	            this.pstmt.setInt(3, start);
	            this.pstmt.setInt(4, end);
	         }else {                     // ?  ?  ? 
	            this.pstmt.setInt(2, start);
	            this.pstmt.setInt(3, end);
	         }
	         
	         
	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            list = new ArrayList<>();
	            do {
	               
	               seq = rs.getLong("seq");      
	               title = rs.getString("title");    
	               writer = rs.getString("writer");   
	               email = rs.getString("email");    
	               writedate = rs.getDate("writedate");
	               readed = rs.getInt("readed");   
	               
	               BoardDTO dto = BoardDTO.builder()
	                     .seq(seq)
	                     .title(title)
	                     .writer(writer)
	                     .email(email)
	                     .writeDate(writedate)
	                     .readed(readed)
	                     .build();
	               list.add(dto);
	            } while (rs.next());

	         } // if 

	      } catch (SQLException e) { 
	         e.printStackTrace();
	      } catch( Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            rs.close();
	            pstmt.close();
	         } catch (SQLException e) { 
	            e.printStackTrace();
	         }         
	      }

	      return list;
	   }

	@Override
	public int getTotalRecords() throws SQLException {

		int totalRecords = 0;
		
		String sql = "SELECT COUNT(*) FROM tbl_cstvsboard";
		this.pstmt = this.conn.prepareStatement(sql);
		this.rs = this.pstmt.executeQuery();
		
		if(this.rs.next()) totalRecords = rs.getInt(1);
		
		this.rs.close();		
		this.pstmt.close();
		
		return totalRecords;
	}
	


	@Override
	public int getTotalPages(int numberPerPage) throws SQLException {
		
		int totalPages = 0;
		
		String sql = "SELECT CEIL(COUNT(*)/?) FROM tbl_cstvsboard";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, numberPerPage);
		
		this.rs = this.pstmt.executeQuery();
		
		if(this.rs.next()) totalPages = rs.getInt(1);
		
		this.rs.close();		
		this.pstmt.close();
		
		return totalPages;
	}
	
	@Override
	public int getTotalSearchRecords(int searchCondition, String searchWord) throws SQLException {
		int totalRecords = 0;
		
		String sql = "SELECT COUNT(*) FROM tbl_cstvsboard ";
		switch ( searchCondition) {
		case 1:  // 제목
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') ";
			break;
		case 2: // 내용
			sql += " WHERE REGEXP_LIKE( content, ?, 'i') ";
			break;
		case 3: // 작성자
			sql += " WHERE REGEXP_LIKE( writer, ?, 'i') ";
			break;         
		case 4: // 제목 + 내용 
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') OR  REGEXP_LIKE( content, ?, 'i') ";
			break;
		} // switch

		sql += "ORDER BY seq ASC ";
		this.pstmt = this.conn.prepareStatement(sql);

		this.pstmt.setString(1, searchWord);
		if (searchCondition == 4) {
			this.pstmt.setString(2, searchWord);
		}
		this.rs = this.pstmt.executeQuery();
		
		if(this.rs.next()) totalRecords = rs.getInt(1);
		

		this.rs.close();		
		this.pstmt.close();
		
		return totalRecords;
	}
	
	@Override
	public int getTotalSearchPages(int numberPerPage, int searchCondition, String searchWord) throws SQLException {
		
		int totalPages = 0;
		
		String sql = "SELECT CEIL(COUNT(*)/?) FROM tbl_cstvsboard ";
		switch ( searchCondition) {
		case 1:  // 제목
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') ";
			break;
		case 2: // 내용
			sql += " WHERE REGEXP_LIKE( content, ?, 'i') ";
			break;
		case 3: // 작성자
			sql += " WHERE REGEXP_LIKE( writer, ?, 'i') ";
			break;         
		case 4: // 제목 + 내용 
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') OR  REGEXP_LIKE( content, ?, 'i') ";
			break;
		} // switch

		sql += "ORDER BY seq ASC ";
		this.pstmt = this.conn.prepareStatement(sql);
		this.pstmt.setInt(1, numberPerPage);
		this.pstmt.setString(2, searchWord);
		if (searchCondition == 4) {
			this.pstmt.setString(3, searchWord);
		}
		
		this.rs = this.pstmt.executeQuery();
		
		if(this.rs.next()) totalPages = rs.getInt(1);
		
		this.rs.close();		
		this.pstmt.close();
		
		return totalPages;
	}

	@Override
	public String getOriginalPwd(int seq) throws SQLException {
		
		String originalPwd = null;
		String sql = "SELECT pwd "
				+"FROM tbl_cstvsboard "
				+"WHERE seq = ? ";
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			originalPwd = rs.getString("pwd");
		}
		pstmt.close();
		rs.close();
		
		return originalPwd;

	}

} // class
