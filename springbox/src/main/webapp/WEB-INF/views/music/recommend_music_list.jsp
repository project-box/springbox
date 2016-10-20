<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="../front/header.jsp"%>

<title>b o x</title>

<style>
#over:hover {
	background-color: #CFCFCF;
	cursor: pointer;
	opacity: 0.8;
}

#img {
	padding: 8px;
}

#button {
	font-family: Tahoma;
	font-size: 12px;
	color: #ffffff;
	padding: 5px 6px;
	background: #000000;
	border: #000000;
}

</style>

<script>
	function myFunction(num) {
		var ref="/springbox/music_pop.box?num="+num
		window.open(ref,"","width=500, height=400,left=100, top=100,");
		 if (!e)
			var e = window.event; // Get the window event
		e.cancelBubble = true; // IE Stop propagation
		if (e.stopPropagation)
			e.stopPropagation(); // Other Broswers
		console.log('td clicked'); 
	};
	
	/* function tdclick(e) {
		if (!e)
			var e = window.event; // Get the window event
		e.cancelBubble = true; // IE Stop propagation
		if (e.stopPropagation)
			e.stopPropagation(); // Other Broswers
		console.log('td clicked');

		alert("야호");
	}; */
</script>
<body>
	<!--추천곡 -->
	<div class="row" padding="50px">
		<div class="col-lg-12">
			<h1 class="page-header">
				추천곡<small> <a href="music_list.box"
					aria-label="Skip to main navigation"> <i class="fa fa-bars"
						aria-hidden="true"></i></a>
				</small>
			</h1>
		</div>
	</div>
	<table>
		<!-- 레코드가 있으면 -->
		<c:if test="${listcount > 0 }">
			<tr id="menu" align="center" valign="top" bordercolor="#333333"
				style="font-weight: bold;">
				<td style="font-family: Tahoma; font-size: 11pt;" width="10%"
					height="30s">
					<div align="center"></div>
				</td>
				<td width="10%" height="26">
					<div align="center"></div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="15%">
					<div align="center">제목</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="15%">
					<div align="center">아티스트</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="20%">
					<div align="center">발매일</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="20%">
					<div align="center">장르</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="10%">
					<div align="center">음악듣기</div>
				</td>
			</tr>

			<!-- 화면 출력 번호 -->
			<c:set var="num" value="${listcount-(start-1)*10}" />

			<c:forEach var="b" items="${musiclist}">
				<div id="table">
					<tr id="over" align="center" valign="middle" bordercolor="#333333"
						onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';"
						onmouseover="this.style.backgroundColor='F8F8F8'"
						onmouseout="this.style.backgroundColor=''">

						<td height="23" style="font-family: Tahoma; font-size: 10pt;">♪♬
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div id="img" align="left">
								<img class="img-responsive img-center"
									src="
							<c:url value='/img/${b.albumcoverfilepath}'/>"
									alt="">
							</div>
						</td>

						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">${b.music_title}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">${b.music_artist}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">
								<fmt:formatDate value="${b.music_publishdate}"
									pattern="yyyy-MM-dd" />
							</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">${b.music_genre}</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<img class="player" src="img/play.jpg" height="20" onclick="myFunction('${b.music_num}')">
							<img class="player" src="img/pause.jpg" height="20" onclick="myFunction('${b.music_num}')">
							</td>
							
				</div>
				</td>
				</tr>
				</div>

			</c:forEach>
			<%
				//}// for end
			%>
			<tr align=center valign=bottom height=40>
				<td colspan=7 style="font-family: Tahoma; font-size: 10pt;"><c:if
						test="${page <= 1 }">[이전]&nbsp;
			</c:if> <c:if test="${page > 1 }">
						<a href="./recommend_music_list.box?page=${page-1}">[이전]</a>&nbsp;
			</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
						<c:if test="${a == page }">[${a}]
					</c:if>

						<c:if test="${a != page }">
							<a href="./recommend_music_list.box?page=${a}">[${a}]</a>&nbsp;
					</c:if>
					</c:forEach> <c:if test="${page >= maxpage }">[다음] 
			</c:if> <c:if test="${page < maxpage }">
						<a href="./recommend_music_list.box?page=${page+1}">[다음]</a>
					</c:if></td>
			</tr>

		</c:if>
		<%
			//}else{
		%>
		<!-- 레코드가 없으면 -->
		<c:if test="${listcount == 0 }">
			<tr align="center" valign="middle">
				<td colspan="4">음악</td>
				<td align="right"><font size=2>추천곡이 없습니다.</font></td>
			</tr>
		</c:if>
		<%
			//	}
		%>
	</table>

		<%@ include file="../front/footer.jsp"%>
</body>
</html>