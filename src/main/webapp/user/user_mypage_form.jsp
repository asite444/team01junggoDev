<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>1조 TeamProject</title>

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
<!-- Bootstrap 3.x -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Daum 주소검색 API  -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
#query {
	margin: auto;
	width: 800px;
}

#box {
	width: 800px;
	margin: auto;
}

/* .parent {
display: grid;
grid-template-columns: repeat(5, 1fr);
grid-template-rows: repeat(5, 1fr);
grid-column-gap: 0px;
grid-row-gap: 0px;
}

.div1 { grid-area: 1 / 1 / 3 / 2; }
.div2 { grid-area: 1 / 2 / 3 / 3; }
.div3 { grid-area: 3 / 1 / 5 / 2; }
.div4 { grid-area: 3 / 2 / 5 / 3; }
 */
</style>

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
	function login() {

		location.href = "../user/login_form.do?url="
				+ encodeURIComponent(location.href);
	}
</script>

<script type="text/javascript">
	
</script>



</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->


	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- Menu -->


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






	<form>

		<input type="hidden" name="user_idx" value="${ vo.user_idx }">
		<div id="box">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 id="title" align="center">🛠️🛠️MY PAGE🛠️🛠️</h2>
				</div>
				<hr class="major">
				<div class="panel-body">

					<%-- <div class="parent">
						<div class="div1" style="text-align: center;"><label>결제내역</label><br><input class="btn-dander" type="button" value="바로가기"
								onclick="location.href='../product/pay_list_form.jsp'"></div>
						<div class="div2" style="text-align: center;"><label>장바구니</label><input class="button special" type="button" value="바로가기"
								onclick="location.href='../product/cart_list.jsp'"></div>
						<div class="div3" style="text-align: center;"><label>나의정보수정</label><input class="btn btn-primary" type="button" value="바로가기"  
						        onclick="location.href='modify_form.do?user_idx=${ vo.user_idx }'"></div>
						<div class="div4" style="text-align: center;"><label>커뮤니티 활동내역</label><input class="button special" type="button" value="바로가기"
								onclick="location.href='../board/board_list.jsp'"></td></div>
					</div> --%>

					<table class="table">
						<tr>
							<th><label>결제내역</label></th>
							<td><input class="button alt" type="button" value="payment"
								onclick="location.href='../product/pay_list_form.do'" style="width: 250px">

							</td>
						</tr>
						<tr>
							<th><label>WISHLIST</label></th>
							<td><input class="button alt" type="button" value="WISHLIST"
								onclick="location.href='../product/cart_list.do'" style="width: 250px; text-align: center;"></td>
						</tr>

						<tr>
							<th><label>나의정보수정</label></th>
							<td><input class="button alt" type="button"
								value="My Profile"
								onclick="location.href='modify_form.do?user_idx=${ vo.user_idx }' " style="width: 250px; text-align: center;">

							</td>

						</tr>

						<tr>
							<th><label>MyCommunity</label></th>
							<td><input class="button alt" type="button" value="MyCommunity"
								onclick="location.href='../board/list.do?category=name&search_text=${user.user_name}'"  style="width: 250px; text-align: center;"></td>

						</tr>
						
						
						<tr>
							<th><label>QnA</label></th>
							<td><input class="button alt" type="button" value="QnA"
								onclick="location.href='../board/qna_list.do?category=name&search_text=${user.user_name}&community_page=3'"  style="width: 250px; text-align: center;"></td>

						</tr>

					</table>
				</div>
			</div>
		</div>
	</form>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<!-- Footer -->







</body>
</html>