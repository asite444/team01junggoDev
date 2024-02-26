<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Daum 주소검색 API  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
  #box{
     width:600px;
     margin: auto;
     margin-top: 20px;
  }
  
</style>

<script type="text/javascript">

  
  
  
  function find_addr(){
	  
	  new daum.Postcode({
	        oncomplete: function(data) {
	            
	        	//data = {"zonecode":"13529", "address":"경기 성남시 분당구 판교역로 166","roadAddress":"",...}
	        	
	        	//주소창에서 선택된 주소값을 입력창에 넣어준다
	        	$("#mem_zipcode").val(data.zonecode);
	        	$("#mem_addr").val(data.roadAddress);
	        }
	  }).open();
	  
  }//end: find_addr()
  
  
  const regular_email = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
  
  function send(f){
	  
	  //폼에서 입력된값 체크...
	  let mem_name 		= f.mem_name.value.trim();
	  let mem_pwd  		= f.mem_pwd.value.trim();
	  let mem_email		= f.mem_email.value;
	  let mem_zipcode 	= f.mem_zipcode.value;
	  let mem_addr		= f.mem_addr.value;
	  
	  if(mem_name==''){
		  alert('이름을 입력하세요!');
		  f.mem_name.value='';
		  f.mem_name.focus();
		  return;
	  }
	  
	  if(mem_pwd==''){
		  alert('비밀번호를 입력하세요!');
		  f.mem_pwd.value='';
		  f.mem_pwd.focus();
		  return;
	  }
	  
	  if(regular_email.test(mem_email)==false){
		  
		  alert('이메일 형식이 틀립니다\n옳바른 형식으로 입력하세요!');
		  f.mem_email.value='';
		  f.mem_email.focus();
		  return;
	  }
	  
	  if(mem_zipcode==''){
		  alert('우편번호를 입력하세요!');
		  f.mem_zipcode.value='';
		  f.mem_zipcode.focus();
		  return;
	  }
	  
	  if(mem_addr==''){
		  alert('주소를 입력하세요!');
		  f.mem_addr.value='';
		  f.mem_addr.focus();
		  return;
	  }
	  
	  
	  f.action = "modify.do";//MemberModifyAction
	  f.submit();//전송
  }
  
  //jQuery초기화 
  $(document).ready(function(){
	  
	  //document.getElementById("mem_grade").value="${vo.mem_grade}";
	  $("#mem_grade").val("${vo.mem_grade}");
	  
	  
  });
  
  

</script>



</head>
<body>
	<form class="form-inline">
	    <input type="hidden"  name="mem_idx"  value="${ vo.mem_idx }">
		<div id="box">
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>::::회원수정::::</h4></div>
				<div class="panel-body">
				   <table class="table">
		              <tr>
		                 <th><label>이름</label></th>
		                 <td><input class="form-control"  readonly="readonly" name="mem_name" value="${ vo.mem_name }"></td>
		              </tr>		   
		              <tr>
		                 <th><label>아이디</label></th>
		                 <td>
		                    <input class="form-control" name="mem_id"  readonly="readonly" value="${ vo.mem_id }">
		                 </td>
		              </tr>		
		              <tr>
		                 <th><label>비밀번호</label></th>
		                 <td><input class="form-control"  type="password" name="mem_pwd" value="${ vo.mem_pwd }"></td>
		              </tr>		   
		              <tr>
		                 <th><label>이메일</label></th>
		                 <td><input class="form-control"  name="mem_email" value="${ vo.mem_email }"></td>
		              </tr>		   
		              <tr>
		                 <th><label>우편번호</label></th>
		                 <td>
		                     <input class="form-control"  name="mem_zipcode"  id="mem_zipcode" value="${ vo.mem_zipcode }">
		                     <input class="btn btn-info"  type="button"  value="주소검색"  onclick="find_addr();">
		                 </td>
		              </tr>		   
		              <tr>
		                 <th><label>주소</label></th>
		                 <td><input class="form-control"  name="mem_addr"  id="mem_addr" size="50" value="${ vo.mem_addr }"></td>
		              </tr>	
		              
		              <tr>
		                 <th><label>등급</label></th>
		                 <td>
		                     
		                     <!-- 관리자면 -->
		                     <c:if test="${ user.mem_grade eq '관리자' }">
			                     <select  class="form-control" name="mem_grade" id="mem_grade">
			                         <option value="일반">일반</option>
			                         <option value="관리자">관리자</option>
			                     </select>
		                     </c:if>
		                     
		                     <!-- 일반이면 -->
		                     <c:if test="${ user.mem_grade eq '일반' }">
		                         <input  class="form-control" name="mem_grade" value="일반" readonly="readonly">
		                     </c:if>
		                     
		                 </td>
		              </tr>		
		              
		              <tr>
		                  <td colspan="2" align="center">
		                          
		                        <input  class="btn  btn-primary" type="button"  value="회원수정"
		                                onclick="send(this.form);">  
		                        <input  class="btn  btn-success" type="button"  value="목록보기"
		                                onclick="location.href='list.do'">  
		                  
		                  </td>
		              </tr>
		              
		              
				   </table>
				</div>
			</div>
		</div>
	</form>	
</body>
</html>