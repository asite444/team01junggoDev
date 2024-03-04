<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
  #box{
     width: 800px;
     margin: auto;
     margin-top: 50px;
  }
  
  textarea {

	resize: none; 
  }

</style>

<script type="text/javascript">
  function  send(f){
	  
	  //입력사항체크(제목/내용/사진)
	  let p_subject 	= f.p_subject.value.trim();
	  let p_content 	= f.p_content.value.trim();
	  let photo		= f.photo.value;
	  let photo1		= f.photo1.value;
	  let photo2		= f.photo2.value;
	  let photo3		= f.photo3.value;
	  
	  if(p_subject==''){
		  alert('제목을 입력하세요!');
		  f.p_subject.value='';
		  f.p_subject.focus();
		  return;
	  }
	  
	  if(p_content==''){
		  alert('내용을 입력하세요!');
		  f.p_content.value='';
		  f.p_content.focus();
		  return;
	  }
	  
	  if(photo==''){
		  alert('사진을 선택하세요!');
		  return;
	  }
	
	  
	  
	  
	  f.action = "../product/insert.do";// PhotoInsertAction
	  f.submit();
	  
  }

</script>

</head>
<body>

<form method="POST"  enctype="multipart/form-data">
    <input type="hidden"  name="user_idx"   value="${ user.user_idx }">
    <input type="hidden"  name="p_idx"   value="${ vo.p_idx }">
   
	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading"><h4>제품등록</h4></div>
			<div class="panel-body">
			   <table class="table">
			   
			     		<tr>
			<th >카테고리</th>			
			<td><input type = "radio"  name="c_name"  value = "가전" checked="checked">가전
			      <input type = "radio"  name="c_name"    value = "도서" >도서
			      <input type = "radio"  name="c_name"   value = "운동" >운동
			      <input type = "radio"  name="c_name"   value = "의류" >의류
			      <input type = "radio"  name="c_name"   value = "식품" >식품</td>
			</tr>	
			   
			    <tr>
			          <th>제품명</th>
			          <td><input class="form-control" name="p_name"></td>
			       </tr>
			   
			    <tr>
			          <th>브랜드</th>
			          <td><input class="form-control" name="p_company"></td>
			       </tr>
			      <tr>
			          <th>가격</th>
			          <td><input class="form-control" name="p_price"></td>
			       </tr>
			   		<tr>
			          <th>지역</th>
			          <td><input class="form-control" name="p_local"></td>
			       </tr>
			   		
			   		<tr>
			<th >거래</th>			
			<td><input type = "radio"  name="p_deal"  value = "거래가능" checked="checked">거래가능
			      <input type = "radio"  name="p_deal"    value = "거래중" >거래중
			      <input type = "radio"  name="p_deal"   value = "거래완료" >거래완료</td>
			</tr>	
			   			
			<tr>
			<th >내고 </th>			
			<td><input type = "radio"  name="p_nego"  value = "내고가능" checked="checked">내고
			      <input type = "radio"  name="p_nego"   value = "내고없음" >내고없음</td>
			</tr>	
			<tr>
			<th >상태 </th>			
			<td><input type = "radio"  name="p_status"  value = "S" checked="checked">S
			      <input type = "radio"  name="p_status"   value = "A" >A
			      <input type = "radio"  name="p_status"   value = "B" >B
			      <input type = "radio"  name="p_status"   value = "C" >C</td>
			</tr>	
			   			
			       <tr>
			          <th>제목</th>
			          <td><input class="form-control" name="p_subject"></td>
			       </tr>
			       
			       <tr>
			          <th>내용</th>
			          <td>
			             <textarea  class="form-control" rows="10" cols="" name="p_content"></textarea>
			          </td>
			       </tr>
			       
			       <tr>
			          <th>사진</th>
			          <td><input type="file" class="form-control" name="photo"><br><input type="file" class="form-control" name="photo1"><br><input type="file" class="form-control" name="photo2"><br><input type="file" class="form-control" name="photo3"></td>
			          
			       </tr>
			       
			       <tr>
			          <td colspan="2" align="center">
			              <input class="btn btn-success" type="button" value="등록하기" 
			                     onclick="send(this.form);">
			                      
			              <input class="btn btn-info"    type="button" value="메인화면" 
			                     onclick="location.href='${ pageContext.request.contextPath}/product/list.do'"> 
			          </td>
			       </tr>
			       
			   </table>
			</div>
		</div>
	</div>
</form>
</body>
</html>