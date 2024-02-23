package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVo;

public class BoardDao {
	SqlSessionFactory factory;
	
	static BoardDao single = null;

	public static BoardDao getInstance() {

		if (single == null)
			single = new BoardDao();
		return single;
	}

	private BoardDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory(); 
	}

	//게시글조회
	public List<BoardVo> selectList(){
		
		List<BoardVo> list = null;
		
		//1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession();
		
		//2.수행
		list = sqlSession.selectList("board.board_list");
		
		//3.닫기
		sqlSession.close();
			
		
		return list;
	}
	
	//페이징 처리
	public List<BoardVo> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<BoardVo> list = null;
		
		//1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession();
		
		//2.수행
		list = sqlSession.selectList("board.board_condition_list",map);
		
		//3.닫기
		sqlSession.close();
			
		
		return list;
	}
	
	/**
	 * 
	 * @selectRowTotal page Menu생성:검색된 레코드수
	 */
	public int selectRowTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int rowTotal = 0;
		
		//1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // true : DML명령(insert,update,delete)
		
		//2.작업수행
		rowTotal = sqlSession.selectOne("board.board_condition_row_total",map);
		
		//3.닫기
		sqlSession.close();

		return rowTotal;
	}
	
	
}
