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
import util.WeatherUtil;
import vo.BoardVo;
import vo.UserVo;
import vo.WeatherVo;

public class BoardController {

	// 커뮤니티 목록보기
	@RequestMapping("/board/list.do")
	public String list(HttpServletRequest request, HttpServletResponse response) {

		// /board/list.do?page=1&category=

		int nowPage = 1;

		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String search_text = request.getParameter("search_text");

		if (category == null || category.isEmpty())
			category = "all";

		if (page != null && !page.isEmpty())
			nowPage = Integer.parseInt(page);

		int start = (nowPage - 1) * MyConstant.Board.BLOCK_LIST + 1;
		int end = start + MyConstant.Board.BLOCK_LIST - 1;

		// 검색조건 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("community_page", MyConstant.Board.COMMUNITY_PAGE);// 1 : 메인게시판 2 : 공지사항 3 : Q&A

		map.put("start", start);
		map.put("end", end);

		if (category.equals("subject_content")) {
			// 제목 + 내용
			map.put("subject", search_text);
			map.put("content", search_text);
		} else if (category.equals("name")) {
			// 이름
			map.put("name", search_text);
		} else if (category.equals("subject")) {
			// 제목
			map.put("subject", search_text);
		} else if (category.equals("content")) {
			// 내용
			map.put("content", search_text);
		}

		// 게시판 전체조회
		List<BoardVo> list = BoardDao.getInstance().selectList(map);
		// System.out.println(list.get(0).getNo());

		// page Menu생성 검색된 레코드수
		int rowTotal = BoardDao.getInstance().selectRowTotal(map);

		String search_filter = Integer.toString(MyConstant.Board.COMMUNITY_PAGE);

		String pageMenu = Paging.getPaging("list.do", search_filter, // 검색조건
				nowPage, // 현제페이지
				rowTotal, // 전체게시물수
				MyConstant.Board.BLOCK_LIST, // 1화면에 보여질 게시물수
				MyConstant.Board.BLOCK_PAGE); // 1화면에 보여질 메뉴수
		// int community_page = 1;

		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 세션에 게시물을 봤다는 정보를 삭제
		request.setAttribute("weatherlist", weatherlist);

		request.getSession().removeAttribute("show");

		// request binding
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		// request.setAttribute("community_page", community_page);

		return "board_list.jsp";
	}

	// 상세보기: 게시물 한건보기
	@RequestMapping("/board/view.do")
	public String view(HttpServletRequest request, HttpServletResponse response) {
		// System.out.println("view실행");
		// /board/view.do?b_idx=1
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		// 페이지 정보를 가져온다 답글쓰기를 할때 넘겨준다
		int community_page = Integer.parseInt(request.getParameter("community_page"));
		// System.out.println(community_page);

		BoardVo vo = BoardDao.getInstance().selectOne(b_idx);

		
		// 세션에서 게시물을 봤는지에 대한 체크
		if (request.getSession().getAttribute("show") == null) {
			// 조회수증가
			int res = BoardDao.getInstance().update_readhit(b_idx);
			request.getSession().setAttribute("show", true);

		}

		// request binding
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("community_page", community_page);
		request.setAttribute("vo", vo);

		return "board_view.jsp";
	}

	// 페이지 공동으로 사용
	// 글쓰기 폼으로 넘어가기
	@RequestMapping("/board/board_insert_form.do")
	public String board_insert_form(HttpServletRequest request, HttpServletResponse response) {
		// community_page 의 정보 community_page=1
		int community_page = Integer.parseInt(request.getParameter("community_page"));

		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("community_page", community_page);

		return "board_insert_form.jsp";
	}

