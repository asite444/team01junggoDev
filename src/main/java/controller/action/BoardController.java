package controller.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.RequestMapping;
import dao.BoardDao;
import myconstant.MyConstant;
import util.Paging;
import vo.BoardVo;
import vo.UserVo;

public class BoardController {
	
	//목록보기
	@RequestMapping("/board/list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {
		
		int nowPage = 1;
		
		String page			= request.getParameter("page");
		String search		= request.getParameter("search");
		String search_text	= request.getParameter("search_text");
		
		if(search==null || search.isEmpty())
			search = "all";
		
		if(page!=null && !page.isEmpty())
			nowPage = Integer.parseInt(page);
		
		int start	= (nowPage-1) * MyConstant.Board.BLOCK_LIST + 1;
		int end		= start + MyConstant.Board.BLOCK_LIST - 1;
		
		//검색조건 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		
		if (search.equals("subject_content")) {
			//제목 + 내용
			map.put("subject", search_text);
			map.put("content", search_text);
		}else if (search.equals("name")) {
			//이름
			map.put("name", search_text);
		}else if (search.equals("subject")) {
			//제목
			map.put("subject", search_text);
		}else if (search.equals("content")) {
			//내용
			map.put("content", search_text);
		}
		
		//게시판 전체조회
		List<BoardVo> list = BoardDao.getInstance().selectList();
		
	
		//page Menu생성							검색된 레코드수
		int rowTotal = BoardDao.getInstance().selectRowTotal(map);
				
		
		
		String search_filter = String.format("&search=%s&search_text=%s", search,search_text);
		
		String pageMenu = Paging.getPaging("list.do",
											search_filter,	//검색조건
											nowPage,  		//현제페이지
											rowTotal, 		//전체게시물수
											MyConstant.Board.BLOCK_LIST,  //1화면에 보여질 게시물수
											MyConstant.Board.BLOCK_PAGE); //1화면에 보여질 메뉴수
		
		//세션에 게시물을 봤다는 정보를 삭제
		request.getSession().removeAttribute("show");

		//request binding
		request.setAttribute("list", list);	
		request.setAttribute("pageMenu", pageMenu);	
		
		return "board_list.jsp";
	}
	
	//상세보기: 게시물 한건보기
	@RequestMapping("/board/view.do")
	public String view(HttpServletRequest request, HttpServletResponse response) {
		
		// /board/view.do?b_idx=1
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		
		BoardVo vo = BoardDao.getInstance().selectOne(b_idx);
		
		//세션에서 게시물을 봤는지에 대한 체크
		if (request.getSession().getAttribute("show")==null) {
			//조회수증가
			int res = BoardDao.getInstance().update_readhit(b_idx);
			request.getSession().setAttribute("show", true);
			
		}
		//request binding
		request.setAttribute("vo", vo);
		
		return "board_view.jsp";
	}
	
	//글쓰기 폼으로 넘어가기
	@RequestMapping("/board/board_insert_form.do")
	public String board_insert_form(HttpServletRequest request, HttpServletResponse response) {

		return "board_insert_form.jsp";
	}
	
	//글쓰기
	@RequestMapping("/board/insert.do")
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		
		// /board/insert.do?b_subject=제목&b_content=내용
		
		UserVo user = (UserVo) request.getSession().getAttribute("user");
		
		if (user == null) {
			//세션이 만료시(logout)
			return "rediect:../member/login_form.do?reason=session_timeout";
		}
		
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content").replaceAll("\n", "<br>");
		
		//2.ip구하기
		String b_ip = request.getRemoteAddr();
		
		//3.b_idx구하기
		int b_idx = BoardDao.getInstance().selectOneB_idx();
		int b_ref = b_idx;
		//4.등록회원정보
		int 	user_idx = user.getUser_idx();
		String user_name = user.getUser_name();
		
		//5.VoardVo포장
		BoardVo vo = new BoardVo(b_idx, b_subject, b_content, b_ip, user_idx, user_name, b_ref);
		
		//6.DB insert
		int res = BoardDao.getInstance().insert(vo);
		
