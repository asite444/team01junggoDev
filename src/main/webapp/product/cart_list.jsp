<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>

<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <!--Bootstrap 3.x-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <!--외부 스타일 scc 참조-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>장바구니</title>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../assets/css/main.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	
		
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
	
	
	
	$("#check_all").click(function(){
		const checked=$(this).is(':checked');
		
		//하위의 체크박스를 모두 체크/언체크(true<-->false)
		$("input[name='cart_idx']").prop("checked",checked);
		
		//하위 각각의 체크박스가 클릭될시
		$("input[name='cart_idx']").click(function(){
			
			//전체 개수
			const total_count =$("input[name='cart_idx']").length;
			
			//체크된 개수
			const check_count =$("input[name='cart_idx']:checked").length;
			//console.log(total_count,check_count);
			
			// 전체 개수 ==체크된 개수가 같으면 전체 체크
			$("#check_all").prop("checked",total_count==check_count);
		});
	});
});

/**
 * 선택된 상품 삭제처리
 */
function delete_cart_select(f){
	const check_count =$("input[name='cart_idx']:checked").length;
	
	// alert(check_count);
	if(check_count==0){
	alert('삭제할 상품을 선택하세요');
	
		return;
	}

		  if (window.confirm("해당 상품을 삭제하시겠습니까?")) {
				f.action="cart_delete_select.do"; // CartSelectDeleteAction.java
				f.submit();
		  }	

}

/**
 * 결제하기
 */
function payment(f){

const check_count =$("input[name='cart_idx']:checked").length;
	
	// alert(check_count);
	if(check_count==0){
	alert('결제할 상품을 선택하세요');
	
		return;
	}
	//결제 폼으로 이동
	if (window.confirm("해당 상품을 결제하시겠습니까?")) {
			f.action="payment_form.do";
			f.submit();
	}

}

</script>


</head>
<body>
<form class="form-inline">
	 <jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->
	
	
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- menu -->
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>WISHLIST</h1>
				
				<div style="width:1300px; margin: auto;" class="table-wrapper"> 
				<table >
				<thead>
				<tr>
				<td colspan="6" align="left">
				<input type="checkbox" id="check_all" class="form-control"><label for="check_all">
				
				 전체선택</label>
				</td>
			</tr>
			
			<tr bgcolor="#dedede" >
			    <th style="text-align: center;">선택</th>
				<th width="25%" style="text-align: center;">제품명</th>
				<th  style="text-align: center;">이미지</th>
				<th style="text-align: center;">판매자</th>
				<th style="text-align: center;">제품상태</th>
				<th align="center" style="text-align: center;">금액</th>
				
				<!-- <th>삭제</th> 
				
				cart_idx,
				 user_idx,
				  prod_idx, prod_count, p_subject, sell_user_idx, p_price, p_status
				-->
			</tr>
			</thead>
			<c:forEach var="cart"  items="${cart_list}">
			<tbody>
				<tr align="center">
				<td style="vertical-align: middle;"><input type="checkbox" name="cart_idx"  value="${cart.cart_idx}" id="cart_idx_${cart.cart_idx}">
				<label for="cart_idx_${cart.cart_idx}">
				</label>
				</td>
				<td style="vertical-align: middle;"><a href="view.do?p_idx=${cart.p_idx}">${ cart.p_name }</a></td>
				<td style="vertical-align: middle;"><img src="${pageContext.request.contextPath}/upload/${cart.p_filename}" width="100" height="90">
				<td style="vertical-align: middle;">${ cart.sell_user_name }</td>
				
				<td style="vertical-align: middle;">${ cart.p_status }</td>
				<td style="vertical-align: middle;">

				<fmt:formatNumber value="${cart.p_price}"/> (원)
			
				</td>
	
			</tr>
			</tbody>
			<tr>
			
			</tr>
			</c:forEach>
				 <!-- 장바구니목록이 없는경우 -->  
	        <c:if test="${ empty cart_list }"> 
				<tr>
					<td colspan="6" align="center">
						<b><font color=red>WISHLIST 가 비었습니다.</font></b>
					</td>
				</tr>
			</c:if>
			
			
			
	
			<tr>
				<td colspan="4" align="right">
					총 결재액 :
				</td>
				<td><fmt:formatNumber value="${ total_amount }"/> (원)</td> 
			</tr>
			
			<tr>
			<td colspan="7" align="right">
				<input type="button" value="선택삭제" class="button" onclick="delete_cart_select(this.form);">
				<input type="button" value="결제" class="button special"
				onclick="payment(this.form);" >
			</td>
			</tr>
				
				
				</table>   
				</div>
				
				
				
				
			</header>
		</div>	
	</section>
<jsp:include page="../include/footer.jsp"></jsp:include>
	
	
	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</form>
</body>
</html>
