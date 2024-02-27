package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.MemberVo;

public class MemberDao {
	
	SqlSessionFactory factory;
	
	static MemberDao single = null;

	public static MemberDao getInstance() {

		if (single == null)
			single = new MemberDao();
		return single;
	}

	private MemberDao() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		
	}
	
	// 목록조회
	public List<MemberVo> selectList() {

		List<MemberVo> list = null;

		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("member.member_list");
		
		sqlSession.close();
		
		return list;
		
	}//end:selectList

	public MemberVo selectOne(int mem_idx) {
		// TODO Auto-generated method stub

		MemberVo vObj = null;

		SqlSession sqlSession =factory.openSession(true);
		
		//2. 작업수행 
		vObj = sqlSession.selectOne("member.member_one_idx", mem_idx);
		
		//3. 닫기
		sqlSession.close();
		
		return vObj;
		
	}//end:selectOne(mem_idx)
	
	public MemberVo selectOne(String mem_id) {
		// TODO Auto-generated method stub

		MemberVo vObj = null;
		
		SqlSession sqlSession =factory.openSession(true);
		
		//2. 작업수행 
		vObj = sqlSession.selectOne("member.member_one_id", mem_id);
		
		//3. 닫기
		sqlSession.close();
		
		return vObj;
		
	}//end:selectOne(mem_id)
	
	public int delete(int mem_idx) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.delete("member.member_delete", mem_idx);
		
		//3. 닫기
		sqlSession.close();
		
		return res;
	}
	

	public int insert(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.insert("member.member_insert", vo);
		
		//3. 닫기
		sqlSession.close();
	
		return res;
	}

	public int update(MemberVo vo) {
		// TODO Auto-generated method stub
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.update("member.member_update",  vo);
		
		//3. 닫기
		sqlSession.close();
		
		return res;
	}
	
}
