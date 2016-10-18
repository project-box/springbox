<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도움말 상세보기</title>
</head>
<body>
	<div align="center">
	<table width="500" border="1">
		<tr>
			<td colspan="2" align="center">
			<h2>상세보기</h2>
			</td>
		</tr>
		
		<tr>
		<td width="20%">제목</td>
		<td width="80%">${result.faq_subject }</td>
		</tr>
			
		<tr>
		<td>내용</td>
		<td>${result.faq_content }</td>
		</tr>
		
		<tr>
		<td colspan="2" align="center">
		<a href="FaqList.box">[목록보기]</a>
		<a href="gogaekmain.jsp">[초기화면]</a>
		</td>
		</tr>
		
	</table>
	</div>
</body>
</html>




