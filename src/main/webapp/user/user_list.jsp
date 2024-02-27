 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE HTML>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>1조 TeamProject</title>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../assets/css/main.css">

<script type="text/javascript">
	function login(){
	    
		   location.href="user_login_form.jsp";
	}
</script>
<style type="text/css">
	#query{ 
	margin: auto;
	width: 800px; }
</style>

</head>
<body>

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="main.jsp" class="logo">중고로Go</a>
		<nav class="right">
			<c:if test="${ empty sessionScope.user }">
				<input class="button alt" value="Login"
					onclick="login();">
			</c:if>

			<!-- 로그인이 됐을경우 : 세션영역에 user가 있는가?  -->
			<c:if test="${ not empty sessionScope.user }">
				<b>${ sessionScope.user.user_name }</b>님 환영합니다!!
			<input class="button alt" type="button" value="Logout"
					onclick="location.href='user/logout.do'">
					
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
			<li>
				<input class="button fit" value="Login" 
						onclick="login();" >			
			</li>
		</ul>
		
		
	</nav>
	<!-- Banner -->
	<section id="banner">
		<div class="content">
			<h1>☆Wellcome SecondHand Shop!!☆</h1>
			<p>
				어서오세요!
				반갑슴둥
				<br>
				Look around ours shop!!!!
			</p>
			<ul class="actions">
				<li><a href="#one" class="button scrolly">Get Started</a></li>
			</ul>
		</div>
	</section>
	
	<!-- <hr>
	Search
		<form method="post" action="#">
			<div class="row uniform">
				<div class="9u 12u$(small)">
					<input type="text" name="query" id="query" value="매물검색"
						placeholder="Query">
				</div>
				<div class="3u$ 12u$(small)">
					<input type="submit" value="Search" class="fit">
				</div>
			</div>
		</form>
	<hr>	 -->
	
	<!-- One -->
	<section id="one" class="wrapper">
	<h2 id="title" align="center">👪👨‍👩‍👧‍👦‍회원목록👪👨‍👩</h2>
	
	
	
	
	
	
	<table class="table">
		<!-- head부분 -->
		<tr class="success">
			<th>회원번호</th>
			<th>회원이름</th>
			<th>아이디</th>
			<th>아이피</th>
			<th>가입(갱신)일자</th>
			<th>회원등급</th>
			<th>편집</th>
		</tr>
		<!-- Data출력 -->
		<!-- for(UserVo vo: list)  -->
		<c:forEach var="vo" items="${ list }">
			<tr><!-- EL은 값을 얻어서 출력(표현,조회만)하는 언어 -->
				<td>${ vo.user_idx  }</td><!-- GETTER로 호출(EL표기법) -->
				<td>${ vo.user_name  }</td>
				<td><span id="user_id">${ vo.user_id  }</span></td>
				<td>${ vo.user_ip  }</td>
				<td>${ fn:substring(vo.user_regdate,0,10)  }<br>(${ fn:substring(vo.user_modifydate,0,10)})</td>
				<td>${ vo.user_grade  }</td>
				<td>
					<!-- 3개의 버튼이 활성화되는 조건:(로그인한 유저가 관리자) 또는 로그인 본인 -->
					<c:if test="${ (user.user_grade eq '관리자') or (user.user_idx == vo.user_idx) }">
					
					<input class="btn btn-info" type="button" value="수정"
					        onclick="location.href='modify_form.do?user_idx=${ vo.user_idx }'">
					<input class="btn btn-warning" type="button" value="삭제" onclick="del('${ vo.user_idx }')"> <!-- 삭제할고객 -->
					
					<input class="btn btn-success" type="button" value="보기"
					       onclick="location.href='view.do?user_idx=${ vo.user_idx }'">       
					
					</c:if>
				</td>
		     </tr>
	   </c:forEach>
	</table>
	
	
		
		
		
		
		
		
		
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
		Powered by: <a href="https://templated.co/">TEMPLATED</a>
	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>
