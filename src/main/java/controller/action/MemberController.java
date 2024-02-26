package controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import annotation.RequestMapping;
import annotation.ResponseBody;
import dao.MemberDao;
import vo.MemberVo;

public class MemberController {

	@RequestMapping("/member/view.do")
	public String view(HttpServletRequest request, HttpServletResponse response) {

		int mem_idx  = Integer.parseInt(request.getParameter("mem_idx"));
		
		//2.mem_idx에 해당되는 MemberVo얻어오기
		MemberVo vo = MemberDao.getInstance().selectOne(mem_idx);
		
		//3.request binding
		request.setAttribute("vo", vo);
		
		return "member_view.jsp";
	}
	
	@RequestMapping("/member/list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		
		List<MemberVo> list = MemberDao.getInstance().selectList();
		
		//request binding
		request.setAttribute("list", list);

		return "member_list.jsp";
	}
	
	@RequestMapping("/member/login_form.do")
	public String login_form(HttpServletRequest request, HttpServletResponse response) {

		return "member_login_form.jsp";
	}
	
	@RequestMapping("/member/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String mem_id	=	request.getParameter("mem_id");
		String mem_pwd	=	request.getParameter("mem_pwd");
		
		// select * from member where mem_id=one111
        //2.mem_id에 해당되는 유저정보 읽어오기
		MemberVo  user = MemberDao.getInstance().selectOne(mem_id);
		
		//아이디가 틀린경우
		if(user==null) {
			response.sendRedirect("login_form.do?reason=fail_id");
		}
		
		//비밀번호가 틀린경우
		if(user.getMem_pwd().equals(mem_pwd)==false) {
			response.sendRedirect("login_form.do?reason=fail_pwd&mem_id=" + mem_id);
		}
		
		//세션정보 얻어오기->로그인 유저정보 저장
		HttpSession session = request.getSession();
		
		session.setAttribute("user", user);
		
		return "redirect:../member/list.do";
	}
	
	@RequestMapping("/member/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		request.getSession().removeAttribute("user");
		
		return "redirect:../photo/list.do";
	}
	
	@RequestMapping(value="/member/check_id.do",produces="application/json;charset=utf-8;")
	@ResponseBody
	public String check_id(HttpServletRequest request, HttpServletResponse response) {
		
		String mem_id = request.getParameter("mem_id");
		
		MemberVo vo = MemberDao.getInstance().selectOne(mem_id);
		
		//true : 사용가능한 아이디
		//false: 이미사용중 아이디
		boolean bResult = (vo==null);
		
		JSONObject json = new JSONObject();
		json.put("result", bResult);

		return json.toString();
	}
	
	@RequestMapping("/member/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response) {

		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		
		//2.DB delete : DML(insert/update/delete)처리후 결과행수반환(res)
		int res = MemberDao.getInstance().delete(mem_idx);
		
		return "redirect:../member/list.do";
	}
	
	@RequestMapping("/member/modify_form.do")
	public String modify_form(HttpServletRequest request, HttpServletResponse response) {
		
		int mem_idx = Integer.parseInt(request.getParameter("mem_idx"));
		
		//2.mem_idx에 해당되는 회원정보 1건을 얻어온다
		MemberVo  vo = MemberDao.getInstance().selectOne(mem_idx);
		
		//3.request binding
		request.setAttribute("vo", vo);

		return "member_modify_form.jsp";
	}
	
	@RequestMapping("/member/modify.do")
	public String modify(HttpServletRequest request, HttpServletResponse response) {
		
		int    mem_idx		=	Integer.parseInt(request.getParameter("mem_idx"));
	String mem_name		=	request.getParameter("mem_name");
	String mem_id		=	request.getParameter("mem_id");
	String mem_pwd		=	request.getParameter("mem_pwd");
	String mem_email	=	request.getParameter("mem_email");
	String mem_zipcode	=	request.getParameter("mem_zipcode");
	String mem_addr		=	request.getParameter("mem_addr");
	String mem_grade	=	request.getParameter("mem_grade");
	//2.IP 구하기
	String mem_ip		=	request.getRemoteAddr();
	
	
	//3.VO포장
	
	MemberVo vo = new MemberVo(mem_idx, mem_name, mem_id, mem_pwd, mem_email, mem_zipcode, mem_addr, mem_ip, mem_grade);
	
	//4.DB update : update member set mem_pwd=?,mem_email=?,mem_zipcode=?,mem_addr=?,mem_ip=?,
	//                                mem_grade=?,mem_modifydate=now()
	//              where mem_idx=?
	int res = MemberDao.getInstance().update(vo);

		return "redirect:../member/list.do";
	}
	
	@RequestMapping("/member/insert_form.do")
	public String insert_form(HttpServletRequest request, HttpServletResponse response) {

		return "member_insert_form.jsp";
	}
	
	@RequestMapping("/member/insert.do")
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		
		String mem_name		=	request.getParameter("mem_name");
		String mem_id		=	request.getParameter("mem_id");
		String mem_pwd		=	request.getParameter("mem_pwd");
		String mem_email	=	request.getParameter("mem_email");
		String mem_zipcode	=	request.getParameter("mem_zipcode");
		String mem_addr		=	request.getParameter("mem_addr");
		
		//2.IP
		String mem_ip		=	request.getRemoteAddr();
		
		//3.VO포장
		MemberVo vo = new MemberVo(mem_name, mem_id, mem_pwd, mem_email, mem_zipcode, mem_addr, mem_ip);
		
		//4.DB insert
		int res = MemberDao.getInstance().insert(vo);

		return "redirect:../member/list.do";
	}
	
}
