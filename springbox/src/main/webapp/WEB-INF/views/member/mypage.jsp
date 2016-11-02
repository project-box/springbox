<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file= "/WEB-INF/views/front/header.jsp" %>

<title>b o x</title>

<style>

   .table-striped {
    float:center;
	width: 500px;
    margin: 40px;    
       }
   
   .table-bordered {
    width: 700px;
    
   }
   
   .navbar-default{
   background: #999999;
   }
   
   
   
   .name {
    text-decoration: underline;
}

  </style>

</head>
<body>


<%-- 	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/projectbox/main.box">BOX</a>

			<ul class="nav navbar-nav">
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#portfolio"> <i class="fa fa-search"
						aria-hidden="true" style="font-size: 20px;"></i>
				</a></li>
				<li>
					<!-- <a>
                    	<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
                   	</a> -->
					<div class="dropdown boxcenter">
						<button class="btn btn-link dropdown-toggle" type="button"
							data-toggle="dropdown">
							<c:if test="${sessionScope.loginId == null}">
								<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
							</c:if>
							<c:if test="${sessionScope.loginId != null}">
								<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
								<a href="#"><c:out value="${sessionScope.loginName}"/></a>
							</c:if>
						</button>
						<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<c:if test="${sessionScope.loginId == null}">
								<li><a href="#">회원가입</a></li>
								<li><a href="login.box">로그인</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<c:if test="${sessionScope.loginId != null}">
								<li><a href="logoutAction.box">로그아웃</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<li>${loginId}</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>  --%>

	    
  <div class="container">  
  
   
    <table class="table table-bordered">
	<tr>
	<td>
	<h2 class="blind">&nbsp;&nbsp;&nbsp;My Page</h2>
	<%-- <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="name">${sessionScope.loginName}</strong>님의 멤버십 등급은 
	<font style="color:navy;"><b>VIP</b></font>입니다.</p> --%>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="name">${sessionScope.loginName}</strong>님의 마이페이지입니다 
	</p> 	
	</td>
	</tr>	
</table><br>
     
     <div>
     <nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">

      <li><a href="book_list.box?month=1"><font color="white"><b>예매정보확인</b></font></a></li>
      <li><a href="edit_preference.box"><font color="white"><b>선호도수정</b></font></a></li>
      <li><a href="/springbox/memberInfo_view.member"><font color="white"><b>회원정보수정</b></font></a></li>
      <li><a href="/springbox/Member_drop.member"><font color="white"><b>회원탈퇴</b></font></a></li>
    </ul>
  </div>
</nav> 
 
 <!-- <div class="tap content">
  <table class="table table-striped">
    <thead>
      <tr align="center">
        <th>예매정보확인</th>        
      </tr>
    </thead>
    <tbody>
      <tr align="center" valign="middle" height="200px">
        <td><br><br><br>예매하신 내역이 없습니다.</td>       
      </tr>      
    </tbody>
  </table>
  </div> -->
  
  
  
   <div style="font-size: 30px; text-align: center; margin-top:80px; margin-bottom:80px;">
   
   MY PAGE
   
   </div>
  
  
  
  
	</div>
	
	<!-- Footer -->
		<%@ include file= "/WEB-INF/views/front/footer.jsp" %>
	<!-- /.container -->


</body>
</html>
	
	