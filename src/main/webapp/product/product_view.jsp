<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
	float: left;
		width: 80px;
		list-style-type: none;
		font-family: 'SejonghospitalBold';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/SejonghospitalBold.woff2') format('woff2');
   		font-weight: 700;
    	font-style: normal;
 	position: relative;
   
    	
	}
	
	li.mainmenu ul{
		margin: 1px;
		list-style-type: none;
		padding: 0px;
		position: absolute;
	}
	
	.mainmenu a{
 		background : white; 
		width: 300px;
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


.container > img {
  position: absolute;
  width:  120px;
  height: 100px; 
	margin-left: 43px;
  transform: translate(-50%, -50%);
}

#maincon{
	margin-left: 300px;
margin-top: 30px;
font-size: 30px;

}

/* img{
	width: 500px;
	height: 450px;
	border: 1px solid black;
	margin:auto;
	margin-top: 50px;
	background: #ffffff;	
	
} */

#product{
	margin-left: 20px;
	width: 520px;
	height: 600px;
	margin-top: 50px;
	border: 1px solid black;
	float: left;
}

#cate{
width: 1200px;
height: 30px;
font-size: 20px;
margin-top: 150px; 
margin-left: 50px;

	float: left;

}
#sub{
width: 1200px;
height: 30px;
font-size: 25px;
margin-left: 50px;
margin-top:10px; 

	float: left;
}

#con{
width: 1200px;
height: 30px;
font-size: 25px;
margin-top: 10px; 
margin-left: 50px;

	float: left;

}
#price{
width: 1200px;
height: 30px;
font-size: 30px;
margin-top: 10px; 
margin-left: 50px;

	float: left;

}


#line{
width: 1220px;
height: 1px;
border: 1px solid #D8D8D8;
margin-top: 10px; 
margin-left: 50px;

	float: left;

}


#time{
width: 1200px;
height: 30px;
font-size: 20px;
margin-top: 5px; 
margin-left: 50px;

	float: left;

}

#local{
width: 400px;
height: 30px;
font-size: 20px;
margin-top: 5px; 
margin-left: 50px;

	float: left;

}

#name{
width: 400px;
height: 30px;
font-size: 20px;
margin-top: 5px; 
margin-left: 50px;

	float: left;


}
#state{
width: 400px;
height: 30px;
font-size: 20px;
margin-top: 5px; 
margin-left: 50px;
	float: left;

}

#bo{
width: 1px;
height: 30px;
border: 1px solid #D8D8D8;
float: left;
}


   #box{
      	width:2000px;
   	
   	
		margin: auto;
  
   }
   
   #title{
      text-align: center;
      font-size: 30px;
      font-weight: bold;
      color: black;
      text-shadow: 1px 1px 2px black; 
   }

	#cat{
	 	
	margin-left: 300px;
	width: 120px;
	height: 600px;
	margin-top: 70px;
	float: left;
	
	}
	
#line1{
width: 2000px;
height: 2px;
border: 1px solid #D8D8D8;
margin-top: 170px; 
margin-left:270px;
}
#footer{
	margin-left: 300px;
margin-top: 10px;
font-size: 30px;

}



	


</style>




<script type="text/javascript">


	  
    //로그인(아웃)상태 체크	  
	  function add_cart(){
		 
	       //Ajax처리(장바구니 등록)
	       $.ajax({
	    	   
	    	   url			:	"api.do",  // CartInsertAction  : cart_insert.do?p_idx=5&mem_idx=1 
	    	   data		:	{"p_idx":"${ vo.p_idx }" ,"mem_idx": "${ user.mem_idx }"   },
	    	   dataType	:	"json",
	    	   success	:	function(res_data){
	    		  
	    		   $("#weather").html(res_data);
	    	   },
	    	   error	:	function(err){
	    		   
	    		   alert(err.responseText);
	    	   }
	    	   
	       });
	       
	       
	  }

	  function photo(){
			 
	       //Ajax처리(장바구니 등록)
	       $.ajax({
	    	   
	    	   url			:	"view.do",  // CartInsertAction  : cart_insert.do?p_idx=5&mem_idx=1 
	    	   data		:	{"p_idx":"${ vo.p_idx }" ,"mem_idx": "${ user.mem_idx }"   },
	    	   dataType	:	"json",
	    	   success	:	function(res_data){
	    		  
	    		   $("#product").html(res_data);
	    	   },
	    	   error	:	function(err){
	    		   
	    		   alert(err.responseText);
	    	   }
	    	   
	       });
	       
	       
	  }
