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
	}
</script>

<style type="text/css">
th{
	font-size: 50px;
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
			       onclick="location.href='logout.do'">
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
						<a href="board_community.jsp">커뮤니티</a> | <a href="board_notice.jsp">Notice</a> | <a href="board_qna.jsp">Q&A</a>
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
	          <!-- 글주인 or 관리자만 활성화 -->
	   	<c:if test="${ (vo.user_idx eq user.user_idx) or (user.user_grade eq '관리자') }"><!-- request:vo | session:user -->
		   	      <input type="button" class="button special"  value="새글쓰기" 
	              			onclick="send(this.form)">
		   	      <input class="button alt" type="button" value="삭제하기" 
		   			onclick="delete_board('${ vo.b_idx }');">
	    </c:if>
	              <input type="button" class="button"  value="목록보기" 
	              			onclick="location.href='list.do'">
	          </td>
	       </tr>
		</table>
		</form>
			
				
				
		
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
