package controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;
import dao.CardDao;
import dao.CartDao;
import vo.CardVo;
import vo.CartVo;

import vo.UserVo;

public class PaymentController {

	@RequestMapping("/product/payment_form.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {

		String[] str_idx_array = request.getParameterValues("cart_idx");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx_array", str_idx_array);
//		UserVo user = (UserVo) request.getSession().getAttribute("user");
//		// 로그아웃 상태
//		if (user == null) {
//			// session_timeout: 세션만료(로그아웃상태)
//			return "redirect:../user/user_login_form.do?reason=session_timeout";
//		}
		
		List<CartVo> payment_list = CartDao.getInstance().payment_select(map);
		int payment_total_amount = CartDao.getInstance().selectPaymentTotalAmount(map);
		// List<CategoryVo> category_list = CategoryDao.getInstance().selectList();
		
		
		List<CardVo> card_list=CardDao.getInstance().selectList();
		
		return "payment_list.jsp";
	}
}
