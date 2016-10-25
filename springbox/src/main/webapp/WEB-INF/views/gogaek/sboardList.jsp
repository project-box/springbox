<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/front/header.jsp"%>



<title>서비스 문의 목록</title>
</head>
<body>
	<%-- <div align="center">
		<table width="600" border="1">
			<tr>
				<td colspan="4" align="center">
				<h2>서비스 문의 목록 출력</h2>
				</td>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th width="60%">제목</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>	
			
			<c:forEach var="item" items="${sboardlist}">
				<tr>
					<td align="right">${item.s_num }&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;<a href="SboardDetail.box?num=${item.s_num}">${item.s_subject}</a></td>
					<td align="center">${item.s_date}</td>
					<td align="right">${item.s_readcount}&nbsp;&nbsp;</td>
				</tr>	
			</c:forEach>
			<tr>
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
					<td colspan="4" align="center">
						<a href="./Gogaekmain.box">[메인으로]</a>
						<a href="SboardWrite.box">[게시글 작성]</a>
					</td>
				</tr>		
		
		</table>
	</div> --%>

	<div class="container" align="Center">
		<h2>서비스 문의 목록 </h2>
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
					    <div align="center">작성일</div>
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
			
			<c:set var="num" value="${listcount-(page-1)*10}"/>


				<c:forEach var="item" items="${sboardlist}">
					<tr>
						<%-- <td align="center">${item.s_num }						  
						</td> --%>
						<td>
						<div align="center">
						<c:out  value="${num}"/></div>		
					    <c:set var="num" value="${num-1}"/>	 
						</td>
						<td align="center">
						<a href="SboardDetail.box?num=${item.s_num}">${item.s_subject}</a></td>
						<td align="center">${item.s_date}</td>
						<td align="center">${item.s_readcount}</td>
					</tr>
				</c:forEach>
			    <tr>
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
					
				</tr>	
				    
			
				</tbody>
		</table>
	</div>




</body>
</html>







