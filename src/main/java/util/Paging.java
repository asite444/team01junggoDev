package util;
/*
        pageURL:목록(list.do)
        nowPage:현재페이지
        rowTotal:전체데이터갯수
        blockList:한페이지당 게시물수
        blockPage:한화면에 나타낼 페이지 목록수
 */

public class Paging {
	
public static String getproductPaging(String pageURL,String search_filter,int nowPage, int rowTotal,int blockList, int blockPage){
		
		int totalPage;   /*전체페이지수*/
        int startPage;   /*시작페이지번호*/
        int endPage;     /*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳
		
		
		isPrevPage=isNextPage=false;
		//입력된 전체 자원을 통해 전체 페이지 수를 구한다..
		totalPage = rowTotal/blockList;
		
		if(rowTotal%blockList!=0)totalPage++;
		

		//만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
		//넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
		if(nowPage > totalPage)nowPage = totalPage;
		

		//시작 페이지와 마지막 페이지를 구함.
		startPage = ((nowPage-1)/blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1; //
		
		
		//마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
		if(endPage > totalPage)endPage = totalPage;
		
		//마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
		//boolean형 변수의 값을 설정
		if(endPage < totalPage) isNextPage = true;
		//시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
		if(startPage > 1)isPrevPage = true;
		
		//HTML코드를 저장할 StringBuffer생성=>코드생성
		sb = new StringBuffer("<ul class='pagination'>");
//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){

			//			sb.append("<li><a href ='"+pageURL+"?page=");
//			sb.append(startPage-1);
//			sb.append(search_filter);
//			sb.append("'>◀</a></li>");
			//                            search_filter="&search=name&search_text=길동" 
			sb.append(String.format("<li><a href ='%s?page=%d%s'>◀</a></li>", 
                    pageURL,startPage-1,search_filter));
			
		}
		else 
			sb.append("<li><a href='#'>◀</a></li>");
			
		
		
		
//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		//sb.append("|");
		for(int i=startPage; i<= endPage ;i++){

			if(i == nowPage){ //현재 있는 페이지
				sb.append("<li class='active'><a href='#'>");
				sb.append(i);
				sb.append("</a></li>");
			}
			else{//현재 페이지가 아니면
//				sb.append("<li><a href='"+pageURL+"?page=");
//				sb.append(i);
//				sb.append("'>");
//				sb.append(i);
//				sb.append("</a></li>");
				
				sb.append(String.format("<li><a href ='%s?page=%d%s'>%d</a></li>", 
                        pageURL,i,search_filter,i));
			}
		}// end for
		
		
		
//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
//			sb.append("<li><a href='" + pageURL + "?page=");
//			sb.append(endPage+1);
//			sb.append(search_filter);
//			sb.append("'>▶</a></li>");
			
			sb.append(String.format("<li><a href ='%s?page=%d%s'>▶</a></li>", 
                    pageURL,endPage+1,search_filter));
			
		}
		else {
			sb.append("<li><a href='#'>▶</a></li>");
		}
//---------------------------------------------------------------------------------------------------------------------
        sb.append("</ul>");		

		return sb.toString();
	}	
	
public static String getproductPaging(String pageURL,int nowPage, int rowTotal,int blockList, int blockPage){
		
		int totalPage;   /*전체페이지수*/
        int startPage;   /*시작페이지번호*/
        int endPage;     /*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳
		
		
		isPrevPage=isNextPage=false;
		//입력된 전체 자원을 통해 전체 페이지 수를 구한다..
		totalPage = rowTotal/blockList;
		
		if(rowTotal%blockList!=0)totalPage++;
		

		//만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
		//넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
		if(nowPage > totalPage)nowPage = totalPage;
		

		//시작 페이지와 마지막 페이지를 구함.
		startPage = ((nowPage-1)/blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1; //
		
		
		//마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
		if(endPage > totalPage)endPage = totalPage;
		
		//마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
		//boolean형 변수의 값을 설정
		if(endPage < totalPage) isNextPage = true;
		//시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
		if(startPage > 1)isPrevPage = true;
		
		//HTML코드를 저장할 StringBuffer생성=>코드생성
		sb = new StringBuffer("<ul class='pagination'>");
//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){

			//			sb.append("<li><a href ='"+pageURL+"?page=");
//			sb.append(startPage-1);
//			sb.append(search_filter);
//			sb.append("'>◀</a></li>");
			//                            search_filter="&search=name&search_text=길동" 
			sb.append(String.format("<li><a href ='%s?page=%d'>◀</a></li>", 
					                            pageURL,startPage-1));
			
		}
		else {
			sb.append("<li><a href='#'>◀</a></li>");
			
		}
		
		
//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		//sb.append("|");
		for(int i=startPage; i<= endPage ;i++){

			if(i == nowPage){ //현재 있는 페이지
				sb.append("<li class='active'><a href='#'>");
				sb.append(i);
				sb.append("</a></li>");
			}
			else{//현재 페이지가 아니면
				sb.append("<li><a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a></li>");
			}
		}// end for
		
		
		
//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
//			sb.append("<li><a href='" + pageURL + "?page=");
//			sb.append(endPage+1);
//			sb.append(search_filter);
//			sb.append("'>▶</a></li>");
			
			sb.append(String.format("<li><a href ='%s?page=%d'>▶</a></li>", 
                                                pageURL,endPage+1));
			
		}
		else {
			sb.append("<li><a href='#'>▶</a></li>");
		}
//---------------------------------------------------------------------------------------------------------------------
        sb.append("</ul>");		

		return sb.toString();
	}
	
	public static String getPaging(String pageURL,int nowPage, int rowTotal,int blockList, int blockPage){
		
		int totalPage	/*전체페이지수*/,
            startPage	/*시작페이지번호*/,
            endPage;	/*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳
		
		
		isPrevPage=isNextPage=false;
		//입력된 전체 자원을 통해 전체 페이지 수를 구한다..
		totalPage = rowTotal/blockList;
		
		if(rowTotal%blockList!=0)totalPage++; //게시물수가 0이 아니면 page++
		

		//만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
		//넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
		if(nowPage > totalPage)nowPage = totalPage;
		

		//시작 페이지와 마지막 페이지를 구함.
		//			예)	( 1-1	/5	)*	5 + 1 = 1
		startPage = ((nowPage-1)/blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1; 
		
		//마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
		if(endPage > totalPage)endPage = totalPage;
		
		//마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
		//boolean형 변수의 값을 설정
		if(endPage < totalPage) isNextPage = true;
		//시작페이지의 값이 1보다 크면 이전페이징 적용할 수 있도록 값설정
		if(startPage > 1)isPrevPage = true;
		
		//HTML코드를 저장할 StringBuffer생성=>코드생성
		sb = new StringBuffer();
//-----그룹페이지처리 이전:🐻🐻🐻‍❄️🐻‍❄️ --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			sb.append(startPage-1);
			sb.append("'>🐻</a>");
		}
		else
			sb.append("🐻");
		
//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		sb.append("|");
		for(int i=startPage; i<= endPage ;i++){
			
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#FFB6C1'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}// end for
		
		sb.append("&nbsp;|");
		
//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			sb.append(endPage+1);
			sb.append("'>🐻‍❄️</a>");
		}
		else
			sb.append("🐻‍❄️");
//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}
	
	
//	search_filter 검색조건이 있을 떄
public static String getPaging(String pageURL,String search_filter,int nowPage, int rowTotal,int blockList, int blockPage){
		
		int totalPage	/*전체페이지수*/,
            startPage	/*시작페이지번호*/,
            endPage;	/*마지막페이지번호*/

		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳
		
		
		isPrevPage=isNextPage=false;
		//입력된 전체 자원을 통해 전체 페이지 수를 구한다..
		totalPage = rowTotal/blockList;
		
		if(rowTotal%blockList!=0)totalPage++; //게시물수가 0이 아니면 page++
		

		//만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
		//넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
		if(nowPage > totalPage)nowPage = totalPage;
		

		//시작 페이지와 마지막 페이지를 구함.
		//			예)	( 1-1	/5	)*	5 + 1 = 1
		startPage = ((nowPage-1)/blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1; 
		
		//마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
		if(endPage > totalPage)endPage = totalPage;
		
		//마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
		//boolean형 변수의 값을 설정
		if(endPage < totalPage) isNextPage = true;
		//시작페이지의 값이 1보다 크면 이전페이징 적용할 수 있도록 값설정
		if(startPage > 1)isPrevPage = true;
		
		//HTML코드를 저장할 StringBuffer생성=>코드생성
		sb = new StringBuffer();
//-----그룹페이지처리 이전:🐻🐻🐻‍❄️🐻‍❄️ --------------------------------------------------------------------------------------------		
		if(isPrevPage){
//			sb.append("<a href ='"+pageURL+"?page=");
//			sb.append(startPage-1);
//			sb.append(search_filter);
//			sb.append("'>🐻</a>");
			sb.append(String.format("<a href='%s'?page=%d%s'>🐻</a>",pageURL,startPage-1,search_filter));
		}
		else
			sb.append("🐻");
		
//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		sb.append("|");
		for(int i=startPage; i<= endPage ;i++){
			
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#FFB6C1'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
//				sb.append("&nbsp;<a href='"+pageURL+"?page=");
//				sb.append(i);
//				sb.append(search_filter);
//				sb.append("'>");
//				sb.append(i);
//				sb.append("</a>");
				
				sb.append(String.format("&nbsp;<a href='%s?page=%d%s'>%d</a>", pageURL,i,search_filter,i));
			}
		}// end for
		
		sb.append("&nbsp;|");
		
//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){
//			sb.append("<a href='"+pageURL+"?page=");
//			sb.append(endPage+1);
//			sb.append(search_filter);
//			sb.append("'>🐻‍❄️</a>");
			sb.append(String.format("<a href='%s?page=%d%s'>🐻‍❄️</a>", pageURL,endPage+1,search_filter));
		}
		else
			sb.append("🐻‍❄️");
//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}