	// 글쓰기
	@RequestMapping("/board/insert.do")
	public String insert(HttpServletRequest request, HttpServletResponse response) {
		// System.out.println("insert실행");
		// /board/insert.do?b_subject=제목&b_content=내용

		UserVo user = (UserVo) request.getSession().getAttribute("user");

		if (user == null) {
			// 세션이 만료시(logout)
			return "rediect:../user/login_form.do?reason=session_timeout";
		}

		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content").replaceAll("\n", "<br>");

		// 2.ip구하기
		String b_ip = request.getRemoteAddr();

		// 3.b_idx구하기
		int b_idx = BoardDao.getInstance().selectOneB_idx();
		int b_ref = b_idx;
		// 4.등록회원정보
		int user_idx = user.getUser_idx();
		String user_name = user.getUser_name();

		int community_page = Integer.parseInt(request.getParameter("community_page")); // community_page 의 정보 가져오기

		// 5.VoardVo포장
		BoardVo vo = new BoardVo(b_idx, b_subject, b_content, b_ip, user_idx, user_name, b_ref, community_page);

		// 6.DB insert
		int res = BoardDao.getInstance().insert(vo);

		// 공지사항 페이지로 넘겼을 때 == 2
		if (community_page == MyConstant.Notice.COMMUNITY_PAGE)
			return "redirect:notice_list.do";
		// Q&A 페이지로 넘겼을 때
		if (community_page == MyConstant.Qna.COMMUNITY_PAGE)
			return "redirect:qna_list.do";

		return "redirect:list.do";
	}

	// 답글글쓰기폼
	@RequestMapping("/board/reply_form.do")
	public String reply_form(HttpServletRequest request, HttpServletResponse response) {

		// int community_page =
		// Integer.parseInt(request.getParameter("community_page"));

		// System.out.println(community_page);
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		int community_page = Integer.parseInt(request.getParameter("community_page"));

		BoardVo vo = BoardDao.getInstance().selectOne(b_idx);

		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("vo", vo);
		request.setAttribute("community_page", community_page);

		return "board_reply_form.jsp";
	}

	// 답글쓰기
	@RequestMapping("/board/reply.do")
	public String reply(HttpServletRequest request, HttpServletResponse response) {
		// /board/reply.do?b_idx=13&b_subject=제목&b_content=내용&page=3
		UserVo user = (UserVo) request.getSession().getAttribute("user");

		if (user == null) {
			// 세션이 만료시(logout)
			return "rediect:../user/login_form.do?reason=session_timeout";
		}

		// 1.파라메터 받기
		int base_b_idx = Integer.parseInt(request.getParameter("b_idx"));

		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content").replaceAll("\n", "<br>");
		String page = request.getParameter("page");

		// 2.ip구하기
		String b_ip = request.getRemoteAddr();

		// 3.답글을 등록할 b_idx얻어오기
		int b_idx = BoardDao.getInstance().selectOneB_idx();

		// 4.등록회원정보
		int user_idx = user.getUser_idx();
		String user_name = user.getUser_name();

		// 5.기준글 정보 얻어오기
		BoardVo baseVo = BoardDao.getInstance().selectOne(base_b_idx);
		// int community_page = MyConstant.Board.COMMUNITY_PAGE; //community_page 의 정보
		// 가져오기
		int community_page = Integer.parseInt(request.getParameter("community_page"));

		// 6.기준글 보다 step이 큰 게시물의 b_step을 1씩 증가
		int res = BoardDao.getInstance().update_step(baseVo);

		// 7.답글에 들어갈 b_ref, b_step b_depth계산
		int b_ref = baseVo.getB_ref();
		int b_step = baseVo.getB_step() + 1;
		int b_depth = baseVo.getB_depth() + 1;

		// 8.BoardVo포장
		BoardVo vo = new BoardVo(b_idx, b_subject, b_content, b_ip, user_idx, user_name, b_ref, b_step, b_depth,
				community_page);

		// 9.DB reply
		res = BoardDao.getInstance().reply(vo);

		// 현제답글의 page계산 baseVo:답글달 글
		int no = baseVo.getNo() + 1;
		int nowPage = no / MyConstant.Board.BLOCK_LIST;
		if (no % MyConstant.Board.BLOCK_LIST != 0)
			nowPage++;

		// 공지사항 페이지로 넘겼을 때 == 2
		if (community_page == MyConstant.Notice.COMMUNITY_PAGE)
			return "redirect:notice_list.do";
		// Q&A 페이지로 넘겼을 때
		if (community_page == MyConstant.Qna.COMMUNITY_PAGE)
			return "redirect:qna_list.do";

		// request.setAttribute("community_page", community_page);
		return "redirect:list.do?page=" + nowPage;
	}

