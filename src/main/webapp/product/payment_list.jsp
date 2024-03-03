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
<style type="text/css">
th{
 vertical-align: middle;
        text-align: center;
}

</style>
<script type="text/javascript">

let  isPersonal=false;
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
    
    //사용자가 결제 방식을 개인간 거래로 선택했을 경우
    $('#paymentMethod').change(function() {
        // 선택된 값 가져오기
        var selectedValue = $(this).val();

        // 선택된 값이 비어있지 않으면
        if (selectedValue == "personal") {
            
            alert("개인간 거래인 경우, 카드를 선택 해도 해당 카드로 결제되지 않습니다.");
            isPersonal=true;
        }
        
		if (selectedValue == "card") {
            isPersonal=false;
        }
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

		if(confirm("해당상품을 결제하시겠습니까?") == false) return;
		f.action = 'payment_insert.do'
		f.submit();
	}
	

	function openCardPopup() {
	  

	    var form = document.createElement('form');
	    form.action = 'popup_card.jsp';
	    form.method = 'post';
	    form.target = '카드등록';

	    // user 데이터 추가
	    var userInput = document.createElement('input');
	    userInput.type = 'hidden';
	    userInput.name = 'user';
	    userInput.value = '${user}';
	    form.appendChild(userInput);


	    // 폼을 body에 추가
	    document.body.appendChild(form);

	    // 팝업 창 열기
	    window.open('popup_card.jsp', '카드등록', 'width=600, height=600, top=200, left=850');

	    // 폼 전송
	    form.submit();

	    // 폼 삭제
	    document.body.removeChild(form);
	}

	function handleDataFromPopup(data) {
	    if (data == "true") {
	        // 현재 페이지의 URL 가져오기
	        var currentUrl = window.location.href;

	        // cart_idx 값 추출 (배열로)
	        var cartIdxArray = getParametersByName('cart_idx', currentUrl);
	        // p_idx 값 추출
	        var pIdx = getParameterByName('p_idx', currentUrl);

	        
	        // cart_idx 값을 쿼리 문자열로 변환
	        if(cartIdxArray!=null){
	        var cartIdxQueryString = cartIdxArray.map(function (value) {
	            return 'cart_idx=' + encodeURIComponent(value);
	        }).join('&');
	    

	        // 새로운 URL 생성
	        var newUrl = "payment_form.do?" + cartIdxQueryString;
	        }
	        
	        // 만약 p_idx가 존재하면 추가
	        if (pIdx) {
	            newUrl =  "direct_payment_list_form.do?p_idx=" + encodeURIComponent(pIdx);
	        }

	        
	        // 이동
	        location.href = newUrl;
	    }
	}

	// URL 파라미터 추출 함수 (특정 값만 추출)
	function getParameterByName(name, url) {
	    if (!url) url = window.location.href;
	    name = name.replace(/[\[\]]/g, "\\$&");
	    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
	    var results = regex.exec(url);
	    if (!results) return null;
	    if (!results[2]) return '';
	    return decodeURIComponent(results[2].replace(/\+/g, " "));
	}

	// URL 파라미터 추출 함수 (모든 값 추출)
	function getParametersByName(name, url) {
	    if (!url) url = window.location.href;
	    name = name.replace(/[\[\]]/g, "\\$&");
	    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)", "g");
	    var results = [];
	    var match;
	    while ((match = regex.exec(url)) !== null) {
	        results.push(decodeURIComponent(match[2].replace(/\+/g, " ")));
	    }
	    return results.length === 0 ? null : results;
	}
	
</script>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->
	
	
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>결제정보</h1>
			</header>
			<form class="form-inline">
				<input type="hidden" value="${user.user_idx}" name="user_idx">
				
				<div style="width: 1300px; margin: auto;">
					<table class="table table-wrapper">
						<tr>
							<th><label>우편번호</label></th>
							<td><input class="form-control" name="user_zipcode" id="user_zipcode" value="${user.user_zipcode}"> <input class="button special small" type="button" value="주소검색" onclick="find_addr();"></td>
						</tr>
						<tr>
							<th><label>배송지</label></th>
							<td><input class="form-control" name="user_addr" id="user_addr" size="50" value="${user.user_addr}"></td>
						</tr>

						<tr>
							<th><label>결제방식</label></th>
							<td><select style="width: 20%" id="paymentMethod">
									<option>결제 방식을 선택하세요</option>
									<option value="card">카드결제</option>
									<option value="personal">1 대 1 개인거래</option>

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
										<input type="hidden" value="${payment.cart_idx}" name="cart_idx">
										<input type="hidden" value="${payment.p_idx}" name="p_idx">
										<input type="hidden" value="${payment.sell_user_name}" name="sell_user_name">
										<input type="hidden" value="${payment.p_price}" name="p_price">
										<tr align="center">
										
											<td colspan="2">${ payment.p_name }<input type="hidden" value="${payment.p_name}" name="p_name"></td>
											<td><b><fmt:formatNumber value="${payment.p_price}"/> </b>
											
											</td>
											<td><img src="${pageContext.request.contextPath}/upload/${payment.p_filename}" width="100" height="90"> <input type="hidden" value="${ payment.p_filename}" name="p_image_s"></td>


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
										<td style="width: 30%">
										<select id="card_list" style="width: 70%" >
												<option value="" style="text-align: center;" >카드선택</option>
												<c:forEach var="card" items="${card_list}">
													<option value="${card.card_idx}" data-card-number="${card.card_number}"  data-card-type="${card.card_type}">${card.card_bank}</option>

												</c:forEach>
										</select> <!-- <input type="text" readonly="readonly" id="card_num" name="card_num" style="width: 20%">  --></td>
										<td align="left"><input type="text" readonly="readonly" id="card_number" width="10px" name="card_number" style="width: 100%"  ></td>
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
