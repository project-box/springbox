<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- <script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script> -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- <%@ include file= "/box/header.jsp" %> --%>

<title>b o x</title>

<script>
	$(function() {
		$("#publishdate").datepicker();
	});
</script>

<script>
	$(document).ready(function() {
		$("form").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력 하세요");
				$("#title").focus();
				return false;
			}
			if ($("#artist").val() == "") {
				alert("아티스트를 입력 하세요");
				$("#artist").focus();
				return false;
			}
			if ($("similarity").val() == "") {
				alert("유사성를 입력 하세요");
				$("#artist").focus();
				return false;
			}
			if ($("#publishdate").val() == "") {
				alert("발매일을 입력 하세요");
				$("#publishdate").focus();
				return false;
			}
			if ($("#genre").val() == "") {
				alert("내용을 입력 하세요");
				$("#genre").focus();
				return false;
			}
			if ($("#lyrics").val() == "") {
				alert("가사를 입력 하세요");
				$("#lyrics").focus();
				return false;
			}
			if ($("#album").val() == "") {
				alert("앨범수록곡을 입력 하세요");
				$("#album").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div class="container">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					곡 등록하기 <small> <i class="fa fa-bars" aria-hidden="true"></i>
					</small>
				</h1>
			</div>
			<form action="/MusicAction.box" method="post"
				enctype="multipart/form-data" name="musicform">
				<table align="center">
					<!-- <tr align="center" valign="middle">
				<td colspan="5">곡 등록하기</td>
			</tr> -->
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center">제목</div> <br>
						</td>
						<td><input name="title" id="title" type="text" size="10"
							maxlength="10" value="" /></td>
						<br>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center">아티스트</div> <br>
						</td>
						<td><input name="artist" id="artist" type="text" size="10"
							maxlength="10" value="" /></td>
						<br>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center">유사성</div> <br>
						</td>
						<td><input name="similarity" id="similarity" type="test"
							size="10" maxlength="10" value="" /><br>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center">발매일</div> <br>
						</td>
						<td><input name="publishdate" id="publishdate" type="text"
							size="10" maxlength="10" value="" /></td>
						<br>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12"><br>
							<div align="center">장르</div></td>
						<td><select name="genre" id="genre">s
								<option value="">---
								<option value="발라드">발라드
								<option value="락">락
								<option value="R&B">R&B
								<option value="힙합/랩">힙합/랩
								<option value="팝">팝
								<option value="댄스">댄스
								<option value="O.S.T">O.S.T
						</select><br>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center">가사</div> <br> <br> <br> <br>
						</td>
						<td><textarea name="lyrics" id="lyrics" cols="67" rows="10"></textarea>
						</td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center">앨범수록곡</div> <br> <br>
						</td>
						<td><textarea name="album" id="album" cols="67" rows="10"></textarea>
						</td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center">앨범사진</div> <br> <br>
						</td>
						<td><input name="Albumcoverfilepath" type="file" /></td>
					</tr>
					<tr bgcolor="cccccc">
						<td colspan="2" style="height: 1px;"></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr align="center" valign="middle">
						<td colspan="5"><input type=submit value="등록"> <input
							type=reset value="취소"
							onclick="location.href='/MusicList.box';"></td>
					</tr>
				</table>
			</form>

			<%-- <%@ include file= "/box/footer.jsp" %>  --%>
</body>
</html>