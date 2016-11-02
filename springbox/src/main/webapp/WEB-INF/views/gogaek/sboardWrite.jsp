<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/front/header.jsp"%>
<title>서비스 문의하기</title>
<script>
	function addsboard() {
		sboardform.submit();
	}
</script>
</head>
<body>
	<!-- 게시판 등록 -->
	<!-- 파일을 전송할 때는 method는 반드시 post 이어야 하고
enctype을 반드시 변경해 주어야 합니다. 그렇지 않으면 파일의 내용이 전송되는 것이 아니고
파일의 이름이 전송됩니다. -->
	<%--  <form action="./SboardAddAction.box" method="post"
		enctype="multipart/form-data" name="sboardform">

		<!-- id를 입력받지 않고 다음 요청으로 전송하기 위해서 hidden을 생성 -->
		<input type="hidden" name="user_id" value="${users.user_id}">
		
		
		<div class="container">
		<h3 class="text-center">도움말 작성 하기</h3>
		<p class="text-center">
			<em>완료 Click 전에 한번 더 점검하기!</em>
		</p>	
		<div class="row test">	
		
		<table>
			<tr align="center" valign="middle">
				<td colspan="5">서비스 문의 </td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">글쓴이</div>
				</td>
				<td>${users.user_id}</td>
			</tr>


			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제 목</div>
				</td>
				<td><input name="s_subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="s_content" cols="67" rows="15"></textarea>
				</td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">파일 첨부</div>
				</td>

				<td><input name="s_file" type="file" /></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>

			<tr>
				<td colspan="2">&nbsp;</td>
			</tr> 
			<tr align="center" valign="middle">
				<td colspan="5"><a href="javascript:addsboard()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a></td>
			</tr>
		</table>
		</div>
		</div>
	</form>  --%>

	<div class="container">
		<h3 class="text-center">서비스 문의 작성하기</h3>
		<p class="text-center">
			<em>문제점을 지적해주세요!</em>
		</p>
		<div class="row test">
			<form action="./SboardAddAction.box" method="post"
				enctype="multipart/form-data" name="sboardform">

				<input type="hidden" name="user_id" value="${users.user_id}">
				<div class="col-md-12">

					<tr>
						<td style="font-family: 돋음; font-size: 20" height="20">
							<div align="Left">ID: &nbsp; ${users.user_id}</div>
						</td>

					</tr>



					<div class="row">
						<div class="col-sm-12 form-group">
							<input class="form-control" id="name" name="s_subject"
								height="20" placeholder="서비스 문의 제목" type="text" required>
						</div>

					</div>



					<br>
					<br>
					<textarea class="form-control" id="comments" name="s_content"
						placeholder="서비스 내용 " rows="20"></textarea>

					<!-- <tr>

						<td><input name="s_file" type="file" /></td>
					</tr> -->
					<tr bgcolor="cccccc">
						<td colspan="2" style="height: 1px;"></td>
					</tr>

					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>

					<div class="row">
						<div class="col-md-12 form-group" align="Right">
							<input class="btn btn-primary" type="button" value="등록" onclick="addsboard()"> &nbsp;&nbsp;&nbsp;
							<input class="btn btn-primary" type="button"
							onclick="history.go(-1)" value="취소">
						</div>
					</div>
			</form>
		</div>
	</div>





</body>
</html>


