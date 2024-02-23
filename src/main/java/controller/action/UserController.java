package controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	//로그인 폼
	@RequestMapping("/user/login_form.do")
	public String login_form(HttpServletRequest request, HttpServletResponse response) {

		return "user_login_form.jsp";
	
	}//end: login_form
	
	//로그인
	@RequestMapping("/user/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
		// /user/login.do?user_id=one&user_pwd=1234&url=http://localhost.....
		
		//1.parameter받기
		String user_id   =  request.getParameter("user_id");
		String user_pwd  =  request.getParameter("user_pwd");
		String url       =  request.getParameter("url");
		
		// select * from user where user_id=one1234
		
		//2.user_id에 해당되는 유저정보 읽어오기
		UserVo s_user = UserDao.getInstance().selectOne(user_id);
		
		//아이디가 틀린경우
		if(s_user==null) {
			//reponse.sendRedirect("login_form.do?reason=fail_id&url=" + url);
			return "redirect: login_form.do?reason=fail_id&url=" + url;
		}
		
		//비밀번호가 틀린경우
		if(s_user.getUser_pwd().equals(user_pwd)==false) {
		   //response.sendRedirect(String.format("login_form.do?reason=fail_pwd&user_id=%s&url=%s", user_id,url));
			return String.format("login_form.do?reason=fail_pwd&user_id=%s&url=%s", user_id,url);
		}
		
		//세션정보 얻어오기->로그인 유저정보 저장
		HttpSession session = request.getSession();
		
		session.setAttribute("s_user", s_user);
		
		//메인페이지 이동: 현재경로 /user/login.do
		if(url.isEmpty()) {
		   //response.sendRedirect("../product/list.do");
			return "redirect:../user/list.do";
		}else {
			return "redirect:" + url;
		   //response.sendRedirect(url);	
		}
		

	  }// end: login
	
	  //로그아웃
	  @RequestMapping("/user/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		  
		// 로그아웃: session에 저장된 user삭제
		request.getSession().removeAttribute("s_user");

		// 메인페이지
		// response.sendRedirect("../product/list.do");
		return "redirect:../user/list.do";
	
	  }//end: logout
	

		
	}
	
	


