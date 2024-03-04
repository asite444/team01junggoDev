package controller.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import annotation.RequestMapping;
import annotation.ResponseBody;
import dao.CartDao;
import dao.CategoryDao;
import dao.ProductDao;
import dao.UserDao;
import myconstant.MyConstant;
import util.Paging;
import util.WeatherUtil;
import vo.CategoryVo;
import vo.ProductVo;
import vo.UserVo;
import vo.WeatherVo;

public class ProductController {
	
		/**
		 *  전체매물란에 화면띄우는 기능
		 * @param request
		 * @param response
		 * @return
		 */
		@RequestMapping("/product/all_items.do")
		public String all_items(HttpServletRequest request, HttpServletResponse response) {
			
			List<ProductVo> list = ProductDao.getInstance().selectList_p_hit();
		
			List<WeatherVo> weatherlist = null;
			try {
				weatherlist =WeatherUtil.search_weather_json();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("weatherlist", weatherlist);
			request.setAttribute("list", list);
			
			return "../all_items.jsp";
		}
	
		/**
		 * 카테고리란에 전체화면 띄우는 기능
		 * @param request
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/product/list.do")
		public String list(HttpServletRequest request, HttpServletResponse response) throws Exception {

			int c_idx = 0;
			try {
			   c_idx = Integer.parseInt(request.getParameter("c_idx"));	
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			int nowPage = 1;
			String page = request.getParameter("page");
			String search = request.getParameter("search");
			String search_text = request.getParameter("search_text");
			String action = request.getParameter("action");
			
			
			if(search==null || search.isEmpty()) {
				search = "all";		
			}
			
			if(page!=null && !page.isEmpty()){
				nowPage = Integer.parseInt(page);
			}
			
			int start = (nowPage-1) * MyConstant.Product.BLOCK_LIST+1;
			int end  = start + MyConstant.Product.BLOCK_LIST-1;
			
			Map<String, Object> map = new HashMap<String,Object>();
			
			map.put("c_idx", c_idx);
			map.put("start", start);
			map.put("end", end);
			
			if(search.equals("subject_content")) {
				
				map.put("subject", search_text);
				map.put("content", search_text);
				
			}else if(search.equals("name")) {
				
				map.put("name", search_text);
				
			}else if(search.equals("subject")) {
				
				map.put("subject", search_text);
				
			}else if(search.equals("content")) {
				
				map.put("content", search_text);
			}
			
			List<WeatherVo> weatherlist = null;
			try {
				weatherlist =WeatherUtil.search_weather_json();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			List<ProductVo> list = ProductDao.getInstance().selectList(map);
			int rowTotal = ProductDao.getInstance().selectRowTotal(map);
			
			String search_filter = String.format("&search=%s&search_text=%s", search,search_text);
			
			String pageMenu = Paging.getproductPaging("list.do", 
					search_filter,
					nowPage,  //현재페이지
					rowTotal,  // 전체게시물수
					MyConstant.Product.BLOCK_LIST,		 //1화면에 보여질 게시물수	 
					MyConstant.Product.BLOCK_PAGE);   // 1화면에 보여질 메뉴수
			
			request.getSession().removeAttribute("show");
			request.setAttribute("list",list);
			request.setAttribute("pageMenu", pageMenu);
			request.setAttribute("weatherlist", weatherlist);
			
//			if(action.equals("1")) {
//				return "../all_items.jsp";
//			} else {
				return "../category.jsp";
			
		}//end:product_list.do
		
	
		
		/**
		 * 포토정보 데이터 하나 가져오는 메서드 서블릿
		 * @param request
		 * @param response
		 * @return
		 */
		@RequestMapping(value="/product/product_one.do",produces="application/json;charset=utf-8;")
		@ResponseBody
		public String product_one(HttpServletRequest request, HttpServletResponse response) {

			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			
			//2.p_idx에 해당되는 vo얻어오기
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			
			//3. JSON 데이터 생성
			JSONObject json = new JSONObject();
			json.put("p_idx", vo.getP_idx());
			json.put("p_subject", vo.getP_subject());
			json.put("p_content", vo.getP_content());
			json.put("p_ip", vo.getP_ip());
			json.put("p_filename", vo.getP_filename());
			json.put("p_regdate", vo.getP_regdate());
			json.put("p_modifydate", vo.getP_modifydate());
			json.put("user_idx", vo.getUser_idx());
			
			return json.toString();
			
		}//end:product_one.do
		
		
		/**
		 *   삭제 기능
		 * @param request
		 * @param response
		 * @return
		 */
		@RequestMapping("/product/delete.do")
		public String delete(HttpServletRequest request, HttpServletResponse response) {

			ServletContext application = request.getServletContext();
			
			int p_idx = Integer.parseInt(request.getParameter("p_idx")); 
			
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			
			String webPath = "/upload/"; 
			
			String saveDir = application.getRealPath(webPath);
		
			File f = new File(saveDir, vo.getP_filename());
				  
			f.delete();
				 
			//3.DB delete
			int res = ProductDao.getInstance().delete(p_idx);
			int res1 = CartDao.getInstance().delete_select_p_idx(p_idx);
			
			return "redirect:../product/list.do";
		}
		
		/**
		 * 인서트 폼으로 바로이동
		 * @param request
		 * @param response
		 * @return
		 */
		@RequestMapping("/product/insert_form.do")
		public String insert_form(HttpServletRequest request, HttpServletResponse response) {

			return "product_insert_form.jsp";
		}
		
		/** 
		 *  입력기능 
		 * @param request
		 * @param response
		 * @return
		 * @throws IOException
		 */
		@RequestMapping("/product/insert.do")
		public String insert(HttpServletRequest request, HttpServletResponse response) throws IOException {

			int res1 =0;
			
			ServletContext application = request.getServletContext();
			
			String webPath = "/upload/"; 									//웹경로(상대적경로)
			String saveDir = application.getRealPath(webPath); 
			System.out.println(saveDir);																			//"c:\\work";   		  	//저장위치(절대경로)
			int maxSize = 1024*1024*100;          							//업로드(최대)크기(byte)
			
			MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy()); 
			
			String p_filename="no_file";
			String p_filename1="no_file";
			String p_filename2="no_file";
			String p_filename3="no_file";
			//업로드된 화일정보 얻어온다
			File f = mr.getFile("photo");
			File f1 = mr.getFile("photo1");
			File f2 = mr.getFile("photo2");
			File f3 = mr.getFile("photo3");
			if(f != null) {
				p_filename = f.getName();
			}
			if(f1 != null) {
				p_filename1 = f1.getName();
			}
			if(f2 != null) {
				p_filename2 = f2.getName();
			}
			if(f3 != null) {
				p_filename3= f3.getName();
			}
			
			String c_name	= mr.getParameter("c_name");  
			CategoryVo cate = CategoryDao.getInstance().selectOne(c_name);
			int c_idx = cate.getC_idx();
		
			int user_idx	= Integer.parseInt(mr.getParameter("user_idx"));  
			
			String p_name	= mr.getParameter("p_name");  
			int p_price = Integer.parseInt(mr.getParameter("p_price"));
			String p_nego	= mr.getParameter("p_nego");
			String p_deal	= mr.getParameter("p_deal");
			String p_local	= mr.getParameter("p_local");
			String p_company	= mr.getParameter("p_company");
			
			String p_subject	= mr.getParameter("p_subject");  
			String p_content	= mr.getParameter("p_content");
			String p_ip		= request.getRemoteAddr();  
			int p_hit = 0;//Integer.parseInt(mr.getParameter("p_hit"));
			String p_status	= mr.getParameter("p_status");
			
			ProductVo vo = new ProductVo( c_idx, user_idx, p_name, p_price, p_nego, p_deal, p_local, p_company, p_subject, p_content, p_filename, p_filename1, p_filename2, p_filename3, p_ip, p_hit, p_status);
			
			res1 = ProductDao.getInstance().insert(vo);
			
			return "redirect:../product/list.do";
		}
		
