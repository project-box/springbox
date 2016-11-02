<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천공연 등록 - 관리자페이지</title>

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<style>

.writeTable{

width: 55%;
height:600px;
margin-top:70px;
border: 1px solid #bebebe;

}

.writeTable th {

font-size: 18px;
text-align: center;
background-color: #F7F5F5;

}

.writeTable td {

padding-left:35px;

}


.writeButton{

text-decoration: none; 
color:black; 
font-size: 20px;
background-color: white;
outline: none;
width: 100px;

}

</style>



</head>
<body>
    <br>
    <br>
    
   <div class=writeForm align="center">
    
	<font style="text-align:center; font-size: 25px; font-weight: bold;">추천공연 등록하기</font>
	
	<form action="./concert_add.box" method="post"
		enctype="multipart/form-data" name="concertform">

		<table border="1"  class="writeTable">
		
			<tr>
				<th colspan=2 width="30%">
					공연제목
				</th>
				<td><input name="concert_title" type="text" size="70"
					maxlength="100" value=""  /></td>
			</tr>


			<tr>
				<th rowspan=2>
					공연날짜
				</th>
				<th>
					시작날짜
				</th>
				<td><input name="concert_startdate1" type="text" size="4"
					maxlength="80" value="" />&nbsp;/
					<input name="concert_startdate2" type="text" size="02"
					maxlength="80" value="" />&nbsp;/
					<input name="concert_startdate3" type="text" size="02"
					maxlength="80" value="" />
					</td>
			</tr>

			<tr>
				<th>
					끝나는 날짜
				</th>
				<td><input name="concert_enddate1" type="text" size="4"
					maxlength="80" value="" />&nbsp;/
					<input name="concert_enddate2" type="text" size="02"
					maxlength="80" value="" />&nbsp;/
					<input name="concert_enddate3" type="text" size="02"
					maxlength="80" value="" />
					</td>
			</tr>

			<tr>
				<th colspan=2 >
					공연장소
				</th>
				<td><input name="concert_place" type="text" size="70"
					maxlength="80" value="" /></td>
			</tr>
			
			<tr>
				<th colspan=2>
					출연자
				</th>
				<td><input name="concert_artist" type="text" size="70"
					maxlength="80" value="" /></td>
			</tr>

			<tr>
				<th colspan=2 >
					예매가격
				</th>
				<td><input name="concert_price" type="text" size="70"
					maxlength="80" value="" /></td>
			</tr>
			<tr>
				<th rowspan=2 >
					
						공연장<br> 위치정보
					
				</th>
				<th >
					위도
				</th>
				<td><input name="locationx" type="text" size="30"
					maxlength="80" value="" /></td>
			</tr>
			<tr>
				<th>
					경도
				</th>
				<td><input name="locationy" type="text" size="30"
					maxlength="80" value="" /></td>
			</tr>

			<tr>
				<th colspan=2 >
					파일 첨부
				</th>

				<td><input name="posterfilepath" type="file" /></td>
			</tr>
		</table>
		<br><br>
	<input type="submit" class="writeButton" value="등록">
	<input type="button" class="writeButton" onclick="javascript:history.go(-1)" value="뒤로">

	</form>
</div> 
<%@ include file="/WEB-INF/views/front/footer.jsp"%>
</body>
</html>