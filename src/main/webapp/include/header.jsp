<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>


<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="../main.jsp" class="logo">중고로Go</a>
		<nav class="right">
		  <c:if test="${ empty sessionScope.user }">
			<input class="button alt" value="Login"
					onclick="login();">
		  </c:if>

			<!-- 로그인이 됐을경우 : 세션영역에 user가 있는가?  -->
			<c:if test="${ not empty sessionScope.user }">
				<b>${ sessionScope.user.user_name }</b>님 환영합니다!!
			<input class="button alt" type="button" value="Logout"
					onclick="location.href='${pageContext.request.contextPath}/user/logout.do'">
			<input class="button alt" type="button" value="MyPage"
					onclick="location.href='${pageContext.request.contextPath}/user/mypage_form.do?user_idx=${user.user_idx}'">
			<input class="button alt" type="button" value="Cart"
			        onclick="location.href='${pageContext.request.contextPath}/product/cart_list.do'">
			</c:if>


		</nav>
	</header>