<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천 공연</title>
</head>
<body>

	추천공연 게시판 리스트
	
	<a href="concert_detail.box">클릭 하면 디테일페이지로</a>
	
	
	<%-- <br>
	<table>
		<tr>
			<c:forEach var="b" items="${concertlist}">
				<td><a href="concert_list.box?num=${b.concert_num}"> 
				<img src="<c:url value='/img/${b.posterfilepath}'/>" alt=""></a> 
				<br> <c:out value="${b.concert_title}" /> <br>
				</td>
				
				${fn:length(concertlist)}

				<c:if test="${fn:length(concertlist)} % 4 == 0">
		       </tr><tr>
			    </c:if>

			</c:forEach>
		</tr>
	</table> --%>
</body>
</html>