	public static String getCommentPaging(int nowPage, int rowTotal, int blockList, int blockPage) {
		// TODO Auto-generated method stub
		
		int totalPage;   /*전체페이지수*/
		int startPage;   /*시작페이지번호*/
		int endPage;     /*마지막페이지번호*/
		
		boolean  isPrevPage,isNextPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳
		
		
		isPrevPage=isNextPage=false;
		//입력된 전체 자원을 통해 전체 페이지 수를 구한다..
		totalPage = rowTotal/blockList;
		
		if(rowTotal%blockList!=0)totalPage++;
		
		
		//만약 잘못된 연산과 움직임으로 인하여 현재 페이지 수가 전체 페이지 수를
		//넘을 경우 강제로 현재페이지 값을 전체 페이지 값으로 변경
		if(nowPage > totalPage)nowPage = totalPage;
		
		
		//시작 페이지와 마지막 페이지를 구함.
		startPage = ((nowPage-1)/blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1; //
		
		
		//마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경
		if(endPage > totalPage)endPage = totalPage;
		
		//마지막페이지가 전체페이지보다 작을 경우 다음 페이징이 적용할 수 있도록
		//boolean형 변수의 값을 설정
		if(endPage < totalPage) isNextPage = true;
		//시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
		if(startPage > 1)isPrevPage = true;
		
		//HTML코드를 저장할 StringBuffer생성=>코드생성
		//sb = new StringBuffer("<ul class='pagination'>");
		sb = new StringBuffer();
//-----그룹페이지처리 이전 --------------------------------------------------------------------------------------------		
		if(isPrevPage){
			sb.append(String.format("<a href ='#' onclick='comment_list(%d);'>🐻</a>", 
					startPage-1));
			
		}
		else
			sb.append("<a href='#'>🐻</a>");
		
//------페이지 목록 출력 -------------------------------------------------------------------------------------------------
		for(int i=startPage; i<= endPage ;i++){
			
			if(i == nowPage){ //현재 있는 페이지
				sb.append("<a href='#'>");
				sb.append("&nbsp;"+i+"&nbsp;");
				sb.append("</a>");
			}
			else{//현재 페이지가 아니면
				
				sb.append(String.format("<a href ='#' onclick='comment_list(%d);'>&nbsp;%d&nbsp;</a>", 
						                                                         i,   i));
			}
		}// end for
		
//-----그룹페이지처리 다음 ----------------------------------------------------------------------------------------------
		if(isNextPage){

			sb.append(String.format("<a href ='#' onclick='comment_list(%d);'>🐻‍❄️</a>", 
					                                                    endPage+1));
		}
		else
			sb.append("<a href='#'>🐻‍❄️</a>");
//---------------------------------------------------------------------------------------------------------------------
		//sb.append("</ul>");		
		
		return sb.toString();
		
	}//end: getCommentPaging()
		
	
	
	
	
}