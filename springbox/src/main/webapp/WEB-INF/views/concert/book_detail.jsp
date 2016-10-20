<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset=UTF-8">
<title>Insert title here</title>

<style>

table, td, th {
    border: 1px solid black;    
}

table {
    border-collapse: collapse;
    width: 100%;
}

</style>


</head>
<body>
  

예매상세정보  &nbsp;&nbsp;  예매일자 : ${paymentdata.payment_date}

<br>
<br>

<table>
<tr align="center">
<td>예매번호</td>
<td>공연명</td>
<td>예매가격</td>
<td>할인금액</td>
<td>배송비</td>
<td>결제현황</td>
</tr>

<tr align="center">
<td>${paymentdata.payment_num}</td>
<td>${paymentdata.payment_title}</td>
<td>${paymentdata.payment_price}<br>
    (${paymentdata.payment_amount})</td>
<td>-&nbsp;0</td>
<td>2500</td>
<td>${paymentdata.payment_check}</td>
</tr>

</table>


<div class="user">
배송지정보
<table>
<tr align="center">
<td>받으시는 분</td>
<td>${sessionScope.loginName}</td>
</tr>

<tr align="center">
<td>연락처</td>
<td>${sessionScope.loginPhone}</td>
<td>주소</td>
<td>${paymentdata.payment_address}</td>
</tr>

</table>

</div>

<div class="pay">
결제정보
<table>
<tr>
<td>최종 결제금액</td>
<td>${paymentdata.payment_price}</td>
</tr>
<tr>
<td>${paymentdata.payment_check}</td>
</tr>
</table>


</div>




</body>
</html>