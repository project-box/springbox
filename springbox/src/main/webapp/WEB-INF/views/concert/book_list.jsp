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


<script>

function Ok(payment_num, concert_num) {
	
	window.open('book_detail.box?payment_num='+payment_num, '_blank', 'width=800, height=500,toolbars=yes');

	
	/* 
 	document.bookform.method="post";
	document.bookform.action="/springbox/book_detail.box";
	document.bookform.target="book_detail"
	
	document.bookform.submit(); */
	
	
} 


</script>





</head>
<body>

<!-- ---------------------예매내역이 없을 때-------------------------------- -->

<c:if test="${empty paymentdata}">

<table border=1px> <tr align="center" valign="middle">
						<td colspan="4" height="200" width="800">
						<font size=2>예매내역이 없습니다.</font></td>
					</tr>
</table>
</c:if>


<!-- --------------------------예매내역이 있을 때------------------------------------ -->


<c:if test="${!empty paymentdata}">
<form name="bookform">
<table border=1px> <tr align="center" valign="middle" height=50px>
							<td width=100px>예매일자</td>
							<td width=200px>예매공연 정보</td>
							<td width=100px>수량</td>
							<td width=100px>결제금액</td>
							<td width=100px>결제현황</td>	
						</tr>
						<c:forEach var="p" items="${paymentdata}">
						<tr align="center" valign="middle" height=100px>
				<%-- 	<input type="hidden" name="concert_num" value="${p.concert_num}">
					<input type="hidden" name="payment_num" value="${p.payment_num}"> --%>
						<td>${p.payment_date}<br>
						<input type="button" value="상세보기" onclick="Ok(${p.payment_num});"></td>												
				<td><br><a href="concert_detail.box?concert_num=${p.concert_num}">
				<img src="/springbox/img/${p.payment_poster}" width="100" height="140" alt="title"/>
				</a>				
			<br><br><a href="concert_detail.box?concert_num=${p.concert_num}">
			${p.payment_title}</a><br><br></td>			
						<td>${p.payment_amount}</td>
						<td>${p.payment_price}</td>
						<td><c:if test="${p.payment_check == '신용카드'}">	결제완료</c:if>
						<c:if test="${p.payment_check == '실시간계좌이체'}">	결제완료</c:if>
						<c:if test="${p.payment_check == '무통장입금'}">결제대기 <br>					
						<input type="button" value="결제하기"></c:if>
						</td>
						</tr>
</c:forEach>
</table>
</form>
</c:if> 



<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>