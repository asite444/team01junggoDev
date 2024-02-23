package dao;

import java.util.List;
import java.util.Map;

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

	public List<BoardVo> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectRowTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//게시글조회
	
}
