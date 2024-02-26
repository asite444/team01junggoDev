package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CartVo;

/**
 * 장바구니 관련 Dao
 */
public class CartDao {

	SqlSessionFactory factory;
	static CartDao single = null;

	public static CartDao getInstance() {

		if (single == null)
			single = new CartDao();
		return single;
	}

	private CartDao() {
		factory=MyBatisConnector.getInstance().getSqlSessionFactory();
	}

	/**
	 * 장바구니 조회list 메서드 (현재는 1번 회원만 보이게 임시조치상태)
	 * @param mem_idx
	 * @return
	 */
	public List<CartVo> selectList(int user_idx) {
			List<CartVo> list=null;
		
		SqlSession sqlSession=factory.openSession();
		
		 list=sqlSession.selectList("cart.cart_list", user_idx);
		
		sqlSession.close();
		return list;
	}

	/**
	 * 총 결재금액
	 * @param mem_idx
	 * @return
	 */
	public int selectTotalAmount(int user_idx) {
		int total_amount=0;
		SqlSession sqlSession=factory.openSession();
		
		total_amount=sqlSession.selectOne("cart.cart_total_amount", user_idx);		
		sqlSession.close();
		
		
		return total_amount;
	}
	
	/**
	 * 위시리스트 삭제 메서드
	 * @param map
	 * @return
	 */
	public int delete_select(Map<String, Object> map) {
		
		int res=0;
		SqlSession sqlSession=factory.openSession(true);
		res=sqlSession.delete("cart.cart_delete_select",map);
		
		sqlSession.close();
		return res;
	}
	
	
}
