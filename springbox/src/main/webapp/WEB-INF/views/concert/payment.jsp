<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/front/header.jsp"%>


<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function Payment(pay_choice) {

		if (pay_choice == "pay1") {

			document.getElementById("pay1").style.display = "";
			document.getElementById("pay2").style.display = "none";
			document.getElementById("pay3").style.display = "none";

		} else if (pay_choice == "pay2") {

			document.getElementById("pay1").style.display = "none";
			document.getElementById("pay2").style.display = "";
			document.getElementById("pay3").style.display = "none";

		} else if (pay_choice == "pay3") {

			document.getElementById("pay1").style.display = "none";
			document.getElementById("pay2").style.display = "none";
			document.getElementById("pay3").style.display = "";

		}
	}
	
	function Num() {
	    //대입 숫자
	    var num1=document.getElementById("num1").value;
	    var num2=document.getElementById("num2").value;
	    var num3=document.getElementById("num3").value;

	    //연산자
	    var operation1=document.getElementById("operation1").value;
	    var operation2=document.getElementById("operation2").value;
	    //결과값 넣기
	    document.getElementById("is_nums").innerHTML =eval(num1+operation1+num2+operation2+num3); 


	  }

	/* 	function Text(b) {

	 if(b == "B"){
	
	 document.getElementById("A").style.display = "none"; 
	 document.getElementById("B").style.display = "";
	
	 } else if(b == "A"){
	
	 document.getElementById("A").style.display = ""; 
	 document.getElementById("B").style.display = "none";

	 }
	
	 } */
</script>

<script>
	/* $(document).ready(function(){
	
	 $(":text").click(function(){
	
	 $(this).css("border",none);
	
	
	 });
	
	
	 }); */
</script>



<style>
.tabel-box {
	border: 1px solid #dcdcdc;
	width: 1000px;
	height: 90px;
	text-align: center;
}

.title {
<<<<<<< HEAD
    background-color: #FF4646; 
	color: white;
=======
	background-color: white;
	color: black;
>>>>>>> branch 'master' of https://github.com/project-box/springbox.git
	font-weight: bold;
	height: 30px;
	border-bottom-color: #FF6464;
	border-bottom-style: double;
}

input:focus {
	outline: none;
}

.select {
	width: 270px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: 5px;
}

.choice_a {
	background-color: #dcdcdc;
	width: 1000px;
	height: 100px;
	border: 1px solid gray;
	margin-left: 75px;
}

hr {
	border: 1px solid #dcdcdc;
	width: 1000px;
	margin-top: 50px;
	margin-left: 75px;
}

h4 {
	margin-left: 75px;
	font-weight: bold;
}

.div1 {
	width: 1000px;
	height: 170px;
	border: 1px solid black;
	padding: 10px;
	margin-left: 75px;
	overflow-x: hidden;
	overflow-y: auto;
	white-space: pre-wrap;
}

input[type=radio] {
	margin-right: 5px;
	margin-left: 10px;
	width: 17px;
	height: 17px;
}

input[type=checkbox] {
	margin-left: 75px;
}

.ul-box {
	list-style: none;
	margin-left: 36px;
	color: black;
}

.li-box {
	padding: 5px;
	border-top: 1px solid black;
	border-left: 1px solid black;
	border-right: 1px solid black;
	float: left;
	width: 333px;
	text-align: center;
	font-size: 17px;
	color: black;
}

.submit{

margin-left: 480px;
width:200px;
height:40px;
color: white;
background-color: red;

}



</style>



