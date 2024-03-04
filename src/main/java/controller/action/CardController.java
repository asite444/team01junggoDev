package controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import annotation.RequestMapping;
import annotation.ResponseBody;
import dao.CardDao;
import dao.CartDao;
import vo.CardVo;
import vo.UserVo;

public class CardController {
	
	
	

	/**
	 * 카드 등록
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value ="/product/card_insert.do" , produces = "application/json; charset=utf-8;")
	@ResponseBody 
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		
		int user_idx=1;
		if(request.getParameter("user_idx")!=null) {
			System.out.println(request.getParameter("user_idx"));
			user_idx=Integer.parseInt(request.getParameter("user_idx")); 	
		}
		String card_number=request.getParameter("card_number");
		String expiration_date=request.getParameter("expiration_date");
		String cvv=request.getParameter("cvv");
		String card_holder_name=request.getParameter("card_holder_name");
		String card_password=request.getParameter("card_password");
		String card_nickname=request.getParameter("card_nickname");
		String card_bank=request.getParameter("card_bank");
		String card_category=request.getParameter("card_category");
		String card_type=request.getParameter("card_type");
		
		CardVo vo=new CardVo(user_idx, card_number, card_holder_name, card_nickname, expiration_date, cvv, card_bank, card_type, card_category, card_password);
		
		int res=CardDao.getInstance().insert(vo);
	
		JSONObject json=new JSONObject();
	
	
	
		json.put("result",res==1); //"{return:true}";
		return json.toString();
	}
}
