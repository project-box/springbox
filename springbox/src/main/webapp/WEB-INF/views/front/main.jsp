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

<style type="text/css">
.bgimg-1, .bgimg-2, .bgimg-3 {
	position: relative;
	opacity: 0.65;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.bgimg-1 {
	opacity: 1;
	background-image: url("img/bobdylan.jpg");
	min-height: 100%;
}

.bgimg-2 {
	opacity: 1;
	background-image: url("img/apple_music.jpg");
	/* min-height: 400px; */
	min-height: 350px;
}

.bgimg-3 {
	background-image: url("img_parallax3.jpg");
	min-height: 400px;
}

.caption {
	position: absolute;
	left: 0;
	top: 70%;
	width: 100%;
	text-align: center;
	color: #000;
}

.caption span.border {
	background-color: transparent;
	color: #f7f7f7;
	padding: 18px;
	font-size: 36px;
	letter-spacing: 10px;
	opacity: 0.65;
}
</style>

</head>
<body>

	<div class="bgimg-1">
		<div class="caption">
			<span class="border"> 밥딜런. 문학과 음악의 경계를 넘나들다. </span>
		</div>
	</div>

	<!-- <div id="myCarousel" class="carousel slide">
	        Indicators
	        <ol class="carousel-indicators">
	            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	            <li data-target="#myCarousel" data-slide-to="1"></li>
	            <li data-target="#myCarousel" data-slide-to="2"></li>
	        </ol>
	
	        Wrapper for Slides
	        <div class="carousel-inner">
	            <div class="item active">
	                Set the first background image using inline CSS below.
	                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');"></div>
	                <div class="fill" style="background-image:url('img/bobdylan.jpg');"></div>
	                <div class="carousel-caption">
	                    <h2>밥딜런. 문학과 음악의 경계를 넘나들다.</h2>
	                </div>
	            </div>
	            <div class="item">
	                Set the second background image using inline CSS below.
	                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Two');"></div>
	                <div class="carousel-caption">
	                    <h2>여기에 들어갈 멋진 사진 이미지 찾아요!</h2>
	                </div>
	            </div>
	            <div class="item">
	                Set the third background image using inline CSS below.
	                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Three');"></div>
	                <div class="carousel-caption">
	                    <h2>여기도요! 그나저나 모두들 잘 되고 있죠? ㅎㅎㅎ</h2>
	                </div>
	            </div>
	        </div>
	
	        Controls
	        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	            <span class="icon-prev"></span>
	        </a>
	        <a class="right carousel-control" href="#myCarousel" data-slide="next">
	            <span class="icon-next"></span>
	        </a>
	
	    </div> -->


	<div class="container">

		<!-- 선호도 -->
		<div>
			<%-- <c:if test="${sessionScope.loginId != null}">
				<!--  -->
			</c:if>
			
			<c:set var="count" value="${fn:length(preferencelist)}"/>
			
			<c:choose>
				<c:when test="${sessionScope.loginId == null}">
			        <!--  -->
			    </c:when>
				<c:when test="${count le 0}">
			        <a href="PreferenceListAction.box">(임시메시지)엇! 아직 선호도가 조사되지 않았습니다.</a>
			    </c:when>
			    <c:when test="${count le 5}">
			        <a href="PreferenceListAction.box">(임시메시지)엇! 아직 선호도가 조사가 부족합니다.</a>
			    </c:when>
			</c:choose> --%>

		</div>

		<!-- 최신곡 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					최신곡 <small> <a href="music_list.box"
						aria-label="Skip to main navigation" title="최신곡 전체 목록"> <i
							class="fa fa-bars" aria-hidden="true"></i>
					</a>
					</small>
				</h1>
			</div>

			<c:forEach var="b" items="${musiclist}">
				<div class="col-md-3 portfolio-item">
					<a href="music_detail.box?num=${b.music_num}&page=${page}"> <img
						class="img-responsive img-center"
						src="
	                    <c:url value='/img/${b.albumcoverfilepath}'/>"
						alt="">
					</a>
					<div class="well well-sm">
						<c:out value="${b.music_title}" />
						<br>
					</div>
				</div>
			</c:forEach>
		</div>

		<br>

		<c:set var="count" value="${fn:length(preferencelist)}" />

		<%-- <c:choose>
				<c:when test="${sessionScope.loginId == null}">
			        
			        <hr class="divider">
			        <div>
			        	<div style=" float: left; ">
			        		<img src="icon/music.png" class="con-img" alt="">
						</div>
						<div class="abc">
							<code>
					        box의 추천 컨텐츠 서비스는 로그인 후 사용 가능합니다.</code>
						</div>
		        	</div>
			        
					<div style="clear:left;">
						<a href="login.box">로그인</a><br>
			        	<a href="memberJoin.box">회원가입 하시겠습니까?</a><br>
		        	</div>
		        	<hr class="divider">
			        
			    </c:when>
			    <c:when test="${count le 5}">
			        
			        <hr class="divider">
					<div>
			        	<div style=" float: left; ">
			        		<img src="icon/music.png" class="con-img" alt="">
						</div>
						<div class="abc">
							<code>
					        엇! 아직 선호도 조사가 부족합니다.
							5개 이상의 음악을 선택하시면
							그에 따른 컨텐츠를 추천해 드립니다.</code>
						</div>
		        	</div>
		        	<div style="clear:left;">
		        		<a href="PreferenceListAction.box">선호도 조사를 하시겠습니까? >></a>
		        	</div>
		        	<hr class="divider">
			        	
			    </c:when>
			    <c:otherwise>
		           <!-- 추천곡 -->
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								추천곡 <small> <a href="recommendMusicList.box" aria-label="Skip to main navigation" title="추천곡 전체 목록">
								<i class="fa fa-bars" aria-hidden="true"></i>
								</a>
								</small>
							</h1>
						</div>
						
						<c:forEach var="b" items="${recommendedmusiclist}">
							<div class="col-md-3 portfolio-item">
								<a href="./NewmusicDetailAction.box?num=${b.id}"> <img class="img-responsive img-center"
									src="<c:url value='/img/${b.albumcoverfilepath}'/>" alt="">
								</a>
								<div class="well well-sm">
									<c:out value="${b.title}" />
									<br>
								</div>
							</div>
						</c:forEach>
						
					</div>
			
					<!-- 추천공연 -->
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								추천공연 <small> <a href="ConcertList.box" aria-label="Skip to main navigation" title="추천공연 전체 목록"> 
								<i class="fa fa-bars" aria-hidden="true"></i>
								</a>
								</small>
							</h1>
						</div>
						
						<c:forEach var="b" items="${recommendedconcertlist}">
							<div class="col-md-3 portfolio-item">
								<a href="/projectbox/ConcertDetail.box?id=${b.id}&page=1"> <!-- <img class="img-responsive" src="http://placehold.it/750x450" alt="" > -->
									<img class="img-responsive img-center"
									src="<c:url value='/img/${b.posterfilepath}'/>" alt="">
								</a>
								<div class="well well-sm">
									<c:out value="${b.title}" />
									<br>
								</div>
							</div>
						</c:forEach>
						
					</div>
		       </c:otherwise>
			</c:choose> --%>
<<<<<<< HEAD
        
        <!-- 추천곡 -->
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								추천곡 <small> <a href="./recommend_music_list.box" aria-label="Skip to main navigation" title="추천곡 전체 목록">
								<i class="fa fa-bars" aria-hidden="true"></i>
								</a>
								</small>
							</h1>
						</div>
						
						<c:forEach var="b" items="${musiclist}">
							<div class="col-md-3 portfolio-item">
								<a href="./NewmusicDetailAction.box?num=${b.music_num}"> <img class="img-responsive img-center"
									src="<c:url value='/img/${b.albumcoverfilepath}'/>" alt="">
								</a>
								<div class="well well-sm">
									<c:out value="${b.music_title}" />
									<br>
								</div>
							</div>
						</c:forEach>
						
=======

		<!-- 추천곡 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					추천곡 <small> <a href="recommendMusicList.box"
						aria-label="Skip to main navigation" title="추천곡 전체 목록"> <i
							class="fa fa-bars" aria-hidden="true"></i>
					</a>
					</small>
				</h1>
			</div>

			<c:forEach var="b" items="${musiclist}">
				<div class="col-md-3 portfolio-item">
					<a href="./NewmusicDetailAction.box?num=${b.music_num}"> <img
						class="img-responsive img-center"
						src="<c:url value='/img/${b.albumcoverfilepath}'/>" alt="">
					</a>
					<div class="well well-sm">
						<c:out value="${b.music_title}" />
						<br>
>>>>>>> branch 'master' of https://github.com/project-box/springbox
					</div>
				</div>
			</c:forEach>

		</div>

	</div>

	<div class="bgimg-2"></div>

	<div class="container">

		<!-- 추천공연 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					추천공연 <small> <a href="concert_list.box"
						aria-label="Skip to main navigation" title="추천공연 전체 목록"> <i
							class="fa fa-bars" aria-hidden="true"></i>
					</a>
					</small>
				</h1>
			</div>

			<c:forEach var="b" items="${concertlist}">
				<div class="col-md-3 portfolio-item">
					<a href="concert_detail.box?concert_num=${b.concert_num}"> <!-- <img class="img-responsive" src="http://placehold.it/750x450" alt="" > -->
						<img class="img-responsive img-center"
						src="<c:url value='/img/${b.posterfilepath}'/>" alt="">
					</a>
					<div class="well well-sm">
						<c:out value="${b.concert_title}" />
						<br>
					</div>
				</div>
			</c:forEach>

		</div>


		<!-- 게시판 -->
		<div class="row">
			<%-- <div class="col-lg-12">
                <h1 class="page-header">자유 게시판
                    <small>
                    	<a href="boardList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
            
            <table class="table table-striped">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>이름</th>
			        <th>등록일</th>
			        <th>조회수</th>			      
			      </tr>
			    </thead>
			    <tbody>
				    <c:forEach var="b" items="${generalboardlist}">
				    	<tr>
			            	<td><c:out value="${b.id}"/></td>
			            	<td><a href="/projectbox/boardCont.box?id=${b.id}">
								<c:out value="${b.title}"/></a>
							</td>
							<td><c:out value="${b.name}"/></td>
							<td><c:out value="${b.registerdate}"/>
								<c:set var="now" value="${b.registerdate}" />
								<fmt:formatDate value="${now}" type="date" />							
							</td>
							<td><c:out value="${b.readcount}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table> --%>

			<%-- <c:forEach var="b" items="${generalboardlist}">
            	<c:out value="${b.id}"/>
            	<a href="#">
					<c:out value="${b.title}"/>
				</a>
				<c:out value="${b.name}"/>
				<c:out value="${b.registerdate}"/>
				<br>
				
			</c:forEach> --%>

			<br> <br>

		</div>


		<!--   Footer -->
		<!-- <footer style="text-align:center">
		<div class="row">
			<div class="col-lg-12" style="font-size: 10px">
				<p>Copyright &copy; 2016 box Inc. 모든 권리 보유.</p>
				<br>
				<p>사업자등록번호 : 510-11-24601 | 통신판매업신고번호 : 제 2011-서울강남-00810호 |
					대표이사 : 마크장 | 주소 : 서울특별시 강남구 영동대로 517 아셈타워 39층 | 대표전화 : 02-6512-8000
					| 팩스 : 02-6128-8000</p>
			</div>
		</div> -->
		<!-- /.row -->
		</footer>
	</div>
	<!-- /.container -->


	<%@ include file="/WEB-INF/views/front/footer.jsp"%>

	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>

</body>
</html>