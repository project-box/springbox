<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<title>b o x</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/main.css" rel="stylesheet">
<link href="css/full-slider.css" rel="stylesheet">

</head>
<body>

	<div id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for Slides -->
		<div class="carousel-inner">
			<div class="item active">
				<!-- Set the first background image using inline CSS below. -->
				<!-- <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');"></div> -->
				<div class="fill" style="background-image: url('img/bobdylan.jpg');"></div>
				<div class="carousel-caption">
					<h2>밥딜런. 문학과 음악의 경계를 넘나들다.</h2>
				</div>
			</div>
			<div class="item">
				<!-- Set the second background image using inline CSS below. -->
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Two');"></div>
				<div class="carousel-caption">
					<h2>여기에 들어갈 멋진 사진 이미지 찾아요!</h2>
				</div>
			</div>
			<div class="item">
				<!-- Set the third background image using inline CSS below. -->
				<div class="fill"
					style="background-image: url('http://placehold.it/1900x1080&amp;text=Slide Three');"></div>
				<div class="carousel-caption">
					<h2>여기도요! 그나저나 모두들 잘 되고 있죠? ㅎㅎㅎ</h2>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>

	</div>




	<!-- 로그아웃 -->

	<!-- 로그인 되어 있다면 - 
	session의 member에 로그인 정보를 저장-->

	<c:if test="${users!=null and users.gubun==0}">
		<div class="normal user">


			<div class="container text-center">
				<h3>${users.name}님환영합니다.</h3>
				<p>
					<em>We love music!</em>
				</p>
				<p>We have created a fictional band website. Lorem ipsum..</p>
			</div>
			<br>

			<div class="row">
				<div class="col-xs-4">
					<p class="text-center">
						<strong>도움말</strong>
					
					<br> <a href="FaqList.box"> <img src="img/Faq.GIF"
						alt="Random Name" width="200" height="200">
					</a>
					</p>
				</div>

				<div class="col-xs-4">
					<p class="text-center">
						<strong>서비스 문의</strong>
					
					<br> <a href="SboardWrite.box"> <img
						src="img/Service question.GIF" alt="Random Name" width="200"
						height="200">
					</a>
					</p>
				</div>
				<div class="col-xs-4">
					<p class="text-center">
						<strong>서비스 문의 리스트</strong>
				
					<br> <a href="SboardList.box"> <img 
						src="img/ServiceList.GIF" alt="Random Name" width="200"
						height="200">
					</a>
						</p>
				</div>

			</div>
		</div>
	</c:if>
	<!-- <div class="wrap_topbar">
		<ul class="sf-menu"> -->


	<c:if test="${users==null}">
		<div class="Out user">
			<div class="container text-center">
				<h3>문의가 있는 경우 로그인을 하세요.</h3>
				<p>
					<em>We love music!</em>
				</p>
				<p>We have created a fictional band website. Lorem ipsum..</p>
			</div>
			<br>

			<div class="row">
				<div class="col-xs-3">
					<p class="text-center">
						<strong>로그인</strong>
				
					<br> <a href="login.box"> <img src="img/Login.JPG"
						alt="Random Name" width="200" height="200">
					</a>
						</p>
				</div>

				<div class="col-xs-3">
					<p class="text-center">
						<strong>도움말</strong>
				
					<br> <a href="FaqList.box"> <img src="img/FaqWrite.GIF"
						alt="Random Name" width="200" height="200">
					</a>
						</p>
				</div>
				<div class="col-xs-3">
					<p class="text-center">
						<strong>서비스 문의 </strong>
				
					<br> <a href="SboardWrite.box"> <img
						src="img/Service question.GIF" alt="Random Name" width="200"
						height="200">
					</a>
						</p>
				</div>

				<div class="col-xs-3">
					<p class="text-center">
						<strong>서비스 문의 리스트</strong>
				
					<br> <a href="SboardList.box"> <img
						src="img/ServiceList.GIF" alt="Random Name" width="200"
						height="200">
					</a>
						</p>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${users!=null and users.gubun==1}">
		<div class="manager">
			<div class="container text-center">
				<h3>관리자 ${users.name}님 환영합니다.</h3>
				<p>
					<em>We love music!</em>
				</p>
				<p>We have created a fictional band website. Lorem ipsum..</p>
			</div>
			<br>

			<div class="row">

				<div class="col-xs-4">
					<p class="text-center">
						<strong>도움말</strong>
					
					<br> <a href="FaqList.box"> <img src="img/Faq.GIF"
						alt="Random Name" width="200" height="200">
					</a>
					</p>
				</div>
				<div class="col-xs-4">
					<p class="text-center">
						<strong>도움말 작성 </strong>
					
					<br> <a href="FaqWrite.box"> <img src="img/FaqWrite.GIF"
						alt="Random Name" width="200" height="200">
					</a>
					</p>
				</div>


				<div class="col-xs-4">
					<p class="text-center">
						<strong>서비스 문의 리스트</strong>
					
					<br> <a href="SboardList.box"> <img
						src="img/ServiceList.GIF" alt="Random Name" width="200"
						height="200">
					</a>
					</p>
				</div>
			</div>
		</div>
	</c:if>


	<%-- 	<!-- 일반 사용자로 로그인 한 경우 -->
			<c:if test=
			"${users!=null and users.gubun==0}">	
			        <ul>
			     	<li><a href="FaqList.box">도움말</a></li>		
				    <li><a href="SboardWrite.box">서비스 문의</a></li>
				    <li><a href="SboardList.box">서비스 문의 리스트</a></li>
				    </ul>		
			</c:if>
			<!-- 관리자로 로그인 했을 때 -->
			<c:if test="${users!=null and users.gubun==1}">
			    <ul>
				<li><a href="FaqList.box">도움말</a></li>
				<li><a href="FaqWrite.box">도움말 작성</a></li>
				<li><a href="SboardList.box">서비스 문의 리스트</a></li>	
				</ul>
			</c:if> --%>



	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>


</body>
</html>