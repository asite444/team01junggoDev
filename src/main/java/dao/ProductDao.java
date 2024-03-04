package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ProductVo;

public class ProductDao {
	
	SqlSessionFactory factory;
	
	static ProductDao single = null;

	public static ProductDao getInstance() {

		if (single == null)
			single = new ProductDao();
		return single;
	}

	private ProductDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public List<ProductVo> selectList() {

		List<ProductVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("product.product_list");
		
		sqlSession.close();
		
		return list;
		
	}//end: selectList()
	
	public List<ProductVo> selectList_p_hit() {

		List<ProductVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("product.product_list_p_hit");
		
		sqlSession.close();
		
		return list;
		
	}
	
	
	
	
	public int update_readhit(int p_idx) { 
		// TODO Auto-generated method stub
		int res = 0;
		
		//1.SqlSession 얻어오기                    true <- auto commit
		SqlSession sqlSession = factory.openSession(true);
		
		//2.수행
		res = sqlSession.update("product.product_update_readhit", p_idx);
		
		//3.닫기
		sqlSession.close();
		
		
		return res;
	}
	
	
	public ProductVo selectOne(int p_idx) {
		// TODO Auto-generated method stub

		ProductVo vOb = null;

		SqlSession sqlSession =factory.openSession(true);
		
		//2. 작업수행 
		vOb = sqlSession.selectOne("product.product_one", p_idx);
		
		//3. 닫기
		sqlSession.close();
		
		return vOb;
	}

	public int insert(ProductVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("product.product_insert", vo);
		
		//3. 닫기
		sqlSession.close();

		return res;
	}

public int delete(int p_idx) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.delete("product.product_delete", p_idx);
	
	//3. 닫기
	sqlSession.close();
	
	return res;
}

public int update(ProductVo vo) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.update("product.product_update",  vo);
	
	//3. 닫기
	sqlSession.close();
	
	return res;
}

public int update_filename(ProductVo vo) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.update("product.product_update_filename",  vo);
	
	//3. 닫기
	sqlSession.close();
	
	
	return res;
}

public int update_filename1(ProductVo vo) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.update("product.product_update_filename1",  vo);
	
	//3. 닫기
	sqlSession.close();
	
	
	return res;
}

public int update_filename2(ProductVo vo) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.update("product.product_update_filename2",  vo);
	
	//3. 닫기
	sqlSession.close();
	
	
	return res;
}

public int update_filename3(ProductVo vo) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.update("product.product_update_filename3",  vo);
	
	//3. 닫기
	sqlSession.close();
	
	
	return res;
}

public int selectRowTotal(Map<String, Object> map) {
	// TODO Auto-generated method stub
	int rowTotal = 0;
	
	SqlSession sqlSesstion = factory.openSession();
	
	rowTotal = sqlSesstion.selectOne("product.product_condition_row_total",map);
	
	sqlSesstion.close();
	
	return rowTotal;
}

public List<ProductVo> selectList(Map<String, Object> map) {
	// TODO Auto-generated method stub
	List<ProductVo> list = null;
	
	SqlSession sqlSesstion = factory.openSession();
	
	list = sqlSesstion.selectList("product.product_condition_list", map);
	
	sqlSesstion.close();
	
	return list;
}




}
