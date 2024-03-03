package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CommentVo;

public class CommentDao {
	
	SqlSessionFactory factory;
	static CommentDao single = null;

	public static CommentDao getInstance() {

		if (single == null)
			single = new CommentDao();
		return single;
	}

	private CommentDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//댓글 전체조회
	public List<CommentVo> selectList(int b_idx){
		
		List<CommentVo> list = null;
		
		//1.
		SqlSession sqlsession = factory.openSession(true);
		
		//2.
		list = sqlsession.selectList("comment.comment_list",b_idx);
		
		//3.
		sqlsession.close();
		
		return list;
		
	}
	
	//
	public List<CommentVo> selectList(Map<String, Object> map){
		
		List<CommentVo> list = null;
		//1.SqlSession얻어오기
		SqlSession sqlSession = factory.openSession();
		
		//2.수행
		list = sqlSession.selectList("comment.comment_condition_list", map);
		
		//3.닫기
		sqlSession.close();
		
		return list;
	}
	
	
	//댓글달기
	public int insert(CommentVo vo) {
		
		int res = 0;
		
		//1.
		SqlSession sqlsession = factory.openSession(true);
		
		//2.
		res = sqlsession.insert("comment.comment_insert",vo);
		
		//3.
		sqlsession.close();
		
		return res;
	
	}
	
	//댓글 삭제하기
	public int delete(int cmt_idx) {
		
		int res = 0;
		
		//1.sqlSession얻어오기
		SqlSession sqlsession = factory.openSession(true);
		
		//2.수행
		res = sqlsession.delete("comment.comment_delete",cmt_idx);
		
		//3.닫기
		sqlsession.close();
		
		return res;
		
	}
	
	/**
	 * 댓글 수정
	 * @param vo
	 * @return
	 */
	public int update(CommentVo vo) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		//1.sqlSession얻어오기
		SqlSession sqlsession = factory.openSession(true);
		
		//2.수행
		res = sqlsession.update("comment.update_comment",vo);
		
		//3.닫기
		sqlsession.close();
		
		return res;
	}
	
	
	//댓글 페이징 처리하기 
	public int selectRowTotal(int b_idx) {
		// TODO Auto-generated method stub
		int rowTotal = 0;
		//1.sqlSession얻어오기
		SqlSession sqlsession = factory.openSession(true);
		
		//2.수행
		rowTotal = sqlsession.selectOne("comment.comment_row_total",b_idx);
		
		//3.닫기
		sqlsession.close();
		
		return rowTotal;
	}

	public int delete_b_idx(int b_idx) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//1.sqlSession얻어오기
		SqlSession sqlSession = factory.openSession(false);
		
		//2.수행
		
		try { //alt+shift+z //트랜잭션
			res = sqlSession.delete("comment.comment_delete_update_b_use",b_idx); //성공 : 1
			
			//트랜잭션
			res = res * sqlSession.update("comment.comment_delete_b_idx",b_idx); //성공 : 0|1
			
			sqlSession.commit();
			
		} catch (Exception e) { //둘중 하나가실패하면 rollback
			// TODO Auto-generated catch block
			sqlSession.rollback();
		}
		
			
		
		//3.닫기
		sqlSession.close();
		
		return res;
	}
	

	

	
	
}
