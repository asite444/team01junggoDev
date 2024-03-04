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
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/assets/css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>




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
		width: 250px;
		display: block; 
		color: black;
		
		text-decoration: none;
		text-align: center;
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
   	
      margin-top: 10px;
      clear: both;
   }
   
   #title{
      text-align: center;
      font-size: 100px;
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
    
   	text-align: 
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
   
   
   #ser{
    width:600px;

   margin-left: 1050px;
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
	
	function login(){
	    
		   location.href="../user/login_form.do";
	}
</script>


<script type="text/javascript">

	//번역변수
	let g_p_idx;             //수정/삭제할 p_idx
	let g_p_filename;      // 다운로드할 파일명
	
 	function insert_form(){
	  
	  //로그인 여부 체크
	 if("${ empty user }"=="true"){
		  
		  if(confirm("사진등록은 로그인후에 이용가능합니다\n로그인하시겠습니까?")==false) return;
		  
		  //로그인폼으로 이동 : 현재위치=> /product/list.do
		  location.href="${ pageContext.request.contextPath}/user/login_form.do?url=" + encodeURIComponent(location.href) ;
		  
		  return;
	  } 
	  //사진등록폼으로 이동
	  location.href="${ pageContext.request.contextPath}/product/insert_form.do"; // productInsertFormAction
  }//end:insert_form()
  
  function send(){
	  
	  location.href="${ pageContext.request.contextPath}/user/login_form.do?url=" + encodeURIComponent(location.href) ;
	  
  }


</script>

</head>
<body>

	<jsp:include page="include/header.jsp"></jsp:include>
	<!-- Header -->


	<jsp:include page="include/menu.jsp"></jsp:include>

		


	<section id="main" class="wrapper">
	
			<ul id="dropdownmenu">
		<li class="mainmenu"><a href="${ pageContext.request.contextPath }/product/list.do?c_idx=0" >&emsp;&emsp;▶▶전체보기(카테고리별검색)▼</a>
		<ul>
					<li><a href="${ pageContext.request.contextPath }/product/list.do?c_idx=1" >가전</a></li>
					<li><a href="${ pageContext.request.contextPath }/product/list.do?c_idx=2" >도서</a></li>
					<li><a href="${ pageContext.request.contextPath }/product/list.do?c_idx=3" >운동</a></li>
					<li><a href="${ pageContext.request.contextPath }/product/list.do?c_idx=4">의류</a></li>
					<li><a href="${ pageContext.request.contextPath }/product/list.do?c_idx=5" >식품</a></li>
				</ul></li>
		</ul>
			<div id="ser" align="center"  >
					<select name="category" id="search" style="width:100px;  float:left; margin-top: 5px;" >
						<option value="all">전체보기</option>
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="subject_content">제목+내용</option>
					</select> <input type="text" id="search_text" class="form-control"value="${ param.search_text }" style="width: 150px;  float:left; margin-top: 5px; margin-left: 5px;" > 
							<a href="#" class="button" id="sb" onclick="find();"style= "float:left; margin-top: 5px; margin-left: 5px;">검색</a>
							<a href="#" class="button special" onclick="insert_form();" style= "float:left; margin-top: 5px; margin-left: 5px;">상품등록</a>
				</div>
		
						
	
	<form class="form-inline">
	<div id="box">
				<div id="product_box">
					<!-- 등록된 사진이 없으면  -->
					<c:if test="${ empty list }">
						<div
							style="color: red; text-align: center; margin-top: 190px; font-weight: bold;">
							등록된 사진이 없습니다</div>
					</c:if>

					<%-- <c:forEach begin="1"  end="20"> --%>
					<!-- for(productVo vo : list) 동일  -->
					<c:forEach var="vo" items="${ list }">
						<div class="product"
							onclick="location.href='${ pageContext.request.contextPath }/product/view.do?p_idx=${vo.p_idx}&page=${ empty param.page ? 1 : param.page }'">
							<img
								src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }">

							<p class="subject">
								제목:${ vo.p_subject }<br>가격 : ${vo.p_price }원 / 지역 : ${vo.p_local }<br>
								<span class="glyphicon glyphicon-heart" style="font-size: 25px; color: red"></span>관심도(${vo.p_hit })
							</p>

						</div>
					</c:forEach>
				</div>
				<div id="page" align="center" style="clear: both;">${ pageMenu }
				</div>
			</div>
				
		  </form>
	</section>
	
	
	<jsp:include page="include/footer.jsp"></jsp:include>


	<!-- Scripts -->
	<script src="${ pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/jquery.scrolly.min.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/skel.min.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/util.js"></script>
	<script src="${ pageContext.request.contextPath }/assets/js/main.js"></script>
	
	

       
	
</body>
</html>
