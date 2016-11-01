<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset=UTF-8">

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<!-- 구글맵 부트스트랩 -->
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0Id8D7bkKotALpSG6e_q4LhgjP8cwpg8"
 type="text/javascript"></script>

<title>b o x</title>

<style type="text/css">

.image {
	float: left;
	margin-right: 70px;
	margin-left:100px;
	margin-top:70px;
	padding-right: 70px;
	border-right: 1px dashed gray;
}

.info {
    float:inherit;
	margin-left: 70px;	
	height:280px;
	line-height: 30px;
	margin-top:110px;
	margin-bottom: 100px;
	font-size: 20px;
}


.Button00{

 outline: none;
 border:none;
 background-color: black;
 border-radius: 12px;
 color:white;
 width: 206px;
 height: 35px;
 font-size: 15px;
 margin-bottom: 10px;

}


.Button00:hover{

background-color: #c8c8c8;
color: black;
border: 1px solid black;

}

.delete {
	
	font-size: 17px;
	color: #ffffff;
	padding: 2px 6px;
	background-color: #777777;
	border: #777777;
	width: 206px;
    height: 35px;
    border-radius: 12px;
}

.delete:hover {

	background-color: black;

}


#tabList{
 border-bottom:5px dashed black; 
 height: 75px;
 width: 100%;
 
}

#tabList a:link{

  color:#282828;
  text-decoration: none;
  font-size: 17px;
  background-color: #dcdcdc;
  padding-left: 100px;
  padding-right: 100px;
  padding-top: 20px;
  padding-bottom: 20px;
  display:inline-block;
}


#tabList a:hover {

 background-color: black;
 color:white;

}


.tab-content{
padding-top: 100px;

}

.commentBoard{

border: 1px solid #dcdcdc;
font-size: 10px;
width: 100%;
}

.commentBoard th{

color:red;
text-align: center;

}

.commentBoard th, td{

height: 40px;
font-size: 14px;

}

.commentButton{

width:100px;
height: 100px;
text-decoration: none;
margin-left:5px;
background-color: red;
color:white;


}


.ctable{

width:85%;
}

.ctable th{

text-align: center;
height: 40px;

}


.ctable td{

height: 55px;

}





</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

/* ------------------------param 값 가져오기----------------------------------- */


function getRequest() {
    if(location.search.length > 1) {
        var get = new Object();
        var ret = location.search.substr(1).split('&');
        for(var i = 0; i < ret.length; i++) {
            var r = ret[i].split('=');
            get[r[0]] = r[1];
        }
        return get;
    }else{
        return false;
    }
}

$(document).ready(function() {
	  var get = getRequest();
	  var param = get['param'];
	  

	  if(param == '123'){
		  $("#second").attr('class','active');
		  $("#menu2").attr('class', 'tab-pane fade in active');
	  } else {
		  $("#first").attr('class','active');
		  $("#menu1").attr('class', 'tab-pane fade in active');
	  }
	  
	  });

/* ------------------------구글지도----------------------------------- */
var lat = '${concertdata.locationx}'
var lon = '${concertdata.locationy}'
var myCenter=new google.maps.LatLng(lat, lon);
var marker;
//var divid = document.getElementById("map1");

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:18,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  animation:google.maps.Animation.BOUNCE
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
//google.maps.event.addDomListener(divid, 'click', initialize());



/* -----------------------팝업창에서 값 받기------------------------------ */


function Book(){

	var concert_num = "/springbox/book.box?concert_num="+'${concertdata.concert_num}';
	
   /*  window.name="Info" */
    window.open(concert_num, "_blank", "width=970, height=650,toolbars=yes");

}

    function Call(){
    
		paymentform.submit(); 
	} 
    

</script>



</head>

<body>


<form name="paymentform" action="payment.box" method="post">
<input type="hidden" name="payment_date" id="payment_date"/>
<input type="hidden" name="payment_time" id="payment_time" />
<input type="hidden" name="seat_seat"/>
<input type="hidden" name="payment_amount" id="payment_amount"/>
<input type="hidden" name="concert_num"	value="${concertdata.concert_num}" />

