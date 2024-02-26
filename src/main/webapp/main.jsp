 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	function login(){
	    
		   location.href="user/user_login_form.jsp";
	}
</script>

</head>
<body>

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="main.jsp" class="logo">중고로Go</a>
		<nav class="right">
			<input class="button alt" value="Login"
					onclick="login();">
		</nav>
	</header>
	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="main.jsp">Home</a></li>
			<li><a href="all_items.jsp">전체매물</a></li>
			<li><a href="category.jsp">Category</a></li>
			<li><a href="board/list.do">community</a></li>
			<li><a href="generic.jsp">Generic</a></li>
			<li><a href="elements.jsp">Elements</a></li>
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
	
	<hr>
	<!-- Search -->
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
						 조회수 count로 10개 가져오기
						 <br> 
						 조회수 count로 10개 가져오기
					</p>
				</div>
			</div>
			<div class="flex-item image fit round">
				<img src="images/pic01.jpg" alt="" width="330" height="330">
			</div>
			<div class="flex-item right">
				<div>
					<h3>Tempus nullam</h3>
					<p>
						Sed adipiscing ornare risus. Morbi estes<br> blandit sit et
						amet, sagittis magna.
					</p>
				</div>
				<div>
					<h3>Suscipit nibh dolore</h3>
					<p>
						Pellentesque egestas sem. Suspendisse<br> modo ullamcorper
						feugiat lorem.
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Two -->
	<section id="two" class="wrapper style1 special">
		<div class="inner">
			<h2>Feugiat lorem</h2>
			<figure>
				<blockquote>
					"Morbi in sem quis dui placerat ornare. Pellentesque odio nisi,
					euismod in, pharetra<br> magna etiam lorem ultricies in diam.
					Sed arcu cras consequat."
				</blockquote>
				<footer>
					<cite class="author">Jane Anderson</cite> <cite class="company">CEO,
						Untitled</cite>
				</footer>
			</figure>
		</div>
	</section>
	<!-- Three -->
	<section id="three" class="wrapper">
		<div class="inner flex flex-3">
			<div class="flex-item box">
				<div class="image fit">
					<img src="images/pic02.jpg" alt="" width="418" height="200">
				</div>
				<div class="content">
					<h3>Consequat</h3>
					<p>Placerat ornare. Pellentesque od sed euismod in, pharetra
						ltricies edarcu cas consequat.</p>
				</div>
			</div>
			<div class="flex-item box">
				<div class="image fit">
					<img src="images/pic03.jpg" alt="" width="418" height="200">
				</div>
				<div class="content">
					<h3>Adipiscing</h3>
					<p>Morbi in sem quis dui placerat Pellentesque odio nisi,
						euismod pharetra lorem ipsum.</p>
				</div>
			</div>
			<div class="flex-item box">
				<div class="image fit">
					<img src="images/pic04.jpg" alt="" width="418" height="200">
				</div>
				<div class="content">
					<h3>Malesuada</h3>
					<p>Nam dui mi, tincidunt quis, accu an porttitor, facilisis
						luctus que metus vulputate sem magna.</p>
				</div>
			</div>
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

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
