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
<title>Join</title>
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

<script type="text/javascript">

  $(document).ready(function(){
	  
	  //ID입력창에서 키가눌렸다 떼어지면
	  $("#user_id").keyup(function(event){
		  
		  //가입버튼기능 disabled
		  $("#btn_register").attr("disabled", true);
		  
		  let user_id = $(this).val();
		  //console.log(mem_id);
		  if(user_id.length<3){
			  $("#id_msg").html("아이디는 3자리 이상입력하세요").css("color","red");
			  return;
		  }
		  
		  //Ajax이용해서 중복아이디 체크
		  $.ajax({
			  url		:	"check_id.do",      //MemberCheckIdAction
			  data		:	{"user_id": user_id}, //parameter  -> check_id.do?mem_id=one
			  dataType	:	"json",           //결과값의 Data Type
			  success	:	function(res_data){
				  // res_data = {"result": true}  or {"result": false}
				  if(res_data.result){
					  //사용가능한 아이디
					  $("#id_msg").html("사용가능한 아이디입니다").css("color","blue");
					  
					  //가입버튼 활성화
					  $("#btn_register").attr("disabled", false);
				  }else{
					  //이미사용중인 아이디
					  $("#id_msg").html("이미 사용중인 아이디입니다").css("color","red");
				  }
			  },
			  error		:	function(err){
				  
				  alert(err.responseText);
			  }
			  
		  });
		  
	  });//end: keyup
	  
  });//end: $(document).ready()
  
  
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
	  let user_email    = f.user_email.value;
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
		  
		  alert('이메일 형식이 틀립니다\n옳바른 형식으로 입력하세요!');
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
	  
	  
	  f.action = "insert.do";//UserInsertAction
	  f.submit();//전송
	  
  }
  
  

</script>
	
</head>
<body>
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h2>회원가입</h2>			
			</header>
			

			<hr class="major">
			
			<!-- Form -->
			<h2>모두 입력해주세요</h2>

			<form>
				<div class="row uniform">
					<table>
					<tr>
						<th>이름</th>
						<td>
							<div class="6u 12u$(xsmall)">
							<input type="text" name="user_name"  value="${ user_name }">
							</div>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<div class="6u 12u$(xsmall)">
							<input type="text" name="user_id" id="user_id" value="${ user_id }"
								placeholder="ID">
							<div data-lastpass-icon-root="true"
								style="position: relative !important; height: 0px !important; width: 0px !important; float: left !important;"></div>
							</div>
							<span id="id_msg"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<div class="6u$ 12u$(xsmall)">
								<input type="password" name="user_pwd" id="user_pwd" value="${ user_pwd }"
										placeholder="Password">
							</div>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<div class="6u 12u$(xsmall)">
							<input type="text" name="user_email"  value="${ user_email }">
							</div>
						</td>
					</tr>
					<tr>
		                 <th><label>우편번호</label></th>
		                 <td>
		                 	<div class="6u 12u$(xsmall)">
		                     <input type="text"  name="user_zipcode"  id="user_zipcode">
		                     <input type="button"  value="주소검색"  onclick="find_addr();">
		                     </div>
		                 </td>
		              </tr>	
					<tr>
						<th>주소</th>
						<td>
							<input type="text" name="user_addr"  value="${ user_addr }">
						</td>
					</tr>
					

					
					<tr>
						<td colspan="2" align="center">
							<!-- Break -->
							<div class="12u$">
								<ul class="actions">
									<li>
										<input type="reset" value="Join In" class="button special"
												onclick="send(this.form);">
									</li>
									<li>
										<input type="reset" value="Home" class="alt"
												onclick="location.href='/SecondhandMarket/main.jsp'">
									</li>
									
								</ul>
							</div>
						</td>
					<tr>
				</table>
				</div>
			</form>
		</div>
	</section>

					

					


</body>
</html>
