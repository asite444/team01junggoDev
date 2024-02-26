<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 3.x -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- Daum 주소검색 API  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
  #box{
     width:600px;
     margin: auto;
     margin-top: 20px;
  }
  
</style>




</head>
<body>
		<div id="box">
			<div class="panel panel-primary">
				<div class="panel-heading"><h4>::::회원정보::::</h4></div>
				<div class="panel-body">
				   <table class="table">
		              <tr>
		                 <th><label>이름</label></th>
		                 <td>${ vo.mem_name }</td>
		              </tr>		   
		              <tr>
		                 <th><label>아이디</label></th>
		                 <td>
		                    ${ vo.mem_id }
		                 </td>
		              </tr>		
		              <tr>
		                 <th><label>비밀번호</label></th>
		                 <td>${ vo.mem_mask_pwd }</td>
		              </tr>		   
		              <tr>
		                 <th><label>이메일</label></th>
		                 <td>${ vo.mem_email }</td>
		              </tr>		   
		              <tr>
		                 <th><label>우편번호</label></th>
		                 <td>
		                     ${ vo.mem_zipcode }
		                 </td>
		              </tr>		   
		              <tr>
		                 <th><label>주소</label></th>
		                 <td>${ vo.mem_addr }</td>
		              </tr>		
		              <tr>
		                 <th><label>가입일자</label></th>
		                 <td>${ fn:substring(vo.mem_regdate,0,16) }</td>
		              </tr>		
		              <tr>
		                 <th><label>마지막수정일자</label></th>
		                 <td>${ fn:substring(vo.mem_modifydate,0,16) }</td>
		              </tr>		
		              <tr>
		                 <th><label>회원구분</label></th>
		                 <td>${ vo.mem_grade }</td>
		              </tr>		
		              
		              <tr>
		                  <td colspan="2" align="center">
		                           <input  class="btn  btn-success" type="button"  value="목록보기"
		                                onclick="location.href='list.do'">  
		                  </td>
		              </tr>
		              
		              
				   </table>
				</div>
			</div>
		</div>

</body>
</html>