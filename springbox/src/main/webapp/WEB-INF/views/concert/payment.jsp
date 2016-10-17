<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/front/header.jsp"%>


<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	function Payment(pay_choice) {

		if(pay_choice == "pay1"){
			
		document.getElementById("pay1").style.display = ""; 
		document.getElementById("pay2").style.display = "none";
		document.getElementById("pay3").style.display = "none"; 
		
		}else if(pay_choice == "pay2"){
			
			document.getElementById("pay1").style.display = "none"; 
			document.getElementById("pay2").style.display = "";
			document.getElementById("pay3").style.display = "none"; 
			
		}else if(pay_choice == "pay3"){
			
			document.getElementById("pay1").style.display = "none"; 
			document.getElementById("pay2").style.display = "none";
			document.getElementById("pay3").style.display = ""; 
			
			
		}
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

table{

border: 1px solid #bcbcbc;
width:800px;
height:70px;
text-align: center;

}

.title{

background-color: #FF0000;
color:white;
font-weight: bold;
height:30px;

}

input:focus{

outline: none;
}


</style>



</head>
<body>

<div class="contents">
<!-- ----------------------------------------------------------------------------- -->
	<h4>1. 티켓정보</h4>
	<br><br>
	
	<table border=1;>
	
	<tr class="title" >
	<td> 날짜 </td>
	<td> 회차 </td>
	<td> 좌석 </td>
	</tr>
	
	<tr>
	<td>${payment_date}</td>
	<td>${payment_time}</td>
	<td>${payment_seat}</td>
	</tr>
		
	</table>
	
	<br>
	<br>
	<br>
	<br>
<!-- ----------------------------------------------------------------------------- -->
	<h4>2. 결제정보</h4>
	<br>
	 
	<table border=1;>
	
	<tr class="title" >
	<td></td>
	<td> 티켓금액 </td>
	<td> 예매수수료 </td>
	<td> 배송비 </td>
	<td></td>
	</tr>
	
	<tr>
	<td></td>
	<td>${concertdata.concert_price}원</td>
	<td>1,000원</td>
	<td>2,500원</td>
	<td>정보</td>
	</tr>
	</table>
	
	<br>
	<br>
	<br>
	<br>
	
	<table  border=1;>	
	<tr class="title" >
	<td></td>
	<td>할인금액</td>
	<td>쿠폰/예매권</td>
	<td>포인트</td>
	<td></td>
	</tr>
	
	<tr>
	<td></td>
	<td>할인이 적용되지 않습니다..</td>
	<td>쿠폰 및 예매권이 없습니다.</td>
	<td>포인트 사용이 적용되지 않습니다.</td>
	<td>정보</td>
	</tr>
	</table>	
		
		<br><br>
		
	<table  border=1;>	
	<tr class="title" >
	<td>총 결제금액</td>
	
	<tr>
	<td colspan="4">정보</td>	
	</tr>
		
	</table>
	
	<br>
	<br>
	<br>
	<br>
	
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
	
	<table border=1;>
	
	<tr class="title" >
	<td colspan="2"> 주문자정보 </td>
	</tr>
	
	<tr>
	<td width="100px"> 받으시는 분   </td>
	<td><input type="text" style="border:none;" size="70"> </td>
	</tr>
	
		<tr>
	<td> 주소   </td>
	<td><input type="text" style="border:none; " size="70"> </td>
	</tr>
	
		<tr>
	<td> 휴대번호  </td>
	<td><input type="text" style="border:none;" size="70"> </td>
	</tr>	
	
	</table> 
	
	</div>	
	
	<br>
	<br>
	<br>
	<br>
	<!-- ----------------------------------------------------------------------------- -->
	<h4>4. 결제수단</h4>
	<br>

	<input type=radio name=payment value="신용카드"  onclick="Payment('pay1');">신용카드	
	<input type=radio name=payment value="계좌이체" onclick="Payment('pay2');">계좌이체	
	<input type=radio name=payment value="무통장입금" onclick="Payment('pay3');">무통장입금
	
	<div id="pay1" style="display: none;"><table border=1;>
	
	<tr class="title" >
	<td> 날짜 </td>
	<td> 회차 </td>
	<td> 좌석 </td>
	</tr>
	
	<tr>
	<td>정보</td>
	<td>정보</td>
	<td>정보</td>
	</tr>
		
	</table></div>
	<div id="pay2" style="display: none;"><table border=1;>
	
	<tr class="title" >
	<td> 날짜 </td>
	<td> 회차 </td>
	<td> 좌석 </td>
	</tr>
	
	<tr>
	<td>정보</td>
	<td>정보</td>
	<td>정보</td>
	</tr>
		
	</table></div>
	
	
	<div id="pay3" style="display: none;"><table border=1;>
	
	<tr class="title" >
	<td> 날짜 </td>
	<td> 회차 </td>
	<td> 좌석 </td>
	</tr>
	
	<tr>
	<td>정보</td>
	<td>정보</td>
	<td>정보</td>
	</tr>
		
	</table></div>

</div>

<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>