	// 삭제하기 : 수정
	@RequestMapping("/board/delete.do")
	public String delete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		// /board/delete.do?b_idx=13&page=3
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String search_text = request.getParameter("search_text");

		int res = BoardDao.getInstance().delete_update_b_use(b_idx);

		// res = CommentDao.getInstance().delete_b_idx(b_idx); //트랜잭션떄문에 주석

		// return "redirect:list.do?page=" + request.getParameter("page");
		return String.format("redirect:list.do?page=%s&category=%s&search_text=%s", page, category,
				URLEncoder.encode(search_text, "utf-8"));
		// 문자열로 받아진다.
	}

	// 수정하기 폼띄우기
	/***
	 * 수정하기 폼띄우기
	 * 
	 * @param request
	 * @param response
	 * @return board_modify_form.jsp
	 */
	@RequestMapping("/board/modify_form.do")
	public String modify_form(HttpServletRequest request, HttpServletResponse response) {

		// /board/modify_form.do?b_idx=3
		// 1.paremeter 받기
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));

		// 2.수정할 원본게시물 얻어오기
		BoardVo vo = BoardDao.getInstance().selectOne(b_idx);

		// 3. <br> -> \n
		String b_content = vo.getB_content().replaceAll("<br>", "\n");
		vo.setB_content(b_content);

		// 페이지 1,2,3
		String search_text = request.getParameter("search_text");

		// community_page 정보 넘기기
		int community_page = Integer.parseInt(request.getParameter("community_page"));
		// 4.request binding
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("vo", vo);
		request.setAttribute("search_text", search_text);
		request.setAttribute("community_page", community_page);

		return "board_modify_form.jsp";
	}

	@RequestMapping("/board/modify.do")
	public String modify(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		// System.out.println("수정");
		UserVo user = (UserVo) request.getSession().getAttribute("user");
		if (user == null) {
			// 세션이 만료시(logout)
			return "rediect:../user/login_form.do?reason=session_timeout";
		}
		// 1.parameter받기 :내용 가져오기
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content").replaceAll("\n", "<br>");
		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String search_text = request.getParameter("search_text");
		int community_page = Integer.parseInt(request.getParameter("community_page"));

		// 3.b_ip구하기
		String b_ip = request.getRemoteAddr();

		// 5. BoardVo 포장
		BoardVo vo = new BoardVo(b_idx, b_subject, b_content, b_ip);

		// 6.DB insert
		int res = BoardDao.getInstance().update(vo);
		System.out.println(res);

		// return "redirect:view.do?b_idx=" + b_idx + "&page=" + page ;
		// return
		// String.format("redirect:view.do?b_idx=%d&page=%s&category=%s&search_text=%s",
		// b_idx, page,category,URLEncoder.encode(search_text, "utf-8")) ;
		return String.format("redirect:view.do?b_idx=%d&community_page=%d", b_idx, community_page);

	}

// notice : 공지사항 ________________________________________________________________________________________________

	// notice목록보기
	@RequestMapping("/board/notice_list.do")
	public String notie_list(HttpServletRequest request, HttpServletResponse response) {

		// /board/list.do?page=1&category=

		int nowPage = 1;

		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String search_text = request.getParameter("search_text");

		// 컬럼 추가에 따른 추가 데이터 / map추가 / search_filter에도 추가 %s,search_filter 추가
		int community_page = MyConstant.Notice.COMMUNITY_PAGE;

		if (category == null || category.isEmpty())
			category = "all";

		if (page != null && !page.isEmpty())
			nowPage = Integer.parseInt(page);

		int start = (nowPage - 1) * MyConstant.Notice.BLOCK_LIST + 1;
		int end = start + MyConstant.Notice.BLOCK_LIST - 1;

		// 검색조건 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("community_page", MyConstant.Notice.COMMUNITY_PAGE);// 1 : 메인게시판 2 : 공지사항 3 : Q&A

		map.put("start", start);
		map.put("end", end);

		if (category.equals("subject_content")) {
			// 제목 + 내용
			map.put("subject", search_text);
			map.put("content", search_text);
		} else if (category.equals("name")) {
			// 이름
			map.put("name", search_text);
		} else if (category.equals("subject")) {
			// 제목
			map.put("subject", search_text);
		} else if (category.equals("content")) {
			// 내용
			map.put("content", search_text);
		}

		// 게시판 전체조회
		List<BoardVo> list = BoardDao.getInstance().selectList(map);
		// System.out.println(list.get(0).getNo());

		// page Menu생성 검색된 레코드수
		int rowTotal = BoardDao.getInstance().selectRowTotal(map);

		String search_filter = String.format("&category=%s&search_text=%s", category, search_text);

		String pageMenu = Paging.getPaging("list.do", search_filter, // 검색조건
				nowPage, // 현제페이지
				rowTotal, // 전체게시물수
				MyConstant.Board.BLOCK_LIST, // 1화면에 보여질 게시물수
				MyConstant.Board.BLOCK_PAGE); // 1화면에 보여질 메뉴수

		// 세션에 게시물을 봤다는 정보를 삭제
		request.getSession().removeAttribute("show");

		// request binding
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		request.setAttribute("community_page", community_page);

		return "board_notice.jsp";
	}

	// 공지사항 글쓰기 폼으로 넘어가기
	@RequestMapping("/board/notice_insert_form.do")
	public String notice_insert_form(HttpServletRequest request, HttpServletResponse response) {
		// community_page 의 정보
		int community_page = MyConstant.Notice.COMMUNITY_PAGE;

		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("community_page", community_page);

		return "board_insert_form.jsp";
	}

	// 답글쓰기 폼으로 넘어갈 때

