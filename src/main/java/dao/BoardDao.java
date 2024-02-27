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
		//System.out.println(list.size());
		
		//3.닫기
		sqlSession.close();
			
		
		return list;
	}
	
	//전체 목록보기
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
	
	//게시글 1건 조회
	public BoardVo selectOne(int b_idx) {
		// TODO Auto-generated method stub
		BoardVo vo = null;
		
		//1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession(); // true : DML명령(insert,update,delete)
		
		//2.작업수행
		vo = sqlSession.selectOne("board.board_one",b_idx);
		
		//3.닫기
		sqlSession.close();

		return vo;
	}
		
	//등록시킬 답글의 메인 게시물의 번호 얻어오기
	public int selectOneB_idx() {
		// TODO Auto-generated method stub
		int b_idx = 0;
		
		//1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession();
		
		//2.작업수행
		b_idx = sqlSession.selectOne("board.board_b_idx");
		
		//3.닫기
		sqlSession.close();
		
		return b_idx;
	}

		/**
		 * 게시글 등록 dao메서드
		 * @param vo
		 * @return
		 */
		public int insert(BoardVo vo) { // vo :7가지 항목이 포장이 되어있다.
			// TODO Auto-generated method stub
			int res = 0;
			
			//1.SqlSession 얻어오기
			SqlSession sqlSession = factory.openSession(true); //true:auto_commit
			
			//2.작업수행
			res = sqlSession.insert("board.board_insert",vo);
			
			//3.닫기
			sqlSession.close();
			
			return res;
		}
		
		//조회수 증가
		public int update_readhit(int b_idx) { 
			// TODO Auto-generated method stub
			int res = 0;
			
			//1.SqlSession 얻어오기                    true <- auto commit
			SqlSession sqlSession = factory.openSession(true);
			
			//2.수행
			res = sqlSession.update("board.board_update_readhit", b_idx);
			
			//3.닫기
			sqlSession.close();
			
			
			return res;
		}
		
		/**
		 * 댓글달기
		 * @param baseVo
		 * @return
		 */
		public int update_step(BoardVo baseVo) {
			// TODO Auto-generated method stub
			int res = 0;
			
			//1.SqlSession 얻어오기                    true <- auto commit
			SqlSession sqlSession = factory.openSession(true);
			
			//2.수행
			res = sqlSession.update("board.board_update_step", baseVo);
			
			//3.닫기
			sqlSession.close();
			
			
			return res;		
		}

		public int reply(BoardVo vo) { //새로운 답글등록하기
			// TODO Auto-generated method stub
			int res = 0;
			
			//1.SqlSession 얻어오기                    true <- auto commit
			SqlSession sqlSession = factory.openSession(true);
			
			//2.수행
			res = sqlSession.insert("board.board_reply", vo);
			
			//3.닫기
			sqlSession.close();
			
			
			return res;		
		}

		public int delete_update_b_use(int b_idx) {
			// TODO Auto-generated method stub
			int res = 0;
			
			//1.SqlSession 얻어오기                    true <- auto commit
			SqlSession sqlSession = factory.openSession(true);
			
			//2.수행
			res = sqlSession.update("board.board_delete_update_b_use", b_idx);
			
			//3.닫기
			sqlSession.close();
			
			
			return res;
		}

		public int update(BoardVo vo) {
			// TODO Auto-generated method stub
			int res = 0;
			//1. SqlSession얻어오기			
			SqlSession sqlSession = factory.openSession(true);
			
			//2. 작업수행			 namespace.mapper_id	, parameter
			res = sqlSession.update("board.board_update", vo);
			
			//3. 닫기 : 2.번을 닫아준다
			sqlSession.close();
					
			return res;
		}

		public int selectRowTotal() {
			// TODO Auto-generated method stub
			int rowTotal = 0;
			
			//1.SqlSession 얻어오기
			SqlSession sqlSession = factory.openSession(); // true : DML명령(insert,update,delete)
			
			//2.작업수행
			rowTotal = sqlSession.selectOne("board.board_row_total");
			
			//3.닫기
			sqlSession.close();

			return rowTotal;
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
