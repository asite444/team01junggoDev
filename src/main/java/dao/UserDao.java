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
		factory=MyBatisConnector.getInstance().getSqlSessionFactory();
		System.out.println("변경");
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
	}
	
	

}
