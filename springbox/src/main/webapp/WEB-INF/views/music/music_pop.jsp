<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="style.css" />

<style>
table {
	border: 1px solid #777777;
}

tr, td {
	border: 2px dotted #777777;
}
</style>

</head>
<body>
	<table width="470" height="380" align="center">
		<tr>
			<td width="470" height="50" colspan="2">Title:
				${music.music_title} / Artist: ${music.music_artist}</td>
		</tr>
		<tr>
			<td align="center"><img width="250" height="250"
				src="<c:url value='/img/${music.albumcoverfilepath}'/>" alt="">
			</td>
			<td rowspan="2"><textarea rows="22" cols="22"
					style="font-family: Tahoma; font-size: 9pt; resize: none;"> ${music.music_lyrics}
						</textarea></td>
		</tr>
		<tr>
			<td width="200" height="40"><audio controls autoplay="autoplay">
            <source src="<c:url value='/song/${music.music_mp3}'/>" type="audio/mp3" />
            </audio></td></tr>
	</table>


</body>
</html>