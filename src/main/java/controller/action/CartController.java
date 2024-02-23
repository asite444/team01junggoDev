package controller.action;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;
import dao.CartDao;

import vo.CartVo;

import vo.UserVo;

/**
 * 장바구니 컨트롤러
 */
public class CartController {

	/**
	 * 장바구니 리스트
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/product/cart_list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {

		// 로그인 유저정보 Object->MemberVo 다운케스팅
		// UserVo user=(UserVo)request.getSession().getAttribute("user");

		// 로그아웃 상태
		// if(user==null) {
		// response.sendRedirect("../user/login_form.do?reason=session_timeout");
		// //session_timeout: 세션만료(로그아웃상태)

		// }

		int user_idx = 1; // 임시
		// 장바구니 목록
		List<CartVo> cart_list = CartDao.getInstance().selectList(user_idx);

		// 결제 정보 총
		//int total_amount = CartDao.getInstance().selectTotalAmount(user_idx);

		request.setAttribute("cart_list", cart_list);
		//request.setAttribute("total_amount", total_amount);

		return "cart_list.jsp";
	}
}
