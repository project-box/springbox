<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천공연 등록 - 관리자페이지</title>

<script>
	function addboard() {
		concertform.submit();
	}
</script>

</head>
<body>

	<h4 align="center">추천공연 등록하기</h4>
	
	<form action="./concert_add.box" method="post"
		enctype="multipart/form-data" name="concertform">

		<table align="center">
			<tr>
				<td width="150" colspan=2 style="font-family: 돋음; font-size: 12"
					height="16">
					공연제목
				</td>
				<td><input name="concert_title" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>


			<tr>
				<td rowspan=2 style="font-family: 돋음; font-size: 12" height="16">
					공연날짜
				</td>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">시작날짜</div>
				</td>
				<td><input name="concert_startdate1" type="text" size="4"
					maxlength="100" value="" />&nbsp;/
					<input name="concert_startdate2" type="text" size="02"
					maxlength="100" value="" />&nbsp;/
					<input name="concert_startdate3" type="text" size="02"
					maxlength="100" value="" />
					</td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					끝나는 날짜
				</td>
				<td><input name="concert_enddate1" type="text" size="4"
					maxlength="100" value="" />&nbsp;/
					<input name="concert_enddate2" type="text" size="02"
					maxlength="100" value="" />&nbsp;/
					<input name="concert_enddate3" type="text" size="02"
					maxlength="100" value="" />
					</td>
			</tr>

			<tr>
				<td colspan=2 style="font-family: 돋음; font-size: 12" height="16">
					공연장소
				</td>
				<td><input name="concert_place" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			
			<tr>
				<td colspan=2 style="font-family: 돋음; font-size: 12" height="16">
					출연자
				</td>
				<td><input name="concert_artist" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>

			<tr>
				<td colspan=2 style="font-family: 돋음; font-size: 12" height="16">
					예매가격
				</td>
				<td><input name="concert_price" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td rowspan=2 style="font-family: 돋음; font-size: 12" height="16">
					
						공연장<br> 위치정보
					
				</td>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">위도</div>
				</td>
				<td><input name="locationx" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">경도</div>
				</td>
				<td><input name="locationy" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>

			<tr>
				<td colspan=2 style="font-family: 돋음; font-size: 12">
					파일 첨부
				</td>

				<td><input name="posterfilepath" type="file" /></td>
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
	</form>


</body>
</html>