<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/front/header.jsp"%>
<title>도움말 쓰기</title>
 <script >
	function addFaq() {
		faqform.submit();
	}
</script>

<style>

#join_menu{margin:30px 0 0 220px;}
</style>
</head>
<body>
	<!-- <div align="center">
	<form action="./FaqAddAction.box" method="post" name="faqform">
		<table >
			<tr align="center" valign="middle">
				<td colspan="5" style="font-family: 돋음; font-size: 30" height="16">
				도움말</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제 목</div>
				</td>
				
				<td><input name="faq_subject" type="text" size="50"
					maxlength="100" value="" /></td>
			</tr>

			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">내 용</div>
				</td>
				<td><textarea name="faq_content" cols="67" rows="15"></textarea>
				</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5"><a href="javascript:addFaq()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>
				</td>
			</tr>
		</table>
	</form>
	</div> -->

	<div class="container">
		<h3 class="text-center">도움말 작성 하기</h3>
		<p class="text-center">
			<em> 도움말 작성 Click 하기 전에 한번 더 점검하기!</em>
		</p>
		<div class="row test">
		 <form action="./FaqAddAction.box" method="post" name="faqform"> 
		
			<div class="col-md-12">
				<div class="row">
					<div class="col-sm-12 form-group">
						<input class="form-control" id="name" name="faq_subject"
						    height="20"
							placeholder="도움말 제목" type="text" required>
					</div>
				
				</div>
				<br><br>
				<textarea class="form-control" id="comments" name="faq_content"
					placeholder="도움말 내용 " rows="20"></textarea>
				<!-- <div class="row">
					<div class="col-md-12 form-group">
						<button class="btn pull-right" type="submit">
						<a href="javascript:addFaq()">등록</a></button>
					</div>	
				</div>	
				<div class="row">
					<div class="col-md-12 form-group">	
						<button class="btn pull-right" type="button">
						<a href="javascript:history.go(-1)">뒤로</a></button>
					</div>
				</div> -->
				<br>
				<tr>
				    <div class="row">
						<div class="col-md-12 form-group" align="Center">&nbsp;
							<input class="btn btn-primary" type="button" value="도움말 리스트"
								onclick="location.href='FaqList.box'" /> &nbsp;&nbsp;&nbsp; 
							<input class="btn btn-primary" type="submit" value="도움말 작성"
							href="javascript:addFaq()"/>
							
								<!-- onclick="location.href='Gogaekmain.box'" /> -->
						</div>
					</div>
					
				</tr>	
				
			</div>
			</form>
		</div>
	</div>

</body>
</html>
				