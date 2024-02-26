package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CardVo;

public class CardDao {
	static CardDao single = null;
	SqlSessionFactory factory;

	public static CardDao getInstance() {

		if (single == null)
			single = new CardDao();
		return single;
	}

	private CardDao() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	public List<CardVo> selectList() {
		List<CardVo> list = null;

		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList("payment.card_list");

		sqlSession.close();
		return list;
	}

}
