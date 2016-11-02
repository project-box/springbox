<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/front/header.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원정보수정하기</title>
<style type="text/css">
#join_form {
	align-content: center;
}

div {
	color: blue;
}

div.image_window {
	margin-top: 120px;
	margin-left: 10px;
}

label {
	color: darkgreen;
}

p {
	color: green;
	margin-left: 2px;
}

input.file {
	margin-left: 30px;
}

input.m_join {
	margin-left: 180px;
	background-color: GreenYellow;
}

input.g_main {
	background-color: Cornsilk;
}
</style>

<script src="js/jquery.js"></script>
<script>
$(function() {
    $("#imageI").on('change', function(){
        readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
    var filename = input.files[0].name;
    var ext = filename.substr(filename.length-3, filename.length);
    var isCheck=false;
    if((ext.toLowerCase() == "jpg" || ext.toLowerCase() == "gif")){
    	isCheck=true;
    }
    if(isCheck == false){
    	alert("jpg나 gif만 업로드가 가능합니다.");
    	return;
    }
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#image').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}
//유효성 검사를 위한 함수
function check() {
	var name = updateform.name.value;
	var password = updateform.password.value;
	var password2 = updateform.passwoed2.value;
	var phone = updateform.phone.value;

	//이름 관련
	if ((name == "") || (name.length <= 1)) {
		document.getElementById("nameSpan").innerHTML = "이름을 제대로 입력해 주세요!";
		updateform.name.focus();
		return false;
	}
	else{
		document.getElementById("nameSpan").innerHTML = "";
	}
	
	
	//이름을 한글 2자 이상 입력받기
	//정규식(javascript, java, c#, php에 모두 활용) 객체 생성
	var regExp = /([a-z, A-Z, 가-힣]){2,}/g;
	if(!regExp.test(name)){
		document.getElementById("nameSpan").innerHTML = "이름은 문자 2자 이상입니다!";
		updateform.name.focus();
		return false;
	}
	else{
		document.getElementById("nameSpan").innerHTML = "";
	}

	//비밀번호 관련
	if (password.length < 7 && password.length > 12 ) {
		document.getElementById("passwordSpan").innerHTML = "비밀번호는 7자 이상 12자 이하로 입력하세요!";
		updateform.password.focus();
		return false;
	}
	else{
		document.getElementById("passwordSpan").innerHTML = "";
		updateform.password.focus();
	}
		
	//비밀번호는 영문 대소문자 및 숫자 1개 이상 입력받기
	var s_cnt = 0;
	var d_cnt = 0;
	var n_cnt = 0;		
	for(var i=0; i<password.length; i++){
		var ch = password.charAt(i);
		if(ch>='a' && ch<='z')
			s_cnt++;
		else if(ch>='A' && ch<='Z')
			d_cnt++;
		else if(ch>='0' && ch<='9')
			n_cnt++;
	}		
	
	if(s_cnt<1 || d_cnt<1 || n_cnt<1){
		updateform.password.value = "";
		document.getElementById("passwordSpan").innerHTML = "비밀번호는 영문대소문자와 숫자가 1개 이상 포함되어야 합니다!";
		updateform.password.focus();			
		return false;
	}
	else{
		document.getElementById("passwordSpan").innerHTML = "";
	}
	
			
		if (password2.length == 0) {
		document.getElementById("password2Span").innerHTML = "비밀번호를 입력하세요!";
		updateform.password2.focus();
		return false;
	}
	else if (password != password2) {
		updateform.password.value = "";
		updateform.password2.value = "";
		document.getElementById("passwordSpan").innerHTML = "비밀번호가 일치하지 않습니다!";			
		updateform.password.focus();
		return false;
	}
	else{
		document.getElementById("password2Span").innerHTML = "";
		updateform.password.focus();
	}
	
	//Mobile 관련
	if (phone.length != 11) {
		document.getElementById("phoneSpan").innerHTML = "휴대폰 번호를 입력하세요!(휴대폰 번호는 11자리입니다.)";
		updateform.phone.focus();
		return false;
	}
		else{
		document.getElementById("phoneSpan").innerHTML = "";
	}
return true;
	
}	function onlyNum(e) {
		var event = e || window.event;

		var keycode = event.keyCode || e.which;
		if (keycode == 8 || (keycode >= 35 && keycode <= 40)
				|| (keycode >= 46 && keycode <= 57)
				|| (keycode >= 96 && keycode <= 105)) {
			return true;
		} else {
			return false;
		}
	}
	
</script>

</head>
<body>
	<form name="updateform" action="/springbox/update_process.member"
		enctype="multipart/form-data" method="post" onsubmit="return check()">

		<!-- 중복 검사 여부를 저장할 변수 -->
		<input type="hidden" name="emailCheck" value='${member.email}' />
		<input type="hidden" name="oldimage" value='${member.image }' />

		<table class="table">
			<tr>
				<td align="center" width="30%">
					<div>
						<img id="image" class="image_window" width="250" height="300"
							src=./sboardupload/${member.image}><br /> <input class="file" type="file"
							id="imageI" name="image" width="250px" />
					</div>
				</td>
				<td>
					<div class="form-group">
						<label for="id" class="control-label">아이디:</label>
						${member.user_id}
					</div>
					<div class="form-group">
						<label for="pw" class="control-label">비밀번호:</label> 
						<input type="password" name="password" size="20" class="form-control" />
						<span id="passwordSpan"></span>
					</div>
					<p>(대문자,소문자와 숫자를 조합하여 7~12자리로 만들어 주세요)</p>
					<div class="form-group">
						<label for="pw2" class="control-label">비밀번호 확인:</label> 
						<input type="password" name="password2" size="15" class="form-control" />
						<span id="password2Span"></span>
					</div>
					<div class="form-group">
						<label for="name" class="control-label">이름:</label>
						<input
							type="text" name="name" size="20" value='${member.name}'
							class="form-control" /> <span id="nameSpan"></span>
					</div>
					<div class="form-group">
						<label for="email" class="control-label">이메일:</label> 
						<input
							type="text" name="email" id="email" size="20" maxlength=30
							value='${member.email}' class="form-control" /> <span
							id="emailSpan"></span>
						<p>(이메일 형식은 "***@****.***" 입니다)</p>
					</div>
					<div class="form-group">
						<label for="phone" class="control-label">전화번호</label> <input
							type="text" name="phone" size="11" maxlength="11"
							style="ime-mode: disabled;" onfocus="this.value='';"
							onkeydown="return onlyNum(event)" class="form-control"
							value='${member.phone}' /> <span id="phoneSpan"></span>
						<p>('-' 없이 숫자만 입력하세요)</p>
					</div>
					<div class="form-group">
						<label for="age" class="control-label">나이:</label> <input
							type="text" name="age" size="10" value="${member.age}"
							class="form-control" />
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><br> <input
					class="m_join m_join-info btn-lg" type="submit" value="수정완료" /> <input
					class="g_main g_main-info btn-lg" type="button" value="메인으로"
					onclick="javascript:window.location='./index.jsp'"></td>
			</tr>
		</table>
	</form>

	<%@ include file="/WEB-INF/views/front/footer.jsp"%>
</body>
</html>