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

	/**
	 * 결제화면의 실제 결제할 상품정보 list(위시리스트에서 결제 화면으로 넘어가는 경우)
	 * @param map
	 * @return
	 */
	public List<CartVo> payment_select(Map<String, Object> map) {
		 
		SqlSession sqlSession=factory.openSession();
		
		List<CartVo> list=sqlSession.selectList("cart.cart_select", map);
		sqlSession.close();
	
		return list;
	}

	/**
	 * 결제화면의 실제 결제할 결제 상품정보 총합금액
	 * @param map
	 * @return
	 */
	public int selectPaymentTotalAmount(Map<String, Object> map) {
		
		int payment_total_amount=0;
		SqlSession sqlSession=factory.openSession();
	
		String [] payment_total=(String[])map.get("idx_array");
		
		for(int i=0;i<payment_total.length;i++) {
		payment_total_amount+=(int)sqlSession.selectOne("cart.payment_total_amount", payment_total[i]);
		}
		sqlSession.close();
		
		
		return payment_total_amount;	
	}
	
	/**
	 * 위시리스트 담기
	 * @param map
	 * @return
	 */
	
	public CartVo selectOneExist(CartVo vo) {
		// TODO Auto-generated method stub
		CartVo resVo = null;
		
		SqlSession sqlSession = factory.openSession();
		
		resVo = sqlSession.selectOne("cart.cart_one_exist", vo);
		
		sqlSession.close();
		
		return resVo;
	}

	public int insert(CartVo vo) {
		// TODO Auto-generated method stub
		
		int res=0;
		SqlSession sqlSession=factory.openSession(true);
		res=sqlSession.insert("cart.cart_insert",vo);
		
		sqlSession.close();
		return res;
		
		
	}

	/**
	 * 바로 결제할 경우
	 * @param map
	 * @return
	 */
	public List<CartVo> selectList_direct_payment(Map<String, Object> map) {
		SqlSession sqlSession=factory.openSession();
		
		List<CartVo> list=sqlSession.selectList("cart.product_direct_payment", map);
		sqlSession.close();
	
		return list;
	}

	public int delete_select_p_idx(int p_idx) {
		// TODO Auto-generated method stub
		int res=0;
		SqlSession sqlSession=factory.openSession(true);
		res=sqlSession.delete("cart.cart_delete_p_idx",p_idx);
		
		sqlSession.close();
		return res;
	}
	
}
