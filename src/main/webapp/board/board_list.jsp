<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
  
<!DOCTYPE HTML>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>community</title>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../assets/css/main.css">
<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
<script type="text/javascript">

	
	function insert_form() { //글쓰기
		
		//로그인이 안된경우
		if("${ empty user }" == "true"){
			
			if (confirm("글쓰기는 로그인 후에 가능합니다\n로그인 하시겠습니까?")==false) return; {
				location.href="../user/login_form.do";
			}
			return;
		}
		//글쓰기 폼으로 이동
		location.href="board_insert_form.do?community_page=1"; // /board/insert_form.do
	}//end:insert_form()
	
	function find() { //검색
		
		let search		= $("#category").val();
		let search_text	= $("#search_text").val().trim();
		
		//전체검색이 아닌데 검색어가 비어있으면
		if(search!='all' && search_text==''){
			
			alert("검색어를 입력하세요!");
			$("search_text").val("");
			$("search_text").val().focus();
			return ;
		}
		
		location.href="list.do?category=" + search + 
						"&search_text=" + encodeURIComponent(search_text,"utf-8"); //한글을 javascript에서 넘길떄 인코딩필수 
						
	}//end : find();
						
		/* 초기화 */
		$(document).ready(function(){
	   if("${ not empty param.category }" =="true"){ 
		   $("#category").val("${ param.category }");
	   }
	   
	   //전체보기면 검색어 지워라
	   if("${ param.category eq 'all' }" == "true"){  
		   $("#search_text").val("");
	   }
   });
		
   function login(){
	      
	   location.href="../user/login_form.do?url=" + encodeURIComponent(location.href) ;
   }
		
		
</script>
<style type="text/css">


	.search{
		width: 150px;
	}
    #search_text {
       
        width: 500px;
    }

	form{
		margin: auto;
	}
	


 .commentFocus {
            text-decoration: none; /* 밑줄 제거 */
            color: inherit; /* 기본 텍스트 색상 사용 */
            cursor: pointer; /* 커서 모양 설정 */
    }

        /* 호버(마우스를 올렸을 때) 스타일 */
  .commentFocus:hover {
            text-decoration: underline; /* 밑줄 추가 */
            color: inherit; /* 기본 텍스트 색상 사용 */
 }	
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->
	
	
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>community</h1>
				<p>
					<b>
						<a href="../board/list.do?community_page=1&">커뮤니티</a> | <a href="notice_list.do?community_page=2&">Notice</a> | <a href="qna_list.do?community_page=3&">Q&A</a>
					</b>
				</p>
			</header>
				<div class="image fit">

				</div>
			<p>자유로운 커뮤니티 모아보기</p>
			<br><br><br>
			
		<!-- 검색기능 -->
			<form>
			<input type="hidden" value="${ param.community_page }">
			<input type="hidden" value="${ community_page }">
			<div class="row">
				<div class="select-wrapper" style="float: left; width: 200px;">
						<select class="select-wrapper" id="category">
							<option value="all">전체보기</option>
							<option value="name">작성자</option>
							<option value="subject">제목</option>
							<option value="conetent">내용</option>
							<option value="subject_content">제목+내용</option>
						</select>
					</div>
				<div class="12u$(small)">
					<input type="text" name="search" id="search_text" value="${ param.search_text }"
						placeholder="search">
				</div>
				<div class="3u$ 12u$(small)">
					<input class="fit" type="button" value="Search" onclick="find();">
				</div>
			</div>
			</form>
		</div>

<hr>
		<div class="inner table-wrapper">
			<input class="btn btn-link" type="button"  value="글쓰기"
	            	onclick="insert_form();">
			
			<br><br>
						
			<table class="table-wrapper">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>아이피</th>
				<th>조회수</th>
			</tr>
				<!-- for(BoardVo vo : list) -->
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td >${ vo.no }</td>
					
					<!-- 제목 -->
					<td class="b_subject" >
						<!-- 답글이면 들여쓰기 -->
						<c:forEach begin="1" end="${ vo.b_depth }">&nbsp;&nbsp;&nbsp;</c:forEach>
						<!-- 메인글이 아니면'ㄴ'붙여라 -->
						<c:if test="${ vo.b_step ne 0 }">ㄴ</c:if>
						
						<!-- 사용중인 게시물 -->
						<c:if test="${ vo.b_use eq 'y' }">
							 <a href="view.do?b_idx=${ vo.b_idx }&page=${ empty param.page ? 1 : param.page }&search=${ param.search }&search_text=${ param.search_text }&community_page=1&">${ vo.b_subject }</a>
						
						<!-- badge: 댓글갯수 -->
							<c:if test="${ vo.cmt_count gt 0 }">
		              	    	<a class="commentFocus" href="view.do?b_idx=${ vo.b_idx }&page=${ empty param.page ? 1 : param.page }&search=${ param.search }&search_text=${ param.search_text }&commentFocus=true&community_page=1"><span class="badge" style="background: #FFB6C1;">${ vo.cmt_count }</span></a>
		              	 	</c:if>
						
						</c:if>
						
						<!-- 삭제 게시물에 대한 정보 -->
						<c:if test="${ vo.b_use eq 'n' }">
							<font color="red">삭제된 게시물(${ vo.b_subject })</font>
						</c:if>
					</td>
					
					<td >${ vo.user_name }</td>
					<!-- <td >ip:{ vo.b_ip }</td> -->
					<td >${ fn:substring(vo.b_regdate,0,16) }</td>
					<td >${ vo.b_ip }</td>
					<td >${ vo.b_readhit }</td>
				</tr>	
			</c:forEach>
			<!-- 게시물이 없는경우 -->
			<c:if test="${ empty list }"> <!-- request Binding에서 줌 -->
				<tr>
					<td colspan="6" align="center">
						<font color="red">등록된 게시글이 없습니다.</font>
					</td>
				</tr>	
			</c:if>
			
	
			<tr >
				<td colspan="6" align="center">
				<br>
	
					<br>
					<br>
					<!-- Page Menu -->
					<ul class="page">${ pageMenu }</ul>
				</td>
			</tr>
			</table>
		</div>
			

	</section>
	
	
<!-- Footer -->
<footer id="footer">
	<div class="inner">
		<h2>Get In Touch</h2>
		<ul class="actions">
			<li><span class="icon fa-phone"></span> <a href="#">(000)
					000-0000</a></li>
			<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
			<li><span class="icon fa-map-marker"></span> 123 Somewhere
				Road, Nashville, TN 00000</li>
		</ul>
	</div>
</footer>
<div class="copyright">
	Powered by: <a href="https://templated.co/">TEMPLATED</a>.
</div>

	
</body>
</html>
