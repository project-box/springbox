<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무통장입금 결제확인창</title>
<style>
table, td, th {
    border-left: 3px solid #c8c8c8;  
    border-right: 3px solid #c8c8c8;  
    font-size: 16px; 
    
  
}

table {
	margin-top: 50px;
	margin-bottom:50px;
    border-collapse: collapse;
    width: 80%;
    height: 250px;
    border-bottom: 3px solid black;
    border-top: 3px solid black;
}


th {
  background-color: #dcdcdc;
  font-weight: bold;
  

}

td{
padding-left: 20px;
padding-right: 20px;

}


button{

width:170px;
height: 40px;
font-size: 13px;
background-color: #F06E6E;
color:white;
font-weight: bold;

}

</style>


<script>

function bookList(x){
	
	alert(x);
	
	opener.location.href="javascript:pay_check_ok("+x+");";

	window.close();
	
	
}




</script>

</head>
<body>

<div class=payCheck >

<table class=account border=1 align=center>
<tr align="center">
<th width=35%>
입금자
</th>
<td>
${sessionScope.loginName}
</td>
</tr>

<tr align="center">
<th>
입금은행
</th>
<td>
${paymentdata.payment_bank}
</td>
</tr>

<tr align="center">
<th>
입금금액
</th>
<td><fmt:formatNumber value="${paymentdata.payment_price}" pattern="#,###.##" /> &nbsp; 원
</td>
</tr>

<tr align="center">
<th>
가상 계좌번호
</th>
<td class=accountTd>
${paymentdata.payment_account}&nbsp;&nbsp;(주)BOX
</td>
</tr>
</table>

<div align="center">
<font style="font-size: 17px; font-weight: bold;">
무통장입금 결제를 완료 하셨습니까?</font><br><br>

<button onclick="bookList(1);">예</button>
<button onclick="bookList(0)">아니오</button>

</div>

</div>





</body>
</html>