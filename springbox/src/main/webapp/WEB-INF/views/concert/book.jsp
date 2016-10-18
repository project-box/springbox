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
<script src="https://code.jquery.com/jquery-latest.js"></script>

<style>
td {
	font-size: 12px;
	text-decoration: none;
	width: 38px;
	height: 38px;
}

th {
	height: 35px;
	text-align: center;
}

A:link, A:active, A:visited {
	text-decoration: none;
	font-size: 10px;
	color: #333333;
}

A:hover {
	text-decoration: none;
	color: ff9900;
}

font {
	font-size: 12px;
}

.cnj_input {
	position: relative;
	margin-right: 80px;
	margin-left: 10px;
}

/* -------------------------------------- */
.form-control {
	width: 200px;
}

hr {
	border: solid 1px black;
	width: 870px;
	margin-top: 50px;
}

.table-hover {
	width: 300px;
	font-size: 13px;
}

.timechoice {
	margin-left: 50px;
}

.date_time_choice {
	float: left;
	margin-left: 10px;
}

.box {
	margin-left: 380px;
	margin-bottom: 20px;
	margin-top: 20px;
	width: 469px;
	height: 30px;
	background-color: #a0a0a0;
	color: white;
}

/* ----------------------------------------------------------- */

/* checkbox*/
.a {
	float: left;
	margin-right: 1%;
	margin-top: 15px;
}

.b {
	float: left;
	margin-left: 1%;
	margin-right: 1%;
	margin-top: 15px;
}

.c {
	float: left;
	margin-left: 1%;
	margin-top: 15px;
}

.checkbox {
	display: none;
}

.checkbox+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 15px;
	padding-bottom: 5px;
	margin-left: 5px;
	margin-bottom: 15px;
	font-size: 13px;
}

