package dao;

import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;

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
	
}
