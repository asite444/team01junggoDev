package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.PaymentVo;

public class PaymentDao {
static PaymentDao single = null;
SqlSessionFactory factory;
public static PaymentDao getInstance() {

	if (single == null)
		single = new PaymentDao();
	return single;
}

private PaymentDao() {
	factory=MyBatisConnector.getInstance().getSqlSessionFactory();
}

/**
 * 결제정보 등록처리
 * @param vo
 * @return
 */
public int insert(PaymentVo vo) {
	
	int res=0;
	SqlSession sqlSession=factory.openSession(true);
	
	res=sqlSession.insert("payment.payment_insert",vo);
	
	sqlSession.close();
	return res;
}

/**
 * 상품 정보 업데이트 
 * @param prod_idx
 * @return
 */
public int product_update(int prod_idx) {
	int res=0;
	SqlSession sqlSession=factory.openSession(true);
	
	res=sqlSession.update("payment.product_update",prod_idx);
	
	sqlSession.close();
	return res;
}

/**
 * 주문번호 얻어오기
 * @return
 */
public int selectOne_order_number() {
	int order_number=0;
	SqlSession sqlSession=factory.openSession();
	
	order_number=sqlSession.selectOne("payment.payment_order_number");
	
	sqlSession.close();
	return order_number;
}

	/**
	 * 결제내역 리스트 dao
	 * @param user_idx
	 * @return
	 */
	public List<PaymentVo> payment_select(int user_idx) {
		List<PaymentVo> list=null;
		
		SqlSession sqlSession=factory.openSession();
		
		 list=sqlSession.selectList("payment.pay_list", user_idx);
		
		sqlSession.close();
		return list;
	}

	/**
	 * 직접결제 금액
	 * @param p_idx
	 * @return
	 */
	public int select_p_idx_amount(int p_idx) {
		int res=0;
		
		SqlSession sqlSession=factory.openSession();
		
		 res=sqlSession.selectOne("cart.product_ammount", p_idx);
		
		sqlSession.close();
		return res;
	}


}
