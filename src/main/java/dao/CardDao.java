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

	public List<CardVo> selectList(int user_idx) {
		List<CardVo> list = null;

		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList("payment.card_list",user_idx);

		sqlSession.close();
		return list;
	}

	/**
	 * 카드 인서트
	 * @param vo
	 * @return
	 */
	public int insert(CardVo vo) {
		int res=0;
		SqlSession sqlSession=factory.openSession(true);
		res=sqlSession.insert("card.card_insert",vo);
		
		sqlSession.close();
		return res;
	}

}
