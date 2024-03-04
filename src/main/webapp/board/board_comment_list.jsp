<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.btn-link{
		color: 	#FFB6C1 !important;
		font-weight: bold !important;
		border: 1px solid #FFB6C1 !important;
	}
		
	b{ /* user-id */
		color: 	#FFB6C1;
	  	font-weight: bold;
	  }
	 .cmt2{
	 color: gray;
	 font-size: small;
	 }
	 .buttonbox{
	 	float: right;
	 }
</style>

<script type="text/javascript">

	function delete_comment(cmt_idx) {
		
		if(confirm("정말 삭제하시겠습니까?")==false) return;
		
		//Ajax 통해서 삭제
		$.ajax({
			url		:	"comment_delete.do",
			data	:	{"cmt_idx" : cmt_idx},
			dataType:	"json",
			success	:	function (res_data) {
				//res_data={"":true, "":}
				if(res_data.result){
					//성공
					comment_list(g_cmt_page);
				}else{
					//실패
					alert("삭제 샐패했습니다..");
				}
			},
			error	:	function (err) {
				alert(err.responseText);
			}
		});
		
		
	}//end:delete_comment();

	function modify_comment(cmt_idx) {
       
		var editFormId = 'editForm' + cmt_idx; // 고유한 수정 폼의 id 생성
	    document.getElementById(editFormId).style.display = 'block'; // 생성한 id로 해당 수정 폼을 보이도록 설정
	}
	
	function save_comment(cmt_idx) {
    	
        //내용입력 여부체크
		   let cmt_content = $("#cmt_update_content"+cmt_idx).val().trim();
		   if(cmt_content==''){
			   alert('댓글 내용을 입력하세요!');
			   $("#cmt_update_content").val(cmt_content);
			   $("#cmt_update_content").focus();
			   return;
		   }
		   
		   // Ajax로 전송
		   $.ajax({
			   url		:	"update_comment.do",
			   data		:	{ 
				               "cmt_idx" : cmt_idx,
				               "cmt_content" : cmt_content
			                },
			   dataType	:	"json",
			   success	:	function(res_data){
				   // res_data = {"result" : true } or {"result" : false}
				   if(res_data.result){
					   //성공시 : 댓글목록 가져오기
					   comment_list(1);
					   
				   }else{
					   //실패시
					   alert("댓글쓰기 실패!!");
				   }
				   
				   //이전댓글내용 지우기
				   $("#cmt_content"+cmt_idx).val();
				   
			   },
			   error	:	function(err){
				   
				   alert(err.responseText);
				   alert('에러');
			   }
		   });

    }
    

    
        
	

</script>



</head>
<body>
	<!-- PageMenu : 댓글이 있으면 메뉴 넣어라...  -->
	<c:if test="${ not empty cmt }">
	   ${ pageMenu }
	</c:if>

<hr>
<c:forEach var="cmt" items="${ cmt }">
		<div class="main_subject">
			<div>
				<b>${ cmt.user_mask_id }</b>님의 댓글
			</div>
			<div>
			<!-- 본인글인 경우만 보여준다 -->
			<c:if test="${ user.user_idx eq cmt.user_idx or (user.user_grade eq '관리자') }">
				<div class="buttonbox">
				<input class="button small" type="button" value="삭제"
						onclick="delete_comment('${ cmt.cmt_idx}');">
				&nbsp;&nbsp;
				<input class="button alt small editBtn" type="button" value="수정"
						onclick="modify_comment('${ cmt.cmt_idx}');">
			 	</div>
			 </c:if>	
			</div>
		</div>
		<!-- 2번째 줄 -->
		<div id="cmt2">
		   ${ cmt.cmt_regdate }
		</div>
		<!-- 3번째 줄 -->
		<div id="cmt3">
		   ${ cmt.cmt_content }
		</div>
		<!-- 수정하기 폼 -->
		<div id="editForm${ cmt.cmt_idx}" style="display: none;">
        	<textarea id="cmt_update_content${ cmt.cmt_idx}">${ cmt.cmt_content }</textarea>
        	<input class="saveBtn special small" type="button" value="저장"
        			onclick="save_comment('${ cmt.cmt_idx}');">
    	</div>
		
		<hr>
</c:forEach>

</body>
</html>