package controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		 UserVo user=(UserVo)request.getSession().getAttribute("user");

		// 로그아웃 상태
		 if(user==null) {
			 return "redirect:../user/login_form.do?reason=session_timeout";
		 //session_timeout: 세션만료(로그아웃상태)

		 }

		int user_idx = user.getUser_idx(); // 임시
		// 장바구니 목록
		List<CartVo> cart_list = CartDao.getInstance().selectList(user_idx);

		// 결제 정보 총
		int total_amount = CartDao.getInstance().selectTotalAmount(user_idx);

		request.setAttribute("cart_list", cart_list);
		request.setAttribute("total_amount", total_amount);

		return "cart_list.jsp";
	}
	
	/**
	 * 선택 상품 삭제 메서드
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/product/cart_delete_select.do")
	public String delete(HttpServletRequest request, HttpServletResponse response) {

		
				String[] str_idx_array=request.getParameterValues("cart_idx"); // 배열처리,기본적으로 문자열로 옴

				Map<String, Object> map=new HashMap<String, Object>();
				map.put("idx_array", str_idx_array);
				
				 int res=CartDao.getInstance().delete_select(map);
		
		return "redirect:cart_list.do";
	}
}
