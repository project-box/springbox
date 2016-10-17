<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>b o x</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>b o x</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- font awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet">

<link href="raty/jquery.raty.css" rel="stylesheet">
<script src="raty/jquery.raty.js" type="text/javascript"></script>

<link href="css/preference.css" rel="stylesheet">

<!-- base CSS -->
<link href="css/base_layout.css" rel="stylesheet">

<!-- toastr -->
<link href="css/toastr.min.css" rel="stylesheet">
<script src="js/toastr.js"></script>

<script>
	$(document).ready(function() {
		toastr.options.preventDuplicates = false;
		toastr.options.positionClass = "toast-top-center";
		toastr.options.timeOut = 2000;

		
		// 여기서 리스트&리스트 매칭을 시켜야 하는데..
		
		initStar($('.star'));
	});

	function post(path, params, method) {
		method = method || "post"; // Set method to post by default if not specified.

		// The rest of this code assumes you are not using a library.
		// It can be made less wordy if you use one.
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);

		for ( var key in params) {
			if (params.hasOwnProperty(key)) {
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", key);
				hiddenField.setAttribute("value", params[key]);

				form.appendChild(hiddenField);
			}
		}

		document.body.appendChild(form);
		form.submit();
	}

	function initStar(star) {
		star.raty({
			//score : 0,
			half : true,
			starOff : 'raty/images/star-off.png',
			starOn : 'raty/images/star-on.png',
			starHalf : 'raty/images/star-half.png',
			hints : [ '별로', '그럭저럭', '보통', '좋음', '최고' ],
			click : function(score, evt) {
				//alert('ID: ' + $(this).attr('id') + '\nscore: ' + score + '\nevent: ' + evt);
				var parent = $(this).parent();
				var num = parent.attr('class');
				//alert(parent.attr('class'));

				var items = {
					"music_num" : num,
					"rate" : score
				};

				//1.Ajax add/update 반영
				$.ajax({
					url : "update_preference.box",
					type : "POST",
					data : items,
					success : function(data, textStatus, jqXHR) {
						//2.성공 시 뷰 반영
						$("#" + num).attr('class', 'thumbnail cover selected');
						toastr.success('평가가 저장되었습니다.');
					},
					error : function(jqXHR, textStatus, errorThrown) {

					}
				});
			}
		});
	}

	function removePreference(num) {
		//1.Ajax remove 반영
		//2.성공 시 뷰 반영
		//alert(num);
		$("#" + num).attr('class', 'thumbnail cover');

		// 뷰 초기화
		initStar($('.star.' + num));

		//toastr.info('저장되었습니다.');
		toastr.success('평가가 삭제되었습니다.');
	}

	// out of date
	function getStars() {

		var items = {};

		$('.musicrating').each(function(index) {
			var music = $(this).children().first();

			// music id
			console.log(music.attr('class'));
			var musicid = 'id.' + music.attr('class');

			// music rating
			console.log(music.children('.star').raty('score'));
			var musicRating = music.children('.star').raty('score');

			if (typeof musicRating != 'undefined') {
				items[musicid] = 'val.' + musicRating;
			}
		});

		console.log(items);

		var count = Object.keys(items).length;

		if (count > 0) {
			//post('/projectbox/PreferenceAddAction.box', items);
			post('update_preference.box', items);
		} else {
			alert("선택된 항목이 없습니다.");
			return false;
		}
	}
</script>

</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<ul class="nav navbar-nav">
			<p id="preferenceCount">0</p>
			<!-- <li><button type="button" onclick="initStars()"
					class="btn btn-default command-button">다시하기</button></li> -->
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><button type="button"
					onclick="window.location='./main.box';"
					class="btn btn-warning command-button">확인</button></li>
			<!-- <li><button type="button" onClick="getStars()"
					class="btn btn-warning command-button">추천받기</button></li> -->
		</ul>
	</div>

	<!-- <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul> --> <!-- /.container --> </nav>

	<div class="container">
		<div class="row">
			<c:forEach var="b" items="${musiclist}">

				<div class="col-xs-12 col-md-3 portfolio-item cover2d">

					<div class="positioningDiv">

						<div class="thumbnail base" id="item">
							<img class="img-responsive img-center"
								src="<c:url value='/img/${b.albumcoverfilepath}'/>" alt="">

							<div class="well well-sm">
								<c:out value="${b.music_title}" />
								-
								<c:out value="${b.music_artist}" />
							</div>
						</div>

						<div class="thumbnail cover" id="${b.music_num}">


							<img class="img-responsive img-center"
								src="<c:url value='/img/${b.albumcoverfilepath}'/>" alt="">

							<!-- 흐릿한 커버 -->
							<div class="tile-cover"></div>

							<div class="tile-cover-title">
								<c:out value="${b.music_title}" />
								-
								<c:out value="${b.music_artist}" />
							</div>

							<div class="info-close">
								<a href="javascript:removePreference('${b.music_num}');"> <i
									class="fa fa-times fa-2x" aria-hidden="true"></i>
								</a>
							</div>

							<div class="tile">
								<div class="musicrating">
									<center class="${b.music_num}">
										<div class='star ${b.music_num}'></div>
									</center>
								</div>
							</div>



						</div>

					</div>
					<!-- /.thumbnail-->

				</div>

			</c:forEach>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/front/footer.jsp"%>
</body>
</html>