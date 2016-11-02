<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/front/header.jsp"%>


<style type="text/css">
p.test {
	width: 550px;
	height: 100px; border : 1px solid #000001;
	word-wrap: break-word;
	border: 1px solid #000001;
}
</style>

<title>서비스 문의 상세보기</title>
</head>
<body>


	<div class="container">
		<h2>Basic Table</h2>
		<p>The .table class adds basic styling (light padding and only
			horizontal dividers) to a table:</p>
		<table class="table">

			<tr>

				<td align="center" width="50%">제목</td>
				<td align="center" width="50%">${sboarddata.s_subject}</td>

			</tr>


			<tr>

				<td align="center" width="50%">내용</td>
				<td align="left" width="50%">
					<%-- ${sboarddata.s_content}</td> --%> <c:set var="bont"
						value="${sboarddata.s_content}" /> ${fn:replace(bont, newLineChar, '<br/>')}
					</p>
			</tr>
			<tr>
				<td>
					<div align="center">첨부파일</div>
				</td>
				<td>
					<div align="center">

						<input class="btn btn-primary" type="button" value="수정"
							onclick="location.href='/downdload.jsp=${sboarddata.s_file}'" />
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><c:if
						test="${sessionScope.loginId == sboarddata.user_id}">
						<input class="btn btn-primary" type="button" value="수정"
							onclick="location.href='SboardModify.box?num=${sboarddata.s_num}'" /> &nbsp;&nbsp;&nbsp;
							<input class="btn btn-primary" type="button" value="삭제"
							onclick="location.href='SboardDelete.box?num=${sboarddata.s_num}'" />
					</c:if>&nbsp;&nbsp;&nbsp; <input class="btn btn-primary" type="button"
					value="목록" onclick="location.href='SboardList.box'" /></td>

			</tr>


			<c:if test="${replydata != null }">
				<c:forEach var="re" items="${replydata}">
					<tr>
						<td>
							<div align="center">
								<img width="200" height="130" src="./sboardupload/${re.IMAGE}" />
						</td>
						<td>
							<%--  ${fn:replace(${re.SR_CONTENT }, newLineChar, '<br/>')} --%>

							<!-- <div class="reply" align="Left" > -->
							<div align="center">
								<div align="left">
									<h6>${re.NAME}</h6>
								</div>
								<div align="center">
									<p class="test" align="left">
										<c:set var="cont" value="${re.SR_CONTENT}" />
										${fn:replace(cont, newLineChar, '<br/>')}
									</p>
								</div>
							</div>

						</td>
					</tr>
				</c:forEach>
			</c:if>

			<tr>
				<td colspan="5">
					<form action="ReplyAdd.box" method="post">
						<!-- 현재 글번호 숨겨서 저장 -->
						<input type="hidden" value="${sboarddata.s_num}" name="num" />
						<textarea cols="130" rows="3" name="comment"></textarea>

						<input type="submit" value="댓글입력" />
					</form>
				</td>
			</tr>



		</table>
	</div>







</body>
</html>