</head>
<body>

	<div class="container">
	
	<form name="payform" action="/springbox/book_add.box" method="post">
	<input type="hidden" name="concert_num" value="${concertdata.concert_num}">
	<input type="hidden" name="payment_date" value="${payment_date}">
	<input type="hidden" name="payment_time" value="${payment_time}">
	<input type="hidden" name="payment_amount" value="${payment_amount}">
	<%-- <input type="hidden" name="seat_seat" value="${seat_seat}"> --%>
		<!-- ----------------------------------------------------------------------------- -->
		<h4>1. 티켓정보</h4>
		<br> <br>

		<table class="tabel-box" border=1; align="center">

			<tr class="title">
				<td>날짜</td>
				<td>회차</td>
				<td>좌석 수</td>
				<td>좌석 번호</td>				
			</tr>

			<tr>
				<td>${payment_date}</td>
				<td>${payment_time}</td>
				<td>${payment_amount}</td>
				<td>${seat_seat}</td>
			</tr>

		</table>

		<br> <br> <br> <br>
		<!-- ----------------------------------------------------------------------------- -->
		<h4>2. 결제정보</h4>
		<br>

		<table class="tabel-box" border=1; align="center">

			<tr class="title">
				<td>티켓금액</td>
				<td>예매수수료</td>
				<td>배송비</td>
				<td>총 합</td>
			</tr>

			<tr>
				<td >${concertdata.concert_price}원</td>
				<td >1,000원</td>
				<td >2,500원</td>
				<td><c:set var="num" value="${concertdata.concert_price}"></c:set>
				<c:out value="${num+1000+2500}"></c:out>원</td>
			</tr>
		</table>

		<br> <br> <br> <br>

		<table class="tabel-box" border=1; align="center">
			<tr class="title">
				<td></td>
				<td>할인금액</td>
				<td>쿠폰/예매권</td>
				<td>포인트</td>
				<td>총 합</td>
			</tr>

			<tr>
				<td></td>
				<td>할인이 적용되지 않습니다.</td>
				<td>쿠폰 및 예매권이 없습니다.</td>
				<td>포인트 사용이 적용되지 않습니다.</td>
				<td>-0 원</td>
			</tr>
		</table>

		<br> <br>

		<table class="tabel-box" border=1; align="center">
			<tr class="title">
				<td>총 결제금액</td>
			<tr>
				<td colspan="4"><c:out value="${num+1000+2500}"></c:out>원</td>				
				<input type="hidden" name="payment_price" value="${num+1000+2500}">
			</tr>

		</table>

		<br> <br> <br> <br>

		<!-- ----------------------------------------------------------------------------- -->
		<h4>3. 티켓수령</h4>
		<!-- 	
	<input type=radio name=text value="A"  onclick="Text('A');" checked="checked" >
	회원정보에 등록된 주소	
	<input type=radio name=text value="B"  onclick="Text('B');" >
	주소 새로 작성하기	
	
	<br>
	
	
	<div id="A" style="display:">
	
	<table border=1;>
	
	<tr class="title" >
	<td colspan="2"> 주문자정보 </td>
	</tr>
	
	<tr>
	<td width="100px"> 받으시는 분   </td>
	<td> 정보</td>
	</tr>
	
		<tr>
	<td> 주소   </td>
	<td> 정보</td>
	</tr>
	
		<tr>
	<td> 휴대번호  </td>
	<td> 정보</td>
	</tr>	
	
	</table> 
	
	</div> -->

		<div>
			<table class="tabel-box" border=1; align="center">
				<tr class="title">
					<td colspan="2">주문자정보</td>
				</tr>

				<tr>
					<td width="180px" height="45px">받으시는 분</td>
					<td>${sessionScope.loginName}
					</td>
				</tr>

				<tr>
					<td height="45px">주소</td>
					<td><input type="text" name="payment_address" style="border: none;" size="70" placeholder="주소를 입력해주세요">
					</td>
				</tr>

				<tr>
					<td height="45px">휴대번호</td>
					<td>${sessionScope.loginPhone}</td>
				</tr>

			</table>

		</div>

		<br> <br> <br> <br>
		<!-- ----------------------------------------------------------------------------- -->
		<h4>4. 결제수단</h4>
		<font color="red" style="margin-left: 75px;">*결제수단을 선택해 주세요</font> <br>
		<br>

		<div style="margin-left: 75px;">

			<label><input type=radio name=payment_check value="신용카드" onclick="Payment('pay1');"> 
			<font size=4px>신용카드</font></label> 
			<label><input type=radio name=payment_check value="실시간계좌이체" onclick="Payment('pay2');">	
			<font size=4px>실시간계좌이체</font></label> 
			<label><input type=radio name=payment_check value="무통장입금" onclick="Payment('pay3');"> 
			<font size=4px>무통장입금</font></label>

		</div>

		<br>
		<br>

		<div id="pay1" style="display: none;">

			<div class="choice_a">

				&nbsp;&nbsp;카드종류 <select class="select">
					<option>선택</option>
					<option value="국민카드">국민카드</option>
					<option value="BC카드">BC카드</option>
					<option value="우리카드">우리카드</option>
					<option value="수협카드">수협카드</option>
					<option value="전북카드">전북카드</option>
					<option value="광주카드">광주카드</option>
					<option value="제주은행카드">제주은행카드</option>
					<option value="저축은행카드">저축은행카드</option>
					<option value="MG새마을체크">MG새마을체크</option>
					<option value="우체국카드">우체국카드</option>
					<option value="KDB산업은행카드">KDB산업은행카드</option>
					<option value="신협체크">신협체크</option>
					<option value="삼성카드">삼성카드</option>
					<option value="신한카드">신한카드</option>
					<option value="씨티카드">씨티카드</option>
					<option value="NG카드">NG카드</option>
					<option value="하나카드">하나카드</option>
					<option value="외환카드">외환카드</option>
				</select> <font color="red">*카드종류를 선택해 주세요</font> <br> &nbsp;&nbsp;할부선택
				<select class="select">
					<option>선택</option>
					<option value="2개월">2개월</option>
					<option value="3개월">3개월</option>
					<option value="4개월">4개월</option>
					<option value="5개월">5개월</option>
					<option value="6개월">6개월</option>
					<option value="7개월">7개월</option>
					<option value="8개월">8개월</option>
					<option value="9개월">9개월</option>
					<option value="10개월">10개월</option>
					<option value="11개월">11개월</option>
					<option value="12개월">12개월</option>
				</select> <input type="button" value="무이자할부 안내" /> * 할부는 50,000원 이상만 가능합니다.

			</div>

			<hr>
			<h4>결제대행서비스 이용약관</h4>

			<ul class="ul-box">
				<li><a class="li-box" href="#div1">기본약관</a></li>
				<li><a class="li-box" href="#div2">개인정보 수집, 이용</a></li>
				<li><a class="li-box" href="#div3">개인정보 제공, 위탁</a></li>
			</ul>



			<pre class="div1" id="div1">
					[전자금융거래 기본약관]

