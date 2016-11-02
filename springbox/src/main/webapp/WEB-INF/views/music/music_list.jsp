<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="../front/header.jsp"%>

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
	background: #777777;
	border: #777777;
}

#delete {
	font-family: Tahoma;
	font-size: 12px;
	color: #ffffff;
	padding: 5px 6px;
	background: #777777;
	border: #777777;
}
</style>

<script>
$(document).ready(function(){
	$('#delete').click(function(){
		var result = confirm("   삭제하시겠습니까?  확인을 누르면 삭제됩니다!   ");
		 	
		if(result){
			location.repalce('/music/music_list');
		}else{
			
		}
	})
	
});
</script>

<title>b o x</title>
</head>
<body>
	<div class="container">

		<!-- 최신곡 -->
		<div class="row" padding="50px">
			<div class="col-lg-12">
				<h1 class="page-header">
					최신곡<small> <a href="music_list.box"
						aria-label="Skip to main navigation"> <i class="fa fa-bars"
							aria-hidden="true"></i></a> <c:if
							test="${sessionScope.loginId == 'dev'}">
							<input id="button" type=button
								onclick="location.href ='./music_write.box' " value="글쓰기" />  &nbsp;&nbsp;&nbsp;
					<!-- <input id="button" type=button 
						onclick="location.href ='/springbox/MusicAction.box'" value="&nbsp;&nbsp;삭제&nbsp;&nbsp;"> -->
						</c:if>
					</small>
				</h1>
			</div>
		</div>
		<table>
			<!-- 레코드가 있으면 -->
			<c:if test="${listcount > 0 }">
				<tr id="menu" align="center" valign="top" bordercolor="#333333"
					style="font-weight: bold;">
					<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
						height="30s">
						<div align="center">번호</div>
					</td>
					<td width="7%" height="26">
						<div align="center"></div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="23%">
						<div align="center">제목</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="13%">
						<div align="center">아티스트</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
						<div align="center">발매일</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="22%">
						<div align="center">장르</div>
					</td>
				</tr>

				<!-- 화면 출력 번호 -->
				<c:set var="num" value="${listcount-(start-1)*10}" />

				<c:forEach var="b" items="${list}">
					<div>
						<tr id="over" align="center" valign="middle" bordercolor="#333333"							
							onmouseover="this.style.backgroundColor='F8F8F8'"
							onmouseout="this.style.backgroundColor=''">
							
							<td height="23" style="font-family: Tahoma; font-size: 10pt;">						
								<!-- 번호 출력 부분 -->
								<input type="hidden" name="music_num" value="${music.music_num}">
								<c:out value="${num}"/>		
								<c:set var="num" value="${num-1}" />
								<%-- <input type=hidden>${b.music_num} --%>
								<div onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';"></div>
							</td>
							
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div id="img" align="left"
								onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';">
									<img class="img-responsive img-center"
										src="
							<c:url value='/img/${b.albumcoverfilepath}'/>"
										alt="">
								</div>
							</td>

							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center" 
								onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';">
								 ${b.music_title}</div>
							</td>
							
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center" onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';"
								>${b.music_artist}</div>
							</td>
							
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center" onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';">
									<fmt:formatDate value="${b.music_publishdate}"
										pattern="yyyy-MM-dd" />
								</div>
							</td>
							
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center" onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';">${b.music_genre}</div>
							</td>
							
							<c:if test="${sessionScope.loginId == 'dev'}">
								<td style="font-family: Tahoma; font-size: 10pt;">
									<div>
										<!-- <input id="button" type="button" value="수정"
											onclick="tdclick1(event)"> -->
											<input id="button" type="button" value="수정"
											onclick="location.href='./music_modify.box?num=${b.music_num}'">
									</div>
								</td>
								<!-- onclick="location.href='./music_modify.box"></div></td> -->
								<td>
									<div>
										<input id="delete" name="delete" type="button" value="삭제"
											onclick="location.href='./music_delete.box?num=${b.music_num}'">
									</div></a>
								</td>
							</c:if>
						</tr>
						</div>
					</div>
				</c:forEach>
				<%
					//}// for end
				%>
				<tr align=center valign=bottom height=40>
					<td colspan=7 style="font-family: Tahoma; font-size: 10pt;"><c:if
							test="${page <= 1 }">[이전]&nbsp;
			</c:if> <c:if test="${page > 1 }">
							<a href="./music_list.box?page=${page-1}">[이전]</a>&nbsp;
			</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a == page }">[${a}]
					</c:if>

							<c:if test="${a != page }">
								<a href="./music_list.box?page=${a}">[${a}]</a>&nbsp;
					</c:if>
						</c:forEach> <c:if test="${page >= maxpage }">[다음] 
			</c:if> <c:if test="${page < maxpage }">
							<a href="./music_list.box?page=${page+1}">[다음]</a>
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
					<td align="right"><font size=2>등록된 글이 없습니다.</font></td>
				</tr>
			</c:if>
			<%
				//	}
			%>
		</table>

		<%@ include file="../front/footer.jsp"%>
</body>
</html>