package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.PhotoVo;

public class PhotoDao {
	
	SqlSessionFactory factory;
	
	static PhotoDao single = null;

	public static PhotoDao getInstance() {

		if (single == null)
			single = new PhotoDao();
		return single;
	}

	private PhotoDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public List<PhotoVo> selectList() {

		List<PhotoVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("photo.photo_list");
		
		sqlSession.close();
		
		return list;
		
	}//end: selectList()
	
	
	public PhotoVo selectOne(int p_idx) {
		// TODO Auto-generated method stub

		PhotoVo vOb = null;

		SqlSession sqlSession =factory.openSession(true);
		
		//2. 작업수행 
		vOb = sqlSession.selectOne("photo.photo_one", p_idx);
		
		//3. 닫기
		sqlSession.close();
		
		return vOb;
	}

	public int insert(PhotoVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("photo.photo_insert", vo);
		
		//3. 닫기
		sqlSession.close();

		return res;
	}

public int delete(int p_idx) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.delete("photo.photo_delete", p_idx);
	
	//3. 닫기
	sqlSession.close();
	
	return res;
}

public int update(PhotoVo vo) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.update("photo.photo_update",  vo);
	
	//3. 닫기
	sqlSession.close();
	
	return res;
}

public int update_filename(PhotoVo vo) {
	// TODO Auto-generated method stub
	int res = 0;
	
	SqlSession sqlSession = factory.openSession(true);
	
	res = sqlSession.update("photo.photo_update_filename",  vo);
	
	//3. 닫기
	sqlSession.close();
	
	
	return res;
}

public int selectRowTotal(Map<String, Object> map) {
	// TODO Auto-generated method stub
	int rowTotal = 0;
	
	SqlSession sqlSesstion = factory.openSession();
	
	rowTotal = sqlSesstion.selectOne("photo.photo_condition_row_total",map);
	
	sqlSesstion.close();
	
	return rowTotal;
}

public List<PhotoVo> selectList(Map<String, Object> map) {
	// TODO Auto-generated method stub
	List<PhotoVo> list = null;
	
	SqlSession sqlSesstion = factory.openSession();
	
	list = sqlSesstion.selectList("photo.photo_condition_list", map);
	
	sqlSesstion.close();
	
	return list;
}


}
