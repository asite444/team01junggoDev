<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
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
	  width: 900px;
	  margin: auto;
	  margin-top: 10px;
	}
	
	#title{
		text-align: center;
		font-size: 50px;
		font-weight: normal;
		color: lime;
	}
	
	/* ellipsis */
	
	#mem_id{
		display: inline-block;
		width: 50px;
		overflow: hidden;
  		white-space: nowrap;
  		text-overflow: ellipsis;
 	    word-break: break-all;

	}
	
	

</style>

<script type="text/javascript">

	function del(user_idx) {
		
		//삭제확인
		if(confirm("정말 삭제하시나요?")==false)return;
		
		//삭제처리
		location.href = "delete.dp?user_idx=" + user_idx; //UserDeleteAction
		
	}



</script>




</head>
<body>

<div id="box">
	<h2 id="title">😊😂😁회원목록입니다😊😂😁</h2>
	
	<!-- 로그인과 로그아웃 -->
	<div style="text-align: right;">
	
		<!-- 로그인이 안될경우 : 세션영역에 user가 없는가? -->
		<c:if test="${ empty sessionScope.user }">
			<input class="btn btn-success" type="button" value="로그인"
			        onclick="location.href='/SecondhandMarket/user/user_login_form.do'">
		</c:if>
		
		<!-- 로그인이 됐을경우 : 세션영역에 user가 있는가?  -->
		<c:if test="${ not empty sessionScope.user }">
			<b>${ sessionScope.user.user_name }</b>님 환영합니다!!
			<input class="btn btn-info" type="button" value="로그아웃"
			       onclick="location.href='logout.do'">
		</c:if>
	
	</div>
	
	<!-- 회원가입 -->
	<div style="margin: -bottom: 5px;">
		<button class="btn btn-danger" onclick="location.href='insert_form.do'">회원가입</button>
	</div>
	
	
	<table class="table">
		<!-- head부분 -->
		<tr class="success">
			<th>회원번호</th>
			<th>회원이름</th>
			<th>아이디</th>
			<th>아이피</th>
			<th>가입(갱신)일자</th>
			<th>회원등급</th>
			<th>편집</th>
		</tr>
		<!-- Data출력 -->
		<!-- for(UserVo vo: list)  -->
		<c:forEach var="vo" items="${ list }">
			<tr><!-- EL은 값을 얻어서 출력(표현,조회만)하는 언어 -->
				<td>${ vo.user_idx  }</td><!-- GETTER로 호출(EL표기법) -->
				<td>${ vo.user_name  }</td>
				<td><span id="user_id">${ vo.user_id  }</span></td>
				<td>${ vo.user_ip  }</td>
				<td>${ fn:substring(vo.user_regdate,0,10)  }<br>(${ fn:substring(vo.user_modifydate,0,10)})</td>
				<td>${ vo.user_grade  }</td>
				<td>
					<!-- 3개의 버튼이 활성화되는 조건:(로그인한 유저가 관리자) 또는 로그인 본인 -->
					<c:if test="${ (user.user_grade eq '관리자') or (user.user_idx == vo.user_idx) }">
					
					<input class="btn btn-info" type="button" value="수정"
					        onclick="location.href='modify_form.do?user_idx=${ vo.user_idx }'">
					<input class="btn btn-warning" type="button" value="삭제" onclick="del('${ vo.user_idx }')"> <!-- 삭제할고객 -->
					
					<input class="btn btn-success" type="button" value="보기"
					       onclick="location.href='view.do?user_idx=${ vo.user_idx }'">       
					
					</c:if>
				</td>
		     </tr>
	   </c:forEach>
	</table>
	
</div>



</body>
</html>