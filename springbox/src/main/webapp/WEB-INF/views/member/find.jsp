<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>

<style type="text/css">

#emailSpan {
	color: red;
}

label {
	color: darkgreen;
}

p {
	color: green;
	margin-left: 2px;
}

input.email {
	margin-left: 20px;
	background-color: GreenYellow;
}

input.button {
	background-color: Cornsilk;
}

</style>
<c:if test="${result != null }">
	<script>
		window.onload = function() {
			document.getElementById("emailSpan").innerHTML = "없는 이메일니다.";
		}
	</script>
</c:if>

</head>
<body>
<div align="center">
		<form action="./FindPassword.member" method="get">
			<span id="emailSpan"></span><br /> 
			
			<p>비밀번호를 다시 설정하려면 등록된 이메일을 입력하세요.</p>
			
			
			<label >이메일</label> 
			<input type="text" name="email" size="50" required="required" /><br /><br />
			<input type="submit" value="이메일 전송" class="email email-info btn-lg" /> 
			<input type="button" value="메인으로" class="button button-info btn-lg" onclick="javascript:location.href='./index.jsp'" />
		</form>
	</div>
</body>
</html>