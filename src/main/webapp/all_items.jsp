<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="${ pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/jquery.scrolly.min.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/skel.min.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/util.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/main.js"></script>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	

<link rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/main.css">

<style type="text/css">


@font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
  
}

#prod_img{
	width: 500px;
	heigth: 400px;
	margin-left: 100px;
	margin-top: 50px;
	margin-bottom: 50px;
	
	 float:left;
}



.content{
width: 500px;
heigth: 400px;
font-family: 'NPSfontBold';
margin-top: 150px;
float:left;

}


#subject{
font-family: 'NPSfontBold';
font-size: 35px;
}

#pcontent{
font-family: 'NPSfontBold';
font-size: 25px;
}

#price{
font-family: 'NPSfontBold';
font-size: 30px;
}

#local{
font-family: 'NPSfontBold';
font-size: 20px;
}


#so{
font-family: 'NPSfontBold';

}


#footer{
clear:both;

}

#heart{
	
width: 30px;
heigth: 40px;



	
}

.main_image {
    position: relative;
  }
  .main_image_text {
    position: absolute;
    font-size: 10px;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
    color: white;
  }

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
function login(){
	
	 location.href="../user/login_form.do?url=" + encodeURIComponent(location.href) ;
	
}



</script>




</head>
<body>
 <jsp:include page="include/header.jsp"></jsp:include>
 <jsp:include page="include/menu.jsp"></jsp:include>

	
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>전체매물(조회수별)</h1>
				<p>
					디지털기기, 유아동,뷰티/미용,여성의류/잡화 | 남성패션/잡화,가구/인테리어/생활가전/생활/주방,가공식품,
					<br>
					스포츠 레저/취미/게임/음반,식물/반려동물용품,도서/유아도서,기타 중고물품
				</p>
			</header>
	<section id="main" class="wrapper">
	<form class="form-inline">
	<div id="box">
				<div id="product_box">
					<!-- 등록된 사진이 없으면  -->
					<c:if test="${ empty list }">
						<div
							style="color: red; text-align: center; margin-top: 190px; font-weight: bold;">
							등록된 사진이 없습니다</div>
					</c:if>
					<c:forEach var="vo" items="${ list }">
						<div class="product"
							onclick="location.href='${ pageContext.request.contextPath }/product/view.do?p_idx=${vo.p_idx}&page=${ empty param.page ? 1 : param.page }'">
							<img id="prod_img"
								src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }">
						<div class="content">
							<div id="subject"> 제목 : ${ vo.p_subject }</div>&emsp;&emsp;&emsp;&emsp;
							<div id="pcontent">설명 : ${ vo.p_content }</div>&emsp;&emsp;&emsp;&emsp;
							<div id="price">가격 : ${ vo.p_price }원 </div>&emsp;&emsp;&emsp;&emsp;
							<div id="local">지역 : ${ vo.p_local }</div><br>
							<span class="glyphicon glyphicon-heart" style="font-size: 40px; color: red"></span>${vo.p_hit }
																						
						
						</div>
						</div>
					</c:forEach>
				</div>
			</div>
		  </form>
	</section>
	</div>
	</section>
	<!-- Footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
