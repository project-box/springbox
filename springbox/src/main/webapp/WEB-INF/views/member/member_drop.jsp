<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/front/header.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원탈퇴</title>

<c:if test="${result != null}">
	<script>
		window.onload = function () {
			document.getElementById("drop_span").innerHTML = "탈퇴에 실패하셨습니다.";
		};
	</script>
</c:if>
<c:if test = "${result == null}">
	<script>
		window.onload = function () {
			document.getElementById("drop_span").innerHTML = "";
		};
	</script>
</c:if>
</head>

<body>
<form action="Drop_process.member" method="post">
	<p>회원탈퇴</p><span id="drop_span"></span>
	<br>
		<label>비밀번호</label>
			<input type="password" name="password" />
			
	<br>
	<br>
	
	<input type="submit" value="회원탈퇴" />
	<input type="button" value="메인으로" onclick="script:location.href = './index.jsp'" />
	
</form>

	
<%@ include file="/WEB-INF/views/front/footer.jsp"%>
</body>

</html>