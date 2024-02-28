<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="KeyPad_Crypto.*"%>
<html>
<head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	//라이브러리를 적용하며, 암호세팅을 위한 설정구간
	KeyPad_E2ECrypto rsa = KeyPad_E2ECrypto.getEncKey();
	request.setAttribute("publicKeyModulus", rsa.getPublicKeyModulus());
	request.setAttribute("publicKeyExponent", rsa.getPublicKeyExponent());
	request.getSession().setAttribute("__rsaPrivateKey__", rsa.getPrivateKey());
	String PKIModulus = rsa.getPublicKeyModulus();
	String PKIExponent = rsa.getPublicKeyExponent();
%>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../js/Keypad.js" ></script>

<link type="text/css" href="../css/Keypad.css" rel="stylesheet" />
  
<script>
//공개키 기반의 모듈값을 세팅
var PKIModulus = '<%=PKIModulus%>';
var PKIExponent = '<%=PKIExponent%>';
</script>
<style type="text/css">
table {
	width: 500px;
	text-align: center;
	border: 1px solid #fff;
	border-spacing: 1px;
	font-family: 'Cairo', sans-serif;
	margin: auto;
}

caption {
	font-weight: bold;
}

table td {
	padding: 10px;
	background-color: #eee;
}

table th {
	background-color: #333;
	color: #fff;
	padding: 10px;
}

img {
	width: 90px;
	height: 90px;
}

.view, .delete {
	border: none;
	padding: 5px 10px;
	color: #fff;
	font-weight: bold;
}

.view {
	background-color: #03A9F4;
}

.delete {
	background-color: #E91E63;
}

.tablefoot {
	padding: 0;
	border-bottom: 3px solid #009688;
}
input {
background-color: #eee;
border: none;
outline: none;
text-align: center;
width: 20%;
}

 input:focus {
            outline: 1px solid #000;
        }
</style>
<script type="text/javascript">
function limitInputLength(input) {
    if (input.value.length > 4) {
        input.value = input.value.slice(0, 4);
    }
}
function send(f) {
	
	//체크 없음 나중에 하자고 
	
	f.action="card_insert.do";
	f.submit();
}
</script>
</head>
<body>
<div id="wrap">
	<h2 align="center">카드 정보</h2>
	<form>
	<table>
		<tr>
			<th colspan="2">카드 정보를 입력해 주세요</th>
		</tr>
		<tr>
			<td align="left" colspan="2">카드번호</td>
		</tr>
		<tr>
			<td align="center"  style="width: 50px" colspan="2">
			<input  type="number"  inputmode="numeric"  inputmode="numeric" maxlength="4" placeholder="0000" oninput="limitInputLength(this)" name="card_number" >
			-<input type="number" maxlength="4" placeholder="0000" oninput="limitInputLength(this)"  name="card_number">
			-<input type="password" inputmode="numeric" maxlength="4" placeholder="0000" oninput="limitInputLength(this)"  Number_keypad="on" name="card_number">
			-<input type="password" inputmode="numeric" maxlength="4" placeholder="0000" oninput="limitInputLength(this)"  Number_keypad="on" name="card_number"> 
			</td>
		</tr>
		<tr>
		<td>유효기간</td>
		<td>cvv</td>
		</tr>
		<tr>
		<td><input width="50%" type="password" inputmode="numeric" maxlength="4" placeholder="MMYY" oninput="limitInputLength(this)"  Number_keypad="on" name="expiration_date"></td>
		<td><input width="100%" type="text" inputmode="numeric" maxlength="3" placeholder="카드 뒷면 3자리 숫자" oninput="limitInputLength(this)"  Number_keypad="on" name="cvv" style="width: 100px"></td>
		</tr>
		<tr>
		<td colspan="2" align="left">카드 비밀번호</td>

		</tr>
		<tr>
		<td colspan="2" align="left"><input width="100%" type="text" inputmode="numeric" maxlength="2" placeholder="앞2자리" oninput="limitInputLength(this)"  Number_keypad="on" name="card_password"></td>
		
		</tr>
		<tr>
		<td align="center"> 
		카드 별칭
		</td>
		<td align="center">
		발급 은행
		</td>
		</tr>
		
		<tr>
		<td><input type="text" style="width: 200px" placeholder="미 입력시 소유자명" name="card_nickname">
		</td>
		<td>
		<input type="text" style="width: 100px" placeholder="은행입력" name="card_bank">
		</td>
		</tr>
		<tr>
		
		<td align="center"> 
		카드 범주
		</td>
		<td align="center"> 
		카드 종류
		</td>
		
		
		</tr>
		<tr>
		<td>
		<select id="card_list" style="width: 70%" name="card_category">
		<option value="">선택</option>
		<option value="개인" >개인</option>
		<option value="법인">법인</option>
		</select>
		</td>
		<td>
		<select id="card_list" style="width: 70%" name="card_type">
		<option value="">선택</option>
		<option value="체크" >체크</option>
		<option value="신용">신용</option>
		</select>
		</td>
		</tr>
		<tr>
		<td colspan="2" align="right">
		<button class="btn btn-primary" onclick="send(this.form);">카드 등록 </button>
		</td>
		
		</tr>
	</table>
	
	</form>
</div>


		


</body>
</html>