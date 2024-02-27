<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE HTML>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Generic - Intensify by TEMPLATED</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/main.css">

<style type="text/css">
	.mainmenu{
		float: left;
		width: 100px;
	
		
		text-align: left;
		list-style-type: none;
		font-family: 'SejonghospitalBold';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/SejonghospitalBold.woff2') format('woff2');
   		font-weight: 700;
    	font-style: normal;
    	
	}
	
	li.mainmenu ul{
		margin: 0px;
		list-style-type: none;
		text-align:center;
		padding: 0px;
		position: absolute;
	}
	
	.mainmenu a{
 		background : white; 
		width: 150px;
		display: block; 
		color: black;
		
		text-decoration: none;
		text-align:left;
		border-bottom: 1px solid #ffffff;
	}
	
	ul#dropdownmenu li a:hover {
		background-color: pink;
	}
</style>

<style type="text/css">

   #box{
      width:2002px;
   		margin: auto; 
   		border: 1px solid black;
      margin-top: 10px;
      clear: both;
   }
   
   #title{
      text-align: center;
      font-size: 30px;
      font-weight: bold;
      color: black;
      text-shadow: 1px 1px 2px black; 
   }
   
   /* id selector  */
   .product_box{
      height: 700px;
      margin-top: 500px;
      border: 1px solid gray;
      
  /* order: 2px solid black; */
   }
   
   .image_box{
   	width:2000px;
    height: 400px;
   	margin: 50px;
  	background: #ffffff;
    border: 1px solid black;
   	
   }
   
   /* class selector */
   .product{
    width: 260px;
    height: 210px;
    margin-bottom:100px;
    margin-left: 60px;
    margin-right: 71px;
    margin-top: 70px;
    float:left;
   }
   
   .product:hover{
      border-color:  pink;
   }
   
   /* child selector */
   .product > img{
    width: 260px;
    height: 210px;
    border: 1px solid gray;
    outline: 1px solid black; 
   }
   
    .product> img:hover{
      border-color:  pink;
   }
  
    .product > p{
      /* border: 1px solid gray; */
      padding: 5px;
        font-family: 'JalnanGothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
      /* box-shadow: 1px 1px 1px black; */
      font-size: 15px;
   } 
   
   .subject{
     /*  border: 1px solid gray; */
   
      margin-top: 5px;
  /* box-shadow: 1px 1px 1px black; */
      font-size: 12px;
       font-family: 'JalnanGothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/JalnanGothic.woff') format('woff');
   	font-weight: normal;
    font-style: normal;
     overflow: hidden;
	 white-space: nowrap;
	  text-overflow: ellipsis;
	  word-break: break-all;
   }
   
   #price{
   margin: 0px;
   padding: 0px;;
    font-size: 20px;
   }
  
    .subject:hover{
      border-color:  pink;
   }
   
   /* attribute selector */
   input[type='button']{
      width: 80px;
   }
   
   #str{
   width: 2000px;
   margin-top: 50px;
   border: 1px solid gray;
   margin-left: 270px;
   }
   
   #foo{
    margin-left: 270px;
   
   font-size: 40px;
   }
   
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		if("${ not empty param.search}" == "true"){
			$("#search").val("${ param.search}");
			}
			
			//전체보기면 검색어 지워라
			if("${ param.search eq 'all' }"=="true"){
				
				$("#search_text").val("");
			}
		
		$("li.mainmenu ul").hide(); //하위메뉴 숨기기
		
		$("li.mainmenu").hover(function(){
			// 자신의 자식요소중에 ul요소 화면에 보이기
			$("ul",this).show(1);
			//$("ul",this).slideDown(500);
			//$("ul",this).fadeIn(1000);
		}, function(){
			$("ul",this).hide(1);
		});
		                          //  마우스올라가면   내려가면
		//$("li.mainmenu").hover(function(){},function(){});
		
	});
	
	function find(){
		
		let search = $("#search").val();
		let search_text = $("#search_text").val().trim();
		
		if(search!='all' && search_text == ''){
			alert("검색어를 입력하세요!!");
			$("#search_text").val("");
			$("#search_text").focus();
			return;
		}
		location.href="${ pageContext.request.contextPath}/product/list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text,"utf-8");
	}
	
</script>


<script type="text/javascript">

	//번역변수
	let g_p_idx;             //수정/삭제할 p_idx
	let g_p_filename;      // 다운로드할 파일명
	
 	function insert_form(){
	  
	  //로그인 여부 체크
	 /*  if("${ empty user }"=="true"){
		  
		  if(confirm("사진등록은 로그인후에 이용가능합니다\n로그인하시겠습니까?")==false) return;
		  
		  //로그인폼으로 이동 : 현재위치=> /product/list.do
		  location.href="${ pageContext.request.contextPath}/user/login_form.do";
		  
		  return;
	  } */
	  //사진등록폼으로 이동
	  location.href="${ pageContext.request.contextPath}/product/insert_form.do"; // productInsertFormAction
  }//end:insert_form()
  

