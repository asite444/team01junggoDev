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
	
	
	function home() {
		lacation.herf="list.do";
		return ;
	}//end: home();
	
	function insert_form() {
		
		//로그인이 안된경우
		if("${ empty user }" == "true"){
			
			if (confirm("글쓰기는 로그인 후에 가능합니다\n로그인 하시겠습니까?")==false) return; {
				location.href="../member/login_form.do";
			}
			return;
		}
		//글쓰기 폼으로 이동
		location.href="insert_form.do"; // /board/insert_form.do
	}//end:insert_form()
	
	function find() {
		
		let search		= $("#search").val();
		let search_text	= $("#search_text").val().trim();
		
		//전체검색이 아닌데 검색어가 비어있으면
		if(search!='all' && search_text==''){
			
			alert("검색어를 입력하세요!");
			$("search_text").val("");
			$("search_text").val().focus();
			return ;
		}
		
		location.href="list.do?search=" + search + 
						"&search_text=" + encodeURIComponent(search_text,"utf-8"); //한글을 javascript에서 넘길떄 인코딩필수 
						
	}
		/* 초기화 */
		$(document).ready(function(){
	   if("${ not empty param.search }" =="true"){ 
		   $("#search").val("${ param.search }");
	   }
	   
	   //전체보기면 검색어 지워라
	   if("${ param.search eq 'all' }" == "true"){  
		   $("#search_text").val("");
	   }
   });
		
   function login(){
	      
	   location.href="../member/login_form.do?url=" + encodeURIComponent(location.href) ;
   }
		
		
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="../main.jsp" class="logo">중고로Go</a>
		<nav class="right">
			<a href="../user/login.jsp" class="button alt">Log in</a>
		</nav>
	</header>
	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="../main.jsp">Home</a></li>
			<li><a href="../all_items.jsp">전체매물</a></li>
			<li><a href="../category.jsp">Category</a></li>
			<li><a href="../board/board_list.jsp">community</a></li>
			<li><a href="../generic.jsp">Generic</a></li>
			<li><a href="../elements.jsp">Elements</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>Notice</h1>
				<p>
					<b>
						<a href="#" style="font: bold;">커뮤니티</a> | <a href="board_notice.jsp">Notice</a> | <a href="board_qna.jsp">Q&A</a>
					</b>
				</p>
			</header>
				<div class="image fit">

				</div>
			<p>공지사항</p>
			
			<div>
				<form method="post" action="#">
					<div class="select-wrapper" style="float: left; width: 150px;">
						<select class="select-wrapper" name="category" id="category">
							<option value="all">전체보기</option>
							<option value="id">아이디</option>
							<option value="subject">제목</option>
							<option value="conetent">내용</option>
							<option value="subject_content">제목+내용</option>
						</select>
					</div>		
					<div class="row uniform 9u$" style="float: right;">
						<div class="6u 12u$(xsmall)">
							<input class="6u" type="text" id="search_text" value="${ param.search_text }" placeholder="search">
						</div>
					</div>
				</form>
				
				
				<div class="3u$ 12u$(small)">
					<input  type="button" value="Search" class="fit"
							onclick="find();">
				</div>
			</div>
		           
			</div>
			
			
			<br>
			<br>
			<br>
			
			<hr>
			<input class="btn btn-link" type="button"  value="글쓰기"
	            	onclick="insert_form();">
			<div>
			
			
			<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>아이피</th>
				<th>작성일</th>
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
							 <a href="view.do?b_idx=${ vo.b_idx }&page=${ empty param.page ? 1 : param.page }&search=${ param.search }&search_text=${ param.search_text }">${ vo.b_subject }</a>
						
						<!-- badge: 댓글갯수 -->
							<c:if test="${ vo.cmt_count gt 0 }">
		              	    	<span class="badge" style="background: #FFB6C1;">${ vo.cmt_count }</span>
		              	 	</c:if>
						
						</c:if>
						
						<!-- 삭제 게시물에 대한 정보 -->
						<c:if test="${ vo.b_use eq 'n' }">
							<font color="red">삭제된 게시물(${ vo.b_subject })</font>
						</c:if>
					</td>
					
					<td >${ vo.mem_name }</td>
					<!-- <td >ip:{ vo.b_ip }</td> -->
					<td >${ fn:substring(vo.b_regdate,0,16) }</td>
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
			
			
			
			<p></p>
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
