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

.container{

margin-left:20px;
margin-right:20px;

}


table, td, th {
    border-bottom: 1px solid #c8c8c8;  
    border-top: 1px solid #c8c8c8;  
    font-size: 13px; 
    
  
}

table {
    border-collapse: collapse;
    width: 100%;
}


th {

  background-color: #dcdcdc;
  font-weight: normal;

}

td{

padding-left: 20px;
padding-right: 20px;
}


.user{

float: left;
width: 53%;
margin-top:20px;

}

.pay{

float: right;
width: 42%;
margin-top:20px;
}


</style>


</head>
<body>
  
<div class="container">
  
  
<font size="5" style="font-weight:bold;">예매상세정보</font> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
예매일자 : <font size=4 style="font-weight:bold;">${paymentdata.payment_date}</font>
<br>
<hr>
<br>

<table>
<tr align="center">
<th height=35px>예매번호</th>
<th width="30%">공연명</th>
<th>예매가격</th>
<th>할인금액</th>
<th>배송비</th>
<th>결제현황</th>
</tr>

<tr align="center">
<td height=55px>${paymentdata.payment_num}</td>
<td>${paymentdata.payment_title}</td>
<td >${paymentdata.payment_price}<br>
    (${paymentdata.payment_amount})</td>
<td style="font-weight: bold; color: red;">-&nbsp;0</td>
<td >2500</td>
<td>${paymentdata.payment_check}</td>
</tr>

</table>


<div class="user">
<font size=4, style="font-weight: bold;">배송지정보</font>
<br><br>
<table >
<tr align="center">
<th height=35px width=30%>받으시는 분</th>
<td>${sessionScope.loginName}</td>
</tr>

<tr align="center">
<th height=35px >연락처</th>
<td>${sessionScope.loginPhone}</td>
</tr>

<tr align="center">
<th height=35px>주소</th>
<td>${paymentdata.payment_address}</td>
</tr>

</table>
<br><font size=2>법인 / 기업카드는 신용카드 무이자 할부 적용이 되지 않습니다. </font>

</div>

<div class="pay">
<font size=4, style="font-weight: bold;">결제정보</font>
<br><br>
<table >
<tr align="center">
<th width="200px"  height=50px >최종 결제금액<br>(${paymentdata.payment_check})</th>
<td style="font-weight: bold;" >${paymentdata.payment_price}</td>
</tr>
<tr align="center">
<th height=35px >예매가격</th>
<td>${paymentdata.payment_price}</td>
</tr>
<tr align="center">
<th height=35px >배송비</th>
<td>2500</td>
</tr>
<tr align="center">
<th height=35px >쿠폰할인</th>
<td style="font-weight: bold; color: red;">-&nbsp;0</td>
</tr>
<tr align="center">
<th height=35px >포인트할인</th>
<td style="font-weight: bold; color: red;">-&nbsp;0</td>
</tr>

</table>


</div>

</div>


</body>
</html>