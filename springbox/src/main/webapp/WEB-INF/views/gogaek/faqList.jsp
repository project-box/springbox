<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항목록</title>
</head>
<body>
	<div align="center">
		<table width="600" border="1">
			<tr>
				<td colspan="4" align="center">
				<h2>도움말</h2>
				</td>
			</tr>
			<tr>
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="20%">날짜</th>
				<th width="15%">조회수</th>
			</tr>	
			
			<c:forEach var="bl" items="${result}">
				<tr>
				<td align="right">${bl.faq_num}&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;
				<a href="FaqDetail.box?num=${bl.faq_num}">${bl.faq_subject}</a></td>
				<td align="center">${bl.faq_date}</td>
				<td align="right">${bl.faq_readcount }&nbsp;&nbsp;&nbsp;</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center"><a href="gogaekmain.jsp">[초기화면]</a></td>
			</tr>	
			
		</table>
	</div>
</body>
</html>








