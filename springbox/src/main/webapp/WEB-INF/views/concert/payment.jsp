<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


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

</script>
</head>
<body>

	1. 할인적용
	<br> 2. 티켓수령
	<br> 3. 결제수단
	<br>

	<input type=radio name=payment value="신용카드"  onclick="Payment('pay1');">신용카드
	
	<input type=radio name=payment value="계좌이체" onclick="Payment('pay2');">계좌이체
	
	<input type=radio name=payment value="무통장입금" onclick="Payment('pay3');">무통장입금
	
	<div id="pay1" style="display: none;">신용카드 정보입니다.</div>
	<div id="pay2" style="display: none;">계좌이체 정보입니다.</div>
	<div id="pay3" style="display: none;">무통장입금 정보입니다.</div>




</body>
</html>