제1조 (목적)
이 약관은 주식회사 한국사이버결제(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.

제2조 (용어의 정의)
이 약관에서 정하는 용어의 정의는 다음과 같습니다.

1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
3. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
4. ‘가맹점’이라 함은 금융기관 또는 전자금융업자와의 계약에 따라 직불전자지급수단이나 선불전자지급수단 또는 전자화폐에 의한 거래에 있어서 이용자에게 재화 또는 용역을 제공하는 자로서 금융기관 또는 전자금융업자가 아닌 자를 말합니다. (신설 2010.09.13)
5. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
6. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
7. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
8. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
제3조 (약관의 명시 및 변경)
① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
제4조 (전자지급결제대행서비스의 종류)
회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.

1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.
제5조 (결제대금예치서비스의 내용)
① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
제6조 (이용시간)
① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
② 회사는 정보통신설비의 보수,점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.
제7조 (접근매체의 선정과 사용 및 관리)
① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
제8조 (거래내용의 확인)
① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.
② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 보존하고, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항을 제공합니다.
(일부개정 2010.09.13)
③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다. 
주소: 서울시 구로구 디지털로 33길 28, 5층(구로동, 우림이비지센터1차) 한국사이버결제
이메일 주소: help@kcp.co.kr
전화번호: 02-2108-1000
제9조 (오류의 정정 등)
① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
제 10조 (가맹점의 준수사항 등)
① 가맹점은 직불전자지급수단이나 선불전자지급수단 또는 전자화폐(이하 "전자화폐등"이라 한다)에 의한 거래를 이유로 재화 또는 용역의 제공 등을 거절하거나 이용자를 불리하게 대우하여서는 아니 됩니다.
② 가맹점은 이용자로 하여금 가맹점수수료를 부담하게 하여서는 아니 됩니다.
③ 가맹점은 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 아니 됩니다.
1. 재화 또는 용역의 제공 등이 없이 전자화폐등에 의한 거래를 한 것으로 가장(가장)하는 행위
2. 실제 매출금액을 초과하여 전자화폐등에 의한 거래를 하는 행위
3. 다른 가맹점 이름으로 전자화폐등에 의한 거래를 하는 행위
4. 가맹점의 이름을 타인에게 빌려주는 행위
5. 전자화폐등에 의한 거래를 대행하는 행위
④ 가맹점이 아닌 자는 가맹점의 이름으로 전자화폐등에 의한 거래를 하여서는 아니 됩니다.
(본조 신설 2010.09.13)
제11조 (가맹점 모집 등)
① 회사는 가맹점을 모집하는 경우에는 가맹점이 되고자 하는 자의 영업여부 등을 확인하여야 합니다. 다만, 「여신전문금융업법」 제16조의2의 규정에 따라 이미 확인을 한 가맹점인 경우에는 그러하지 아니합니다.
② 회사는 다음 각 호의 사항을 금융위원회가 정하는 방법에 따라 가맹점에 알려야 합니다.
1. 가맹점수수료
2. 제2항의 규정에 따른 가맹점에 대한 책임
3. 전조 규정에 따른 가맹점의 준수사항
③ 회사는 가맹점이 전조의 규정을 위반하여 형의 선고를 받거나 관계 행정기관으로부터 위반사실에 대하여 서면통보를 받는 등 대통령령이 정하는 사유에 해당하는 때에는 특별한 사유가 없는 한 지체 없이 가맹점계약을 해지하여야 합니다. ‘대통령령이 정하는 사유’라 함은 다음 각 호의 어느 하나에 해당하는 경우를 말합니다.
1. 가맹점이 전자금융거래법 제 26조 또는 전조 제3항제3호 내지 제5호를 위반하여 형을 선고받은 경우
2. 가맹점이 전조 제1항?제2항 또는 제3항제3호 내지 제5호를 위반한 사실에 관하여 관계 행정기관으로부터 서면통보가 있는 경우
3. 관계 행정기관으로부터 해당 가맹점의 폐업사실을 서면으로 통보 받은 경우 
(본조 신설 2010.09.13)
제12조 (회사의 책임)
① 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다.
② 회사가 접근매체의 발급주체이거나 사용, 관리주체인 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우에는 그러하지 아니합니다.
③ 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조 제2항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
④ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다.
⑤ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제 2조 제 1항 제 1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음과 같은 경우 회사는 이용자에 대하여 일부 또는 전부에 대하여 책임을 지지 않습니다.
1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 전자금융거래법 제9조 제1항 제3호에 따른(이하 ‘사고’라 한다)사고가 발생한 경우.
2. 이용자가 동항 제 1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우
가. 누설, 누출 또는 방치한 행위
나. 제 3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위
(본조 신설 2015.10.14)
제13조 (전자지급거래계약의 효력)
① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
제14조 (거래지시의 철회)
① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다.
② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을 반환받을 수 있습니다.
제15조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
제16조 (전자금융거래정보의 제공금지)
회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다.

제17조 (분쟁처리 및 분쟁조정)
① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
담당자: 김명건
연락처(전화번호, 전자우편주소): 070-7595-1031, minwon@kcp.co.kr 
(일부 개정 2015.10.14)
② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
③ 이용자는 '금융감독기구의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자보호법' 제31조 제1항의 규정에 따른 소비자보호원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
제18조 (회사의 안정성 확보 의무)
회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융감독위원회가 정하는 기준을 준수합니다.

제19조 (약관외 준칙 및 관할)
① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
부칙 < 제 1 호, 2006.12.26. >
본 약관은 2007년 1월 1일부터 시행한다.

부칙 < 제 2 호, 2011.01.17. >
본 약관은 2011년 02월 21일부터 시행한다.
(제 2조 4항 신설, 제 8조 2항 일부 개정, 제 10조 신설, 제11조 신설)

부칙 < 제 3 호, 2015.10.14. >
본 약관은 2015년 10월 14일부터 시행한다
(제 17조 제1항 일부 개정, 제 12조 제 5항 신설)

					</pre>
			<input type="checkbox">본인은 위의 내용을 모두 읽어보았으며 이에 전체 동의합니다.

			<hr>


			<h4>개인정보 제3자 제공</h4>
			<pre class="div1">
(주)BOX는 귀하께서 판매자로부터 상품 및 서비스를 구매하는 경우, 거래의 이행 및 거래 당사간 의사소통 및 상담, 배송 등 원활한 거래이행을 위하여 아래와 같은 최소한의 개인정보를 판매자 및 기획사에 제공합니다.

<table class="table table-bordered"> 
<tr align="left">
<td>제공받는자</td>
<td>(주)취향저격, 본 공연(행사)기획사, 공연장(행사장), 배송업체</td>
</tr>
<tr align="left">
<td>목적</td>
<td>-(주)취향저격: 판매자와 구매자간 거래이행 및 거래의 원활한 진행, 고객상담 및 불만처리, 상품(경품)배송을 위한 배송지 확인 등 
-본 공연(행사) 기획사: 티켓발권 및 현장운영, 캐스팅변경, 공연취소 등에 대한 고객안내, 응대
-공연장(행사장), 공연(행사) 진행 및 현장 좌석 안내, 예매 확인
-배송업체: 티켓 배송을 선택하였을 경우, 티켓 배송이행</td>
</tr>
<tr align="left">
<td>항목</td>
<td>성명, 아이디, 전화번호, 휴대폰번호, 이메일, 예매정보, 배송지 정보</td>
</tr>
<tr align="left">
<td>보유기간</td>
<td>개인정보 이용목적 달성 시까지(단, 관계법령의 규정에 의한 경우 규정된 시점까지 또는 이용자로부터 
사전동의를 받은 경우 해당 보유기간까지)</td>
</tr>			
	</table>				
					
		</pre>

		<input type="checkbox">개인정보 제3자 제공에 동의

		</div>

		<div id="pay2" style="display: none;"></div>

		<div id="pay3" style="display: none;"></div>
		
		
		<input type="submit" class="submit" value="결제하기">
		
		</form>
		
	</div>

	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>