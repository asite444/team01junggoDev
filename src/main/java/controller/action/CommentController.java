package controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import annotation.RequestMapping;
import annotation.ResponseBody;
import dao.CommentDao;
import myconstant.MyConstant;
import util.Paging;
import vo.CommentVo;

public class CommentController {
	
	
	@RequestMapping("/board/comment_list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("ㅅㅎ");
		// board/comment_list.do?b_idx=5&page=1
		int nowPage = 1;
		//1.parameter 받기
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String strPage = request.getParameter("page");
		
		//만약 page 값이 null이 아니면 ㅈ금 page
		if(strPage!=null && ! strPage.isEmpty())
			nowPage = Integer.parseInt(strPage);
			
		int start = (nowPage-1) * MyConstant.Comment.BLOCK_LIST + 1; // (3-1)*
		int end	  = start + MyConstant.Comment.BLOCK_LIST - 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_idx", b_idx);
		map.put("start", start);
		map.put("end", end);
		
		
		List<CommentVo> cmt = CommentDao.getInstance().selectList(map);
		
		//게시물별 댓글의 갯수 : /page Menu생성
		int rowTotal = CommentDao.getInstance().selectRowTotal(b_idx);
		
		// list.do?page=1&search=name&search_text=길동
		String pageMenu = Paging.getCommentPaging(nowPage,  		//현제페이지
														rowTotal, 		//전체게시물수
														MyConstant.Comment.BLOCK_LIST,  //1화면에 보여질 게시물수
														MyConstant.Comment.BLOCK_PAGE); //1화면에 보여질 메뉴수

		//request binding
		request.setAttribute("cmt", cmt);
		// System.out.println(cmt.get(0).getCmt_content());
		request.setAttribute("pageMenu", pageMenu);
		
		return "board_comment_list.jsp";
	}
	
	//댓글쓰기
	@RequestMapping(value="/board/comment_insert.do",produces="application/json; charset=utf-8;")
	@ResponseBody
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		
		// /board/comment_insert.,do?b_idx=5&cmt_content=댓글내용&user_idx=1&user_id=one&user_name=일길동
		
		//1.parameter 받기
		int b_idx 			= Integer.parseInt(request.getParameter("b_idx"));
		String cmt_content  = request.getParameter("cmt_content").replaceAll("\n", "<br>");
		int	user_idx		= Integer.parseInt(request.getParameter("user_idx"));
		String user_id 		= request.getParameter("user_id");
		String user_name 	= request.getParameter("user_name");
		
		//2.ip구하기
		String cmt_ip 		= request.getRemoteAddr();
		
		//3.vo패장
		CommentVo vo = new CommentVo(cmt_content, cmt_ip, b_idx, user_idx, user_id, user_name);
		
		//4.DB insert : res <- 처리된 행수
		int res = CommentDao.getInstance().insert(vo);
		
		//5.결과 JSON객체로 생성
		JSONObject json = new JSONObject();
		json.put("result",  res==1 ); //{"result":true}
		
		
		return json.toString();
	}
	
	//댓글삭제
	@RequestMapping(value="/board/comment_delete.do",produces="application/json; charset=utf-8;")
	@ResponseBody
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		
		// /board/comment_delete.do?cmt_idx=2
		//1.parameter 받기
		int	cmt_idx			= Integer.parseInt(request.getParameter("cmt_idx"));
	
		//2.DB insert : res <- 처리된 행수
		int res = CommentDao.getInstance().delete(cmt_idx);
		
		//3.결과 JSON객체로 생성
		JSONObject json = new JSONObject();
		if(res==1)
			json.put("result",  res );
		else
			json.put("result",  false ); 
		
		return json.toString();
	}
	
	//댓글수정
	@RequestMapping(value="/board/update_comment.do",produces="application/json; charset=utf-8;")
	@ResponseBody
	public String update(HttpServletRequest request, HttpServletResponse response) {
		
		// /board/comment_delete.do?cmt_idx=2
		//1.parameter 받기
		int	cmt_idx			= Integer.parseInt(request.getParameter("cmt_idx"));
		String cmt_content =  request.getParameter("cmt_content");
		
		CommentVo vo = new CommentVo();
		vo.setCmt_idx(cmt_idx);
		vo.setCmt_content(cmt_content);
	
		//2.DB insert : res <- 처리된 행수
		int res = CommentDao.getInstance().update(vo);
		
		//3.결과 JSON객체로 생성
		JSONObject json = new JSONObject();
		if(res==1)
			json.put("result",  res );
		else
			json.put("result",  false ); 
		
		return json.toString();
	}


}
