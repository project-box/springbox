<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset=UTF-8">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<title>b o x</title>

	<!-- base CSS -->
    <link href="css/base_layout.css" rel="stylesheet">

 	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
    
    <!-- font awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">

</head>
<body>
	<!-- Navigation -->
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
			<a class="navbar-brand" href="main.box">BOX</a>

			<ul class="nav navbar-nav">
				<li><a href="music_list.box">음악</a></li>
				<li><a href="concert_list.box">공연</a></li>
				<li><a href="Gogaekmain.box">고객센터</a></li>
				<li><a href="make_preference.box">선호도추가</a></li>
			</ul>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="search_content.box"> <i class="fa fa-search"
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
								<li><a href="member_join.member">회원가입</a></li>
								<li><a href="login.box">로그인</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<c:if test="${sessionScope.loginId != null}">
								<li><a href="logout.box">로그아웃</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<%-- <li>${loginId}</li> --%>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

</body>
</html>