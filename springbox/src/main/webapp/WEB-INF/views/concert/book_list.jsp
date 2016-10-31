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
<title>예매정보 확인창</title>

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
	margin-left: 115px;
	padding-left: 25px;
	padding-top: 15px;
	padding-bottom: 17px;
}

.dateBox{	
	margin-left: 115px;
	border: 1px solid #FAC6C6;
	width:85%;
	height: 120px;
	padding-left: 25px;
	padding-top: 22px;
	
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
var month="${month}";

function Now(y,m,d){
	
	var Today = ' ~ '+y+' / '+(m+1)+' / '+d;
	
	now.setMonth(now.getMonth()-month);
	
	y=now.getFullYear();
	m=now.getMonth();
	d=now.getDate();
	
	var NotToday = ' - '+y+' / '+(m+1)+' / '+d;
	
	nowDate.innerHTML=NotToday+Today;
	
}


function Ok(payment_num) {
	
	window.open('book_detail.box?payment_num='+payment_num, '_blank', 'width=800, height=500,toolbars=yes');

} 

function payCheck(payment_num) {
	
	confirm("결제를 완료하셨습니까?");	
	location.href="pay_ok.box?payment_num="+payment_num+'&month='+month;

}

 function cBook(payment_num) {
		
		confirm("예약을 취소하시겠습니까?");		
		location.href="book_c.box?payment_num="+payment_num+'&month='+month;

	} 

</script>





</head>
<body onLoad="Now(nowy,nowm,nowd);">

	<br>
	<br>
	
	<div class="nameBox">
	<font size="6px" style="text-decoration: underline;">${sessionScope.loginName}</font>
	<font size="5px">님의 예매내역</font>		
	</div>
	
	<br>
	<br>
	<!-- -----------------------------날짜 버튼------------------------------------- -->
		<div class="dateBox">
	 <a href="book_list.box?month=1"> <input type="button" value="1개월" class="dateButton"></a>
	 <a href="book_list.box?month=3"> <input type="button" value="3개월" class="dateButton"></a>
	 <a href="book_list.box?month=6"> <input type="button" value="6개월"  class="dateButton"></a>
		<br><br><font size="4px"><p id="nowDate"></p></font>
		</div>	
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
				
			<!-- ---------------예매목록 시작---------------------------- -->
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
						<font color="red" style="font-weight: bold;">결제완료</font>
						<input type="button" class="cButton"  value="예약취소" onclick="cBook(${p.payment_num});"><br><br>
						</c:if> 
						
						<c:if test="${p.payment_check == '무통장입금'}">
						<font color="red" style="font-weight: bold;">결제대기 </font><br><br>								
						<input type="button" class="payButton" value="결제하기" onclick="payCheck(${p.payment_num});"><br><br>		
						<input type="button" class="cButton"  value="예약취소" onclick="cBook(${p.payment_num});"><br><br>				
						</c:if>
						
						<c:if test="${p.payment_check == '무통장입금 결제완료'}">
						<font color="red" style="font-weight: bold;">결제완료 </font><br><br>
						<input type="button" class="cButton"  value="예약취소" onclick="cBook(${p.payment_num});"><br><br>									
					    </c:if>	
					    
					    <c:if test="${p.payment_check == '취소완료'}">
						<font color="red" style="font-weight: bold;">취소완료 </font><br><br>								
					    </c:if>			
						
						</td>
					</tr>
					
					
					<!----------------------------예매목록 끝-------------------------------->
					
				</c:forEach>
			</table>
		</form>
	</c:if>



	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>