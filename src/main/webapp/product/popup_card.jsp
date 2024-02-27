<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="KeyPad_Crypto.*"%>
<html>
<head>
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
</script>
</head>
<body>
<div id="wrap">
	<h2 align="center">카드 정보</h2>
	<table>
		<tr>
			<th>카드 정보를 입력해 주세요</th>
		</tr>
		<tr>
			<td align="left">카드번호</td>
		</tr>
		<tr >
			<td align="center"  style="width: 50px" >
			<input  type="number"  inputmode="numeric"  inputmode="numeric" maxlength="4" placeholder="0000" oninput="limitInputLength(this)" >
			-<input type="number" maxlength="4" placeholder="0000" oninput="limitInputLength(this)"  >
			-<input type="password" inputmode="numeric" maxlength="4" placeholder="0000" oninput="limitInputLength(this)"  Number_keypad="on">
			-<input type="password" inputmode="numeric" maxlength="4" placeholder="0000" oninput="limitInputLength(this)"  Number_keypad="on"></td>
		</tr>
	</table>
</div>


		


</body>
</html>