<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ include file="../front/header.jsp"%>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>b o x</title>
<style>
.art {
	padding: 10px;
}
</style>
<script>
	$(function() {
		$("#music_publishdate").datepicker();
	});
</script>
<!-- <script>
	$(document).ready(function() {
		$("form").submit(function() {
			if ($("#music_title").val() == "") {
				alert("제목을 입력 하세요");
				$("#music_title").focus();
				return false;
			}
			if ($("#music_artist").val() == "") {
				alert("아티스트를 입력 하세요");
				$("#music_artist").focus();
				return false;
			}
			if ($("#music_publishdate").val() == "") {
				alert("발매일을 입력 하세요");
				$("#music_publishdate").focus();
				return false;
			}
			if ($("#music_genre").val() == "") {
				alert("장르를 선택 하세요");
				$("#music_genre").focus();
				return false;
			}
			if ($("#music_lyrics").val() == "") {
				alert("가사를 입력 하세요");
				$("#music_lyrics").focus();
				return false;
			}
			if ($("#music_album").val() == "") {
				alert("앨범수록곡을 입력 하세요");
				$("#music_album").focus();
				return false;
			}
		});
	});
</script> -->

<style>
table {
	border: 1px solid black;
}
</style>
</head>
<body>
<body>
	
	<form action="music_update.box" method="post" name="modifyform"
		enctype="multipart/form-data">
		<input type="hidden" name="music_num" value="${music.music_num}">
		<table align="center" width="70%">
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center" class="art">♬ 제목</div>
						</td>
						<td><input name="music_title" id="music_title" type="text" size="10"
							maxlength="10" value="${music.music_title }" /></td>
						<br>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="16">
							<div align="center" class="art">♬ 아티스트</div>
						</td>
						<td><input name="music_artist" id="music_artist" type="text" size="10"
							maxlength="10" value="${music.music_artist }" /></td>
						<br>
					</tr>	
					<tr>
						<td style="font-family: 돋음; font-size: 12" height="18">
							<div align="center" class="art">♬ 발매일</div>
						</td>
						<fmt:formatDate value="${music.music_publishdate}" pattern="MM/dd/yyyy" var="music_publishdate" />
						<td><input name="music_publishdate" id="music_publishdate" type="text"
							size="10" maxlength="10" value="${music_publishdate}" />
							<%-- <fmt:formatDate value="${music.music_publishdate}" pattern="yyyy-MM-dd" var="music_publishdate" /> --%>
							</td>
						<br>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center" class="art">♬ 장르</div></td>
						<td>
						<%-- <c:if test="${}"></c:if>  --%>
						<select name="music_genre" id="music_genre">
						
			<%-- <option value="추억장소" ${infolist.join_passq == '추억장소' ? 'selected="selected"' : '' }>기억에 남는 추억의 장소는?</option> --%>
								<option value="">---
								<option value="발라드" ${music.music_genre == '발라드' ? 'selected="selected"' : ''}>발라드</option>
								<option value="트로트" ${music.music_genre == '트로트' ? 'selected="selected"' : ''}>트로트</option>
								<option value="인디" ${music.music_genre == '인디' ? 'selected="selected"' : ''}>인디</option>
								<option value="락" ${music.music_genre == '락' ? 'selected="selected"' : ''}>락</option>
								<option value="R&B" ${music.music_genre == 'R&B' ? 'selected="selected"' : ''}>R&B</option>
								<option value="힙합/랩" ${music.music_genre == '힙합/랩' ? 'selected="selected"' : ''}>힙합/랩</option>
								<option value="POP" ${music.music_genre == 'POP' ? 'selected="selected"' : ''}>POP</option>
								<option value="댄스" ${music.music_genre == '댄스' ? 'selected="selected"' : ''}>댄스</option>
								<option value="OST" ${music.music_genre == 'OST' ? 'selected="selected"' : ''}>OST</option>
								<option value="해외" ${music.music_genre == '해외' ? 'selected="selected"' : ''}>해외</option>
								<option value="기타" ${music.music_genre == '기타' ? 'selected="selected"' : ''}>기타</option>
						</select><br>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center" class="art">♬ 가사</div>
						</td>
						<td><textarea name="music_lyrics" id="music_lyrics" cols="67" rows="10">${music.music_lyrics}</textarea>
						</td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center" class="art">♬ 앨범수록곡</div> <br> <br>
						</td>
						<td><textarea name="music_album" id="music_album" cols="67" rows="10">${music.music_album}</textarea>
						</td>
					</tr>
					<tr>
						<td style="font-family: 돋음; font-size: 12">
							<div align="center" class="art">♬ 앨범사진</div>
						</td>
						<td><input name="Albumcoverfilepath" type="file"/></td>
					</tr>
					<tr bgcolor="cccccc">
						<td colspan="2" style="height: 1px;"></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr align="center" valign="middle">
						<td colspan="5"><input type=submit value="수정"> 
						<input type=reset value="취소"
							onclick="location.href='./music_list.box';"></td>
					</tr>
				</table>
	</form>

	<%@ include file="../front/footer.jsp"%>
</body>
</html>