<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


.dateTabel{
    border: 1px solid #bebebe;
}


 .dateClick1{
 border:0px;
 font-size: 10px;
 background-color: white;
 width:38px;
 height: 38px;
} 

.dateClick1:hover, .dateClick1:active, .dateClick1:focus{

background-color: #FF8282;
color: white;
outline: none;

}

.dateClick1:visited{

background-color: white;

}

.dateClick2{

border:0px;
 font-size: 10px;
 background-color: transparent;
 width:38px;
 height: 38px;

}

.dateClick2:hover, .dateClick2:active, .dateClick2:focus{
 cursor: default;
 outline: none;
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
	font-weight: bold;
	border: none;
	text-align: center;
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

.checkbox:disabled+label:before {
	background-color: #ccc;
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
	background-color: #F4B4B4;
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
	background: #800000;
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
var startd=<fmt:formatDate value='${concertdata.concert_startdate}' pattern='dd'/>;
var startm=<fmt:formatDate value='${concertdata.concert_startdate}' pattern='MM'/>-1;
var starty=<fmt:formatDate value='${concertdata.concert_startdate}' pattern='yyyy'/>;
var endd=<fmt:formatDate value='${concertdata.concert_enddate}' pattern='dd'/>;
var endm=<fmt:formatDate value='${concertdata.concert_enddate}' pattern='MM'/>-1;
var endy=<fmt:formatDate value='${concertdata.concert_enddate}' pattern='yyyy'/>;
var max=1;
var date=null;
var time=null;
var startd2=<fmt:formatDate value='${concertdata.concert_startdate}' pattern='dd'/>;
var startm2=<fmt:formatDate value='${concertdata.concert_startdate}' pattern='MM'/>-1;
var starty2=<fmt:formatDate value='${concertdata.concert_startdate}' pattern='yyyy'/>;

   function showCalendar(day,month,year) {
      if ((year%4==0||year%100==0)&&(year%400==0)) monthDays[1]=29; else monthDays[1]=28 //leap year test

        var firstDay=new Date(year,month,1).getDay() 
        
        var cnj_str="<table class='dateTabel' border=0 cellpadding=10 cellspacing=1 bgcolor=#CCCCCC>"

            cnj_str+="<tr bgcolor='#323232'><td colspan=7>"
			cnj_str+="<table border=0 cellpadding=0 cellspacing=0 align=center width=100%>"
			cnj_str+="<td><a href='javascript:;' onClick='startm--; if (startm<0) { starty--; startm=11; } showCalendar(startd,startm,starty)' title='이전 월'><font color='white'> << </font></a></td>"
			cnj_str+="<td align=center><font color='white'><b>"+starty+"년"+" "+monthName[month].toUpperCase()+"</b></font></td>"
			cnj_str+="<td align=right><a href='javascript:;' onClick='startm++; if (startm>11) { starty++; startm=0; } showCalendar(startd,startm,starty)' title='다음 월'><font color='white'> >> </font></a></td>"
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
			
			var dayCount=1;
			
			cnj_str+="<tr bgcolor=white>"

   		for (var i=0;i<firstDay;i++) cnj_str+="<td bgcolor='#dcdcdc'>" //공백
   		
   			/* -----------------------------공연날짜 표시하는 부분 시작------------------------------------ */

   			
 		for (var i=0;i<monthDays[month];i++) {
 			
 			
 			if(month == startm2 && month != endm){
 			
 		        if(dayCount >= startd2) {
                       cnj_str+="<td align=center bgcolor='white'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게
                       cnj_str+="<input type=button class='dateClick1' id='date"+dayCount+"' onclick='Test("+dayCount+","+month+","+year+");' value='"+(dayCount++)+"'>" // 링크설정
       		 	}else {
            	     cnj_str+="<td align=center bgcolor='#dcdcdc'>" // 오늘 날짜가 아닐때 배경색 지정
            	     cnj_str+="<input type=button class='dateClick2' id='date"+dayCount+"' value='"+(dayCount++)+"'>" // 링크설정
            	}
       	
 			}else if(month == endm && month != startm2){
 				
 				if(dayCount <= endd) {
                    cnj_str+="<td align=center bgcolor='white'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게
                    cnj_str+="<input type=button class='dateClick1' id='date"+dayCount+"' onclick='Test("+dayCount+","+month+","+year+");' value='"+(dayCount++)+"'>" // 링크설정
    		 	}else {
         	     cnj_str+="<td align=center bgcolor='#dcdcdc'>" // 오늘 날짜가 아닐때 배경색 지정
         	     cnj_str+="<input type=button class='dateClick2' id='date"+dayCount+"' value='"+(dayCount++)+"'>" // 링크설정
    		 	}
 				
			}else if(month == endm && month == startm2){
 				
 				if(dayCount <= endd && dayCount >= startd2) {
                    cnj_str+="<td align=center bgcolor='white'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게
                    cnj_str+="<input type=button class='dateClick1' id='date"+dayCount+"' onclick='Test("+dayCount+","+month+","+year+");' value='"+(dayCount++)+"'>" // 링크설정
    		 	}else {
         	     cnj_str+="<td align=center bgcolor='#dcdcdc'>" // 오늘 날짜가 아닐때 배경색 지정
         	     cnj_str+="<input type=button class='dateClick2' id='date"+dayCount+"' value='"+(dayCount++)+"'>" // 링크설정
    		 	}	
 				
    		}else {
       	     cnj_str+="<td align=center bgcolor='#dcdcdc'>" // 오늘 날짜가 아닐때 배경색 지정
        	     cnj_str+="<input type=button class='dateClick2' id='date"+dayCount+"' value='"+(dayCount++)+"'>" // 링크설정
        	} /* else if(month == startm && month == endm){
    			
    			if(dayCount >= startd && dayCount <= endd) {
                    cnj_str+="<td align=center bgcolor='white'><b>" // 오늘 날짜일때 배경색 지정,글자 진하게
                    cnj_str+="<input type=button class='dateClick1' id='date"+dayCount+"' onclick='Test("+dayCount+","+month+","+year+");' value='"+(dayCount++)+"'>" // 링크설정
    		 	}else {
         	     cnj_str+="<td align=center bgcolor='#dcdcdc'>" // 오늘 날짜가 아닐때 배경색 지정
         	     cnj_str+="<input type=button class='dateClick2' id='date"+dayCount+"' value='"+(dayCount++)+"'>" // 링크설정
    		 	}
    			
    		}else {
        	     cnj_str+="<td align=center bgcolor='#dcdcdc'>" // 오늘 날짜가 아닐때 배경색 지정
             	     cnj_str+="<input type=button class='dateClick2' id='date"+dayCount+"' value='"+(dayCount++)+"'>" // 링크설정
             	
    		} 
    	 */
 			
			     /* if(dayCount==startd) {
				  cnj_str+="</b>" // 오늘 날짜일때 글자 진하게
				 } else {
				  cnj_str+="" // 오늘 날짜가 글자 진하게 안함
				 } */
 
       		/* -----------------------------공연날짜 표시하는 부분 끝------------------------------------ */

			    if ((i+firstDay+1)%7==0 && (dayCount<monthDays[month]+1)) 
	
				  cnj_str+="<tr bgcolor=white>"

        }

		var totCells=firstDay+monthDays[month]
		
		for (var i=0; i<(totCells>28?(totCells>35?42:35):28)-totCells; i++) 
			
			cnj_str+="<td>"
			cnj_str+="</table><BR>"
			
            calendar.innerHTML=cnj_str
	}


 function Test(dayCount,month,year){	 // 날짜 선택

	 date = year+"/"+(month+1)+"/"+dayCount;
	 
	document.getElementById('payment_date').value = date;
    
	
	$("input[type=checkbox]").attr("disabled",false);
	$("input[type=checkbox]").prop("checked",false);
	$("#time option:eq(0)").prop("selected", true);
	$("#payment_time").val("");
	$("#amount option:eq(0)").prop("selected", true);
	$("#payment_amount").val("");
 }



function Send() { // 부모창으로 값 넘김

	
	var seatnum=document.getElementsByName('seat_seat[]'); 
	var seat = "";

	for(i=0; i<seatnum.length; i++) { 		
		
	    seat += seatnum[i].value+"/";
	
	}
	
   opener.document.paymentform.seat_seat.value = seat;
   opener.document.paymentform.payment_date.value=$("#payment_date").val();
   opener.document.paymentform.payment_time.value=$("#payment_time").val();   
   opener.document.paymentform.payment_amount.value=$("#payment_amount").val(); 
   
    opener.location.href="javascript:Call();";

	window.close();
}




/* --------------------------제이쿼리------------------------------- */
var num=0; //선택한 개수
var seat_info=null; // 선택한 체크박스의 값
var y=null;  /// 좌석 수
var oTbl;
   //선택가능 갯수
var checked;
var x=null;

		$(document).ready(function(){	
			
			
		$(":checkbox").click(function(){	
			// 체크박스 설정 및 해제
          		
			checked = $(this);
          	      x = checked.val();
          	    num =  $(":checkbox:checked").length;
          	    
				if(checked.is(":checked")==true){	// 체크박스 클릭
					 
					if (num > max) {
			            alert ("좌석수를 다시 설정해주세요.");
			            checked.prop("checked", false);        
			        }
					
					$("#seat_seat"+num).val(x);
					
					
			//---------------체크박스 해제---------------------------------	
					
			
				}if(checked.is(":checked")==false){	
	
					 for(k=0; k < max; k++)	{
						  $("#seat_seat"+(k+1)).val(""); // 좌석번호 다 지우기
					 } 
					 
					 var checked_num=0; 
					 
					$("input:checkbox:checked").each(function (index) {  // 선택된 좌석만 차례로 다시 뿌려주기  
								
						checked_num+=1;
						
					    $("#seat_seat"+checked_num).val( $(this).val());	
						    	
					 });  
				}				
			});			
		
		
		$("#time").change(function(){	  // 회차 선택	
			
			/* --------회차 변경시 좌석수, 좌석번호 초기화------------------ */
			  $("input[type=checkbox]").prop("checked",false);
			  $("#amount option:eq(0)").prop("selected", true);
			  $("#payment_amount").val("");
			  max = 1;
			  Amount();
			  
			   time=$(this).val();
			
			  
				$("#payment_time").val(time);		
				/* alert( $(this).val()); */	
				
				if($("#payment_date").val() ==""){	
					
					alert("날짜를 선택해주세요!");	
					$("#time option:eq(0)").prop("selected", true);
					$("#payment_time").val("");
					return false;
					
				}else if(time != "회차선택"){
				
					$("input[type=checkbox]").attr("disabled",false);
					 $("#on").show();
					 $("#off").hide();
					SeatView();
				}					
				
		});	
		
		
		$("#amount").click(function(){     //좌석 수 선택
			
			$("#payment_amount").val($(this).val());
	
			max=$(this).val();
			
			$("input[type=checkbox]").prop("checked",false);
			Amount();

	    });	
		
		 $("#all").click(function(){
				
			$("input[type=checkbox]").prop("checked",false);
			Amount();
			
		}); 
		  });	
		
	
 function Amount(){ 
	 // 좌석 수 선택
	 
	 oTbl = document.getElementById('addTable');	

	$("#seat_seat1").val("");
	
	 
	var lastRow = addTable.rows.length - 1;
	  
	for(var j = lastRow; j > 1; j--) {
		addTable.deleteRow(j);
	}
 
	 for(var i=2; i <= max; i++){

		 var oRow = oTbl.insertRow();
		 var oCell1 = oRow.insertCell(0);
		 var oCell2 = oRow.insertCell(1);
		 var oCell3 = oRow.insertCell(2);
		 var oCell4 = oRow.insertCell(3);
		 
	oCell1.innerHTML ="";
	oCell2.innerHTML ="";
	oCell3.innerHTML ="";
	oCell4.innerHTML ="<input type='text' readonly id='seat_seat"+i+"' name='seat_seat[]' class='form-control' placeholder='좌석을 선택해주세요'>";
		 
	 } 
 }
 
 
  function SeatView(){
	 // 좌석 뷰
	 
	
	 
	var seatNum1 = new Array();
	
	<c:forEach items="${seatdata}" var="item1">
	seatNum1.push("${item1.seat_seat}");	
	</c:forEach>
	
	var seatNum2 = new Array();
	
	<c:forEach items="${seatdata}" var="item2">
	seatNum2.push("${item2.seat_date}");	
	</c:forEach>
	
	var seatNum3 = new Array();
	
	<c:forEach items="${seatdata}" var="item3">
	seatNum3.push("${item3.seat_time}");	
	</c:forEach>
	
	
   var count=0;  // 남은 좌석 수 카운트 변수
  
	
	/* --------------------------A구역 루프------------------------------------- */
	for(var k=1; k<51; k++){
	
     for (var i=0; i<seatNum1.length; i++) {
			
			var A = document.getElementById("A구역"+k+"번");
				
			if(seatNum1[i] == A.value && seatNum2[i] == date && seatNum3[i] == time){
				
				A.disabled=true; 
				
				count += 1;
			}	
			
		}} 
	
	
	/* --------------------------B구역 루프------------------------------------- */
	for(var k=121; k<201; k++){
		
		for (var i=0; i<seatNum1.length; i++) {
			
			var B = document.getElementById("B구역"+(k-120)+"번");
			
			if(seatNum1[i] == B.value && seatNum2[i] == date && seatNum3[i] == time){
				
				B.disabled=true; 
				count += 1;
			}	
			
		}} 
	/* --------------------------C구역 루프------------------------------------- */
   
	for(var k=201; k<251; k++){
	
		for (var i=0; i<seatNum1.length; i++) {
			
			var C = document.getElementById("C구역"+(k-200)+"번");			
		
			if(seatNum1[i] == C.value && seatNum2[i] == date && seatNum3[i] == time){
				
		          C.disabled=true; 
		          count += 1;
	          }	
			
		}} 
	
      document.getElementById('count').value=180-count; // 남은 좌석수 뿌려주기
 } 
 


 
		
	</script>
<body onLoad="showCalendar(startd,startm,starty)">



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
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
				</select>

				<h3>좌석 선택</h3>
				
			
				<div id="off" style="display:inline;">
				<br>
				<table style="background-color:#dcdcdc;  width:480px; height:300px; ">
				<tr align="center">
				<td style="font-size: 20px;">날짜와 회차를 선택해주세요!</td>
				</tr>
				</table>				
				</div> <!-- 좌석 뷰 off -->
				
				
				<div id="on" style="display: none;">

				<br> <input type="checkbox" class="checkbox"
					disabled="disabled" id="check" /> <label for="check" title="check">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					회색으로 채워진 좌석은 이미 예매된 좌석입니다. &nbsp; <font color="red">남은 좌석 수
						<input type="text" style="width:50px; border:none;" readonly id="count"></font>
				</label>

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
									id="A구역${i}번" />
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
								id="C구역${i-200}번" />
							<label for="C구역${i-200}번" title="C구역${i-200}번"></label>

							<c:if test="${i % 5 == 0 && i != 250}">
								<br>
							</c:if>

						</c:forEach>
					</div>

				</div> <!-- 좌석 전체 div -->
				</div> <!-- 좌석 뷰 온 오프 -->
			</div>

			<br> <br>

			<div class="col-sm-12">

				<hr>

				<table class="table table-hover" id="addTable">

					<tr>
						<th>선택한 날짜</th>
						<th>선택한 회차</th>
						<th>선택한 좌석 수</th>
						<th>선택한 좌석</th>
						<th></th>
					</tr>
					<tr>
						<td><input type="text" readonly id="payment_date" name="payment_date"
							class="form-control" placeholder="날짜를 선택해주세요"></td>
						<td><input type="text" readonly id="payment_time" name="payment_time"
							class="form-control" placeholder="회차를 선택해주세요"></td>
						<td><input type="text" readonly id="payment_amount"
							name="payment_amount" class="form-control" value="1"
							placeholder="좌석 수를 선택해주세요"></td>
						<td><input type='text' readonly id="seat_seat1" name="seat_seat[]"
							class='form-control' placeholder='좌석을 선택해주세요'></td>
						<td><input type='button' id="all" value='좌석 다시 선택하기'></td>
					</tr>
				</table>

				<input type="button" onclick="Send();" value="결제하기"
					class="btn btn-insert" style="margin-left: 37%; width: 200px" />
			</div>
     
      
		</form>








	</div>

	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>