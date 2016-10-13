<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>서비스 문의 상세보기</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<td>제목</td>
				<td>${sboarddata.s_subject}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${sboarddata.s_content}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
				<a href="download.box?filename=${sboarddata.s_file}">${sboarddata.s_file}</a>
				</td>
			</tr>
			<!-- 수정,삭제,목록 버튼 만들기
			수정과 삭제는 글쓴이와 
			로그인한 사용자가 같을 때만 출력 -->	
			<tr>
				<td colspan="2" align="center">
				<c:if test="${sessionScope.loginId == sboarddata.user_id}">
					<a href="SboardModify.box?num=${sboarddata.s_num}">[수정]</a> 
					<a href="SboardDelete.box?num=${sboarddata.s_num}">[삭제]</a>
				</c:if>
				<a href="SboardList.box">[목록]</a>
				</td>
			</tr>	
			<c:if test="${replydata != null }">
				<c:forEach var="re" items="${replydata}">
					<tr>
						<td><img width="50" height="50" src="./image/${re.IMAGE }" /></td>
						<td>
							${re.NAME }:${re.sr_CONTENT }
						</td>
					</tr>	
				</c:forEach>
			</c:if>	
			
			<tr>
				<td colspan="2">
				<form action="ReplyAdd.box" method="post">
					<!-- 현재 글번호 숨겨서 저장 -->
					<input type="hidden" value="${sboarddata.s_num}" name="num" />
					<textarea cols="60" rows="3" name="comment"></textarea>
					<input type="submit" value="댓글입력"/>
				</form>
				</td>
			</tr>	
			
		</table>
	</div>
</body>
</html>






