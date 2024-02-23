package controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;
import dao.UserDao;
import vo.UserVo;


public class UserController {
	
	@RequestMapping("/user/list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		
		
		//회원정보 가져오기
		List<UserVo> list = UserDao.getInstance().selectList();

		// request binding
		request.setAttribute("list", list);
		
		return "user_list.jsp";
	}
	
	//로그인
	@RequestMapping("/user/login_form.do")
	public String login_form(HttpServletRequest request, HttpServletResponse response) {

		return "user_login_form.jsp";
	
	}//end: login_form
	
	@RequestMapping("/user/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
		

		return "";
	}
	
	

}
