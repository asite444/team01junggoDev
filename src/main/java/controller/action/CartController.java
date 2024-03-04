package controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import annotation.RequestMapping;
import annotation.ResponseBody;
import dao.CartDao;
import util.WeatherUtil;
import vo.CartVo;
import vo.UserVo;
import vo.WeatherVo;

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
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist =WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("weatherlist", weatherlist);

		
		
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
	

	@RequestMapping(value="/product/cart_insert.do",produces="application/json;charset=utf-8;")
	@ResponseBody
	public String insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int p_idx = Integer.parseInt(request.getParameter("p_idx"));
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		
		//2.CartVo  포장
		CartVo vo = new CartVo();
		vo.setP_idx(p_idx);
		vo.setUser_idx(user_idx);
		
		//3.장바구니 등록여부에 정보 얻어온다
		CartVo resVo = CartDao.getInstance().selectOneExist(vo);
		
		String result = "fail";
		
		if(resVo == null) {
			//등록작업
			int res = CartDao.getInstance().insert(vo);
			if(res==1) {
				result = "success";
			}
			
		}else {
			//이미 등록된 상태
			result = "exist";
		}
		
		
		//JSON으로 응답
		
		
		JSONObject json = new JSONObject();
		json.put("result", result);   //{"result":"success"} or {"result":"exist"}
		
		return json.toString();

		
	}
	
}
