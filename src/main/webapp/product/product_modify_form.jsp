<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
     width: 700px;
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
  function ajaxFileUpload1() {
      // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
      $("#ajaxFile1").click();
  }
  function ajaxFileUpload2() {
      // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
      $("#ajaxFile2").click();
  }
  function ajaxFileUpload3() {
      // 업로드 버튼이 클릭되면 파일 찾기 창을 띄운다.
      $("#ajaxFile3").click();
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
	             url : "product_upload.do", //PhotoUploadAction
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
  
  function photo_upload1() {

		//파일선택->취소시
		if( $("#ajaxFile1")[0].files[0]==undefined)return;
		
		   	   
		var form = $("ajaxForm1")[0];
	    var formData = new FormData(form);
	    formData.append("p_idx", '${ vo.p_idx }');
	    formData.append("photo1", $("#ajaxFile1")[0].files[0]); 
	 
	    /*
	    <form method="POST" encType="mutipart/form-data">
	       <input name="p_idx" value="${ vo.p_idx}">
	       <input type="file" name="photo">
	    </form>
      */ 
	    $.ajax({
	             url : "product_upload1.do", //PhotoUploadAction
	             type : "POST",
	             data : formData,
	             processData : false,
	             contentType : false,
	             dataType : 'json',
	             success:function(result_data) {
	            	 //result_data = {"p_filename":"aaa.jpb"}
	            	 
	            	 $("#my_img1").attr("src","../upload/" + result_data.p_filename1);
	            	
	             },
	             error : function(err){
	            	 alert(err.responseText);
	             }
	       });
	 }
  function photo_upload2() {

		//파일선택->취소시
		if( $("#ajaxFile2")[0].files[0]==undefined)return;
		
		   	   
		var form = $("ajaxForm2")[0];
	    var formData = new FormData(form);
	    formData.append("p_idx", '${ vo.p_idx }');
	    formData.append("photo2", $("#ajaxFile2")[0].files[0]); 
	 
	    /*
	    <form method="POST" encType="mutipart/form-data">
	       <input name="p_idx" value="${ vo.p_idx}">
	       <input type="file" name="photo">
	    </form>
    */ 
	    $.ajax({
	             url : "product_upload2.do", //PhotoUploadAction
	             type : "POST",
	             data : formData,
	             processData : false,
	             contentType : false,
	             dataType : 'json',
	             success:function(result_data) {
	            	 //result_data = {"p_filename":"aaa.jpb"}
	            	 
	            	 $("#my_img2").attr("src","../upload/" + result_data.p_filename2);
	            	
	             },
	             error : function(err){
	            	 alert(err.responseText);
	             }
	       });
	 }
  function photo_upload3() {

		//파일선택->취소시
		if( $("#ajaxFile3")[0].files[0]==undefined)return;
		
		   	   
		var form = $("ajaxForm3")[0];
	    var formData = new FormData(form);
	    formData.append("p_idx", '${ vo.p_idx }');
	    formData.append("photo3", $("#ajaxFile3")[0].files[0]); 
	 
	    /*
	    <form method="POST" encType="mutipart/form-data">
	       <input name="p_idx" value="${ vo.p_idx}">
	       <input type="file" name="photo">
	    </form>
    */ 
	    $.ajax({
	             url : "product_upload3.do", //PhotoUploadAction
	             type : "POST",
	             data : formData,
	             processData : false,
	             contentType : false,
	             dataType : 'json',
	             success:function(result_data) {
	            	 //result_data = {"p_filename":"aaa.jpb"}
	            	 
	            	 $("#my_img3").attr("src","../upload/" + result_data.p_filename3);
	            	
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
    <input id="ajaxFile" 	type="file"  style="display:none;"  onChange="photo_upload();" >
</form>
<form enctype="multipart/form-data" id="ajaxForm1" method="post">
    <input id="ajaxFile1" 	type="file"  style="display:none;"  onChange="photo_upload1();" >
</form>
<form enctype="multipart/form-data" id="ajaxForm2" method="post">
    <input id="ajaxFile2" 	type="file"  style="display:none;"  onChange="photo_upload2();" >
</form>
<form enctype="multipart/form-data" id="ajaxForm3" method="post">
    <input id="ajaxFile3" 	type="file"  style="display:none;"  onChange="photo_upload3();" >
</form>



<!-- 내용수정용 폼 -->
<form>
    <input type="hidden"  name="user_idx"   value="${ vo.user_idx }">
  	<input type="hidden"  name="p_idx"  	value="${ vo.p_idx }">
  	<input type="hidden"  name="page"  value="${ param.page }">

	<div id="box">
		<div class="panel panel-primary">
			<div class="panel-heading"><h4>수정하기</h4></div>
			<div class="panel-body">
			   <table class="table">
			   
			     		<tr>
			<th >카테고리</th>
		
				<c:if test="${ ( c_name eq '가전') }">		
					<td><input type = "radio"  name="c_name"  value = "가전" checked="checked">가전
					<input type = "radio"  name="c_name"    value = "도서">도서
					<input type = "radio"  name="c_name"   value = "운동" >운동
					<input type = "radio"  name="c_name"   value = "의류" >의류
					<input type = "radio"  name="c_name"   value = "식품" >식품</td>
			    </c:if>
			    <c:if test="${ ( c_name eq '도서') }">
			      <td><input type = "radio"  name="c_name"  value = "가전" >가전
					<input type = "radio"  name="c_name"    value = "도서"checked="checked">도서
					<input type = "radio"  name="c_name"   value = "운동" >운동
					<input type = "radio"  name="c_name"   value = "의류" >의류
					<input type = "radio"  name="c_name"   value = "식품" >식품</td>
			      </c:if>
			      <c:if test="${ ( c_name eq '운동') }">
			      <td><input type = "radio"  name="c_name"  value = "가전" >가전
					<input type = "radio"  name="c_name"    value = "도서">도서
					<input type = "radio"  name="c_name"   value = "운동" checked="checked">운동
					<input type = "radio"  name="c_name"   value = "의류" >의류
					<input type = "radio"  name="c_name"   value = "식품" >식품</td>
			      </c:if>
			      <c:if test="${ ( c_name eq '의류') }">
			      <td><input type = "radio"  name="c_name"  value = "가전" >가전
					<input type = "radio"  name="c_name"    value = "도서">도서
					<input type = "radio"  name="c_name"   value = "운동" >운동
					<input type = "radio"  name="c_name"   value = "의류" checked="checked">의류
					<input type = "radio"  name="c_name"   value = "식품" >식품</td>
			      </c:if>
			       <c:if test="${ ( c_name eq '식품') }">
			      <td><input type = "radio"  name="c_name"  value = "가전" >가전
					<input type = "radio"  name="c_name"    value = "도서">도서
					<input type = "radio"  name="c_name"   value = "운동" >운동
					<input type = "radio"  name="c_name"   value = "의류" >의류
					<input type = "radio"  name="c_name"   value = "식품" checked="checked">식품</td>
			      </c:if>
			</tr>	
			   
			    <tr>
			          <th>제품명</th>
			          <td><input class="form-control" name="p_name" value="${vo.p_name }"></td>
			       </tr>
			   
			    <tr>
			          <th>브랜드</th>
			          <td><input class="form-control" name="p_company" value="${vo.p_company }"></td>
			       </tr>
			      <tr>
			          <th>가격</th>
			          <td><input class="form-control" name="p_price" value="${vo.p_price }"></td>
			       </tr>
			   		<tr>
			          <th>지역</th>
			          <td><input class="form-control" name="p_local" value="${vo.p_local }"></td>
			       </tr>
			   		
			   		<tr>
			<th >거래</th>
			<c:if test="${ (vo.p_deal eq '거래가능') }">			
			<td><input type = "radio"  name="p_deal"  value = "거래가능" checked="checked">거래가능
			      <input type = "radio"  name="p_deal"    value = "거래중" >거래중
			      <input type = "radio"  name="p_deal"   value = "거래완료" >거래완료</td>
			      </c:if>
			   <c:if test="${ (vo.p_deal eq '거래중') }">			
			<td><input type = "radio"  name="p_deal"  value = "거래가능" >거래가능
			      <input type = "radio"  name="p_deal"    value = "거래중" checked="checked">거래중
			      <input type = "radio"  name="p_deal"   value = "거래완료" >거래완료</td>
			      </c:if>   
			       <c:if test="${ (vo.p_deal eq '거래완료') }">			
			<td><input type = "radio"  name="p_deal"  value = "거래가능" >거래가능
			      <input type = "radio"  name="p_deal"    value = "거래중" >거래중
			      <input type = "radio"  name="p_deal"   value = "거래완료" checked="checked">거래완료</td>
			      </c:if> 
			</tr>	
			   			
			   			
			<tr>
			<th >내고 </th>	
			<c:if test="${ (vo.p_nego eq '내고가능') }">				
			<td><input type = "radio"  name="p_nego"  value = "내고가능" checked="checked">내고가능
			      <input type = "radio"  name="p_nego"   value = "내고없음" >내고없음</td>
			      </c:if>
			  <c:if test="${ (vo.p_nego eq '내고없음') }">				
			<td><input type = "radio"  name="p_nego"  value = "내고가능" >내고가능
			      <input type = "radio"  name="p_nego"   value = "내고없음" checked="checked">내고없음</td>
			      </c:if>
			</tr>	
			
			
			<tr>
			<th >상태 </th>
			<c:if test="${ (vo.p_status eq 'S') }">				
			<td><input type = "radio"  name="p_status"  value = "S" checked="checked">S
			      <input type = "radio"  name="p_status"   value = "A" >A
			      <input type = "radio"  name="p_status"   value = "B" >B
			      <input type = "radio"  name="p_status"   value = "C" >C</td>
			      </c:if>
			      <c:if test="${ (vo.p_status eq 'A') }">				
			<td><input type = "radio"  name="p_status"  value = "S" >S
			      <input type = "radio"  name="p_status"   value = "A" checked="checked">A
			      <input type = "radio"  name="p_status"   value = "B" >B
			      <input type = "radio"  name="p_status"   value = "C" >C</td>
			      </c:if>
			        <c:if test="${ (vo.p_status eq 'B') }">				
			<td><input type = "radio"  name="p_status"  value = "S" >S
			      <input type = "radio"  name="p_status"   value = "A" >A
			      <input type = "radio"  name="p_status"   value = "B" checked="checked">B
			      <input type = "radio"  name="p_status"   value = "C" >C</td>
			      </c:if>   
			 <c:if test="${ (vo.p_status eq 'C') }">				
			<td><input type = "radio"  name="p_status"  value = "S" >S
			      <input type = "radio"  name="p_status"   value = "A" >A
			      <input type = "radio"  name="p_status"   value = "B" >B
			      <input type = "radio"  name="p_status"   value = "C" checked="checked">C</td>
			      </c:if>  
			</tr>	
			   			
			       <tr>
			          <th>제목</th>
			          <td><input class="form-control" name="p_subject" value="${ vo.p_subject }"></td>
			       </tr>
			       
			       <tr>
			          <th>내용</th>
			          <td>
			             <textarea  class="form-control" rows="10" cols="" name="p_content" >${ vo.p_content }</textarea>
			          </td>
			       </tr>
			       
			        <tr>
			          <td colspan="2" align="center">
			             
			             <img id="my_img" src="../upload/${ vo.p_filename }">
			            
			             <br>
			             <br>
			             <input class="btn btn-info" type="button" value="이미지수정" onclick="ajaxFileUpload();">			          
			          </td>
			       </tr>
			       
			         <tr>
			          <td colspan="2" align="center">
			             
			             <img id="my_img1" src="../upload/${ vo.p_filename1 }">
			            
			             <br>
			             <br>
			             <input class="btn btn-info" type="button" value="이미지수정" onclick="ajaxFileUpload1();">			          
			          </td>
			       </tr>
			       
			         <tr>
			          <td colspan="2" align="center">
			             
			             <img id="my_img2" src="../upload/${ vo.p_filename2 }">
			            
			             <br>
			             <br>
			             <input class="btn btn-info" type="button" value="이미지수정" onclick="ajaxFileUpload2();">			          
			          </td>
			       </tr>
			       
			         <tr>
			          <td colspan="2" align="center">
			             
			             <img id="my_img3" src="../upload/${ vo.p_filename3 }">
			            
			             <br>
			             <br>
			             <input class="btn btn-info" type="button" value="이미지수정" onclick="ajaxFileUpload3();">			          
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