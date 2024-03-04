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
	<!-- Bootstrap 3.x -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
   
   function send(f){
	     
	   //ID/PWD체크
	   let user_id  = f.user_id.value.trim();
	   let user_pwd = f.user_pwd.value.trim();
	   
	   if(user_id==''){
		   alert("아이디를 입력하세요!");
		   f.user_id.value='';
		   f.user_id.focus();
		   return;
	   }
	   
	   if(user_pwd==''){
		   alert("비밀번호를 입력하세요!");
		   f.user_pwd.value='';
		   f.user_pwd.focus();
		   return;
	   }
	  
	   
	   f.action="login.do"; // UserLoginAction
	   f.submit();
   }

</script>



<script type="text/javascript">
  
  //$(document).ready(function(){});
  
  window.onload=function(){
	  
	 //show_message();
	 
	 setTimeout(show_message,100);
	 
  };

  function show_message(){
	  // login_form.do?reason=fail_id
			  
	  if("${ param.reason eq 'fail_id'}"=="true"){
		  alert("아이디가 틀렸습니다");
	  }
	  
	  // login_form.do?reason=fail_pwd
			  
	  if("${ param.reason eq 'fail_pwd'}"=="true"){
		  alert("비밀번호가 틀렸습니다");
	  }
	  
	  // login_form.do?reason=session_timeout
			  
	  if("${ param.reason eq 'session_timeout'}"=="true"){
		  alert("로그아웃상태입니다\n로그인 하세요");
	  }
	  
  }
  
</script>

	
	
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

					<form >
						<div class="row uniform">
							<div class="6u 12u$(xsmall)">
								<input type="text" name="user_id" id="user_id" value="${ user_id }"
									placeholder="ID">
								<div data-lastpass-icon-root="true" 
									style="position: relative !important; height: 0px !important; width: 0px !important; float: left !important;"></div>
							</div>
							<div class="6u$ 12u$(xsmall)">
								<input type="password" name="user_pwd" id="user_pwd" value="${ user_pwd }">
							</div>
							
							<!-- Break -->
							<div class="12u$">
								<ul class="actions">
									<li>
										<input type="submit" value="Login"
												onclick="send(this.form);">
									</li>
									<li>
										<input type="reset" value="Home" class="alt"
												onclick="location.href='../main.jsp'">
									</li>
									<li>
										<input type="reset" value="Join Us" class="button special"
												onclick="location.href='insert_form.do'">
									</li>
								</ul>
							</div>
						</div>
					</form>
		</div>
	</section>

					

					


</body>
</html>
