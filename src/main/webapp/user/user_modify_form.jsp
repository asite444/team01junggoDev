<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>

<title>1조 TeamProject</title>

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

<!-- Daum 주소검색 API  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
  #query{ 
	margin: auto;
	width: 800px; 
	}
	
  #box{
  	width: 800px;
  	margin: auto;
  
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
	    
		   location.href="login_form.do";
	}
</script>

<script type="text/javascript">

  
  
  
  function find_addr(){
	  
	  new daum.Postcode({
	        oncomplete: function(data) {
	            
	        	//data = {"zonecode":"13529", "address":"경기 성남시 분당구 판교역로 166","roadAddress":"",...}
	        	
	        	//주소창에서 선택된 주소값을 입력창에 넣어준다
	        	$("#user_zipcode").val(data.zonecode);
	        	$("#user_addr").val(data.roadAddress);
	        }
	  }).open();
	  
  }//end: find_addr()
  
  
  const regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
  
  function send(f){
	  
	  //폼에서 입력된값 체크...
	  let user_name 	= f.user_name.value.trim();
	  let user_pwd  	= f.user_pwd.value.trim();
	  let user_email	= f.user_email.value;
	  let user_zipcode 	= f.user_zipcode.value;
	  let user_addr		= f.user_addr.value;
	  
	  if(user_name==''){
		  alert('이름을 입력하세요!');
		  f.user_name.value='';
		  f.user_name.focus();
		  return;
	  }
	  
	  if(user_pwd==''){
		  alert('비밀번호를 입력하세요!');
		  f.user_pwd.value='';
		  f.user_pwd.focus();
		  return;
	  }
	  
	  if(regular_email.test(user_email)==false){
		  
		  alert('이메일 형식이 틀립니다\n올바른 형식으로 입력하세요!');
		  f.user_email.value='';
		  f.user_email.focus();
		  return;
	  }
	  
	  if(user_zipcode==''){
		  alert('우편번호를 입력하세요!');
		  f.user_zipcode.value='';
		  f.user_zipcode.focus();
		  return;
	  }
	  
	  if(user_addr==''){
		  alert('주소를 입력하세요!');
		  f.user_addr.value='';
		  f.user_addr.focus();
		  return;
	  }
	  
	  
	  f.action = "modify.do";//UserModifyAction
	  f.submit();//전송
  }
  
  //jQuery초기화 
  $(document).ready(function(){
	  
	  //document.getElementById("user_grade").value="${vo.user_grade}";
	  $("#user_grade").val("${vo.user_grade}");
	  
	  
  });
  
  

</script>



</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->
	
	
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- Menu -->
	
	
	<!-- Banner -->
	<!-- <section id="banner">
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
	</section> -->
	
	
		
		


	<form>
		
	    <input type="hidden"  name="user_idx"  value="${ vo.user_idx }">
		<div id="box">
			<div class="panel panel-primary">
				<div class="panel-heading"><h2 id="title" align="center">🛠️🛠️회원정보수정🛠️🛠️</h2></div>
				<hr class="major">
				<div class="panel-body">
				   <table class="table">
						<tr>
							<th><label>이름</label></th>
							<td>
								<div class="6u 12u$(xsmall)">
									<input type="text" readonly="readonly" name="user_name" value="${ vo.user_name }">
								</div>
							</td>
						</tr>
						<tr>
		                 <th><label>아이디</label></th>
		                 <td>
		                    <input type="text" name="user_id"  readonly="readonly" value="${ vo.user_id }">
		                 </td>
		              </tr>		
		              <tr>
		                 <th><label>비밀번호</label></th>
		                 <td><input class="form-control"  type="password" name="user_pwd" value="${ vo.user_pwd }"></td>
		              </tr>		   
		              <tr>
		                 <th><label>이메일</label></th>
		                 <td><input class="form-control" type="text" name="user_email" value="${ vo.user_email }"></td>
		              </tr>		   
		              <tr>
		                 <th><label>우편번호</label></th>
		                 <td>
		                     <input class="form-control"  type="text"    name="user_zipcode"  id="user_zipcode" value="${ vo.user_zipcode }">
		                     <input class="btn btn-info"  type="button"  value="주소검색"  onclick="find_addr();">
		                 </td>
		              </tr>		   
		              <tr>
		                 <th><label>주소</label></th>
		                 <td><input class="form-control" type="text"  name="user_addr"  id="user_addr" size="50" value="${ vo.user_addr }"></td>
		              </tr>	
		              
		              <tr>
		                 <th><label>등급</label></th>
		                 <td>
		                 
		                     
		                     <!-- 관리자면 -->
		                     <c:if test="${ user.user_grade eq '관리자' }">
			                     <select  class="form-control"    name="user_grade" id="user_grade">
			                         <option value="일반">일반</option>
			                         <option value="관리자">관리자</option>
			                     </select>
		                     </c:if>
		                     
		                     <!-- 일반이면 -->
		                     <c:if test="${ user.user_grade eq '일반' }">
		                         <input  class="form-control" type="text" name="user_grade" value="일반" readonly="readonly">
		                     </c:if>
		                     
		                 </td>
		              </tr>		
		              
		              <tr>
		                  <td colspan="2" align="center">
		                          
		                        <input  class="button special" type="button"  value="회원수정"
		                                onclick="send(this.form);">  
		                        <input  class="button alt" type="button"  value="목록보기"
		                                onclick="location.href='list.do'">  
		                  
		                  </td>
		              </tr>
		              
		              
				   </table>
				</div>
			</div>
		</div>
	</form>	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	
	
	
	
	
	
</body>
</html>