</script>

</head>
<body>

	<!-- Header -->
	<form class="form-inline">
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="main.jsp" class="logo">◈◈◈◈ 중고로Go ◈◈◈◈</a>
		
	
		
	<ul id="dropdownmenu">
		<li class="mainmenu">
			<a href="#">도서</a>
			<ul>
				<li><a href="#">프로그램</a></li>
				<li><a href="#">여행</a></li>			
				<li><a href="#">역사</a></li>
				<li><a href="#">자기개발</a></li>
				<li><a href="#">잡지</a></li>
			</ul>
		</li>
		<li class="mainmenu">
			<a href="#">화장품</a>
			<ul>
				<li><a href="#">SK-II</a></li>
				<li><a href="#">아리따움</a></li>
				<li><a href="#">설화수</a></li>				
			</ul>
		</li>
		
		<li class="mainmenu">
			<a href="#">가전제품</a>
			<ul>
				<li><a href="#">냉장고</a></li>
				<li><a href="#">휴대폰</a></li>
				<li><a href="#">세탁기</a></li>				
			</ul>
		</li>
		<li class="mainmenu">
			<a href="#">스포츠</a>
			<ul>
				<li><a href="#">자전거</a></li>
				<li><a href="#">유니폼</a></li>
				<li><a href="#">운동화</a></li>
				<li><a href="#">운동기구</a></li>				
			</ul>
		</li>
		<li class="mainmenu">
			<a href="#">게임</a>
			<ul>
				<li><a href="#">플레이스테이션</a></li>
				<li><a href="#">닌텐도스위치</a></li>
				<li><a href="#">PC게임</a></li>
				<li><a href="#">XBOX</a></li>				
			</ul>
		</li>
	</ul>
		<nav class="right">
		<%-- <c:if test="${ empty sessionScope.user }">
			<input type="reset" value="Join Us" class="button special" onclick="location.href='/SecondhandMarket/user/user_insert_form.jsp'">
			<input type="submit" value="Login" onclick="send(this.form);">
			</c:if>
			 --%>
			<c:if test="${ not empty sessionScope.user }">
			<b>${ user.mem_name }</b>님 환영합니다 
			<a href="#" class="button alt" onclick="location.href='${ pageContext.request.contextPath}/user/logout.do'">로그아웃</a>
			</c:if>
			<a href="#" class="button alt" onclick="insert_form();"> 상품등록</a>
	
				 <div id="ser" align="right" style="margin-bottom: 5px;">
   					<select id="search" class="form-control">
							<option value="all">전체보기</option>
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="subject_content">제목+내용</option>
					</select>
					<input id="search_text" class="form-control" value="${ param.search_text }">
					<a href="#" class="button"  onclick="find();" >검색</a>
					</div>
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
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>
	
	
	<section id="main" class="wrapper">
	
			
	<div id="box">
	<div id="image_box">
		<img src="../images/aa.png" alt="My Image"  width="2000">
	</div>
		<div id="product_box">
 
      <!-- 등록된 사진이 없으면  -->
      <c:if test="${ empty list }">
         <div style="color:red; text-align: center; margin-top: 190px; font-weight: bold;">
            등록된 사진이 없습니다
         </div>
      </c:if>
      
      <%-- <c:forEach begin="1"  end="20"> --%>
      <!-- for(productVo vo : list) 동일  -->
      <c:forEach var="vo"  items="${ list }">   
         <div class="product" onclick="location.href='view.do?p_idx=${vo.p_idx}&page=${ empty param.page ? 1 : param.page }'">
            <img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }">
            
            <p class="subject">제목:${ vo.p_subject }<br>가격/지역<br><span class="glyphicon glyphicon-heart">관심도</span></p>
           
         </div>
      </c:forEach>
   </div>
			 <div id="page" align="center"  style="clear:both;">
	${ pageMenu }
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
	</form>
	<c:forEach var="vo"  items="${ weatherlist }">   
       		<div id="weather" align="center">오늘의 날씨
        	<c:if test="${ (vo.icon eq '01d') }">
           	<div><img src="../images/01d.png">상태 : 맑음&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '02d') }">
           	<div><img src="../images/02d.png">상태 : 약간흐림&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '03d') }">
           	<div><img src="../images/03d.png">상태 : 흐림&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '04d') }">
           	<div><img src="../images/04d.png">상태 : 매우흐림&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '09d') }">
           	<div><img src="../images/09d.png">상태 : 약한비&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '10d') }">
           	<div><img src="../images/10d.png">상태 : 비&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '11d') }">
           	<div><img src="../images/11d.png">상태 : 번개&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '13d') }">
           	<div><img src="../images/13d.png">상태 : 눈&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '50d') }">
           	<div><img src="../images/50d.png">상태 : 안개&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
         </div>
   </c:forEach>


       
	
</body>
</html>
