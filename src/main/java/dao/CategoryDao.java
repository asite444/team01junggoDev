package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CategoryVo;
import vo.ProductVo;

public class CategoryDao {
	
	SqlSessionFactory factory;
	
	static CategoryDao single = null;

	public static CategoryDao getInstance() {

		if (single == null)
			single = new CategoryDao();
		return single;
	}

	private CategoryDao() {
		// TODO Auto-generated constructor stub
		
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public CategoryVo selectOne(String c_name) {
		// TODO Auto-generated method stub

		CategoryVo vo = null;

		SqlSession sqlSession =factory.openSession();
		
		//2. 작업수행 
		vo = sqlSession.selectOne("category.category_one_c_name", c_name);
		
		//3. 닫기
		sqlSession.close();
		
		return vo;
	}

	public CategoryVo select_one_c_idx(int c_idx) {
		// TODO Auto-generated method stub
		CategoryVo vo = null;

		SqlSession sqlSession =factory.openSession();
		
		//2. 작업수행 
		vo = sqlSession.selectOne("category.category_one_c_idx", c_idx);
		
		//3. 닫기
		sqlSession.close();
		
		return vo;
	}

}
