<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- <link rel="stylesheet" type="text/css" href="style.css" /> -->

<style>
table, tr, td {
	border: 1px solid black;
}
</style>

</head>
<body>
	<table width="470" height="380">
		<tr>
			<td width="470" height="50" colspan="2">Title: ${music.music_title} / Artist: ${music.music_artist}</td>
		</tr>
		<tr>
			<td align="center">
				<img  width="250" height="250" src="<c:url value='/img/${music.albumcoverfilepath}'/>" alt="">
			</td>
			<td rowspan="2">가사
				<!-- style="font-family: Tahoma; font-size: 9pt; overflow: auto;" -->
				<%-- ${music.music_lyrics} --%>
			</td>
		</tr>
		<tr>
		<td width="200" height="40"><audio controls="controls">
				<source src="song/Hello.mp3" type="audio/mp3" />
				</audio></td></tr>
		<%-- <tr >
			<td>
				<audio controls="controls">
				<source src="10_20springbox/song/${b.music_mp3}" type="audio/mp3" />
				</audio>
			
			</td>
			<td></td>
		</tr> --%>
	</table>



	<%-- 	<c:out value="${music.music_title}"></c:out> --%>
	<%-- 

			<div class="image">
				<img class="img-responsive img-center" width="350" height="400"
					src="
							<c:url value='/img/${music.albumcoverfilepath}'/>"
					alt="">
			</div>

			<div class="info">
				<b><div align="center">
						<Font Size="30" color="#777777">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							${music.music_title}</Font>
					</div></b><br>
				<br>

				<div align="center">
					<Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							아티스트 :</b> ${music.music_artist}</Font>
				</div>
				<br> <br>

				<div align="center">
					<Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							발매일 : </b>
						<fmt:formatDate value="${music.music_publishdate}"
							pattern="yyyy-MM-dd" /> </Font>
				</div>
				<br> <br>
				<div align="center">
					<Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							장르 : </b>${music.music_genre}</Font>
				</div>
				<br>
				<br>
				<br>
			</div>

			<div class="row">
				<table width=100%>
					<tr>
						<td width=50%><div class="col-lg-12">
								<h1 class="page-header">
									가사 <small> <i class="fa fa-bars" aria-hidden="true"></i>
									</small>
								</h1></td>
						<td widht=50%><div class="col-lg-12">
								<h1 class="page-header">
									앨범 수록곡 <small> <i class="fa fa-bars" aria-hidden="true"></i>
									</small>
								</h1></td>
					</tr>
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="center">${music.music_lyrics}</div>
					</td>
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="center">${music.music_album}</div>
					</td>
					<tr>
						</div>
				</table>
			</div>
 --%>
</body>
</html>