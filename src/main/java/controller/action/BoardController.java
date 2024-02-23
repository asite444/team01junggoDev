package controller.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.MysqlConnection;

import annotation.RequestMapping;
import dao.BoardDao;
import myconstant.MyConstant;
import util.Paging;
import vo.BoardVo;

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
		
		//게시판 목록 가져오기
		List<BoardVo> list = BoardDao.getInstance().selectList(map);
		
		//page Menu생성							검색된 레코드수
		int rowTotal = BoardDao.getInstance().selectRowTotal(map);
				
		request.getSession().setAttribute("list", list);
		
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

}
