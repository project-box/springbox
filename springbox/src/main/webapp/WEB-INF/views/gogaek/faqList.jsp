<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/front/header.jsp"%>

<style>

.title {
    background-color: #D2E1FF; 
	color: white;
	font-weight: bold;
	height: 30px;
}
.btn {
color: black;
}

</style>

<title>도움말 목록</title>
</head>
<body>
<%-- 	<div align="center">
		<table width="580" border="1">
			<tr class="title">
				<td colspan="4" align="center">
				<h2>도움말</h2>
				</td>
			</tr>
			<tr height="30">
				<th width="10%" style="text-align:center">번호</th>
				<th width="50%" style="text-align:center">제목</th>
				<th width="20%" style="text-align:center">날짜</th>
				<th width="15%" style="text-align:center">조회수</th>
			</tr>	
			
			<c:forEach var="bl" items="${result}">
				<tr>
				<td align="center">${bl.faq_num}&nbsp;</td>
				<td>&nbsp;&nbsp;
				<a href="FaqDetail.box?num=${bl.faq_num}">${bl.faq_subject}</a></td>
				<td align="center">${bl.faq_date}</td>
				<td align="center">${bl.faq_readcount }&nbsp;</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center">
				<button class="btn"><a href="Gogaekmain.box">초기화면</a></button></td>
			</tr>	
			
		</table>
	</div> --%>
	
	
	
	<div class="container" align="Center">
		<h2>도움말</h2>
		<p>Contextual classes can be used to color table rows or table
			cells. The classes that can be used are: .active, .success, .info,
			.warning, and .danger.</p>
		<table class="table">
			<thead>
				<tr>
					<th> 
					    <div align="center">번호</div>
				    </th>
				    <th> 
					    <div align="center">제목</div>
				    </th>
				    <th> 
					    <div align="center">날 짜</div>
				    </th>
				    <th> 
					    <div align="center">조회수</div>
				    </th>
				    				    
					<!-- <th align="Center">제목</th>
					<th align="Center">작성일</th>
					<th align="Center">조회수</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bl" items="${result}">
				<tr>
				<td align="center">${bl.faq_num}&nbsp;</td>
				<td align="center">
				<a href="FaqDetail.box?num=${bl.faq_num}">${bl.faq_subject}</a></td>
				<td align="center">${bl.faq_date}</td>
				<td align="center">${bl.faq_readcount }&nbsp;</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center">
				<button class="btn"><a href="Gogaekmain.box">초기화면</a></button></td>
			</tr>	
			 <%--    <tr>
				<td colspan="4" align="center">
				<!-- 현재 page가 1이 아니면 이전 페이지로
				이동할 수 있는 [이전] 링크 만들기 -->
				<c:if test = "${page>1} ">
					<a href="SboardList.box?page=${page-1}">[이전]</a>
				</c:if>
				<!-- 페이지 번호 목록 출력 -->
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<!-- 출력하는 페이지 번호가 현재 페이지 번호이면 그냥 출력하고 그렇지 않으면 링크 설정 -->
				<c:if test="${a==page}">[${a}]</c:if>
				<c:if test="${a!=page}"><a href="SboardList.box?page=${a}">[${a}]</a>
				</c:if>
				</c:forEach>
				<!-- 현재 출력 중인 페이지가 마지막 페이지가 아니면 [다음]을 만들어서 현재 출력 중인 페이지 다음으로
				이동하도록 링크 설정 -->
				<c:if test="${page!=maxpage }">
					<a href="SboardList.box?page=${page+1 }">[다음]</a>
				</c:if>
				</td>
				</tr>
				
				<tr>
				    <div class="row">
						<div class="col-md-12 form-group" align="Center">
							<input class="btn btn-primary" type="button" value="메인으로"
								onclick="location.href='Gogaekmain.box'" /> &nbsp;&nbsp;&nbsp; 
							<input class="btn btn-primary" type="button" value="문의 글 작성"
								onclick="location.href='SboardWrite.box'" />
						</div>
					</div>
					
				</tr>	 --%>
				    
			
				</tbody>
		</table>
	</div>
	
</body>
</html>








