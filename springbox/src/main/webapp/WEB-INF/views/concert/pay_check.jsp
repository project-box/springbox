<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>무통장입금 결제창</title>

<style>

.paycheck{

 width: 85%;
 height: 85%;
 color: white;
 padding : 25px;

}
</style>

<script>

function payOk(payment_num){
	
	opener.location.href="javascript:Re("+payment_num+");";
	window.close();
	
}

</script>


</head>
<body>


<div class="payCheck">

무통장입금 결제를 완료하셨습니까?

<input type="button" value="결제완료" onclick= "payOk(${payment_num});" >
<input type="button" value="결제미완료" >

</div>




</body>
</html>