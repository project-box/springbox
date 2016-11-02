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
	border: 1px solid #dcdcdc;
	margin-top: 10px;
	width:85%;
	
}

.listTable td {
	padding-top: 35px;
	padding-left: 35px;
	padding-right: 35px;
	border: 1px solid #dcdcdc;
	height: 100%;
}


.write {
	float: right;
	margin-top: 25px;
	margin-right: 85px;
	display: none;
	width: 17%;
}

.write button {
	text-decoration: none;
	outline: none;
	color: white;
	border-radius: 0.2em;
	background-color: #787878;
	height: 40px;
	width: 80%;
}

.text {
	font-size: 20px;
	font-weight: bold;
	font-family: inherit;
	color: #646464;
	width: 100%; height : 45px;
	float: left;
	/* margin-left: 75px;
margin-top: 40px; */
	border: 1px dashed #8c8c8c;
	padding-left:10px;
	padding-top:5px;
}

.text0 {
	margin-left: 100px;
	margin-top: 30px;
	width: 85%;
	height: 63px;
	border: 1px solid #8c8c8c;
	padding: 8px;
}

.page{

	margin-top:70px;
	margin-bottom:150px;
	font-size: 25px;
	border: 1px solid #dcdcdc;
	width:85%;
	padding-bottom: 10px;
	padding-top: 10px;
	margin-left:100px;
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
		<font size=4px><a href="concert_write.box">	<button >추천공연등록</button></a>
		</font><br>
		<font size=2px>(관리자 아이디 접속 시에만 보입니다)</font><br>
		<br>
	</div>


	<div id=listTable>
		<table border=1 class=listTable align="center"> 
			<tr align="center">
				<c:forEach var="b" items="${concertlist}">

					<c:set var="i" value="${i+1}" />

					<td class="col-md-3 portfolio-item" width="250" height="500"
						valign="top"><a
						href="concert_detail.box?concert_num=${b.concert_num}"> <img
							class="img-responsive img-center" width="300" height="400"
							src="<c:url value='/img/${b.posterfilepath}'/>" alt=""></a> <br>
						<br>
						<div class="well well-sm">
							<font size=3px color="#505050"><b><c:out
										value="${b.concert_title}" /></b></font>
						</div> <br></td>

					<c:if test="${i % 4 == 0}">
			</tr>
			<tr align="center">
				</c:if>

				</c:forEach>
			</tr>
		
	</table>	
	<!-- -------------------------페이징처리----------------------------------------------	 -->

<div class="page" align="center">

	<c:if test = "${page>1}">
					<a href="concert_list.box?page=${page-1}">
					<font color=black>[이전]</font>
					</a>
				</c:if>
				<!-- 페이지 번호 목록 출력 -->
				<c:forEach var="a" begin="${startpage}" 
				end="${endpage}">
				<!-- 출력하는 페이지 번호가 현재 페이지
				번호이면 그냥 출력하고 그렇지 않으면 링크 설정 -->
				<c:if test="${a==page}">
					<font color=red>[${a}]</font>
				</c:if>
				<c:if test="${a!=page}">
				<a href="concert_list.box?page=${a}">
					<font color=black>
					[${a}]</font></a>
				</c:if>
				</c:forEach>
				<!-- 현재 출력 중인 페이지가 마지막 페이지가 아니면
				[다음]을 만들어서 현재 출력 중인 페이지 다음으로
				이동하도록 링크 설정 -->
				<c:if test="${page!=maxpage}">
					<a href="concert_list.box?page=${page+1}">
					<font color=black>[다음]</font></a>
				</c:if> 
	
		</div>
	</div>

</body>
</html>