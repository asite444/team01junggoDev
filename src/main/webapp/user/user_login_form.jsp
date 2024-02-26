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
<title>Generic - Intensify by TEMPLATED</title>
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
	
</head>
<body>
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>로그인</h1>			
			</header>
			

			<hr class="major">
			
					<!-- Form -->
					<h3>로그인을 해주세요</h3>

					<form method="post" action="#">
						<div class="row uniform">
							<div class="6u 12u$(xsmall)">
								<input type="text" name="id" id="id" value="${ user_id }"
									placeholder="ID">
								<div data-lastpass-icon-root="true"
									style="position: relative !important; height: 0px !important; width: 0px !important; float: left !important;"></div>
							</div>
							<div class="6u$ 12u$(xsmall)">
								<input type="password" name="password" id="password" value="${ user_pwd }">
							</div>
							
							<!-- Break -->
							<div class="12u$">
								<ul class="actions">
									<li>
										<input type="submit" value="Login"
												onclick="list.do">
									</li>
									<li>
										<input type="reset" value="Home" class="alt"
												onclick="location.href='/SecondhandMarket/main.jsp'">
									</li>
									<li>
										<input type="reset" value="Join Us" class="button special"
												onclick="location.href='/SecondhandMarket/user/user_insert_form.jsp'">
									</li>
								</ul>
							</div>
						</div>
					</form>
		</div>
	</section>

					

					


</body>
</html>
