package controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import annotation.RequestMapping;
import annotation.ResponseBody;
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
		
		UserVo user=null;
		
		return "user_login_form.jsp";
	
	}//end: login_form
	
	//로그인
	@RequestMapping("/user/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
		// /user/login.do?user_id=one&user_pwd=1234&url=http://localhost.....
		// System.out.println("로그인 실행");
		//1.parameter받기
		String user_id   =  request.getParameter("user_id");
		// System.out.println("user_id:"+user_id);
		String user_pwd  =  request.getParameter("user_pwd");
		// String url       =  request.getParameter("url");
		
		// select * from user where user_id=one1234
		
		//2.user_id에 해당되는 유저정보 읽어오기
		UserVo user = UserDao.getInstance().selectOne(user_id);
		
		//아이디가 틀린경우
		if(user==null) {
			//reponse.sendRedirect("login_form.do?reason=fail_id&url=" + url);
			
			// url 기능 임시 주석처리
			// return "redirect: login_form.do?reason=fail_id&url=" + url;
			
			return "redirect: login_form.do?reason=fail_id";
		}
		
		//비밀번호가 틀린경우
		if(user.getUser_pwd().equals(user_pwd)==false) {
		   //response.sendRedirect(String.format("login_form.do?reason=fail_pwd&user_id=%s&url=%s", user_id,url));
			
			//url기능 임시 주석처리
		// return String.format("login_form.do?reason=fail_pwd&user_id=%s&url=%s", user_id,url);
			
			return String.format("login_form.do?reason=fail_pwd&user_id=%s", user_id);
		}
		
		//세션정보 얻어오기->로그인 유저정보 저장
		HttpSession session = request.getSession();
		
		session.setAttribute("user", user);
		
		// return "redirect:../user/list.do";
	    return "redirect:../main.jsp";
		
		//메인페이지 이동: 현재경로 /user/login.do
//		if(url.isEmpty()) {
//		   //response.sendRedirect("../user/list.do");
//			return "redirect:../board/list.do";
//		}else {
//			return "redirect:" + url;
//		   //response.sendRedirect(url);	
//		}
		

	  }// end: login
	
	  //로그아웃
	  @RequestMapping("/user/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		  
		// 로그아웃: session에 저장된 user삭제
		request.getSession().removeAttribute("user");

		// 메인페이지
		return "redirect:../main.jsp";
	
	  }//end: logout
	  
	  
	  // 회원가입 폼
	 @RequestMapping("/user/insert_form.do")
	public String insert_form(HttpServletRequest request, HttpServletResponse response) {

		return "user_insert_form.do";
	 }//end: insert_form.do
	  		

	  		
	  		  
	  
	 
	  
	  
	 // 회원가입
    @RequestMapping("/user/insert.do")
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		  
		    //1.paramter 받기
	  		String user_name	=	request.getParameter("user_name");
	  		String user_id		=	request.getParameter("user_id");
	  		String user_pwd		=	request.getParameter("user_pwd");
	  		String user_email	=	request.getParameter("user_email");
	  		String user_zipcode	=	request.getParameter("user_zipcode");
	  		String user_addr	=	request.getParameter("user_addr");
	  		
	  		//2.IP
	  		String user_ip		=	request.getRemoteAddr();
	  		
	  		//3.VO포장
	  		UserVo vo = new UserVo(user_name, user_id, user_pwd, user_email, user_zipcode, user_addr, user_ip);
	  		
	  		//4.DB insert
	  		int res = UserDao.getInstance().insert(vo);
	  		
	  		//5.목록보기(차후:로그인창 이동)
	  		return "redirect:../main.jsp";
	  		
	  	 
	  	
	  }//end: insert.do
	  
	  
	  	//아이디 체크
		@RequestMapping(value="/user/check_id.do",produces="application/json;charset=utf-8;")
		@ResponseBody
		public String check_id(HttpServletRequest request, HttpServletResponse response) {
			
			String user_id = request.getParameter("user_id");
			// System.out.println("아이디 체크");
			UserVo vo = UserDao.getInstance().selectOne(user_id);
			
			//true : 사용가능한 아이디
			//false: 이미사용중 아이디
			boolean bResult = (vo==null);
			
			JSONObject json = new JSONObject();     
			json.put("result", bResult);
			System.out.println(bResult);
			
			
			return json.toString(); 
		}
	  
	  	
	  


}
	
	


