package controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;
import dao.CardDao;
import dao.CartDao;
import dao.PaymentDao;
import util.WeatherUtil;
import vo.CardVo;
import vo.CartVo;
import vo.PaymentVo;
import vo.UserVo;
import vo.WeatherVo;

/**
 * 결제정보 컨트롤러
 */
public class PaymentController {

	/**
	 * 결제할 결제화면 form(위시리스트에서 이동할 경우)
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/product/payment_form.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] str_idx_array = request.getParameterValues("cart_idx");
		map.put("idx_array", str_idx_array);
		int payment_total_amount = CartDao.getInstance().selectPaymentTotalAmount(map);
		request.setAttribute("payment_total_amount", payment_total_amount);
		
		
		UserVo user = (UserVo) request.getSession().getAttribute("user");
		// 로그아웃 상태
		if (user == null) {
			// session_timeout: 세션만료(로그아웃상태)
			return "redirect:../user/login_form.do?reason=session_timeout";
		}

		List<CartVo> payment_list = CartDao.getInstance().payment_select(map);
		
	
		// List<CategoryVo> category_list = CategoryDao.getInstance().selectList();

		int user_idx = user.getUser_idx();
		List<CardVo> card_list = CardDao.getInstance().selectList(user_idx);
		request.setAttribute("payment_list", payment_list);
		// request.setAttribute("category_list", category_list);
	
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist =WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("card_list", card_list);

		return "payment_list.jsp";
	}
	
	
	/**
	 * 결제할 결제화면 form(바로 결제 버튼을 누른경우)
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/product/direct_payment_list_form.do")
	public String direct_payment_list(HttpServletRequest request, HttpServletResponse response) {
		
		UserVo user = (UserVo) request.getSession().getAttribute("user");
		// 로그아웃 상태
		if (user == null) {
			// session_timeout: 세션만료(로그아웃상태)
			return "redirect:../user/login_form.do?reason=session_timeout";
		}		
		Map<String, Object> map = new HashMap<String, Object>();
		int p_idx=Integer.parseInt(request.getParameter("p_idx"));
		
		
		map.put("p_idx", p_idx);
		map.put("user_idx", user.getUser_idx());
		
		
		
		int payment_total_amount = PaymentDao.getInstance().select_p_idx_amount(p_idx);
		request.setAttribute("payment_total_amount", payment_total_amount);
		
		
	

		int user_idx = user.getUser_idx();
		List<CartVo> payment_list = CartDao.getInstance().selectList_direct_payment(map);
		
	

		
		List<CardVo> card_list = CardDao.getInstance().selectList(user_idx);
		request.setAttribute("payment_list", payment_list);
		
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist =WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("card_list", card_list);

		return "payment_list.jsp";
	}


	/**
	 * 결제 처리 서블릿
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/product/payment_insert.do")
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		// System.out.println("실행");
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		String pay_zipcode = request.getParameter("user_zipcode");
		String pay_addr = request.getParameter("user_addr");
		String user_name = request.getParameter("user_name");

		String[] cart_idx_array = request.getParameterValues("cart_idx");
		String[] p_idx_array = request.getParameterValues("p_idx");
		String[] p_name_array = request.getParameterValues("p_name");
		String[] pro_image_array = request.getParameterValues("p_image_s");
		String[] sell_user_name_array = request.getParameterValues("sell_user_name");
		String[] p_total_amount_array = request.getParameterValues("p_price");

		int amount_appr = Integer.parseInt(request.getParameter("amount_appr"));
		String card_type = request.getParameter("card_type");
		String card_number = request.getParameter("card_number");

		PaymentVo vo = null;
		int res = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx_array", cart_idx_array);
		
		//주문번호 얻어오기
		int order_number=PaymentDao.getInstance().selectOne_order_number();

		// 위시리스트 삭제
		res = CartDao.getInstance().delete_select(map);
		for (int i = 0; i < cart_idx_array.length; i++) {
			int cart_idx = Integer.parseInt(cart_idx_array[i]);
			int p_idx = Integer.parseInt(p_idx_array[i]);
			int p_total_amount=Integer.parseInt(p_total_amount_array[i]);
			String p_name = p_name_array[i];
			String pro_image = pro_image_array[i];
			String sell_user = sell_user_name_array[i];
			
			vo = new PaymentVo(user_idx, cart_idx, pay_zipcode, pay_addr, user_name, p_idx, p_name, pro_image,
					sell_user, p_total_amount, amount_appr, card_type, card_number,order_number);

			//결제처리
			res = PaymentDao.getInstance().insert(vo);

			// 해당 상품 결제완료처리
			res = PaymentDao.getInstance().product_update(p_idx);
		}

		return "redirect:../main.jsp";
	}
	
	/**
	 * 결제내역 서블릿
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/product/pay_list_form.do")
	public String pay_list(HttpServletRequest request, HttpServletResponse response) {

		UserVo user = (UserVo) request.getSession().getAttribute("user");
		// 로그아웃 상태
		if (user == null) {
			return "redirect:../user/login_form.do?reason=session_timeout";
		}
		int user_idx=user.getUser_idx();
		
		//결제 내역
		List<PaymentVo> payment_list = PaymentDao.getInstance().payment_select(user_idx);
		
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist =WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("payment_list", payment_list);
		
		return "pay_list_form.jsp";
	}
}
