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
		
	b{ /* mem-id */
		color: 	#FFB6C1;
	  	font-weight: bold;
	  }
	 .cmt2{
	 color: gray;
	 font-size: small;
	 }
</style>

<script type="text/javascript">

	function delete_comment(cmt_idx) {
		//alert(cmt_idx);
		//comment_list(1); //board_list.jsp에서 동적으로 가져온 정보
		
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
	
	
	
</script>
</head>
<body>
	<!-- PageMenu : 댓글이 있으면 메뉴 넣어라...  -->
	<c:if test="${ not empty cmt_list }">
	   ${ pageMenu }
	</c:if>
	<!-- CommentController에서 아래와 같이 생성해서 와야 된다 : pageing.getCommentPaging -->
	<!-- <ul class="pagination">
		<li><a href="#" onclick="comment_list(1);">1</a></li>
		<li><a href="#" onclick="comment_list(2);">2</a></li>
		<li><a href="#" onclick="comment_list(3);">3</a></li>
		<li><a href="#" onclick="comment_list(4);">4</a></li>
		<li><a href="#" onclick="comment_list(5);">5</a></li>
	</ul> -->

<hr>
<c:forEach var="cmt" items="${ cmt_list }">
		<div class="row">
			<div class="col-sm-9">
				<b>${ cmt.mem_mask_id }</b>님의 댓글
			</div>
			<div class="col-sm-3" >
			<!-- 본인글인 경우만 보여준다 -->
			<c:if test="${ user.mem_idx eq cmt.mem_idx or (user.mem_grade eq '관리자') }">
				<input class="btn btn-link" type="button" value="삭제"
						onclick="delete_comment('${ cmt.cmt_idx}');">
				<input class="btn btn-link" type="button" value="수정"
						onclick="modify_comment('${ cmt.cmt_idx}');">
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
		
		<hr>
</c:forEach>

</body>
</html>