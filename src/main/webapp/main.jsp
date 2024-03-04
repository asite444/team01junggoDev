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
<link rel="stylesheet" href="assets/css/main.css">
<!-- Bootstrap 3.x -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

<script type="text/javascript">
	function login(){
	    
		   location.href="user/login_form.do";
	}
</script>

<style type="text/css">
	#query{ 
	margin: auto;
	width: 800px; }
</style>

</head>
<body>

   
<jsp:include page="include/header.jsp"></jsp:include>
	<!-- Header -->


	<jsp:include page="include/menu.jsp"></jsp:include>
	
	<!-- Banner -->
	<section id="banner">
		<div class="content" style="height: 350px">
		
			<!-- <h1>☆Wellcome SecondHand Shop!!☆</h1>
			<p>
				어서오세요!
				반갑슴둥
				<br>
				Look around ours shop!!!!
			</p>
			<ul class="actions">
				<li><a href="#one" class="button scrolly">Get Started</a></li>
			</ul>  -->
		</div>
	</section>
	
	
	<!-- Search -->
		<!-- <form method="post" action="#">
			<div class="row uniform">
				<div class="9u 12u$(small)">
					<input type="text" name="query" id="query" value="매물검색"
						placeholder="Query">
				</div>
				<div class="3u$ 12u$(small)">
					<input type="submit" value="Search" class="fit">
				</div>
			</div>
		</form> -->
	<hr>	
	
	<!-- One -->
	<section id="one" class="wrapper">
		<div class="inner flex flex-3">
			<div class="flex-item left">
				<div>
					<h3><a href="category.jsp">Category</a></h3>
					<p>
						디지털기기, 유아동,뷰티/미용,여성의류/잡화 | 남성패션/잡화,가구/인테리어/생활가전/생활/주방,
						<br> 
						가공식품,스포츠 레저/취미/게임/음반,식물/반려동물용품,도서/유아도서,기타 중고물품
					</p>
				</div>
				<div>
					<h3>인기매물</h3>
					<p>
						가전제품/접시그릇세트 | 명품가방/신발
				        <br> 
						 
					</p>
				</div>
			</div>
			<div class="flex-item image fit round">
				<img src="images/joonggo5.png" alt="" width="330" height="330">
			</div>
			<div class="flex-item right">
				<div>
					<h3>중고 거래 금지물품</h3>
					<p>
						기호식품(담배,주류등),의약품, 시력교정 제품,저작권 침해제품<br>
						소분된식품,화장품샘플,소분된화장품,면세품, 모의총포, 헌혈증 등등
					</p>
				</div>
				<div>
					<h3>안심거래존</h3>
					<p>
						이제 안심거래존에서 안전거래하세요!!<br>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Two -->
	<section id="two" class="">
		<div class="inner">
			<h2>안심거래존</h2>
			<figure>
				<blockquote>
					안심거래존이 신설되었습니다. 많은 이용부탁드립니다.
				</blockquote>
				<footer>
					
				</footer>
			</figure>
		</div>
	</section>
	<!-- Three -->
	<section id="three" class="wrapper">
		<div class="inner flex flex-3">
			<div class="flex-item box">
				<div class="image fit">
					<img src="images/joonggo6.jpg" alt="" width="418" height="200">
				</div>
				<div class="content">
					<h3>1:1안심거래</h3>
					<p>1:1 안심거래 수칙을 준수하면서 거래하세요</p>
				</div>
			</div>
			<div class="flex-item box">
				<div class="image fit">
					<img src="images/joonggo10.png" alt="" width="418" height="200">
				</div>
				<div class="content">
					<h3>거래금지품목</h3>
					<p>거래금지 품목을 확인해주세요</p>
				</div>
			</div>
			<div class="flex-item box">
				<div class="image fit">
					<img src="images/joonggo7.jpg" alt="" width="418" height="200">
				</div>
				<div class="content">
					<h3>안심거래존</h3>
					<p>안심거래존에서 보다 안전한거래를 하세요</p>
				</div>
			</div>
		</div>
	</section>
	
	
	<!-- Footer -->
	<footer id="footer">
			
			<span><b style="color: white;" ></b>공동대표 임동현 민수진 주도윤 정상균 | <b style="color: white;"></b>사업자번호 123-00-00000</span>
			<div><b style="color:  white"></b>직업정보제공사업 신고번호 K1200020200016</div>
			<div><b style="color: white;"></b>주소 서울 강남구 서초대로 77길 41 5층(중고로고서비스)</div>
			<span><b style="color: white;"></b>전화 1500-1500 | <b style="color: white;"></b>고객문의 kor@ict.com</span>
			
			<div>
			<b>
			  <a href="#">이용약관</a> |	<a href="#">개인정보사용방침</a> | <a href="#">청소년보호정책</a>
			</b></div>
			
			
			
			
			<!-- <ul class="actions">
				<li><span class="icon fa-phone"></span> (02)4321-1234</li>
				<li><span class="icon fa-envelope"></span> <a href="#">information@ict.com</a></li>
				<li><span class="icon fa-map-marker"></span>(06611) 서울 강남구 서초대로 77길 41 5층</li>
			</ul> -->
			
			
		
	</footer>
	
	
	<div class="copyright">
		<ul class="icons">
				<li><a href="https://twitter.com/" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="https://www.facebook.com/" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="https://www.instagram.com/" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="https://github.com/" class="icon fa-github"><span class="label">Github</span></a></li>
				<li><a href="https://dribbble.com/" class="icon fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="https://www.tumblr.com/" class="icon fa-tumblr"><span class="label">Tumblr</span></a></li>
				<li><a href="https://www.youtube.com/" class="icon fa-youtube"><span class="label">Youtube</span></a></li>
			</ul>
	</div>
	

	
</body>
</html>
