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
	  let p_subject = f.p_subject.value.trim();
	  let p_content = f.p_content.value.trim();
	  let photo		= f.photo.value;
	  let photo1		= f1.photo1.value;
	  let photo2		= f2.photo2.value;
	  let photo3		= f3.photo3.value;
	  
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
	  if(photo1==''){
		  alert('사진을 선택하세요!');
		  return;
	  }
	  if(photo2==''){
		  alert('사진을 선택하세요!');
		  return;
	  }
	  if(photo3==''){
		  alert('사진을 선택하세요!');
		  return;
	  }
	  
	  
	  
	  f.action = "${ pageContext.request.contextPath}/product/insert.do";// PhotoInsertAction
	  f.submit();
	  
  }

</script>

</head>
<body>

<form method="POST"  enctype="multipart/form-data">
    <input type="hidden"  name="user_idx"   value="${ user.user_idx }">
    

	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading"><h4>사진등록</h4></div>
			<div class="panel-body">
			   <table class="table">
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
			              <input class="btn btn-primary" type="button" value="등록하기" 
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