		@RequestMapping("/product/modify_form.do")
		public String modify_form(HttpServletRequest request, HttpServletResponse response) {
			String page = request.getParameter("page");
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			
			//2. p_idx - > ProductVo
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			int c_idx = vo.getC_idx();
			
			CategoryVo cate = CategoryDao.getInstance().select_one_c_idx(c_idx);
			String c_name = cate.getC_name();
			
			//<br> -> \n
			String p_content = vo.getP_content().replace("<br>", "\n");
			vo.setP_content(p_content);
			//3. request binding
			request.setAttribute("c_name", c_name);
			request.setAttribute("vo", vo);
			request.setAttribute("page", page);
			
			return "product_modify_form.jsp";
		}
		
		@RequestMapping("/product/modify.do")
		public String modify(HttpServletRequest request, HttpServletResponse response) {

			String c_name	= request.getParameter("c_name");  
			CategoryVo cate = CategoryDao.getInstance().selectOne(c_name);
		
			
			int     p_idx			= Integer.parseInt(request.getParameter("p_idx"));
			int 	c_idx = cate.getC_idx();
			int 	user_idx	= Integer.parseInt(request.getParameter("user_idx"));  
			
			String p_name	= request.getParameter("p_name");  
			int 	p_price = Integer.parseInt(request.getParameter("p_price"));
			String p_nego	= request.getParameter("p_nego");
			String p_deal	= request.getParameter("p_deal");
			String p_local	= request.getParameter("p_local");
			String p_company	= request.getParameter("p_company");
			
			String p_subject		= request.getParameter("p_subject");  
			String p_content	= request.getParameter("p_content").replaceAll("\n", "<br>");
			String p_ip		= request.getRemoteAddr(); 
			String p_status	= request.getParameter("p_status");
			String page = request.getParameter("page");
			//String p_ip			= request.getRemoteAddr();  
		
		   ProductVo  vo = new ProductVo();
		   vo.setP_idx(p_idx);
		   vo.setC_idx(c_idx);
		   vo.setUser_idx(user_idx);
		   vo.setP_name(p_name);
		   vo.setP_price(p_price);
		   vo.setP_nego(p_nego);
		   vo.setP_deal(p_deal);
		   vo.setP_local(p_local);
		   vo.setP_company(p_company);
		   vo.setP_subject(p_subject);
		   vo.setP_content(p_content);
		   vo.setP_status(p_status);
		   vo.setP_ip(p_ip);
		 
		   
		   int res = ProductDao.getInstance().update(vo);
		   
		 
		  return  String.format("redirect:../product/view.do?p_idx=%d&page=%s",p_idx,page);
		   //return "redirect:../product/view.do?p_idx=" + p_idx + "&page=" + page;
		}
		
