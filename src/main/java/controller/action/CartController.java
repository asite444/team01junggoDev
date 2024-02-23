package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;

/**
 * 장바구니 컨트롤러
 */
public class CartController {

	@RequestMapping("/product/cart_list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {

		
		return "cart_list.jsp";
	}
}
