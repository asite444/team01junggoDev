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
<title>게시물 보기</title>
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
	function login(){
	    
		   location.href="../user/login_form.do?url=" + encodeURIComponent(location.href) ;
	}//end : login
	
	function delete_board(b_idx) { //delete는 javascript예약어이다.
		
		if (confirm("정말 삭제하시겠습니다?")==false)return;
			
		location.href='delete.do?b_idx=' + b_idx + "&page=${ param.page }&search=${param.search}&search_text=${param.search_text}" ;
		//자리는 유지하되 내용만 감춘다.
	}//end : delete_board
	
	//개시물의 댓글
	$(document).ready(function (){
		comment_list(1); //page1
	});
		
	//Ajax 통해서 삭제 => boaed_comment_list.jsp	
	var g_cmt_page=1;
	
	function comment_list(p) { //답글의 댓글
		//ajax  댓글목록 요청
		$.ajax({
			url		:	"comment_list.do",
			data	:	{ "b_idx" : "${ vo.b_idx }", "page" : p },
			success	:	function (res_data){
				
				$("#disp").html(res_data);
			},
			error	:	function (err){
				alert(err.responseText); //서버 점검중
			}
			
		});
	}//end : comment_list
	
	function comment_insert() {
		
		//로그인여부 체트
		if ("${ empty user}" == "true") {
			if(confirm("댓글쓰기는 로그인후에 가능합니다\n로그인하시겠습니까?")==false) return;
			
			location.href="../user/login_form.do?url=" + encodeURIComponent(location.href);			
			return;
		
		}//로그인여부

		   //내용입력 여부체크
		   let cmt_content = $("#cmt_content").val().trim();
		   if(cmt_content==''){
			   alert('댓글 내용을 입력하세요!');
			   $("#cmt_content").val('');
			   $("#cmt_content").focus();
			   return;
		   }
		   
		   // Ajax로 전송
		   $.ajax({
			   url		:	"comment_insert.do",
			   data		:	{ 
				               "b_idx" : "${ vo.b_idx }",
				               "cmt_content" : cmt_content, 
				               "user_idx" : "${ user.user_idx }",
				               "user_id"  : "${ user.user_id }",
				               "user_name": "${ user.user_name }"
			                },
			   dataType	:	"json",
			   success	:	function(res_data){
				   // res_data = {"result" : true } or {"result" : false}
				   if(res_data.result){
					   //성공시 : 댓글목록 가져오기
					   comment_list(1);
					   
				   }else{
					   //실패시
					   alert("댓글쓰기 실패!!");
				   }
				   
				   //이전댓글내용 지우기
				   $("#cmt_content").val('');
				   
			   },
			   error	:	function(err){
				   
				   alert(err.responseText);
				   alert('에러');
			   }
		   });
		   
		
	}//end : comment_insert
	function modify_form(b_idx) {
		
		console.log(b_idx);
		location.href="modify_form.do?b_idx=" + b_idx; //PhotoModifyFormAction=BoardController

	}//end : modify_form
</script>

<style type="text/css">
th{
	font-size: 20px;
	width: 300px;
}
b{font-weight: bold;}
.row{ margin: auto; }
textarea{ 
	width: 700px; 
    display: inline-block;
    margin-right: 20px; /* 요소 사이의 간격 조정 */
    vertical-align: middle; /* 요소의 수직 정렬 설정 */
}
.comment{
	 vertical-align: middle;
	
}

</style>

</head>
<body>

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="../main.jsp" class="logo">중고로Go</a>
		<nav class="right">
			<c:if test="${ empty sessionScope.user }">
			<input class="button alt" value="Login"
					onclick="login();">
			</c:if>
			<!-- 로그인이 됐을경우 : 세션영역에 user가 있는가?  -->
			<c:if test="${ not empty sessionScope.user }">
				<b>${ sessionScope.user.user_name }</b>님 환영합니다!!
				<input class="button alt" type="button" value="Logout"
			       onclick="location.href='../user/logout.do'">
			</c:if>	
		</nav>
	</header>
	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="../main.jsp">Home</a></li>
			<li><a href="../all_items.jsp">전체매물</a></li>
			<li><a href="../category.jsp">Category</a></li>
			<li><a href="../board/list.do">community</a></li>
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
				<h1>community</h1>
				<p>
					<b>
						<a href="../board/list.do">커뮤니티</a> | <a href="board_notice.jsp">Notice</a> | <a href="board_qna.jsp">Q&A</a>
					</b>
				</p>
			</header>
				<div class="image fit">

				</div>
			<br>
			<br>
		<hr>
			<br>
		
			<h1>게시물 보기</h1>
			
			<br>
		<form action="form-inline">
			<input type="hidden"  name="user_idx"   value="${ user.user_idx }">
    		<input type="hidden"  name="b_idx"  value="${ vo.b_idx }">
			<table class="table-wrapper">
				<tr>
					<th colspan="2"><b>${ vo.user_name }</b>님의 글 </th>
				</tr>
		       <tr>
		          <th>제목</th>
		          <td id="subject">${ vo.b_subject }</td>
		       </tr>
		       <tr>
		          <th>내용</th>
		          <td id="content">${ vo.b_content }</td>
		       </tr>
		       
		       <tr>
		          <td colspan="2" align="center">
		          
		          <c:if test="${ user.user_grade eq '관리자' }">
				   	<input class="button" type="button" value="답글달기" 
				   				onclick="location.href='reply_form.do?b_idx=${ vo.b_idx }&page=${ param.page }&'">&nbsp;
				  </c:if>
		          <!-- 글주인 or 관리자만 활성화 -->
		   			<c:if test="${ (vo.user_idx eq user.user_idx) or (user.user_grade eq '관리자') }"><!-- request:vo | session:user -->
			   	      <input type="button" class="button special"  value="수정하기" 
		              			onclick="modify_form('${ vo.b_idx }');">&nbsp;
			   	      <input class="button alt" type="button" value="삭제하기" 
			   			onclick="delete_board('${ vo.b_idx }');">&nbsp;
		    		</c:if>
		              <input type="button" class="button"  value="목록보기" 
		              			onclick="location.href='list.do'">
		          </td>
		       </tr>
			</table>
		</form>
		
		<br><br>
			
		<!-- 댓글등록폼 -->
		<div class="row">
			<form action="">
				<div class="row uniform">
					<div class="12u$">
						<textarea id="cmt_content" placeholder="로그인 후에 댓글쓰기가 가능합니다" rows="6"></textarea>
						<input class="button comment" id="cmt_btn_register" type="button" value="댓글쓰기"
							onclick="comment_insert();">
					</div>
				</div>
			</form>
		</div>
		
		
		<hr>
			<!-- 댓글목록 출력 -->
		<div id="disp"></div>	
				
		</div><!-- end : inner -->
		
	
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
