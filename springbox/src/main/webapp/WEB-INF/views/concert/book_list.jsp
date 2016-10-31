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
.bookListTable {
	width: 85%;
	border-bottom: 1px solid #dcdcdc;
	border-left: none;
	border-right: none;
}

.bookListTable th {
	text-align: center;
	background-color: #F7F5F5;
	border-top: 2.5px solid black;
	border-bottom: 1px solid #828282;
}

.viewButton {
	outline: none;
	background: #F7F5F5;
	font-weight: bold;
	width: 130px;
	height: 30px;
}

.payButton {
	outline: none;
	background: #F7F5F5;
	font-weight: bold;
	width: 80px;
	height: 30px;
}

.nameBox {
	width: 85%;
	height: 80px;
	background-color: #4A4E5D;
	color: white;
}

.dateBox{	
	margin-left: 115px;
	border: 1px solid #FAC6C6;
	width:85%;
	height: 100px;
}

.dateBox td{

	padding-left: 30px;
	padding-top: 25px;
	padding-bottom: 17px;

}

.dateButton{
	background-color: white;
	outline: none;
	color: #3c3c3c;
	width: 80px;
	height: 30px;
	vertical-align: middle;

}

#nowDate{

color:red;

}

.cButton {
	outline: none;
	background: #FAC6C6;
	font-weight: bold;
	width: 80px;
	height: 30px;
}


</style>






<%@ include file="/WEB-INF/views/front/header.jsp"%>

<script>

var now=new Date()
var nowd=now.getDate()
var nowm=now.getMonth()
var nowy=now.getFullYear()

function Now(year,month,day){
	
	nowDate.innerHTML='- '+year+'/'+(month+1)+'/'+day;
	
}


function Ok(payment_num, concert_num) {
	
	window.open('book_detail.box?payment_num='+payment_num, '_blank', 'width=800, height=500,toolbars=yes');

} 


</script>





</head>
<body onLoad="Now(nowy,nowm,nowd);">

	<br>
	<br>
	<table align=center border=1 class="nameBox">
		<tr>
			<td>&nbsp;&nbsp; <font size="6px"
				style="text-decoration: underline;">${sessionScope.loginName}</font>
				<font size="5px">님의 예매내역</font>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>

 
 
	<table class="dateBox" border=1 cellpacing=3>
		<tr>
			<td>
			
			<input type="button" name="btnTerm1M" value="1개월" id="btnTerm1M" class="dateButton" /> 
			<input type="button" name="btnTerm3M" value="3개월" id="btnTerm3M" class="dateButton" /> 
			<input type="button" name="btnTerm6M" value="6개월" id="btnTerm6M" class="dateButton" />
						
			<br><br><p id="nowDate"></p>
			
			</td>
		</tr>
	</table>
	<br>
	<br>


	<!-- ---------------------예매내역이 없을 때-------------------------------- -->

	<c:if test="${empty paymentdata}">

		<table align="center" class='bookListTable' border=1>
			<tr valign="middle" height=50px>
				<th width=20%>예매일자</th>
				<th width=45%>예매공연 정보</th>
				<th width=10%>수량</th>
				<th width=15%>결제금액</th>
				<th width=10%>결제현황</th>
			</tr>
			<tr align="center" valign="middle" height=100px>
				<td colspan=5>예매내역이 없습니다.</td>
			</tr>
		</table>
	</c:if>


	<!-- --------------------------예매내역이 있을 때------------------------------------ -->


	<c:if test="${!empty paymentdata}">
		<form name="bookform">
			<table align="center" class='bookListTable' border=1>
				<tr valign="middle" height=50px>
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
						<td><font size="3px" color="#282828"
							style="font-weight: bold;"><fmt:formatDate
									value="${p.payment_registerdate}" pattern="yyyy-MM-dd" /> </font><br>
						<br>
						<input type="button" class="viewButton" value="상세보기"
							onclick="Ok(${p.payment_num});"></td>

						<td align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="concert_detail.box?concert_num=${p.concert_num}"> <img
								src="/springbox/img/${p.payment_poster}" width="85" height="120"
								alt="title" />
						</a> &nbsp;&nbsp;<a
							href="concert_detail.box?concert_num=${p.concert_num}"
							style="color: black"> ${p.payment_title}</a><br>
						<br></td>
						<td><font size="3px" color="#282828"
							style="font-weight: bold;">${p.payment_amount}</font></td>
						<td><b><fmt:formatNumber value="${p.payment_price}"
									pattern="#,###.##" />&nbsp;원</b></td>
						<td>
						<br>
						<c:if test="${p.payment_check == '신용카드'}">	
						<font color="red" style="font-weight: bold;">결제완료</font></c:if> 
						<c:if test="${p.payment_check == '실시간계좌이체'}">	
						<font color="red" style="font-weight: bold;">결제완료</font></c:if> 
						<c:if test="${p.payment_check == '무통장입금'}">
						<font color="red" style="font-weight: bold;">결제대기 </font>
								<br>
								<br>
						<input type="button" class="payButton" value="결제하기"><br><br>
						<input type="button" class="cButton"  value="예약취소"><br><br>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</c:if>



	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>