		@RequestMapping(value="/product/product_upload.do",produces="application/json;charset=utf-8;")
		@ResponseBody
		public String product_upload(HttpServletRequest request, HttpServletResponse response) throws IOException {

			ServletContext application = request.getServletContext();
			
			String webPath = "/upload/";         //웹경로(상대적경로) 
			//                                   저장위치(절대경로)
			String saveDir = application.getRealPath(webPath);
			
			int    maxSize    = 1024*1024*100;   //업로드(최대)크기(byte)
					
			MultipartRequest  mr = new MultipartRequest(request,//처리위임 
					                                    saveDir,//저장위치(절대경로) 
					                                    maxSize,//업로드크기
					                                    "utf-8",//수신인코딩 
					                                    //동일화일인경우 이름을 변경해서 저장
					                                    new DefaultFileRenamePolicy()
					                                    );
			//업로드된 화일명 얻어온다
			String p_filename="no_file";
		
			//업로드된 화일정보 얻어온다
			File f = mr.getFile("photo");
			
			
			if(f != null) {
				p_filename = f.getName();
			}
			

			
			//p_idx
			int p_idx = Integer.parseInt(mr.getParameter("p_idx"));
			
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			
			//기존화일을 삭제
			File oldFile = new File(saveDir,vo.getP_filename());
			
			
			oldFile.delete();
			
			
			//DB p_filename update
			// update product set p_filename=? where p_idx=?
			vo.setP_filename(p_filename); //old -> new filename
	
			
			int res = ProductDao.getInstance().update_filename(vo);
		
			//결과전송
			JSONObject json = new JSONObject();
			json.put("p_filename", p_filename);
	

			return json.toString();
		}
		
		@RequestMapping(value="/product/product_upload1.do",produces="application/json;charset=utf-8;")
		@ResponseBody
		public String product_upload1(HttpServletRequest request, HttpServletResponse response) throws IOException {

			ServletContext application = request.getServletContext();
			
			String webPath = "/upload/";         //웹경로(상대적경로) 
			//                                   저장위치(절대경로)
			String saveDir = application.getRealPath(webPath);
			
			int    maxSize    = 1024*1024*100;   //업로드(최대)크기(byte)
					
			MultipartRequest  mr = new MultipartRequest(request,//처리위임 
					                                    saveDir,//저장위치(절대경로) 
					                                    maxSize,//업로드크기
					                                    "utf-8",//수신인코딩 
					                                    //동일화일인경우 이름을 변경해서 저장
					                                    new DefaultFileRenamePolicy()
					                                    );
			//업로드된 화일명 얻어온다
			String p_filename1="no_file";
		
			//업로드된 화일정보 얻어온다
			File f1 = mr.getFile("photo1");
			
			
			if(f1 != null) {
				p_filename1 = f1.getName();
			}
			

			
			//p_idx
			int p_idx = Integer.parseInt(mr.getParameter("p_idx"));
			
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			
			//기존화일을 삭제
			File oldFile1 = new File(saveDir,vo.getP_filename1());
			
			
			oldFile1.delete();
			
			
			//DB p_filename update
			// update product set p_filename=? where p_idx=?
			vo.setP_filename1(p_filename1); //old -> new filename
	
			
			int res = ProductDao.getInstance().update_filename1(vo);
		
			//결과전송
			JSONObject json = new JSONObject();
			json.put("p_filename1", p_filename1);
	

			return json.toString();
		}
		
