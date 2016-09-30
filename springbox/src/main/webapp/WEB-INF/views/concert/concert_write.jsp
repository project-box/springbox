<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
			<tr align="center" valign="middle">
				<td colspan="5">게시판 글쓰기</td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">공연제목</div>
				</td>
				<td><input name="board_Subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">공연날짜</div>
				</td>
				<td><input name="board_Subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">공연시간</div>
				</td>
				<td><input name="board_Subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">공연장소</div>
				</td>
				<td><input name="board_Subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">예매가격</div>
				</td>
				<td><input name="board_Subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">상세정보</div>
				</td>
				<td><textarea name="board_Content" cols="67" rows="15"></textarea>
				</td>
			</tr>
			
			
			
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">공연장 위치정보</div>
				</td>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">위도</div>
				</td>
				<td><input name="board_Subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">공연장 위치정보</div>
				</td>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">경도</div>
				</td>
				<td><input name="board_Subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">파일 첨부</div>
				</td>

				<td><input name="board_File" type="file" /></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>

			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5"><a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a></td>
			</tr>
		</table>



</body>
</html>