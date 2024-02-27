<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>결제정보</title>

<meta charset="UTF-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../assets/css/main.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // select 요소가 변경될 때
    $('#card_list').change(function() {
        // 선택한 카드의 값과 hidden 값을 가져오기
        var selectedCardNum = $('option:selected', this).data('card-number');
        var selectedCardType = $('option:selected', this).data('card-type');
        
        // 가져온 값을 각각의 input 태그에 입력
        $('#card_number').val(selectedCardNum);
        $('#card_type').val(selectedCardType);
    });
});


	function find_addr() {
		new daum.Postcode({
			oncomplete : function(data) {
				// {"zonecode":"03366","address":"서울 은평구 불광로 2길 33"}
				$("#user_zipcode").val(data.zonecode);
				$("#user_addr").val(data.address);
			} 
		}).open();
	}

	function send(f) {

		f.action = 'payment.do'
		f.submit();
	}
	

	function openCardPopup() {
		
		
            var form = document.createElement('form');
            form.action = 'popup_card.jsp';
            form.method = 'post';
            form.target = '공지사항';
            
            var parameterValue = '${user}'; // 원하는 파라미터 값 설정
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'user';
            input.value = parameterValue;
            
            form.appendChild(input);
            document.body.appendChild(form);
            
            window.open('popup_card.jsp', '카드등록', 'width=600, height=600, top=200, left=850');
            
            form.submit();
            
            document.body.removeChild(form);
        
	}
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="main.jsp" class="logo">intensify</a>
		<nav class="right">
			<a href="#" class="button alt">Log in</a>
		</nav>
	</header>
	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="../main.jsp">Home</a></li>
			<li><a href="../all_items.jsp">전체매물</a></li>
			<li><a href="../category.jsp">Category</a></li>
			<li><a href="../board/list.do">community</a></li>
			<li><a href="../generic.jsp">Generic</a></li>
			<li><a href="../elements.jsp">Elements</a></li>
		</ul>
		<ul class="actions vertical">
			<li><a href="#" class="button fit">Login</a></li>
		</ul>
	</nav>
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>결제정보</h1>
			</header>
			<form class="form-inline">
				<input type="hidden" value="${user.user_idx}" name="mem_idx">
				<div style="width: 1300px; margin: auto;">
					<table class="table table-wrapper">
						<tr>
							<th><label>우편번호</label></th>
							<td><input class="form-control" name="user_zipcode" id="user_zipcode" value="${user.user_zipcode}"> <input class="btn btn-info" type="button" value="주소검색" onclick="find_addr();"></td>
						</tr>
						<tr>
							<th><label>배송지</label></th>
							<td><input class="form-control" name="user_addr" id="user_addr" size="50" value="${user.user_addr}"></td>
						</tr>

						<tr>
							<th><label>결제방식</label></th>
							<td><select style="width: 20%">
									<option>결제 방식을 선택하세요</option>
									<option value="card">카드결제</option>
									<option value="tong">통장</option>

							</select></td>
						</tr>

						<tr>
							<th><label>주문자</label></th>
							<td><span><input class="form-control" name="user_name" id="user_name" readonly="readonly" size="50" value="${user.user_name}"></span></td>
						</tr>
						<tr>
							<th><label>주문상품</label></th>
							<td>
								<table class="table table-bordered">

									<tr bgcolor="#dedede">
										<th width="25%" colspan="2">제품명</th>

										<th width="15%">금액</th>
										<th width="30%">상품이미지</th>


										<!-- <th>삭제</th> -->
									</tr>

									<!--  for(CartVo cart : cart_list)   -->
									<c:forEach var="payment" items="${payment_list}">
										<input type="hidden" value="${payment.cart_idx}" name="c_idx">
										<tr align="center">

											<td colspan="2">${ payment.p_name }<input type="hidden" value="${payment.p_name}" name="p_name"></td>
											<td><b><fmt:formatNumber value="${ payment.p_price}" /> </b></td>
											<td><img src="${pageContext.request.contextPath}/images/${payment.p_filename}" width="100" height="90"> <input type="hidden" value="${ payment.p_filename}" name="p_image_s"></td>


										</tr>

									</c:forEach>





									<tr>
										<td colspan="3" align="right">상품 결재액 :</td>
										<td align="right"><fmt:formatNumber value="${payment_total_amount}" /> (원) <input type="hidden" value="${payment_total_amount}" name="p_total_amount"></td>

									</tr>
									<tr>
										<td colspan="3" align="right">(총 결제 금액이 5,0000원 이상일 경우 배송비는 무료 입니다.)배송비 :</td>
										<c:if test="${ payment_total_amount<50000}">
											<td align="right"><fmt:formatNumber value="3000" /> (원)</td>
											<input type="hidden" name="deli_pay" value="3000">
										</c:if>
										<c:if test="${ payment_total_amount>=50000}">
											<td align="right"><fmt:formatNumber value="0" /> (원)</td>
											<input type="hidden" name="deli_pay" value="0">
										</c:if>
									</tr>

									<tr>
										<td colspan="3" align="right">총 결재액 :</td>
										<c:if test="${payment_total_amount<50000}">
											<td align="right"><b style="font-size: 20px"><fmt:formatNumber value="${payment_total_amount+3000}" /> (원)</b></td>
											<input type="hidden" value="${payment_total_amount+3000}" name="amount_appr">

										</c:if>
										<c:if test="${ payment_total_amount>=50000}">
											<td align="right"><b style="font-size: 20px"><fmt:formatNumber value="${payment_total_amount}" /> (원)</b></td>
											<input type="hidden" value="${payment_total_amount}" name="amount_appr">
										</c:if>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<th><label>결제카드</label></th>
							<td>
								<table class="table">
									<tr>
										<td style="width: 30%"><select id="card_list" style="width: 70%">
												<option value="" style="text-align: center;" >카드선택</option>
												<c:forEach var="card" items="${card_list}">
													<option value="${card.card_idx}" data-card-number="${card.card_number}"  data-card-type="${card.card_type}">${card.card_bank}</option>

												</c:forEach>
										</select> <!-- <input type="text" readonly="readonly" id="card_num" name="card_num" style="width: 20%">  --></td>
										<td align="left"><input type="text" readonly="readonly" id="card_number" width="10px" name="card_type" style="width: 100%"></td>
										<td><input type="text" readonly="readonly" id="card_type" name="card_type" style="width: 50%"></td>
										
										<td><input type="button" value="카드등록" class="button small" onclick="openCardPopup()"></td>
									</tr>
								</table>
							</td>

						</tr>
						<tr>
							<td colspan="2" style="text-align: right;"><input type="button" value="결제" class="btn btn-primary" onclick="send(this.form);"></td>
						</tr>
					</table>
				</div>
			</form>

		</div>
	</section>
	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>Get In Touch</h2>
			<ul class="actions">
				<li><span class="icon fa-phone"></span> <a href="#">(000) 000-0000</a></li>
				<li><span class="icon fa-envelope"></span> <a href="#">information@untitled.tld</a></li>
				<li><span class="icon fa-map-marker"></span> 123 Somewhere Road, Nashville, TN 00000</li>
			</ul>
		</div>
	</footer>
	<div class="copyright">
		Powered by: <a href="https://templated.co/">TEMPLATED</a>.
	</div>

	<!-- Scripts -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/jquery.scrolly.min.js"></script>
	<script src="../assets/js/skel.min.js"></script>
	<script src="../assets/js/util.js"></script>
	<script src="../assets/js/main.js"></script>
</body>
</html>
