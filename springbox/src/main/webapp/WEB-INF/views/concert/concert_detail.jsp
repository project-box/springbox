<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="/WEB-INF/views/front/header.jsp"%>
<title>b o x</title>

<style type="text/css">

.image {
	float: left;
	margin: 10px;
}

.info {
	float: center;
	margin: 30px;
}

</style>

</head>

<body>


	<h3><b>${concertdata.concert_title}</b></h3>

	<div class="image">
		<img src="./img/${concertdata.posterfilepath}" 
		width="250" height="310" alt="title" />
	</div>
	
	

	<div class="info">
		<b>장소</b>&nbsp;&nbsp;&nbsp;&nbsp;${concertdata.concert_place}<br> <br>
		<b>기간</b>&nbsp;&nbsp;&nbsp;&nbsp;
		<fmt:formatDate value="${concertdata.concert_startdate}" pattern="yyyy-MM-dd" />
		~
		<fmt:formatDate value="${concertdata.concert_enddate}" pattern="yyyy-MM-dd" />
		<br> <br> <b>가격</b>
		&nbsp;&nbsp;&nbsp;&nbsp;${concertdata.concert_price}<br><br>
		<a href="book.box"><button type="button">예매하기</button></a> 
		<a href="concert_list.box">클릭 하면 리스트로</a>
			<br><br>관리자만 보입니다.
			<a href="concert_delete.box?num=${concertdata.concert_num}">[삭제]</a>
	</div>
	
	
	<ul class="nav nav-tabs">
			<li id="first"><a data-toggle="tab" href="#menu1"><b>상세정보</b></a></li>
			<li id="second" ><a data-toggle="tab" href="#menu2"><b>관람후기</b></a></li>
			<li id="map1"><a data-toggle="tab" href="#menu3"><b>공연장위치</b></a></li>
			<li><a data-toggle="tab" href="#menu4"><b>티켓취소/환불</b></a></li>
		</ul>
		
		
		
		<!-- -----------------------------상세정보------------------------------------ -->
		
		<div class="tab-content" align="center">		
			<div id="menu1" class="tab-pane fade">	
			
			
			<h3><b>${concertdata.concert_title}</b></h3>
										
					<h4><br><b>공연기간</b></h4><br><br>
					<fmt:formatDate value="${concertdata.concert_startdate}" pattern="yyyy년MM월dd일" />
					~
					<fmt:formatDate value="${concertdata.concert_enddate}" pattern="yyyy년MM월dd일" />
					<br>
					<img src="./img/${concertdata.posterfilepath}" 
					width="450" height="560" alt="title" />
					
					
					<br><b>공연관련정보</b><br> <br>
					<table class="table table-bordered">
						<tr align=center>
							<td width=50>주최/기획</td>
							<td width=200>(주)커뮤니케이션</td>
							<td width=50>고객문의</td>
							<td width=200>111-1111</td>
						</tr>
						<tr align=center>
							<td>주연</td>
							<td>${concertdata.concert_artist}</td>
							<td>공연장소</td>
							<td>${concertdata.concert_place}</td>
						</tr>
						<tr align=center>
							<td>예매수수료</td>
							<td>1,000원</td>
							<td>배송료</td>
							<td>2,500원</td>
						</tr>
					</table>
				</div>
			
		<!-----------------------------관람후기----------------------------------->
		<div id="menu2" class="tab-pane fade">			
		<br> <b>관람후기 보기</b><br> <br>
		<form action="./concertboard_add.box" method="post" name="concertboardform">
        <input type="hidden" name="concert_num" value="${concertdata.concert_num}"/>
        <%-- <input type="hidden" name="user_id" value="${sessionScope.loginId}" /> --%>
        <table align="center" border="0" width="550">
        <tr>
        <td>
     <textarea name="concertboard_content" id="concertboard_content"
     rows="3" cols="65" placeholder="후기를 입력 해주세요"></textarea>
     </td>
     <td>
        <input type="submit" value="후기입력" class="btn btn-insert"/>
    </td>
   </tr>
  </table>
</form>


<!-- 후기 리스트 출력-->
<%-- <br><table class="table table-bordered" align=center 
            width=600 border="1" cellpadding="0" cellspacing="0">
<!-- 레코드가 있으면 -->
<c:if test="${!empty concertboardlist}">
<tr align="center" valign="middle">  
		<td style="font-size:8pt; color: red;" width="8%">
			<div align="center"><b>번호</b></div>
		</td>
		<td style="font-size:8pt; color: red;" width="10%">
			<div align="center"><b>아이디</b></div>
		</td>
		<td style="font-size:8pt; color: red;" width="50%">
			<div align="center"><b>관람후기</b></div>
		</td>
		<td style="font-size:8pt; color: red;" width="32%">
			<div align="center"><b>날짜</b></div>
		</td>		
</tr>
		
		<!-- 화면 출력 번호 -->		
	    <c:set var="num" value="${listcount-(page-1)*10}"/> 	
	    <c:forEach var="c" items="${concertboardlist}">	
	    
	    <!-- 번호 출력 부분 -->
 <tr align="center" valign="middle">
		<td>		
		<c:out value="${num}"/>				
		<c:set var="num" value="${num-1}"/>					
		</td>					
		<td>${c.user_id}		</td>
		<td style="width:200px; overflow:hidden; word-break:break-all; text-overflow:ellipsis;">
		${c.concertboard_content}</td>
		<td>${fn:substring(c.concertboard_registerdate,0,16)}		
		<a href="./ConBoardDeleteAction.box?id=${c.id}&concertid=${c.concertid}">
		
			[삭제]</a>&nbsp;&nbsp;
       </td>		  
</tr>	
	  </c:forEach>	
	  	
	  	
	  	<!-- 레코드가 없으면 -->
	<c:if test="${empty conboardlist}">
			<tr align="center" valign="middle">
		<td colspan="4" height="200">
			<font size=2>등록된 후기가 없습니다.</font>
		</td>
	</tr></c:if>

</table> --%>
			
			</div>
	  	
		
		
		

<!---------------------------공연장위치----------------------------->

<div id="menu3" class="tab-pane fade">
					<br> <b>공연장 위치</b><br> <br>
					<div id="googleMap" style="width:500px;height:380px;"></div>										
					<br> <br>
			</div>
			
<!--------------------------티켓취소/환불--------------------------->		

<div id="menu4" class="tab-pane fade">	<!-- 티켓취소/환불 안내 -->					
					<br> <b>티켓취소 안내</b> <br> <br>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width=320>행사일</th>
								<th width=300>취소수수료(인터넷,콜센터)</th>
								<th width=550>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr align=center>
								<td>예매후 7일 이내/예매당일</td>
								<td>없음</td>
								<td rowspan=5>예매 당일에 취소하는 경우 이외에는<br> 예매수수료가 환불되지 않음<br>
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
						</tbody>
					</table>

					<b>티켓환불 안내</b><br> <br> 신용카드 : 취소 시 승인이 취소됩니다.<br>
					무통장입금 : 인터넷 또는 콜센터로 접수된 고객님의 환불계좌로 입금해드립니다.<br> <br>
				</div>
			</div>
		</div>
		

<%@ include file= "/WEB-INF/views/front/footer.jsp" %>   

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