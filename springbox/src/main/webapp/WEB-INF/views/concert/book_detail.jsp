<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/front/header.jsp"%>



</head>
<body>
  

예매상세정보    예매일자 : ${paymentdata.payment_date}

<table class="table table-bordered">
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
<td>${concertdata.concert_title}</td>
<td>${paymentdata.payment_price}</td>
<td>-&nbsp;0</td>
<td>2500</td>
<td>${paymentdata.payment_check}</td>
</tr>

</table>



  

<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>