<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="${ pageContext.request.contextPath }/main.jsp">Home</a></li>
			<li><a href="${ pageContext.request.contextPath }/product/all_items.do">전체매물</a></li>
			<li><a href="${ pageContext.request.contextPath }/product/list.do" >Category</a></li>
			<li><a href="${ pageContext.request.contextPath }/board/list.do">community</a></li>
			
		</ul>
		<ul class="actions vertical">
			<li>
				<input class="button fit" value="Login" 
						onclick="login();" >			
			</li>
		</ul>
	</nav>