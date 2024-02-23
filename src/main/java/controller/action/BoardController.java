package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;

public class BoardController {
	
	//목록보기
	@RequestMapping("/board/list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {

		return "board_list.jsp";
	}

}
