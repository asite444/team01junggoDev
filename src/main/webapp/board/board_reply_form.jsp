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
	function login(){
	    
		   location.href="../user/login_form.do?url=" + encodeURIComponent(location.href) ;
	}
   function send(f) {

		//입력사항체크(제목/내용/사진)
		let b_subject = f.b_subject.value.trim();
		let b_content = f.b_content.value.trim();
		

		if (b_subject == '') {
			alert('제목을 입력하세요!');
			f.b_subject.value = '';
			f.b_subject.focus();
			return;
		}

		if (b_content == '') {
			alert('내용을 입력하세요!');
			f.b_content.value = '';
			f.b_content.focus();
			return;
		}
		if (confirm("답글을 입력하시겠습니까?")==false)return;

		f.action = "reply.do";// /board/reply.do  <- BoardController
		f.submit();

	}
</script>
<style type="text/css">
th{
	font-size: 20px;
}
</style>

</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->
	
	
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>community</h1>
				<p>
					<b>
						<a href="../board/list.do?community_page=1&">커뮤니티</a> | <a href="notice_list.do?community_page=2&">Notice</a> | <a href="qna_list.do?community_page=3&">Q&A</a>
					</b>
				</p>
			</header>
				<div class="image fit">

				</div>
			<br>
			<br>
		<hr>
			<br>
		
			<h1>답글달기</h1>
			
			<br>
			
	<form action="form-inline">
		<input type="hidden"  name="user_idx"   value="${ user.user_idx }">
		<input type="hidden"  name="b_idx"   value="${ param.b_idx }">
	  	<input type="hidden"  name="user_name"  value="${ user.user_name }">
	  	<input type="hidden"  name="community_page"   value="${ param.community_page }"><!-- param에서 -->
		<input type="hidden"  name="community_page"   value="${ community_page }"><!-- controller에서 -->
	<table class="table-wrapper">
		<tr>
			<th colspan="2">▶<b>${ vo.b_subject }</b>◀ 글의 답글</th>
		</tr>
	      <tr>
	         <th>제목</th>
	         <td><input class="query" type="text" name="b_subject"></td>
	      </tr>
	      <tr>
	         <th>내용</th>
	         <td><textarea class="message" rows="5" name="b_content" ></textarea></td>
	      </tr>
	      
	      <tr>
	         <td colspan="2" align="center">
	             <input type="button" class="button special" value="답글달기" 
	             			onclick="send(this.form);">
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
