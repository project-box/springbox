<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/search_panel_style.css" rel="stylesheet" />

</head>
<style>

#over:hover {
	background-color: #CFCFCF;
	cursor: pointer;
	opacity: 0.8;
}

#img {
	padding: 8px;
}

input[type=text], select {
	width: 600px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

</style>

<script type="text/javascript">

	function sendKeyword(){
		var key = $('#autocomplete').val();        
		if (key != undefined && key != null) {
		    window.location = '/springbox/search_content.box?keyword=' + key;
		}
	}

	$(document).ready(function() {
		
		// 파라미터 가져오기
		var getParam = function(key){
	        var _parammap = {};
	        document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
	            function decode(s) {
	                return decodeURIComponent(s.split("+").join(" "));
	            }
	 
	            _parammap[decode(arguments[1])] = decode(arguments[2]);
	        });
	 
	        return _parammap[key];
	    };
	 	
		// 검색어 파라미터 유지
	    var param = getParam("keyword");
	    if(param != undefined && param != null){
	    	$('#autocomplete').val(param);
	    }else{
	    	// 검색창 포커스
			$("#autocomplete").focus();
	    }
		
	    // 오토컴플리트 초기화
		$('#autocomplete').autocomplete({
			//lookup: countries,
			serviceUrl: '/springbox/get_keyword.box',
			transformResult : function(response) {
				var jdata = JSON.parse(response);
				return {
		            suggestions: $.map(jdata, function(value) {
		                return { value: value.keyword };
		            })
		        };
		    },
		    onSelect: function (suggestion) {
		        //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
		        // call Search()
		        console.log(suggestion.value);
		        sendKeyword();
		    },
		    triggerSelectOnValidInput : false,
		});
	    
	    // 엔터키 이벤트
		$("#autocomplete").keyup(function(event){
		    if(event.keyCode == 13){
		    	sendKeyword();
		    }
		});
	});
</script>

<body>
	<div class="container">
		<br>
		<br>
		<br>
		<br>
		<center>
			<input type="text" id="autocomplete" placeholder="음악 또는 공연 검색">
		</center>
		<br>
		<br>
		
		<c:set var="resultMusicCount" value="${fn:length(resultMusic)}"/>
		<c:set var="resultConcertCount" value="${fn:length(resultConcert)}"/>
		
		<c:if test="${resultMusicCount gt 0}">
		
			<!-- 음악 -->
			
			<h1 class="page-header">음악</h1>
			
			<table>
				<tr id="menu" align="center" valign="top" bordercolor="#333333"
					style="font-weight: bold;">
					<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
						height="30s">
						<div align="center">번호</div>
					</td>
					<td width="7%" height="26">
						<div align="center"></div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="23%">
						<div align="center">제목</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="13%">
						<div align="center">아티스트</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
						<div align="center">발매일</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="22%">
						<div align="center">장르</div>
					</td>
				</tr>
	
				<c:forEach var="b" items="${resultMusic}">
					<div>
						<tr id="over" align="center" valign="middle"
							bordercolor="#333333"
							onclick="location.href='./music_detail.box?num=${b.music_num}&page=${page}';"
							onmouseover="this.style.backgroundColor='F8F8F8'"
							onmouseout="this.style.backgroundColor=''">
	
							<td height="23" style="font-family: Tahoma; font-size: 10pt;">
	
								<!-- 번호 출력 부분 --> <c:out value="${b.music_num}" /> <c:set
									var="num" value="${num-1}" />
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div id="img" align="left">
									<img class="img-responsive img-center"
										src="
						<c:url value='/img/${b.albumcoverfilepath}'/>"
										alt="">
								</div>
							</td>
	
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">${b.music_title}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">${b.music_artist}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">
									<fmt:formatDate value="${b.music_publishdate}"
										pattern="yyyy-MM-dd" />
								</div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">${b.music_genre}</div>
							</td>
						</tr>
					</div>
				</c:forEach>
					
			</table>
			
		</c:if>
		
		<br>
		
		<c:if test="${resultConcertCount gt 0}">
			
			<!-- 공연 -->
			
			<h1 class="page-header">공연</h1>
					
			<table>
				<tr id="menu" align="center" valign="top" bordercolor="#333333"
					style="font-weight: bold;">
					<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
						height="30s">
						<div align="center">번호</div>
					</td>
					<td width="7%" height="26">
						<div align="center"></div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="23%">
						<div align="center">제목</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="13%">
						<div align="center">아티스트</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
						<div align="center">날짜</div>
					</td>
					<td style="font-family: Tahoma; font-size: 11pt;" width="22%">
						<div align="center">장소</div>
					</td>
				</tr>

				<c:forEach var="b" items="${resultConcert}">
					<div>
						<tr id="over" align="center" valign="middle"
							bordercolor="#333333"
							onclick="location.href='./concert_detail.box?concert_num=${b.concert_num}';"
							onmouseover="this.style.backgroundColor='F8F8F8'"
							onmouseout="this.style.backgroundColor=''">
	
							<td height="23" style="font-family: Tahoma; font-size: 10pt;">
	
								<!-- 번호 출력 부분 --> <c:out value="${b.concert_num}" /> <c:set
									var="num" value="${num-1}" />
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div id="img" align="left">
									<img class="img-responsive img-center"
										src="
						<c:url value='/img/${b.posterfilepath}'/>"
										alt="">
								</div>
							</td>
	
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">${b.concert_title}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">${b.concert_artist}</div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">
									<fmt:formatDate value="${b.concert_startdate}"
										pattern="yyyy-MM-dd" />
								</div>
							</td>
							<td style="font-family: Tahoma; font-size: 10pt;">
								<div align="center">${b.concert_place}</div>
							</td>
						</tr>
					</div>
				</c:forEach>
					
			</table>
			
		</c:if>

	
	</div>
	<!-- /.container -->
	
	<%@ include file= "/WEB-INF/views/front/footer.jsp" %> 
	
	<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
	
</body>
</html>