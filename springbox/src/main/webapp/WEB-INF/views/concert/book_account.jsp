<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가상계좌 확인창</title>

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<script type="text/javascript">

function Account(){

  var result = Math.floor( (Math.random() * (9999999999999 - 1111111111111 + 1)) + 1111111111111 );
  
  account_num.innerHTML=result;
}
</script>


<style>

.titleText{

margin-top: 50px;
margin-bottom: 50px;
font-size: 30px;
}


.account{
margin-top: 50px;
margin-bottom: 50px;
width:500px;
height: 170px;
font-size: 18px;

border-top: 2.5px solid black;
border-bottom: 2.5px solid black;
border-left: none;
border-right: none;
}

.account th{
text-align: center;
background-color: #F7F5F5;
border-bottom: 1px solid #d2d2d2; 
border-top: 1px solid #d2d2d2; 
border-right: 1px solid #d2d2d2; 
}

.account td{
 border-bottom: 1px solid #d2d2d2; 
border-top: 1px solid #d2d2d2; 

}

.accountTd{

 font-weight: bold;
 color:red;
}

.okButton{

width:200px;
height:40px;
color: white;
background-color: gray;

}


</style>

</head>
<body onload="Account();">

<div class="titleText" align="center">
공연명을 예매하셨습니다.<br><br>
<p style="font-size:14px; color:gray;">
입금기한은 예매날짜로부터 <b><font color=red>일주일</font></b>입니다. <br>
일주일안에 입금확인이 되지 않으며 예매취소처리되며, <br>
공연날짜 하루전까지 입금되지 않아도 예매취소될 수 있습니다.</p>
</div>


<table class=account border=1 align=center>
<tr align="center">
<th width=35%>
입금자
</th>
<td>
${sessionScope.loginName}
</td>
</tr>

<tr align="center">
<th>
입금은행
</th>
<td>
입금은행
</td>
</tr>

<tr align="center">
<th>
가상 계좌번호
</th>
<td class=accountTd>
<p id=account_num ></p>
</td>
</tr>
</table>

<div align="center" >
<a href="book_list.box?month=1"><input type="button" class="okButton" value="확인" width="300px" height="70px"/></a>
</div>


<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>