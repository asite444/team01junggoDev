package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.UserVo;

public class UserDao {
	
	SqlSessionFactory factory;
	
	static UserDao single = null;

	public static UserDao getInstance() {

		if (single == null)
			single = new UserDao();

		return single;
	}

	private UserDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public List<UserVo> selectList() {
		// TODO Auto-generated method stub
		List<UserVo> list = null;
		
		//1.SqlSession얻어오기
		SqlSession sqlSession = factory.openSession();
		
		//2.수행                      namespace.user_list
		list = sqlSession.selectList("user.user_list");
		
		//3.닫기
		sqlSession.close();
		
		return list;
		
	}//end:selectList
	
	
	public UserVo selectOne(int user_idx) {
		// TODO Auto-generated method stub

		UserVo vObj = null;
		
		//1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession();
		
		//2.작업수행              namespace.인자user_one_user_idx 
		vObj = sqlSession.selectOne("user.user_one_user_idx", user_idx);
		
		//3.닫기
		sqlSession.close();
		
		return vObj;
		
	}//end:selectOne(user_idx)
	
      
	public UserVo selectOne(String user_id) {
		// TODO Auto-generated method stub

		UserVo vObj = null;

		// 1.SqlSession 얻어오기
		SqlSession sqlSession = factory.openSession();

		// 2.작업수행 namespace.인자member_one_mem_id
		vObj = sqlSession.selectOne("user.user_one_user_id", user_id);

		// 3.닫기
		sqlSession.close();

		return vObj;

	}// end:selectOne(user_id)
	
	public int insert(UserVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		//                                         불린형 true 옵션추가
		//1.SqlSession얻어오기                      true : auto commit
		SqlSession sqlSession = factory.openSession(true);//true를 주면 auto commit된다
		                                                  //true를 안주면 commit을 따로 줘야한다.
		//2.작업수행               namespace.mapper_id, parameter
		res = sqlSession.insert("user.user_insert",vo);
		
		//3.닫기
		sqlSession.close();

		return res;
	}
	
	
	public int delete(int user_idx) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//1.SqlSession 얻어오기                     true : auto commit
		SqlSession sqlSession = factory.openSession(true);
		
		//2.작업수행
		res = sqlSession.delete("user.user_delete", user_idx);
		// DML명령문
		//3.닫기
		sqlSession.close();

		return res;
	}
	
	
	public int update(UserVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		//1.SqlSession 얻어오기                     true : auto commit
		SqlSession sqlSession = factory.openSession(true);
		
		//2.작업수행
		res = sqlSession.update("user.user_update", vo);
		// DML명령문
		//3.닫기
		sqlSession.close();
		
        return res;
	}
	
	
		

	
	

}
