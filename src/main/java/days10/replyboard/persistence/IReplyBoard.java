package days10.replyboard.persistence;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import days10.replyboard.domain.ReplyBoardDTO;


public interface IReplyBoard {

   // 1. 글 목록
   List<ReplyBoardDTO> selectList(Connection con) throws SQLException;

   // 2. 글 추가 ( 새글 + 답글 )
   int insert( Connection con, ReplyBoardDTO dto) throws SQLException;

   // 3. 조회수 증가
   int updateReadCount( Connection con, int num) throws SQLException;

   // 4. 글 상세 보기
   ReplyBoardDTO selectOne( Connection con, int num) throws SQLException;

   // 5. 답글    부모step <             step+1 증가
   int updateRefStep( Connection con, int parentRef, int parentStep) throws SQLException;

   // 6. 삭제
   int delete(Connection con, int num) throws SQLException;   
   
}