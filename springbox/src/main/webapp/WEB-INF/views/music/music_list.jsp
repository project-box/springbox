<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%-- 	<%@ include file= "/box/header.jsp" %> --%>

<style>
#over:hover {
	background-color:#CFCFCF;
	cursor:pointer;
	opacity: 0.8;
} 
#img {
	padding:8px;
}
</style>
	<title>b o x</title>
</head>
<body>
	<div class="container">
  
	<!-- 최신곡 -->
        <div class="row" padding="50px">
            <div class="col-lg-12">
                <h1 class="page-header">최신곡
                    <small>
                    	<a href="MusicList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
    <table>
   <%
			//if(listcount > 0){
		%>
		<!-- 레코드가 있으면 -->
		
		<c:if test="${listcount > 0 }">
			<tr id="menu" align="center" valign="top" bordercolor="#333333" style="font-weight: bold;">
				<td style="font-family: Tahoma; font-size: 11pt;"  width="8%" height="30s" >
					<div align="center">번호</div>
				</td>
				<td width="7%" height="26"> 
					<div align="center">    </div>
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

			<%
		
			%>

			<!-- 화면 출력 번호 -->
			<c:set var="num" value="${listcount-(page-1)*10}" />

			<c:forEach var="b" items="${Newmusiclist}">
			<div>
				<tr id="over"align="center" valign="middle" bordercolor="#333333"
					onclick="location.href='./musicDetailAction.box?num=${b.id}&page=${page}';"
					onmouseover="this.style.backgroundColor='F8F8F8'"
					onmouseout="this.style.backgroundColor=''">
					<td height="23" style="font-family: Tahoma; font-size: 10pt;">
						
			<!-- 번호 출력 부분 --> 
			
				<c:out value="${num}" /> 
				<c:set var="num" value="${num-1}" />
				</td>		
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div id="img" align="left">
							<img class="img-responsive img-center" src="
							<c:url value='/img/${b.albumcoverfilepath}'/>" alt="" >
						</div>
					</td>
					
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${b.title}</div>
					</td>
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${b.artist}</div>
					</td>
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center"><fmt:formatDate value="${b.publishdate}" pattern="yyyy-MM-dd"/>
					</div>
					</td>	
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${b.genre}</div>
					</td>
				</tr>
				</div>
 			</c:forEach>
			<%
				//}// for end
			%>
				<tr align=center valign=bottom height=40>
					<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
			<c:if test="${page <= 1 }">[이전]&nbsp;
			</c:if> 
			
			<c:if test="${page > 1 }">
				<a href="./MusicList.box?page=${page-1}">[이전]</a>&nbsp;
			</c:if> 
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page }">[${a}]
					</c:if>
						
					<c:if test="${a != page }">
							<a href="./MusicList.box?page=${a}">[${a}]</a>&nbsp;
					</c:if>
			</c:forEach>
					
			<c:if test="${page >= maxpage }">[다음] 
			</c:if> 
			
			<c:if test="${page < maxpage }">
				<a href="./MusicList.box?page=${page+1}">[다음]</a>
			</c:if>
			</td>
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
		<c:if test="${sessionScope.loginId == 'dev'}">
		<tr align="right">
			<td colspan="6"><a href="./musicWrite.box">[글쓰기]</a></td>
		</tr>
		</c:if>
	</table>
	
<%-- 	<%@ include file= "/box/footer.jsp" %> --%>

</body>
</html>