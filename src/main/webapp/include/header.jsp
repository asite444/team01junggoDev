<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<style type="text/css">
	#contents{
		width: 750px;
		background-color: skyblue;
	}
	#quickmenu{
		width: 200px;
		height: 230px;
		
		background-color: rgb(213,216,218,0.8);
		
		/*부모 기준 절대좌표*/
		position: absolute;
		
		right: 200px;
		/* left:50px; */
		top:30px;
		
		
	}
	
	#quickmenu ul li {
		list-style-type: none;
	}
</style>

<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="${pageContext.request.contextPath}/main.do" class="logo">중고로GO</a>
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

	<div id="quickmenu" >
		<c:forEach var="vo"  items="${ weatherlist }">  
		
        	<c:if test="${ (vo.icon eq '01d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/01d.png"><br>상태 : 맑음<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }%   </div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '02d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/02d.png"><br>상태 : 약간흐림<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }% </div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '03d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/03d.png"><br>상태 : 흐림<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '04d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/04d.png"><br>상태 : 매우흐림<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '09d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/09d.png"><br>상태 : 약한비<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '10d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/10d.png"><br>상태 : 비<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '11d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/11d.png"><br>상태 : 번개<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }%</div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '13d') }">
           	<div align="center">오늘의 날씨 :<br> <img src="${pageContext.request.contextPath}/images/13d.png"><br>상태 : 눈<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }% </div>
           	</c:if>
           	<c:if test="${ (vo.icon eq '50d') }">
           	<div align="center">오늘의 날씨 :<br><img src="${pageContext.request.contextPath}/images/50d.png"><br>상태 : 안개<br>온도 : ${ vo.temp  }ºC<br>습도 : ${ vo.humidity }%</div>
           	</c:if>
          
   </c:forEach>
	</div>