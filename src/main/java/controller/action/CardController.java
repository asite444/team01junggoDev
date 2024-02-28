package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;
import annotation.ResponseBody;

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
		System.out.println("실행");
		return "";
	}
}