</form>



	<h2 style="margin-top:50px; margin-left:100px;">
		<b>&lt;  ${concertdata.concert_title} &gt;</b>
	</h2>

	<div class="image">
		<img src="./img/${concertdata.posterfilepath}" width="250"
			height="310" alt="title" />
	</div>



	<div class="info">
	
	<div class="infoLabel" style="float:left; margin-right:20px;">
	<b>장소</b><br><br>
	<b>기간</b><br><br>
	<b>가격</b><br><br>
	</div>
	
	<div class="infoContent" style="float:left; margin-left:20px;">		
		${concertdata.concert_place}<br>
		<br> 
		<fmt:formatDate value="${concertdata.concert_startdate}"
			pattern="yyyy-MM-dd" />
		~
		<fmt:formatDate value="${concertdata.concert_enddate}"
			pattern="yyyy-MM-dd" />
		<br> <br> 
		<fmt:formatNumber value="${concertdata.concert_price}" pattern="#,###.##"/>&nbsp;원<br>
		<br>	
		
	</div>	
	
	<div class="infoButton" style="float:left;">
		<button type="button" class="Button00" onclick="Book();">예매하기</button><br>
		<button type="button" class="Button00" onclick="location.href='concert_list.box'">목록보기</button>
        &nbsp; &nbsp;
        <c:if test="${sessionScope.loginId == 'dev'}">         
		<button class="delete" onclick="location.href='concert_delete.box?num=${concertdata.concert_num}'">삭제</button>
	    (관리자아이디로 접속 시에만 보입니다.)
	    </c:if>
	 </div>
	</div>


    <div id="tabList" align=center>
     
    <a id="first" data-toggle="tab" href="#menu1"><b>상세정보</b></a>
	<a id="second" data-toggle="tab" href="#menu2"><b>관람후기</b></a>
	<a id="map1" data-toggle="tab" href="#menu3"><b>공연장위치</b></a>
	<a data-toggle="tab" href="#menu4"><b>티켓취소/환불</b></a>    
    
    </div>


<!-- 	 <ul class="nav nav-tabs"> 
		<li id="first"><a data-toggle="tab" href="#menu1"><b>상세정보</b></a></li>
		<li id="second"><a data-toggle="tab" href="#menu2"><b>관람후기</b></a></li>
		<li id="map1"><a data-toggle="tab" href="#menu3"><b>공연장위치</b></a></li>
		<li><a data-toggle="tab" href="#menu4"><b>티켓취소/환불</b></a></li>
	</ul>  -->



	<!-- -----------------------------상세정보------------------------------------ -->

	<div class="tab-content" align="center">
		<div id="menu1" class="tab-pane fade">


			<p style="font-size: 35px;">
				<b>${concertdata.concert_title}</b>
			</p>
			
			<br><br><br><br>
			
			<font size=6px><b>
			
			<c:if test="${concertdata.concert_startdate == concertdata.concert_enddate}">
			<fmt:formatDate value="${concertdata.concert_startdate}"
				pattern="yyyy년MM월dd일" />			
			</c:if>
			
			<c:if test="${concertdata.concert_startdate != concertdata.concert_enddate}">
			<fmt:formatDate value="${concertdata.concert_startdate}"
				pattern="yyyy년MM월dd일" />
			~
			<fmt:formatDate value="${concertdata.concert_enddate}"
				pattern="yyyy년MM월dd일" />
				
			</c:if>	
				
				
				</b> </font>
	
				
			<br> <br><br><br>
			
			<img src="./img/${concertdata.posterfilepath}" width="450"
				height="560" alt="title" />
				
			<br><br><br><br>	
				
			<h3><b>공연관련정보</b></h3>
			<br>
			
			<table border=1 style="width:80%; height: 130px; border:1px solid gray;">
				<tr align=center>
					<td width=15%><b>주최/기획</b></td>
					<td width=35%>(주)커뮤니케이션</td>
					<td width=15%><b>고객문의</b></td>
					<td width=35%>111-1111</td>
				</tr>
				<tr align=center>
					<td><b>주연</b></td>
					<td>${concertdata.concert_artist}</td>
					<td><b>공연장소</b></td>
					<td>${concertdata.concert_place}</td>
				</tr>
				<tr align=center>
					<td><b>예매수수료</b></td>
					<td>1,000원</td>
					<td><b>배송료</b></td>
					<td>2,500원</td>
				</tr>
			</table>
		</div>

		<!-----------------------------관람후기----------------------------------->
		<div id="menu2" class="tab-pane fade" style="width: 85%;">
		
			<br> <h3><b>관람후기 보기</b></h3><br> <br>
			
			<form action="./concertboard_add.box" method="post"
				name="concertboardform">
				<input type="hidden" name="concert_num"
					value="${concertdata.concert_num}" />
				<%-- <input type="hidden" name="user_id" value="${sessionScope.loginId}" /> --%>
				
				<table align="center" border="0" width="60%">
					<tr>
						<td><textarea name="concertboard_content"
								id="concertboard_content" rows="5" cols="150"
								placeholder="후기를 입력 해주세요"></textarea></td>
						<td><input type="submit" value="후기입력" class="commentButton" />
						</td>
					</tr>
				</table>
				
			</form>
			<br>
			<br>

			<!--------------------- 후기 리스트 출력-------------------------->
			<br>
			<table class="commentBoard" align=center width=600 border="1"
				cellpadding="0" cellspacing="0">

				<!------------------------- 레코드가 있으면 ----------------------->
				<c:if test="${!empty concertboarddata}">

					<tr align="center" valign="middle">
						<th width="8%">
								<b>번호</b>
						</th>
						<th width="10%">
								<b>아이디</b>
						</th>
						<th width="50%">
								<b>관람후기</b>
						</th>
						<th width="32%">
								<b>날짜</b>
						</th>
					</tr>

					<!-- 화면 출력 번호 -->
					<c:set var="num" value="${concertboardlistcount}" />
					<c:forEach var="c" items="${concertboarddata}">

						<!-- 번호 출력 부분 -->
						<tr align="center" valign="middle">
							<td><c:out value="${num}" /> <c:set var="num"
									value="${num-1}" /></td>
							<td>${c.user_id}</td>
							<td
								style="width: 200px; overflow: hidden; word-break: break-all; text-overflow: ellipsis;">
								${c.concertboard_content}</td>
							<td>
							<fmt:formatDate value="${c.concertboard_registerdate}"
			pattern="yyyy-MM-dd" />
			
			<c:if test="${sessionScope.loginId == 'dev'}">  
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="./concertboard_delete.box?concertboard_num=${c.concertboard_num}
		&concert_num=${c.concert_num}" style="color:black;text-decoration: none; font-weight: bold;">
		[삭제]</a>
		</c:if> <!--  관리자만 삭제가능 -->
		
							</td>
						</tr>
					</c:forEach>
				</c:if>


				<!-- 레코드가 없으면 -->
				<c:if test="${empty concertboarddata}">
					<tr align="center" valign="middle">
						<td colspan="4" height="200"><font size=2>등록된 후기가
								없습니다.</font></td>
					</tr>
				</c:if>

			</table>

		</div>





		<!---------------------------공연장위치----------------------------->

		<div id="menu3" class="tab-pane fade">
			<br> <h3><b>공연장 위치</b></h3><br> <br>
			
			<h4>&lt;&nbsp;${concertdata.concert_place}&nbsp;&gt;</h4>
			
			<br><br>
			<div id="googleMap" style="width: 500px; height: 380px;"></div>
			<br> <br>
		</div>

		<!--------------------------티켓취소/환불--------------------------->

		<div id="menu4" class="tab-pane fade">
			<!-- 티켓취소/환불 안내 -->
			<br><h3> <b>티켓취소 안내</b> </h3><br> <br>
			<table class="ctable" border=1>
					<tr>
						<th width=320>행사일</th>
						<th width=300>취소수수료(인터넷,콜센터)</th>
						<th width=550>비고</th>
					</tr>
					<tr align=center>
						<td>예매후 7일 이내/예매당일</td>
						<td>없음</td>
						<td rowspan=5 style="line-height: 30px;">예매 당일에 취소하는 경우 이외에는<br> 예매수수료가 환불되지 않음<br>
							예매 후 7일 이내라도 취소 시점이 공연일로부터<br> 10일 이내라면 그에 해당하는 취소수수료가 부과됨<br>
							예매 취소 시, 최소 결제금액 정책으로<br> 1,000원 미만 수수료에 대하여 1,000원으로 결제
						</td>
					</tr>
					<tr align=center>
						<td>예매후 8일 ~ 관람일 10일 전</td>
						<td>장당 4,000원<br> * 티켓금액의 10%이내
						</td>
					</tr>
					<tr align=center>
						<td>관람일 9일 전 ~ 7일 전</td>
						<td>티켓금액의 10%</td>
					</tr>
					<tr align=center>
						<td>관람일 6일 전 ~ 3일 전</td>
						<td>티켓금액의 20%</td>
					</tr>
					<tr align=center>
						<td>관람일 2일 전 ~ 1일 전</td>
						<td>티켓금액의 30%</td>
					</tr>
			</table>
