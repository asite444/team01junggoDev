<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Intensify by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>결제내역</title>
<meta charset="UTF-8">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../assets/css/main.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
 td{
   vertical-align: middle;
        text-align: center;
  }
  td[rowspan] {
        background-color: white;
        font-weight: bolder; 
        font-size: 20px;
    }
 
</style>
<script type="text/javascript">
$(function(){
	    $('#forRowspan').each(function() {
	        var table = this;
	        $.each([1,2,7] /* 합칠 칸 번호 */, function(c, v) {
	            var tds = $('>tbody>tr>td:nth-child(' + v + ')', table).toArray(), i = 0, j = 0;
	            for(j = 1; j < tds.length; j ++) {
	                if(tds[i].innerHTML != tds[j].innerHTML) {
	                    $(tds[i]).attr('rowspan', j - i);
	                    i = j;
	                    continue;
	                }
	                $(tds[j]).hide();
	            }
	            j --;
	            if(tds[i].innerHTML == tds[j].innerHTML) {
	                $(tds[i]).attr('rowspan', j - i + 1);
	            }
	        });
	    });
	});

</script>
</head>
<body>

 <jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Header -->
	
	
	<jsp:include page="../include/menu.jsp"></jsp:include>
	<!-- menu -->
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h1>결제내역</h1>
			</header>
			<form class="form-inline">
				<table class="table table-wrapper" id="forRowspan">
					<thead>
						<tr>
							<th>결제일자</th>
							<th>주문번호</th>
							<th>제품명</th>
							<th>제품이미지</th>
							<th>판매자</th>
							<th>상품금액</th>
							<th>총 결제액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="payment" items="${payment_list}" varStatus="loop">
							<tr>
									<td>${payment.payment_date}</td>
									<td>${payment.order_number}</td>
							
								<td>${payment.p_name}</td>
								<td><img src="${ pageContext.request.contextPath }/upload/${payment.pro_image}" width="100px" height="100px"></td>
								<td>${payment.sell_user_name}</td>
								<td><fmt:formatNumber value="${payment.p_total_amount}"></fmt:formatNumber></td>
								
									<td>${payment.amount_appr}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>

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