// Q&A : Q&A ________________________________________________________________________________________________

	// qna 전체조회
	@RequestMapping("/board/qna_list.do")
	public String qna_list(HttpServletRequest request, HttpServletResponse response) {

		int nowPage = 1;

		String page = request.getParameter("page");
		String category = request.getParameter("category");
		String search_text = request.getParameter("search_text");

		// 컬럼 추가에 따른 추가 데이터 / map추가 / search_filter에도 추가 %s,search_filter 추가
		int community_page = MyConstant.Qna.COMMUNITY_PAGE;

		if (category == null || category.isEmpty())
			category = "all";

		if (page != null && !page.isEmpty())
			nowPage = Integer.parseInt(page);

		int start = (nowPage - 1) * MyConstant.Qna.BLOCK_LIST + 1;
		int end = start + MyConstant.Qna.BLOCK_LIST - 1;

		// 검색조건 정보를 맵으로 포장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("community_page", MyConstant.Qna.COMMUNITY_PAGE); // 3 : Q&A

		map.put("start", start);
		map.put("end", end);

		if (category.equals("subject_content")) {
			// 제목 + 내용
			map.put("subject", search_text);
			map.put("content", search_text);
		} else if (category.equals("name")) {
			// 이름
			map.put("name", search_text);
		} else if (category.equals("subject")) {
			// 제목
			map.put("subject", search_text);
		} else if (category.equals("content")) {
			// 내용
			map.put("content", search_text);
		}

		// 게시판 전체조회
		List<BoardVo> list = BoardDao.getInstance().selectList(map);

		// page Menu생성 검색된 레코드수
		int rowTotal = BoardDao.getInstance().selectRowTotal(map);

		String search_filter = String.format("&category=%s&search_text=%s", category, search_text);

		String pageMenu = Paging.getPaging("list.do", search_filter, // 검색조건
				nowPage, // 현제페이지
				rowTotal, // 전체게시물수
				MyConstant.Qna.BLOCK_LIST, // 1화면에 보여질 게시물수
				MyConstant.Qna.BLOCK_PAGE); // 1화면에 보여질 메뉴수

		// 세션에 게시물을 봤다는 정보를 삭제
		request.getSession().removeAttribute("show");

		// request binding
		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		request.setAttribute("community_page", community_page);

		return "board_qna.jsp";
	}

	// Qna 글쓰기 폼으로 넘어가기
	@RequestMapping("/board/qna_insert_form.do")
	public String qna_insert_form(HttpServletRequest request, HttpServletResponse response) {
		// community_page 의 정보
		int community_page = MyConstant.Qna.COMMUNITY_PAGE;

		List<WeatherVo> weatherlist = null;
		try {
			weatherlist = WeatherUtil.search_weather_json();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("weatherlist", weatherlist);
		request.setAttribute("community_page", community_page);

		return "board_insert_form.jsp";
	}

}