<br><br><br>
			<br><h3> <b>티켓환불 안내</b> </h3><br> 
			
			<br><font size="3px"> <b>신용카드 :</b> 취소 시 승인이 취소됩니다.<br>
			<b>무통장입금 :</b> 인터넷 또는 콜센터로 접수된 고객님의 환불계좌로 입금해드립니다.</font><br> <br>
		</div>
	</div>
	</div>


	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

	<!-- <tr class="">
<th scope="row">평점</th>
                    <td><input id="point0" name="point" fw-filter="" fw-label="평점" fw-msg="" value="5" type="radio" checked="checked"  /><label for="point0" ><span class="point5"><em>★★★★★</em></span></label>
<input id="point1" name="point" fw-filter="" fw-label="평점" fw-msg="" value="4" type="radio"  /><label for="point1" ><span class="point4"><em>★★★★</em></span></label>
<input id="point2" name="point" fw-filter="" fw-label="평점" fw-msg="" value="3" type="radio"  /><label for="point2" ><span class="point3"><em>★★★</em></span></label>
<input id="point3" name="point" fw-filter="" fw-label="평점" fw-msg="" value="2" type="radio"  /><label for="point3" ><span class="point2"><em>★★</em></span></label>
<input id="point4" name="point" fw-filter="" fw-label="평점" fw-msg="" value="1" type="radio"  /><label for="point4" ><span class="point1"><em>★</em></span></label></td>
                </tr> -->






</body>
</html>