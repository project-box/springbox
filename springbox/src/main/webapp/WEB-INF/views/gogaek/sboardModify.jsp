<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/front/header.jsp"%>
<title>서비스 게시판 수정</title>
<script>
	function modifysboard() {
		//modifyform의 내용을 전송
		modifysform.submit();
	}
</script>
</head>
<body>
	<%-- <!-- 파일 업로드가 있는 폼의 기본 형식은 
	method는 post 이어야 하고 
	enctype이 multipart/form-data 이어야 합니다. -->
	<form action="SboardModifyAction.box" method="post" name="modifysform"
		enctype="multipart/form-data">

		<!-- 직접 입력받지 않고 다음 페이지로 데이터를
	전송하고자 할 때는 input type이 hidden 인 객체를
	만들어서 넘겨줍니다.
	폼의 전송이나 링크를 타고 이동하는 것은 forwarding이
	아니기 때문에 request를 이용해서 데이터를
	넘겨줄 수 없습니다. -->
		<!-- 글번호, 접속한 유저의 이메일, 파일이름을
	저장 -->
		<input type="hidden" name="s_num" value="${sboarddata.s_num }" /> <input
			type="hidden" name="user_id" value="${sboarddata.user_id }" /> <input
			type="hidden" name="s_oldfile" value="${sboarddata.s_file }" />

		<table align="center" border="1">
			<tr>
				<td colspan="2" align="center">
					<h2>게시글 수정</h2>
				</td>
			</tr>
			<tr>
				<td align="right">제목</td>
				<td><input type="text" name="s_subject"
					value="${sboarddata.s_subject}" size="50" /></td>
			</tr>
			<tr>
				<td align="right">내용</td>
				<td><textarea cols="60" rows="15" name="s_content">${sboarddata.s_content}</textarea>
				</td>
			</tr>
			<tr>
				<td align="right">첨부파일</td>
				<td>기존파일:${sboarddata.s_file} <br /> <input type="file"
					name="s_file" /> <br /> 파일을 수정하려면 다시 선택하세요
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a
					href="javascript:modifysboard()">수정</a> &nbsp;&nbsp; <a
					href="javascript:history.go(-1)">뒤로</a></td>
			</tr>

		</table>
	</form> --%>

	<div class="container">
		<h3 class="text-center">서비스 문의 수정하기</h3>
		<!-- <p class="text-center">
			<em>문제점을 지적해주세요!</em>
		</p> -->
		<div class="row test">

			<form action="SboardModifyAction.box" method="post"
				name="modifysform" enctype="multipart/form-data">

				<input type="hidden" name="s_num" value="${sboarddata.s_num }" /> <input
					type="hidden" name="user_id" value="${sboarddata.user_id }" /> <input
					type="hidden" name="s_oldfile" value="${sboarddata.s_file }" />

				<div class="col-md-12">

					<tr>
						<td style="font-family: 돋음; font-size: 20" height="20">
							<div align="Left">ID: &nbsp; ${users.user_id}</div>
						</td>
						</br>
						<td>제목을 수정하세요
						</td>

					</tr>


                    
                    
					<div class="row">
						<div class="col-sm-12 form-group">
						
							<input class="form-control" id="name" name="s_subject"
								height="20" value="${sboarddata.s_subject}" size="50"
								type="text" required>
						</div>


						<%-- 	<td><input type="text" name="s_subject" value="${sboarddata.s_subject}" size="50" />
			</td> --%>

					</div>



					<br> <br>
					
					<td>내용을 수정하세요
						</td>
					<textarea class="form-control" id="comments" name="s_content"
						rows="20" >${sboarddata.s_content}
					</textarea>

				<%-- 	<tr>
						<td align="right">첨부파일</td>
						<td>기존파일:${sboarddata.s_file}<br /> <input name="s_file"
							type="file" /></td>
					</tr>
					<br /> 파일을 수정하려면 다시 선택하세요 --%>
					<!-- 	<tr bgcolor="cccccc">
						<td colspan="2" style="height: 1px;"></td>
					</tr>
 -->
					<%-- <tr>
						<td align="right">첨부파일</td>
						<td>기존파일:${sboarddata.s_file} <br /> <input type="file"
							name="s_file" /> <br /> 파일을 수정하려면 다시 선택하세요
						</td>
					</tr>
 --%>


					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>

					<div class="row">
						<div class="col-md-12 form-group" align="Right">
							<input class="btn btn-primary" type="button" value="수정"
								onclick="modifysboard()"> &nbsp;&nbsp;&nbsp; <input
								class="btn btn-primary" type="button" onclick="history.go(-1)"
								value="뒤로">
						</div>
					</div>

					<!-- 		<tr>
						<td colspan="2" align="center"><a
							href="javascript:modifysboard()">수정</a> &nbsp;&nbsp; <a
							href="javascript:history.go(-1)">뒤로</a></td>
					</tr>
				 -->
			</form>
		</div>
	</div>



</body>
</html>















