<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file= "/WEB-INF/views/front/header.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입</title>

<style type="text/css">
   #join_form { width : 900px; 	align-content: center; }  
   div { color:blue; float:left;}
   div.image_window { margin-top: 20px; margin-left: 10px; }
   label {color:darkgreen; } 
   p {color: green; }  
   input.m_join { margin-left:180px; background-color:GreenYellow; }
   input.g_main { background-color:Cornsilk;}
</style>


<!-- jQuery 사용을 위한 라이브러리 설정 -->
<script src="js/jquery.js"></script>
<script>
$(function(){
	//imgInp를 눌러서 파일을 변경하면 함수 호출
	$("#imageI").on('change', function(){
		readURL(this);
	});
});

function readURL(input){
	//input에 선택된 파일이 있다면
	if(input.files && input.files[0]){
		//파일 이름 가져오기
		var filename = input.files[0].name;
		//파일 이름에서 확장자 가져오기
		var ext = 
			filename.substr(
			filename.length-3,filename.length);
		var isCheck = false;
		if((ext.toLowerCase() == 'jpg' ||
			 ext.toLowerCase() == "gif")){
			isCheck=true;
		}
		if(isCheck == false){
			alert("jpg나 gif를 선택하세요");
			return;
		}
		//파일의 내용을 읽을 수 있는 객체 생성
		var reader = new FileReader();
		//input.files[0] 파일을 읽기
		reader.readAsDataURL(input.files[0]);
		//파일을 전부 읽었으면
		reader.onload = function(e){
			$("#image").attr('src', 
					e.target.result);
		}
	}
}
	//mobile에 숫자와 방향키만 사용할 수 있도록 //해주는 함수
 	function onlyNum(e){
		//이벤트 발생 객체 가져오기
		var event = e || window.event;
		//누른 키보드 값 가져오기
		var keycode = event.keyCode || e.which;
		if(keycode == 8 || 
			keycode >= 35 && keycode <= 40 ||
			keycode >= 46 && keycode <= 57 || 
			keycode >= 96 && keycode <= 105){
			return true;
		}
		else{
			return false;
		}
	}
	
 	function confirmId(){  
		//ajax 요청
		//ajax: 페이지 이동이 아니고 페이지의 내용을 가져오는 것
		$.post("id_Check.member", 
				{user_id:joinform.user_id.value},
				function(req){
					var sp = 
						document.getElementById("idSpan");
					//중복되지 않는 경우
					if(req.result == true){
						sp.innerHTML = "사용 가능한 아이디";
						joinform.idCheck.value="true";
					}
					//있는 경우
					else{
						sp.innerHTML = "사용 불가능한 아이디";
						joinform.idCheck.value="false";
					}
		})
	} 
	
	function confirmEamil(){  
		//ajax 요청
		//ajax: 페이지 이동이 아니고 페이지의 내용을 가져오는 것
		$.post("email_Check.member", 
				{email:joinform.email.value},
				function(req){
					var sp = 
						document.getElementById("emailSpan");
					//중복되지 않는 경우
					if(req.result == true){
						sp.innerHTML = "사용 가능한 이메일";
						joinform.emailCheck.value="true";
					}
					//있는 경우
					else{
						sp.innerHTML = "사용 불가능한 이메일";
						joinform.emailCheck.value="false";
					}
		})
	} 
	
	//유효성 검사를 위한 함수
	function check(){
		//이메일 관련 유효성 검사
		var email = joinform.email.value;
		var emailSp = 
			document.getElementById("emailSpan");
		//이메일에 값이 없으면 span에 메시지 출력하고
		//전송되지 않도록 설정
		if(email.length == 0){
			emailSp.innerHTML = 
				"이메일은 필수 입력입니다.";
			return false;
		}
		//정규식을 생성 - 이메일 패턴
		//\w는 단어
		var regemail = 
			/\w+@\w+\.\w+/;
		if(!regemail.test(email)){
			emailSp.innerHTML = 
				"이메일 형식이 아닙니다.";
			return false;
		}
		
		//이름은 영문자 또는 한글 2자 이상
		var regname = /([a-z,A-Z,가-힣]){2,}/g;
		var irum = joinform.name.value;
		var nameSp = 
			document.getElementById("nameSpan");
		if(!regname.test(irum)){
			nameSp.innerHTML = 
				"이름은 영문자와 한글로 2자 이상";
			return false;
		}
		
		var user_id = joinform.idcheck.value;	
		if(user_id == "false"){
			alert("id 중복 체크를 해야 합니다.");
			return false;
		}
		
		var email = joinform.emailcheck.value;	
		if(email == "false"){
			alert("email 중복 체크를 해야 합니다.");
			return false;
		}
		return true;
	}
</script>

</head>

<body>
<form name="joinform" action="/springbox/join_process.member" enctype="multipart/form-data" method="post" onsubmit="return check()">
	
	<!-- 아이디 중복 검사 여부를 저장할 변수 -->
	<input type="hidden" name="idCheck" value="false" />
	<input type="hidden" name="emailCheck" value="false" />
<table>
<tr>
	<td>
		<div class="image_window" width=25% style="float:left">
		<img id="image" width="200" height="300" /><br />
		<input type="file" id="imageI" name="image" />
		</div>
	</td>
	<td>
<div id="join_form" width=60% style="float:right">
	
  	<label for="id">&nbsp;아&nbsp;이&nbsp;디&nbsp;&nbsp;</label>
  	<input type="text" name="user_id" size="20"/>
  	<span id="idSpan"></span>
  	<br>
  	<label for="pw">비밀번호&nbsp;</label>
  	<input type="password" name="password" size="15" />
  	<br>
  	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (비밀번호는 대문자,소문자와 숫자를 조합하여 7~12자리로 만들어 주세요)</p>
  	<label for="pw2">비밀번호 확인</label>
  	<input type="password" name="password2" size="15" />
  	<br>
  	<label for="name">&nbsp;&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;</label>
  	<input type="text" name="name" size="20" onblur="confirmId()"/>
  	<span id="nameSpan"></span>
  	<br>
  	<label>&nbsp;이&nbsp;메&nbsp;일&nbsp;&nbsp;</label>
  	<input type="text" name="email" id="email" size="20" maxlength=30 onblur="confirmEamil()" />
  	<span id="emailSpan"></span>
  	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (이메일 형식은 "***@****.***" 입니다)</p> 
  	<br>
  	<label>&nbsp;&nbsp;&nbsp;성&nbsp;&nbsp;별&nbsp;&nbsp;&nbsp;&nbsp;</label>
  	<input type="radio" name="gender" vlaue="남자" id="gender_man"/> <label>남자</label>
	<input type="radio" name="gender" vlaue="여자" id="gender_woman"/> <label>여자</label>
  	<br>
  	
  	<label>전화번호&nbsp;</label>
  	<input type="text" name="phone" size="11" maxlength="11" style="ime-mode: disabled;"
		   onfocus="this.value='';" onkeydown="return onlyNum(event)" />
	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (전화번호는 -없이 숫자만 입력하세요)</p>
  	<br>
  	<label>&nbsp;&nbsp;&nbsp;나&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;&nbsp;</label>
  	<input type="text" name="age" size="10" />
  	
  
  	
</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<br>			
			<input class="m_join" type="submit" value="회원가입" />
			<input class="g_main" type="button" value="메인으로" onclick="javascript:window.location='./index.jsp'">
		</td>
	</tr>
</table>
</form>

<%@ include file= "/WEB-INF/views/front/footer.jsp" %>

</body>
</html>