</script>

<script type="text/javascript">

	function download(p_filename){
		
		 location.href="../FileDownload.do?dir=/upload/&filename=" + encodeURIComponent(p_filename, "utf-8");
		 
	}
	
	function del(p_idx){
		
		
		if(confirm("정말 삭제할꺼니?")==false) return;
		
		location.href="delete.do?p_idx=" + p_idx;
		
	}
	
	function modify_form(p_idx){
		
		location.href="modify_form.do?p_idx=" + p_idx + "&page=" + ${param.page};
		
	}

</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//span요소 감추기 

		
		// mybtn은 버튼 처럼 클릭하게 
		$(".mybtn").click(function(){
			$("#list").slideToggle(1000);
		});
		
		// 이미지에 마우스오버되면
				// 뿌옇게 보이게 설정
		$("#list img").hover(
				function(){
					$(this).css("opacity",0.25);
				}, function(){
					$(this).css("opacity",1);
				});
		// li 에 마우스 올라오면 영화정보를 
		// 보여주게 설정
		
		$("#list img").hover(function(){
			//$(".movieinfo").show();
	        // 마우스 오버된 img의 src속성값얻기
			//var src = $(this).find("img").attr("src");
	        //        this의 자식요소(img)알아낸다. 
	       
	        var src = $(this).attr("src");
	 
			//console.log(src);
			$("#img1").attr("src",src);
		}
		);
		
		
	});
</script>
</head>
<body>

<div id="box" align="center">
   <h1 id="title">◈◈◈◈ 중고로Go ◈◈◈◈</h1>
  
<%--    <div style="text-align: right">
   	
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
              --%>

	
					
				


 
   <%-- 현재 컨텍스트 경로 : ${ pageContext.request.contextPath } --%>


</div>


				<div id="weather"></div>

			<div id="cat">
			 <div id="list">
				<img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }" style="width: 120px; height: 100px; margin-top:50px;border: 1px solid black;" onclick="photo();" />
				<img src="${ pageContext.request.contextPath }/upload/02d.png" style="width: 120px; height: 100px; margin-top: 3px; border: 1px solid black;" onclick="photo();" />
				<img src="${ pageContext.request.contextPath }/upload/03d.png" style="width: 120px; height: 100px; margin-top: 3px; border: 1px solid black;" onclick="photo();" />
				<img src="${ pageContext.request.contextPath }/upload/04d.png" style="width: 120px; height: 100px; margin-top: 3px; border: 1px solid black;" onclick="photo();" />
			</div>
			</div>
	
		
			<div class="movieinfo">
			<div id="product" align="center" >
				<img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }" id="img1" style="width: 500px; height: 450px; margin-top: 50px;"/>
				<%-- <input type="button" class="btn btn-success" value="다운로드" onclick="download('${vo.p_filename}');"> --%>
       			<input type="button" class="btn btn-info"  value="수정"onclick="modify_form(${vo.p_idx});"> 
       			<input type="button" class="btn btn-warning"  value="삭제" onclick="del(${vo.p_idx});">      
       			<input type="button" class="btn btn-danger"  value="메인화면" onclick="location.href='list.do?page=${page}'">
			</div>
			</div>
			<div id="cate">카테고리</div>
			<div id="sub">제품명 : ${ vo.p_subject }</div>
			<div id="con">${ vo.p_content }</div>
			<div id="price">가격</div>
		
			<div id="line"></div>

			<div id="time" > <span class="glyphicon glyphicon-heart">관심도</span></div>
			<div id="local">지역</div>
			<div id="bo"></div>
			<div id="name">판매자</div>
			<div id="bo"></div>
			<div id="state">제품상태</div>
			
			<div id="local">경기</div>
			<div id="bo"></div>
			<div id="name">${ vo.mem_name }</div>
			<div id="bo"></div>
			<div id="state">제품상태</div>
			
			<input type="button" class="btn btn-info"  style="width: 500px; height: 60px; margin-top: 50px; margin-left: 50px; "value="관심중고"/>
			<input type="button" class="btn btn-success"  style="width: 700px; height: 60px; margin-top: 50px; margin-left: 10px;"value="바로구매"/>
			
			<div id="line1"></div>
			<div id="maincon" >${ vo.p_content }</div>
			<div id="line1"></div>
			<div id="footer">footer</div>
</body>
</html>