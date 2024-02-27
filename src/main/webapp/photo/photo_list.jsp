<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

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
		
		location.href="list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text,"utf-8");
		
	}
	
	
	
	
	
	
</script>
<style type="text/css">
	.mainmenu{
		float:left;
		width: 80px;
		list-style-type: none;
		font-family: 'SejonghospitalBold';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/SejonghospitalBold.woff2') format('woff2');
   		font-weight: 700;
    	font-style: normal;
	}
	
	li.mainmenu ul{
		margin: 0px;
		list-style-type: none;
		padding: 0px;
		position: absolute;
	}
	
	.mainmenu a{
 		background : white; 
		width: 200px;
		display: block; 
		color: black;
		text-decoration: none;
		padding: 10px;
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
   .photo_box{
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
   .photo{
    width: 260px;
    height: 210px;
    margin-bottom:100px;
    margin-left: 60px;
    margin-right: 71px;
    margin-top: 70px;
    float:left;
   }
   
   .photo:hover{
      border-color:  pink;
   }
   
   /* child selector */
   .photo > img{
    width: 260px;
    height: 210px;
    border: 1px solid gray;
    outline: 1px solid black; 
   }
   
    .photo> img:hover{
      border-color:  pink;
   }
  
    .photo > p{
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


	//번역변수
	let g_p_idx;             //수정/삭제할 p_idx
	let g_p_filename;      // 다운로드할 파일명
  
	



	
	
  function insert_form(){
	  
	  //로그인 여부 체크
	  if("${ empty user }"=="true"){
		  
		  if(confirm("사진등록은 로그인후에 이용가능합니다\n로그인하시겠습니까?")==false) return;
		  
		  //로그인폼으로 이동 : 현재위치=> /photo/list.do
		  location.href="../member/login_form.do";
		  
		  return;
	  }
		
	  //사진등록폼으로 이동
	  location.href="insert_form.do"; // PhotoInsertFormAction
		  
	  
  }//end:insert_form()
  
  function show_detail(p_idx){
	  
	  //alert(p_idx+" 상세보기");
	  
	  //Ajax이용 p_idx에해당되는 사진정보 가져와서
	  $.ajax({
		  url		:	"photo_one.do",//PhotoOneAction
		  data		:	{"p_idx":p_idx},
		  dataType	:	"json",
		  success	:	function(res_data){
			  //res_data={"p_idx":1,"p_subject":"제목","p_content":"내용","mem_idx":3}
			 
			  g_p_idx        = res_data.p_idx;
			  g_p_filename = res_data.p_filename;
			  
			   //팝업창
			    $("#myModal").modal({backdrop: "static" });
			 
			   $("#btn_popup_download").hide();
			   $("#btn_popup_update").hide();
			   $("#btn_popup_delete").hide();
			   
			   //로그인이 된경우
			   if("${ not empty user }"=="true"){
				   //다운로드버튼
				   $("#btn_popup_download").show();
			   }
			   
			   //로그인유저가 관리자인 경우
			   if("${ user.mem_grade eq '관리자' }" == "true"){
				   $("#btn_popup_update").show();
				   $("#btn_popup_delete").show();
			   }
			   
			   //사진올린사람이 로그인유저와 동일한경우
			   if( "${ user.mem_idx }" == res_data.p_idx){
				   $("#btn_popup_update").show();
				   $("#btn_popup_delete").show();
			   }
			   			   
			   $("#popup_title").html(res_data.p_subject);
			   $("#popup_content").html(res_data.p_content);
			   $("#popup_regdate").html("올린날짜 : " + res_data.p_regdate);
			   $("#popup_p_name").html("작 성 자 : " +res_data.p_name);
			   
			   //<img id="popup_image" src="">
			   $("#popup_image").attr("src","../upload/" + res_data.p_filename)
			   
		  },
		  error		:	function(err){
			  alert(err.responseTex);
		  }
		  
	  });//end:ajax

	}
</script>


</head>
<body>
<!-- Modal창 -->

<form class="form-inline">
<div id="box">
   <h1 id="title">◈◈◈◈ 중고로Go ◈◈◈◈</h1>
   
  
   <div style="text-align: right">
   	
      <!-- 로그인안된경우 -->
      <c:if test="${ empty sessionScope.user }">
          <input class="btn btn-info"  type="button"  value="회원가입" 
                 onclick="location.href='${ pageContext.request.contextPath}/member/insert_form.do'">
                 
          <input class="btn btn-warning"  type="button"  value="로그인" 
                 onclick="location.href='${ pageContext.request.contextPath}/member/login_form.do'">
      </c:if>
      
      <!-- 로그인이된경우 -->
      <c:if test="${ not empty sessionScope.user }">
          <b>${ user.mem_name }</b>님 환영합니다 
          <input class="btn btn-warning"  type="button"  value="로그아웃" 
                 onclick="location.href='../member/logout.do'">
      </c:if>
      <input class="btn btn-success"  type="button"  value="상품등록" 
             onclick="insert_form();">       
             
            
   </div>


					
				


 
   <%-- 현재 컨텍스트 경로 : ${ pageContext.request.contextPath } --%>
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
	
	 <div id="ser" align="right" style="margin-bottom: 5px;">
   <select id="search" class="form-control">
							<option value="all">전체보기</option>
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="subject_content">제목+내용</option>
					</select>
					
					<input id="search_text" class="form-control" value="${ param.search_text }">
					<input type="button"  value="검색" class="btn btn-info" onclick="find();">
					</div>
	
	
</div>
<div id="box">
	<div id="image_box">
		<img src="../image/aa.png" alt="My Image"  width="2000">
	</div>

   <div id="photo_box">
 
      <!-- 등록된 사진이 없으면  -->
      <c:if test="${ empty list }">
         <div style="color:red; text-align: center; margin-top: 190px; font-weight: bold;">
            등록된 사진이 없습니다
         </div>
      </c:if>
      
      <%-- <c:forEach begin="1"  end="20"> --%>
      <!-- for(PhotoVo vo : list) 동일  -->
      <c:forEach var="vo"  items="${ list }">   
         <div class="photo" onclick="location.href='view.do?p_idx=${vo.p_idx}&page=${ empty param.page ? 1 : param.page }'">
            <img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }">
            
            <p class="subject">제목:${ vo.p_subject }<br>가격/지역<br><span class="glyphicon glyphicon-heart">관심도</span></p>
           
         </div>
      </c:forEach>
   </div>
   
   <div id="page" align="center"  style="clear:both;">
	${ pageMenu }
</div>
   </div>
  
</form>
<div id="str"></div>
<div id="foo" >footer</div>


     	    <c:forEach var="vo"  items="${ weatherlist }">   
       		<div id="weather" align="center">오늘의 날씨
        	<c:if test="${ (vo.icon eq '01d') }">
           	<div><img src="../image/01d.png">상태 : 맑음&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '02d') }">
           	<div><img src="../image/02d.png">상태 : 약간흐림&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '03d') }">
           	<div><img src="../image/03d.png">상태 : 흐림&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '04d') }">
           	<div><img src="../image/04d.png">상태 : 매우흐림&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '09d') }">
           	<div><img src="../image/09d.png">상태 : 약한비&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '10d') }">
           	<div><img src="../image/10d.png">상태 : 비&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '11d') }">
           	<div><img src="../image/11d.png">상태 : 번개&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '13d') }">
           	<div><img src="../image/13d.png">상태 : 눈&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '50d') }">
           	<div><img src="../image/50d.png">상태 : 안개&ensp;온도 : ${ vo.temp  }ºC&ensp;습도 : ${ vo.humidity }%</div>
           	</c:if>
         </div>
   </c:forEach>
       
  

     







</body>
</html>