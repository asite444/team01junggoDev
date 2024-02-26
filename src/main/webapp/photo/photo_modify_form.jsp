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
     width: 500px;
     margin: auto;
     margin-top: 50px;
  }
  
  img{
     width: 200px;
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
	  
	 
	 	f.action = "modify.do";// PhotoModifyAction
	  f.submit();
  }
  
  
  
  function ajaxFileUpload() {
      // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
      $("#ajaxFile").click();
  }
  
  function photo_upload() {

		//파일선택->취소시
		if( $("#ajaxFile")[0].files[0]==undefined)return;
		   
		   	   
		var form = $("ajaxForm")[0];
	    var formData = new FormData(form);
	    formData.append("p_idx", '${ vo.p_idx }');
	    formData.append("photo", $("#ajaxFile")[0].files[0]);
	    
	    /*
	    <form method="POST" encType="mutipart/form-data">
	       <input name="p_idx" value="${ vo.p_idx}">
	       <input type="file" name="photo">
	    </form>
        */ 
	    $.ajax({
	             url : "photo_upload.do", //PhotoUploadAction
	             type : "POST",
	             data : formData,
	             processData : false,
	             contentType : false,
	             dataType : 'json',
	             success:function(result_data) {
	            	 //result_data = {"p_filename":"aaa.jpb"}
	            	 
	            	 $("#my_img").attr("src","../upload/" + result_data.p_filename);
	             },
	             error : function(err){
	            	 alert(err.responseText);
	             }
	       });
	 }

</script>

</head>
<body>


<!-- 파일수정용폼  -->
<!--화일업로드용 폼  -->
<form enctype="multipart/form-data" id="ajaxForm" method="post">
    <input id="ajaxFile" type="file"  style="display:none;"  onChange="photo_upload();" >
</form>



<!-- 내용수정용 폼 -->
<form>
    <input type="hidden"  name="mem_idx"   value="${ user.mem_idx }">
    <input type="hidden"  name="mem_name"  value="${ user.mem_name }">
  	<input type="hidden"  name="p_idx"  value="${ vo.p_idx }">
  	<input type="hidden"  name="page"  value="${ param.page }">

	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading"><h4>수정하기</h4></div>
			<div class="panel-body">
			   <table class="table">
			       <tr>
			          <td colspan="2" align="center">
			             
			             <img id="my_img" src="../upload/${ vo.p_filename }">
			             <br>
			             <br>
			             <input class="btn btn-info" type="button" value="이미지수정" onclick="ajaxFileUpload();">			          
			          </td>
			       </tr>
			       <tr>
			          <th>제목</th>
			          <td><input class="form-control" name="p_subject" value="${ vo.p_subject }"></td>
			       </tr>
			       
			       <tr>
			          <th>내용</th>
			          <td>
			             <textarea  class="form-control" rows="5" cols="" name="p_content" >${ vo.p_content }</textarea>
			          </td>
			       </tr>
			       
			       
			       
			       <tr>
			          <td colspan="2" align="center">
			              <input class="btn btn-primary" type="button" value="수정하기" 
			                     onclick="send(this.form);">
			                      
			              <input class="btn btn-info"    type="button" value="메인화면" 
			                     onclick="location.href='list.do?page=${param.page}'"> 
			          </td>
			       </tr>
			       
			   </table>
			</div>
		</div>
	</div>
</form>
  
  
</body>
</html>