		return "redirect:list.do";
	}

	//답글글쓰기폼
	@RequestMapping("/board/reply_form.do")
	public String reply_form(HttpServletRequest request, HttpServletResponse response) {

		return "board_reply_form.jsp";
	}
	
	
	//답글쓰기
	@RequestMapping("/board/reply.do")
	public String reply(HttpServletRequest request, HttpServletResponse response) {
		// /board/reply.do?b_idx=13&b_subject=제목&b_content=내용&page=3
		UserVo user = (UserVo) request.getSession().getAttribute("user");
		
		if (user == null) {
			//세션이 만료시(logout)
			return "rediect:../member/login_form.do?reason=session_timeout";
		}	
		
		//1.파라메터 받기
		int base_b_idx 	 = Integer.parseInt(request.getParameter("b_idx"));
		
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content").replaceAll("\n", "<br>");
		String page 	 = request.getParameter("page");
		
		//2.ip구하기
		String b_ip = request.getRemoteAddr();
		
		//3.답글을 등록할 b_idx얻어오기
		int b_idx = BoardDao.getInstance().selectOneB_idx();
//		int b_ref = b_idx;
		//4.등록회원정보
		int 	user_idx = user.getUser_idx();
		String user_name = user.getUser_name();
		
		//5.기준글 정보 얻어오기
		BoardVo baseVo	= BoardDao.getInstance().selectOne(base_b_idx);
		
		//6.기준글 보다 step이 큰 게시물의 b_step을 1씩 증가
		int res = BoardDao.getInstance().update_step(baseVo);

		//7.답글에 들어갈 b_ref, b_step b_depth계산
		int b_ref	= baseVo.getB_ref();
		int b_step	= baseVo.getB_step() + 1;
		int b_depth	= baseVo.getB_depth() + 1;
		
		//8.BoardVo포장
		BoardVo vo = new BoardVo(b_idx, b_subject, b_content, b_ip, user_idx, user_name, b_ref, b_step, b_depth);
		
		//9.DB reply
		res = BoardDao.getInstance().reply(vo);
		
		//현제답글의 page계산  baseVo:답글달 글
		int no = baseVo.getNo() + 1;
		int nowPage = no/MyConstant.Board.BLOCK_LIST;
		if(no%MyConstant.Board.BLOCK_LIST!=0) nowPage++;
		
		return "redirect:list.do?page=" + nowPage ;
	}

	
	//삭제하기 : 수정
	@RequestMapping("/board/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		// /board/delete.do?b_idx=13&page=3
		int 	b_idx 		 = Integer.parseInt(request.getParameter("b_idx"));
		String 	page 		 = request.getParameter("page");
		String 	search	 	 = request.getParameter("search");
		String 	search_text	 = request.getParameter("search_text");
		
		int res = BoardDao.getInstance().delete_update_b_use(b_idx);
		
		//res = CommentDao.getInstance().delete_b_idx(b_idx); //트랜잭션떄문에 주석
		
		//return "redirect:list.do?page=" + request.getParameter("page");
		return String.format("redirect:list.do?page=%s&search=%s&search_text=%s",page,search,URLEncoder.encode(search_text, "utf-8")) ;
											//문자열로 받아진다.
	}
	
	//수정하기 폼띄우기
	@RequestMapping("/board/modify_form.do")
	public String modify_form(HttpServletRequest request, HttpServletResponse response) {
		
		// /board/modify_form.do?b_idx=3
		//1.paremeter 받기
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		
		//2.수정할 원본게시물 얻어오기
		BoardVo vo = BoardDao.getInstance().selectOne(b_idx);
		
		//3. <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);
		
		//4.request binding
		request.setAttribute("vo", vo);
		
		return "board_modify_form.jsp";
	}
	
	@RequestMapping("/board/modify.do")
	public String modify(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		UserVo user = (UserVo) request.getSession().getAttribute("user");
		if (user == null) {
			//세션이 만료시(logout)
			return "rediect:../member/login_form.do?reason=session_timeout";
		}
		//1.parameter받기 :내용 가져오기
		int    b_idx     = Integer.parseInt(request.getParameter("b_idx"));
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content").replaceAll("\n", "<br>");
		String page = request.getParameter("page");
		String search	 = request.getParameter("search");
		String search_text	 = request.getParameter("search_text");
		
		//3.b_ip구하기
		String b_ip = request.getRemoteAddr();

		//5. BoardVo 포장
		BoardVo vo = new BoardVo(b_idx, b_subject, b_content, b_ip);
		
		//6.DB insert
		int res = BoardDao.getInstance().update(vo);
		System.out.println(res);
		
		//return "redirect:view.do?b_idx=" + b_idx + "&page=" + page ;
		return String.format("redirect:view.do?b_idx=%d&page=%s&search=%s&search_text=%s", b_idx, page,search,URLEncoder.encode(search_text, "utf-8")) ;
		
	}


}
