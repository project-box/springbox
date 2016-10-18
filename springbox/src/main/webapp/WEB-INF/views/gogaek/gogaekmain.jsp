<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file= "/WEB-INF/views/front/header.jsp" %>

<title>b o x</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/main.css" rel="stylesheet">
<link href="css/gogaek.css" rel="stylesheet">
</head>
<body>


<!-- 로그인 되어 있다면 - 
	session의 member에 로그인 정보를 저장-->
	<c:if test="${users != null}">
		${users.name}님 환영합니다.
	</c:if>
	<!-- <div class="wrap_topbar">
		<ul class="sf-menu"> -->
		
		
			<c:if test="${member==null}">
				<ul>
				<li><a href="login.box">로그인</a></li>	
				<li><a href="/springbox/FaqList.box">도움말</a></li>
				<li><a href="SboardWrite.box">서비스 문의</a></li>
				<li><a href="SboardList.box">서비스 문의 리스트</a></li>	
				</ul>				
			</c:if>	
			
				<!-- <li><a href="login.box">로그인</a></li> 다른사람 -->
				<!-- <a href="/springbox/FaqList.box">도움말</a></li>	
				<a href="SboardWrite.box">서비스 문의</a></li>
				<a href="SboardList.box">서비스 문의 리스트</a></li> -->	
				
			 <!--    <div id="di" align ="center">				    		
				<button type="button" class="btn btn-primary"
				href="login.box">로그인</button>
                <button type="button" class="btn btn-primary"
                href="FaqList.box">도움말</button>
                <button type="button" class="btn btn-primary" 
                href="SboardWrite.box">서비스 문의</button>
                <button type="button" class="btn btn-primary" 
                href="SboardList.box">서비스 문의 리스트</button>		               	
				</div> -->
		
			
			<!-- 일반 사용자로 로그인 한 경우 -->
			<c:if test=
			"${users!=null and users.gubun==0}">		
					<li><a href="FaqList.box">도움말</a></li>		
				    <li><a href="SboardWrite.box">서비스 문의</a></li>
				    <li><a href="SboardList.box">서비스 문의 리스트</a></li>	
			</c:if>
			<!-- 관리자로 로그인 했을 때 -->
			<c:if test="${users!=null and users.gubun==1}">
				<li><a href="FaqList.box">도움말</a></li>
				<li><a href="FaqWrite.box">도움말 작성</a></li>
				<li><a href="SboardList.box">서비스 문의 리스트</a></li>	
			</c:if>
		</ul>
	</div>
		
<%@ include file= "/WEB-INF/views/front/footer.jsp" %> 


</body>
</html>