		@RequestMapping(value="/product/product_upload2.do",produces="application/json;charset=utf-8;")
		@ResponseBody
		public String product_upload2(HttpServletRequest request, HttpServletResponse response) throws IOException {

			ServletContext application = request.getServletContext();
			
			String webPath = "/upload/";         //웹경로(상대적경로) 
			//                                   저장위치(절대경로)
			String saveDir = application.getRealPath(webPath);
			
			int    maxSize    = 1024*1024*100;   //업로드(최대)크기(byte)
					
			MultipartRequest  mr = new MultipartRequest(request,//처리위임 
					                                    saveDir,//저장위치(절대경로) 
					                                    maxSize,//업로드크기
					                                    "utf-8",//수신인코딩 
					                                    //동일화일인경우 이름을 변경해서 저장
					                                    new DefaultFileRenamePolicy()
					                                    );
			//업로드된 화일명 얻어온다
			String p_filename2="no_file";
		
			//업로드된 화일정보 얻어온다
			File f2 = mr.getFile("photo2");
			
			
			if(f2 != null) {
				p_filename2 = f2.getName();
			}
			

			
			//p_idx
			int p_idx = Integer.parseInt(mr.getParameter("p_idx"));
			
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			
			//기존화일을 삭제
			File oldFile2 = new File(saveDir,vo.getP_filename2());
			
			
			oldFile2.delete();
			
			
			//DB p_filename update
			// update product set p_filename=? where p_idx=?
			vo.setP_filename2(p_filename2); //old -> new filename
	
			
			int res = ProductDao.getInstance().update_filename2(vo);
		
			//결과전송
			JSONObject json = new JSONObject();
			json.put("p_filename2", p_filename2);
	

			return json.toString();
		}
		
		@RequestMapping(value="/product/product_upload3.do",produces="application/json;charset=utf-8;")
		@ResponseBody
		public String product_upload3(HttpServletRequest request, HttpServletResponse response) throws IOException {

			ServletContext application = request.getServletContext();
			
			String webPath = "/upload/";         //웹경로(상대적경로) 
			//                                   저장위치(절대경로)
			String saveDir = application.getRealPath(webPath);
			
			int    maxSize    = 1024*1024*100;   //업로드(최대)크기(byte)
					
			MultipartRequest  mr = new MultipartRequest(request,//처리위임 
					                                    saveDir,//저장위치(절대경로) 
					                                    maxSize,//업로드크기
					                                    "utf-8",//수신인코딩 
					                                    //동일화일인경우 이름을 변경해서 저장
					                                    new DefaultFileRenamePolicy()
					                                    );
			//업로드된 화일명 얻어온다
			String p_filename3="no_file";
		
			//업로드된 화일정보 얻어온다
			File f3 = mr.getFile("photo3");
			
			
			if(f3 != null) {
				p_filename3 = f3.getName();
			}
			

			
			//p_idx
			int p_idx = Integer.parseInt(mr.getParameter("p_idx"));
			
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			
			//기존화일을 삭제
			File oldFile3 = new File(saveDir,vo.getP_filename3());
			
			
			oldFile3.delete();
			
			
			//DB p_filename update
			// update product set p_filename=? where p_idx=?
			vo.setP_filename3(p_filename3); //old -> new filename
	
			
			int res = ProductDao.getInstance().update_filename3(vo);
		
			//결과전송
			JSONObject json = new JSONObject();
			json.put("p_filename3", p_filename3);
	

			return json.toString();
		}
		
	
		
		@RequestMapping("/product/view.do")
		public String view(HttpServletRequest request, HttpServletResponse response) {
			
			int p_idx = Integer.parseInt(request.getParameter("p_idx"));
			ProductVo vo = ProductDao.getInstance().selectOne(p_idx);
			int user_idx = vo.getUser_idx();
			
			UserVo user = UserDao.getInstance().selectOne(user_idx);
			
			String user_name = user.getUser_name();
			
			String page = request.getParameter("page");
			
			if(request.getSession().getAttribute("show")==null) {
				//조회수 증가
				int res1 = ProductDao.getInstance().update_readhit(p_idx);
				
				request.getSession().setAttribute("show", true);
				
				}
			
			request.setAttribute("user_name", user_name);
			request.setAttribute("vo", vo);
			request.setAttribute("page", page);

			return "product_view.jsp";
		}
		
		
}
