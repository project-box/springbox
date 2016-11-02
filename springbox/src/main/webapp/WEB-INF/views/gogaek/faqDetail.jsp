<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/front/header.jsp"%>

<style>

.title {
    background-color: #D2E1FF; 
	color: white;
	font-weight: bold;
	height: 30px;
}
.btn {
color: black;
}

</style>

<title>도움말 상세보기</title>
</head>
<%-- <body>

	 <div align="center">
		<table width="500" border="1">
			<tr class="title">
				<td colspan="2" align="center">
					<h2>상세보기</h2>
				</td>
			</tr>

			<tr height="30">
				<td width="20%" align="center">제목</td>
				<td width="80%" align="center">${result.faq_subject }</td>
			</tr>

			<tr height="30">
				<td align="center">내용</td>
				<td align="center">${result.faq_content }</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<button class="btn"><a href="FaqList.box">목록보기</a></button>
				<button class="btn"><a href="gogaekmain.jsp">초기화면</a></button></td>
			</tr>
            

		</table>
	</div> --%>




	<div class="container">
		<h2>상세보기</h2>
		<p>Contextual classes can be used to color table rows or table
			cells. The classes that can be used are: .active, .success, .info,
			.warning, and .danger.</p>
		<table class="table">
			<thead>
				<tr>
					<th>제목</th>
					<th>내용</th>
					
				</tr>
			</thead>
			<tbody>
				
					
					<td>${result.faq_subject }</td>
					<td>${result.faq_content }</td>
					
				</tr>
		
			    <tr>
			        <div class="row">
						<div class="col-md-12 form-group" align="Right">
							<input class="btn btn-primary" type="button" value="목록보기" 
							onclick="location.href='FaqList.box'"/> &nbsp;&nbsp;&nbsp;
							<input class="btn btn-primary" type="button"
							 value="초기화면"  onclick="location.href='Gogaekmain.box'"/>
							
						</div>
					</div>
				</tr>
			</tbody>
						
			
		</table>
	</div>





</body>
</html>




