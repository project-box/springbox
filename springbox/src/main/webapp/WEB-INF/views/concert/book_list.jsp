<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset=UTF-8>
<title>Insert title here</title>

<style>


.bookListTable{
width:85%;
border-bottom: 1px solid #dcdcdc;
border-left: none;
border-right: none;
}

.bookListTable th{

text-align: center;
background-color: #F7F5F5;
border-top: 2.5px solid black;
border-bottom: 1px solid #828282;
}

.viewButton{

outline:none;
background: #F7F5F5;
font-weight: bold;
width: 130px;
height: 30px;


}

.payButton{

outline:none;
background: #F7F5F5;
font-weight: bold;
width: 80px;
height: 30px;


}


</style>






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

<br>
<br>
<table width=85% align=center border=1 >
<tr>
<td>

<font size="6px" style="text-decoration: underline;">${sessionScope.loginName}</font>
<font size="5px">님의 예매내역</font>


</td>
</tr>
</table>
<br>
<br>
<br>
















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
<table align="center" class='bookListTable' border=1 > 
<tr valign="middle" height=50px >
							<th width=20%>예매일자</th>
							<th width=45%>예매공연 정보</th>
							<th width=10%>수량</th>
							<th width=15%>결제금액</th>
							<th width=10%>결제현황</th>
						</tr>
						
						<c:forEach var="p" items="${paymentdata}">
						<tr align="center" valign="middle" height=100px>
				<%-- 	<input type="hidden" name="concert_num" value="${p.concert_num}">
					<input type="hidden" name="payment_num" value="${p.payment_num}"> --%>
						<td><font size="3px" color="#282828"  style="font-weight: bold;"><fmt:formatDate value="${p.payment_registerdate}" pattern="yyyy-MM-dd"/>						
						</font><br><br><input type="button" class="viewButton" value="상세보기" onclick="Ok(${p.payment_num});"></td>
																		
				<td align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="concert_detail.box?concert_num=${p.concert_num}">
				<img src="/springbox/img/${p.payment_poster}" width="85" height="120" alt="title"/>
				</a>	
				
				
							
			&nbsp;&nbsp;<a href="concert_detail.box?concert_num=${p.concert_num}" style="color: black">
			${p.payment_title}</a><br><br></td>			
						<td><font size="3px" color="#282828"  style="font-weight: bold;">${p.payment_amount}</font></td>
						<td><b><fmt:formatNumber value="${p.payment_price}" pattern="#,###.##"/>&nbsp;원</b></td>
						<td><c:if test="${p.payment_check == '신용카드'}">	결제완료</c:if>
						<c:if test="${p.payment_check == '실시간계좌이체'}">	결제완료</c:if>
						<c:if test="${p.payment_check == '무통장입금'}"><font color="red" style="font-weight: bold;">결제대기 </font><br><br>					
						<input type="button" class="payButton" value="결제하기"></c:if>
						</td>
						</tr>
</c:forEach>
</table>
</form>
</c:if> 



<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>