.checkbox+label:before {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 50px;
	position: absolute;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
	border-radius: 2px;
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

.checkbox:checked+label:before {
	content: "\2713";
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 17px;
	font-weight: 800;
	color: #fff;
	background: #2f87c1;
	text-align: center;
	line-height: 19px;
}
</style>




<script language='JavaScript'>

var monthName=new Array("1월","2월","3월","4월","5월","6월","7월",
"8월","9월","10월","11월","12월")

var monthDays=new Array(31,28,31,30,31,30,31,31,30,31,30,31)
var now=new Date()
var nowd=now.getDate()
var nowm=now.getMonth()
var nowy=now.getFullYear()



   function showCalendar(day,month,year) {
      if ((year%4==0||year%100==0)&&(year%400==0)) monthDays[1]=29; else monthDays[1]=28 //leap year test

        var firstDay=new Date(year,month,1).getDay()
        var cnj_str="<table border=0 cellpadding=10 cellspacing=1 bgcolor=#CCCCCC>"

            cnj_str+="<tr bgcolor='#323232'><td colspan=7>"
			cnj_str+="<table border=0 cellpadding=0 cellspacing=0 align=center width=100%>"
			cnj_str+="<td><a href='javascript:;' onClick='nowm--; if (nowm<0) { nowy--; nowm=11; } showCalendar(nowd,nowm,nowy)' title='이전 월'><font color='white'> << </font></a></td>"
			cnj_str+="<td align=center><font color='white'><b>"+nowy+"년"+" "+monthName[month].toUpperCase()+"</b></font></td>"
			cnj_str+="<td align=right><a href='javascript:;' onClick='nowm++; if (nowm>11) { nowy++; nowm=0; } showCalendar(nowd,nowm,nowy)' title='다음 월'><font color='white'> >> </font></a></td>"
			cnj_str+="</tr></table>"
			cnj_str+="</td></tr>"
			cnj_str+="<tr align=center bgcolor='#FFFFFF'>"
			cnj_str+="<th><font color='red'><b>일</b></font></th>"
			cnj_str+="<th><font color='black'><b>월</b></font></th>"
			cnj_str+="<th><font color='black'><b>화</b></font></th>"
			cnj_str+="<th><font color='black'><b>수</b></font></th>"
			cnj_str+="<th><font color='black'><b>목</b></font></th>"
			cnj_str+="<th><font color='black'><b>금</b></font></th>"
			cnj_str+="<th><font color='black'><b>토</b></font></th>" 
			cnj_str+="</tr>"
			
			var dayCount=1
			
			cnj_str+="<tr bgcolor=white>"

   		for (var i=0;i<firstDay;i++) cnj_str+="<td bgcolor='#dcdcdc'> " //공백

 		for (var i=0;i<monthDays[month];i++) {
       		 	if(dayCount==nowd) {
        		 cnj_str+="<td align=center bgcolor='#FAC6C6'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게
         		} else {
         	     cnj_str+="<td align=center >" // 오늘 날짜가 아닐때 배경색 지정
         		}

       		 cnj_str+="<a href=javascript:void(0) id='date"+dayCount+"' onclick='Test("+dayCount+","+month+","+year+");'>" // 링크설정
       		 cnj_str+=dayCount++ // 날짜
       		 cnj_str+="</a>"

          
       		 
			     if(dayCount==nowd) {
				  cnj_str+="</b>" // 오늘 날짜일때 글자 진하게
				 } else {
				  cnj_str+="" // 오늘 날짜가 글자 진하게 안함
				 }



			    if ((i+firstDay+1)%7==0&&(dayCount<monthDays[month]+1)) 
	
				  cnj_str+="<tr bgcolor=white>"

        }

		var totCells=firstDay+monthDays[month]
		
		for (var i=0;i<(totCells>28?(totCells>35?42:35):28)-totCells;i++) 
			
			cnj_str+="<td>"
			cnj_str+="</table><BR>"
			
            calendar.innerHTML=cnj_str
	}


 function Test(dayCount,month,year){
	 

	 var date = year+"/"+(month+1)+"/"+dayCount;

	document.getElementById('payment_date').value = date

 }



function Send() {

   opener.document.paymentform.payment_date.value=$("#payment_date").val();
   opener.document.paymentform.payment_time.value=$("#payment_time").val();
   opener.document.paymentform.payment_seat.value=$("#payment_seat").val();
   opener.document.paymentform.payment_amount.value=$("#payment_amount").val();
   
    opener.location.href="javascript:Call();";

	window.close();
    
}

 
</script>
<script>


		$(document).ready(function(){
				
		$(":checkbox").click(function(){
				if($(this).is(":checked")){
	
					
					$("#payment_seat").val($(this).val());
			
					/* alert( $(this).val()); */												
				}	
			});	
		
		$("#time").click(function(){
			
				$("#payment_time").val($(this).val());
		
				/* alert( $(this).val()); */												
				
		});	
		
		$("#amount").click(function(){
			
			$("#payment_amount").val($(this).val());
	
			/* alert( $(this).val()); */												
			
	});	

		}); 

		
		
	</script>
<body onLoad="showCalendar(nowd,nowm,nowy)">

	<div class="container">

		<form name="paymentform" method="post" action="/springbox/payment.box">

			<div class="date_time_choice">


				<h3>공연날짜 선택</h3>
				<br>
				<p id="calendar" class="cnj_input"></p>



				<h3>회차선택</h3>
				<br> <select id="time" class="form-control">
					<option>회차선택</option>
					<option value="1회차 12:00">1회차 12:00</option>
					<option value="2회차 15:30">2회차 15:30</option>
					<option value="3회차 19:00">3회차 19:00</option>
				</select>
				

			</div>

			<br>

			<div class="seatchoice">
			
			
				<h3>좌석 수 선택</h3>
				<br> <select id="amount" class="form-control">
					<option>좌석 수 선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>				
				</select>
			
				<h3>좌석 선택</h3>
				<br>
				<div>

					<table class="box">
						<tr align="center">
							<td>무대</td>
						</tr>
					</table>

				</div>

				<div class="seat">

					<div class="a">

						<c:forEach var="i" begin="1" end="50">
							<input type="checkbox" class="checkbox" value="A구역${i}번"
								id="A구역${i}번"/>
							<label for="A구역${i}번" title="A구역${i}번"></label>
							<c:if test="${i % 5 == 0 && i != 50}">
								<br>
							</c:if>
						</c:forEach>

					</div>


					<div class="b">

						<c:forEach var="i" begin="121" end="200">
							<input type="checkbox" class="checkbox" value="B구역${i-120}번"
								id="B구역${i-120}번" />
							<label for="B구역${i-120}번" title="B구역${i-120}번"></label>
							<c:if test="${i % 8 == 0 && i != 200}">
								<br>
							</c:if>
						</c:forEach>
					</div>


					<div class="c">
						<c:forEach var="i" begin="201" end="250">

							<input type="checkbox" class="checkbox" value="C구역${i-200}번"
								id="C구역${i-200}번"/>
							<label for="C구역${i-200}번" title="C구역${i-200}번"></label>

							<c:if test="${i % 5 == 0 && i != 250}">
								<br>
							</c:if>

						</c:forEach>
					</div>

				</div>
			</div>

			<br> <br>

			<div class="col-sm-12">

				<hr>

				<table class="table table-hover">

					<tr>
						<th>선택한 날짜</th>
						<th>선택한 회차</th>
						<th>선택한 좌석 수</th>
						<th>선택한 좌석</th>
						<th></th>
					</tr>
					<tr>
						<td><input type="text" id="payment_date" name="payment_date"
							class="form-control" placeholder="날짜를 선택해주세요"
							style="font-weight: bold; border: none; align: center;">
						</td>
						<td><input type="text" id="payment_time" name="payment_time"
							class="form-control" placeholder="회차를 선택해주세요"
							style="font-weight: bold; border: none; align: center;">
						</td>
						<td><input type="text" id="payment_amount" name="payment_amount"
							class="form-control" placeholder="좌석 수를 선택해주세요"
							style="font-weight: bold; border: none; align: center;">
						</td>						
						<td><input type="text" id="payment_seat" name="payment_seat"
							class="form-control" placeholder="좌석을 선택해주세요"
							style="font-weight: bold; border: none; align: center;"></td>
							
						<td><input type="button" onclick="Send();" value="결제하기" class="btn btn-insert" />
						</td>
					</tr>

				</table>
			</div>

		</form>

	</div>

	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>