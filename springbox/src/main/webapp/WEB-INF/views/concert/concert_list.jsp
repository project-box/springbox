<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>추천 공연</title>

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<style>
.listTable {
	width: 90%;
	border: 1px solid #dcdcdc;
	margin-top: 10px;
}

.listTable td {
	padding-top: 40px;
	padding-left: 18px;
	padding-right: 18px;
}

.write {
	float: right;
	margin-top: 35px;
	margin-right: 80px;
	display: none;
}

.write button {
	text-decoration: none;
	outline: none;
	color: white;
	border-radius: 0.2em;
	background-color: #787878;
	height: 50px;
	width: 265px;
}

.text {
	font-size: 40px;
	font-weight: bold;
	font-family: inherit;
	color: #646464;
	width: 100%; height : 100px;
	float: left;
	/* margin-left: 75px;
margin-top: 40px; */
	border: 1px dashed #8c8c8c;
	padding-left: 25px;
	padding-top: 15px;
	padding-bottom: 17px;
	height: 100px;
}

.text0 {
	margin-left: 75px;
	margin-top: 40px;
	width: 90%;
	height: 120px;
	border: 1px solid #8c8c8c;
	padding: 10px;
}
</style>


<script>
	var id = '${sessionScope.loginId}';

	function writebutton() {

		if (id != 'dev') {

			document.getElementById("write").style.display = "none";
			document.getElementById("listTable").style.marginTop = "100px";

		} else if (id == 'dev') {

			document.getElementById("write").style.display = "block";
		}

	}
</script>


</head>
<body onload="writebutton();">

	<div class="text0">
		<div class="text">추천공연 목록</div>
	</div>


	<div class="write" id="write">
		<font size=5px><a href="concert_write.box">	<button>추천공연등록</button></a>
		</font><br> <font size=3px>(관리자 아이디 접속 시에만 보입니다)</font><br>
		<br>
	</div>


	<div id=listTable>
		<table cellspacing="10" border=1 align=center class=listTable>
			<tr>
				<c:forEach var="b" items="${concertlist}">

					<c:set var="i" value="${i+1}" />

					<td class="col-md-3 portfolio-item" width="250" height="500"
						valign="top"><a
						href="concert_detail.box?concert_num=${b.concert_num}"> <img
							class="img-responsive img-center" width="300" height="400"
							src="<c:url value='/img/${b.posterfilepath}'/>" alt=""></a> <br>
						<br>
						<div class="well well-sm">
							<font size=4px color="#505050"><b><c:out
										value="${b.concert_title}" /></b></font>
						</div> <br></td>

					<c:if test="${i % 4 == 0}">
			</tr>
			<tr>
				</c:if>

				</c:forEach>
			</tr>
		</table>
	</div>

</body>
</html>