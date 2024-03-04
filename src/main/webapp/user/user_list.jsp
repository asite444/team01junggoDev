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
<!-- Bootstrap 3.x -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	//  quickmenu의 top 이 얼마인지 알아오자
		var top = 
		parseInt($("#quickmenu").css("top"));
		$("#quickmenu").css("top",130);
	
		
	// 스크롤 되어질때 quickmenu의 속성값도 이동하게 설정
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		
					
		var quickTop = top + scrollTop;
		
	
		
		//$("#quickmenu").animate({top:quickTop},1);
		$("#quickmenu").css("top",quickTop+100);
	});
});
	function login(){
	      
		   location.href="../user/login_form.do?url=" + encodeURIComponent(location.href) ;
	   }
</script><!-- 로그인 후 원래 있던 페이지로 넘김  -->

<style type="text/css">
	#query{ 
	margin: auto;
	width: 800px; 
	}
	
	.table-wrapper{
	width: 1200px;
	text-align: center;
	margin-left: 1000px; 
	}
	
	
	
	
	
	
</style>

<script type="text/javascript">

	function del(user_idx) {
		
		//삭제확인
		if(confirm("정말 삭제하시겠습니까?")==false) return;
		
		//삭제처리
		location.href = "delete.do?user_idx=" + user_idx; //UserDeleteAction
		
	}


</script>

</head>
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->
	
	
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- menu -->
	
	
	<!-- Banner -->
	<!-- <section id="banner">
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
	</section> -->
	
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
	
	
	
	
	<form>
	<input type="hidden"  name="url" value="${param.url}">
	<div class="table-wrapper">
	<table class="table" >
		<!-- head부분 -->
		<tr class="success" >
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
					
					<input class="button special" type="button" value="수정"
					        onclick="location.href='modify_form.do?user_idx=${ vo.user_idx }'">
					<input class="btn-danger" type="button" value="삭제" onclick="del('${ vo.user_idx }')"> <!-- 삭제할고객 -->
					
					<%-- <input class="btn btn-success" type="button" value="보기"
					       onclick="location.href='view.do?user_idx=${ vo.user_idx }'"> --%>       
					
					</c:if>
				</td>
		     </tr>
	   </c:forEach>
	</table>
	</div>
</form>
	
  </section>
  
   
   <jsp:include page="../include/footer.jsp"></jsp:include>
   <!-- Footer -->
	
	
</body>
</html>
