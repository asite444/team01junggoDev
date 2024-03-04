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
	
	function direct_Buy() {
		
      let p_idx="${vo.p_idx}";
	    if("${ vo.p_deal}"== "결제완료"){
	    	   
	    	   alert('이미 거래 완료된 상품입니다.');
	    	   return;
	       }
	    
	    if("${ vo.p_deal}"== "거래중"){
	    	   
	    	   alert('거래가 진행중인 상품입니다.');
	    	   return;
	       }
		location.href="direct_payment_list_form.do?p_idx="+p_idx;
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

#weather{
	
	padding: 0%;
	width: 2500px;
	height: 700px;
}


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
width: 1000px; 
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

float:left;
} 

#local{
width: 400px;
height: 30px;
font-size: 20px;
margin-top: 5px; 
margin-left: 50px;

float:left;

}

#name{
width: 400px;
height: 30px;
font-size: 20px;
margin-top: 5px; 
margin-left: 50px;

float:left;


}
#state{
width: 400px;
height: 30px;
font-size: 20px;
margin-top: 5px; 
margin-left: 50px;
	float:left;
}

#bo{
width: 1px;
height: 30px;
border: 1px solid #D8D8D8;
float: left;
}


   #box{
      	width: 2500px;
      
   		padding-top: 0%;
   		
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

#bu{

width: 400px; 
height: 60px; 
margin-top: 50px; 
margin-left: 50px;"

}
	


</style>
<script type="text/javascript">


	  
    //로그인(아웃)상태 체크	  
	  function add_cart(){
		  
		    if("${ vo.p_deal}"== "결제완료"){
		    	   
		    	   alert('이미 거래 완료된 상품입니다.');
		    	   return;
		       }
		    
		    if("${ vo.p_deal}"== "거래중"){
		    	   
		    	   alert('거래가 진행중인 상품입니다.');
		    	   return;
		       }
	       //로그인(아웃)상태 체크	  
	       if("${ empty user }" == "true"){
	    	   
	    	   if(confirm("장바구니 등록은 로그인후 가능합니다\n로그인하시겠습니까?") == false)return;
	    	   
	    	   //현재 주소
	    	   const url = location.href;
	    	   //alert(url);
	    	   
	    	   //로그인 폼으로 이동                             charset생략시 현재 pageEncoding을 설정    
	    	  location.href="${ pageContext.request.contextPath}/user/login_form.do?url" +  encodeURIComponent(url , "utf-8");
	    	   
	    	   return;
	       }
	       
	       
	       
	       
	   
	       //Ajax처리(장바구니 등록)
	       $.ajax({
	    	   
	    	   url			:	"cart_insert.do",  // CartInsertAction  : cart_insert.do?p_idx=5&mem_idx=1 
	    	   data		:	{"p_idx":"${ vo.p_idx }" ,"user_idx": "${ user.user_idx }"   },
	    	   dataType	:	"json",
	    	   success	:	function(res_data){
	    		   
	    		   if(res_data.result == 'exist'){
	    			   alert("현재상품은 이미 장바구니에 담겨져있습니다");
	    			   return;
	    		   }
	    		   
	    		   if(res_data.result == 'success'){
	    			   
	    			   if(confirm("장바구니에 상품을 등록했습니다\n장바구니보기로 이동하시겠습니까?")==false)return;
	    			   
	    			   //장바구니 보기
	    			   location.href="cart_list.do";
	    		   }
	    	   },
	    	   error	:	function(err){
	    		  
	    		   alert(err.responseText);
	    	   }
	    	   
	       });
	       
	       
	  }


</script>





<script type="text/javascript">

	function del(p_idx){
		
		if(confirm("해당 상품을 삭제하시겠습니까?")==false) return;
		
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

   <h1 id="title"> 중고로Go </h1>
		
			<div id="weather">

			<div id="cat">
			 <div id="list">
				<img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }" style="width: 120px; height: 100px; margin-top:50px;border: 1px solid black;"  />
				<img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename1 }" style="width: 120px; height: 100px; margin-top: 3px; border: 1px solid black;"  />
				<img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename2 }" style="width: 120px; height: 100px; margin-top: 3px; border: 1px solid black;"  />
				<img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename3 }" style="width: 120px; height: 100px; margin-top: 3px; border: 1px solid black;"  />
			</div>
			</div>
	
			<div class="movieinfo">
			<div id="product" align="center" >
				<img src="${ pageContext.request.contextPath }/upload/${ vo.p_filename }" id="img1" style="width: 500px; height: 450px; margin-top: 50px;"/>
				<%-- <input type="button" class="btn btn-success" value="다운로드" onclick="download('${vo.p_filename}');"> --%>
				<c:if test="${ (vo.user_idx eq user.user_idx) or (user.user_grade eq '관리자') }">	
       			<input type="button" class="btn btn-info"  value="수정"onclick="modify_form(${vo.p_idx});"> 
       			<input type="button" class="btn btn-warning"  value="삭제" onclick="del(${vo.p_idx});"> 
       			</c:if>     
       			<input type="button" class="btn btn-danger"  value="메인화면" onclick="location.href='list.do?page=${page}'">
			</div>
			</div>
			<div id="cate">카테고리 ${ vo.c_idx }</div>
			<div id="sub">제품명 : ${ vo.p_subject }</div>
			<div id="con">설명 : ${ vo.p_content }</div>
			<div id="price">가격 : ${ vo.p_price }원</div>
		
			<div id="line"></div>
			<div id="time"><div id="tim" class="glyphicon glyphicon-heart" style="font-size: 40px; color: red"></div>${vo.p_hit }<b>(${ vo.p_deal })</b></div>
		
			<div id="local">지역</div>
			<div id="bo"></div>
			<div id="name">판매자</div>
			<div id="bo"></div>
			<div id="state">제품상태</div>
			
	 		<div id="local">${ vo.p_local }</div>
	 		<div id="bo"></div>
			<div id="name">${ user_name }</div>
			<div id="bo"></div>
			<div id="state">${ vo.p_status }</div> 

			<c:if test="${ (vo.user_idx ne user.user_idx)}">	
			<input type="button" class="btn btn-info"  		style="width: 600px; height: 60px; margin-top: 80px; margin-left: 50px;"   value="위시리스트 담기" 	onclick="add_cart();"/>
			<input type="button" class="btn btn-warning"  style="width: 200px; height: 60px; margin-top: 80px; margin-left: 10px;" value="위시리스트 보기" 	onclick="location.href='cart_list.do'"/> 
			<input type="button" class="btn btn-success" 	style="width: 400px; height: 60px; margin-top: 80px; margin-left: 10px;" value="바로구매" 			onclick="direct_Buy();"/> 
		   	</c:if>
		   
		  	<c:if test="${ (vo.user_idx eq user.user_idx)}">	
		  	<input disabled="disabled" type="button" class="btn btn-info"  style="width: 600px; height: 60px; margin-top: 80px; margin-left: 50px;"   value="위시리스트 담기" 	onclick="add_cart();"/>
			<input type="button" class="btn btn-warning"  style="width: 200px; height: 60px; margin-top: 80px; margin-left: 10px;" value="위시리스트 보기" 	onclick="location.href='cart_list.do'"/> 
			<input disabled="disabled" type="button" class="btn btn-success" 	style="width: 400px; height: 60px; margin-top: 80px; margin-left: 10px;" value="바로구매" 			onclick="direct_Buy();"/>
			</c:if>
			<div id="line1"></div>
		</div>
</body>
</html>