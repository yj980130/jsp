package homework;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.JdbcUtil;

public class ImageListDAO {

	private static ImageListDAO dao = null;

	private ImageListDAO() {}
	public static ImageListDAO getInstance() {
		if( dao == null ) {
			dao = new ImageListDAO();
		}
		return dao;
	}

	public int insert(Connection conn, ImageListDTO dto){
		int result = 0;
		String sql = "insert into filetest "
				+" (product_id, product_name, product_detail, filesystemname, originalfilename, filelength ) "
				+" values "
				+" ( seq_filetest.nextval , ? ,? , ?, ?, ?) ";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProduct_name());
			pstmt.setString(2, dto.getProduct_detail());			
			pstmt.setString(3, dto.getFilesystemname());
			pstmt.setString(4, dto.getOriginalfilename());
			pstmt.setLong(5, dto.getFilelength());
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("> dao.insert()  : " + e.toString());
		}finally {
			try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();         }
		}
		return result;
	}//insert
	
	
	
	
	
	

	public ArrayList<ImageListDTO> selectFileList(Connection conn) {

		ArrayList<ImageListDTO> list =  null;

		String sql = 
				" select product_id, product_name, product_detail,  filesystemname, originalfilename, filelength  "
						+" from filetest "
						+" order by num desc ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ImageListDTO dto = null;
			if (rs.next()) {
				list = new ArrayList<ImageListDTO>();
				do {
					dto = new ImageListDTO();
					dto.setProduct_id(rs.getInt("product_id"));
					dto.setProduct_name( rs.getString("product_name"));
					dto.setProduct_detail(rs.getString("product_detail"));
					dto.setFilesystemname(rs.getString("filesystemname"));
					dto.setOriginalfilename(rs.getString("originalfilename"));
					dto.setFilelength(rs.getLong("filelength"));
					list.add(dto);
				} while (rs.next());
			} // 
		}catch(Exception e) {
			System.out.println("> dao.insert()  : " + e.toString());
		}finally {
			try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();         }
		}

		return list;

	}

	public int delete(Connection conn, int product_id) {
		int result = 0;
		String sql = "delete from filetest where product_id = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return result;
	}

	public ImageListDTO selectOne(Connection con, int product_id) {
		String sql = 
				" select product_id, product_name, product_detail, filesystemname, originalfilename, filelength  "
						+" from filetest "
						+" where product_id = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ImageListDTO dto = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			rs = pstmt.executeQuery();
			if( rs.next()) {
				dto = new ImageListDTO();
				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_name( rs.getString("product_name"));
				dto.setProduct_detail(rs.getString("product_detail"));				
				dto.setFilesystemname(rs.getString("filesystemname"));
				dto.setOriginalfilename(rs.getString("originalfilename"));
				dto.setFilelength(rs.getLong("filelength"));
			}
		}catch(Exception e) {
			System.out.println("> dao.insert()  : " + e.toString());
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return dto;
	}

	public int update(Connection conn, ImageListDTO dto) {
		int result = 0;
		String sql = " update filetest "
				+ " set product_id=?, product_name=?, product_detail=? ,filesystemname=?,originalfilename=?,filelength=?   "
				+ " where product_id = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProduct_name());
			pstmt.setString(2, dto.getProduct_detail() );
			pstmt.setString(3, dto.getFilesystemname());
			pstmt.setString(4, dto.getOriginalfilename() );
			pstmt.setLong(5, dto.getFilelength());
			pstmt.setInt(6, dto.getProduct_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return result;
	}

}
