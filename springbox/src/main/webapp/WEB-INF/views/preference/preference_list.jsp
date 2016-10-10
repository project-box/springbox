<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>b o x</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>b o x</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/4-col-portfolio.css" rel="stylesheet">

<!-- font awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet">

<link href="raty/jquery.raty.css" rel="stylesheet">
<script src="raty/jquery.raty.js" type="text/javascript"></script>

<link href="css/preference.css" rel="stylesheet">
    
<script>
	$(document).ready(function() {
		initStars();
	});
	
	function post(path, params, method) {
	    method = method || "post"; // Set method to post by default if not specified.

	    // The rest of this code assumes you are not using a library.
	    // It can be made less wordy if you use one.
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);

	    for(var key in params) {
	        if(params.hasOwnProperty(key)) {
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
	
	function initStars(){
		$('.star').raty({
			half : true,
			starOff : 'raty/images/star-off.png',
			starOn  : 'raty/images/star-on.png',
			starHalf : 'raty/images/star-half.png',
			hints : ['별로', '그럭저럭', '보통', '좋음', '최고']
		});
	}
	
	function getStars(){
		
		var items = {};        
        
		$('.musicrating').each(function(index){
			var music = $(this).children().first();
			
			// music id
			console.log(music.attr('class'));
			var musicid = 'id.' + music.attr('class');
			
			// music rating
			console.log(music.children('.star').raty('score'));
			var musicRating = music.children('.star').raty('score');
			
			if(typeof musicRating != 'undefined'){
				items[musicid] = 'val.' + musicRating;	
			}
		});
		
		console.log(items);
		
		var count = Object.keys(items).length;
		
		if(count > 0){
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
			<li>
				<div class="dropdown boxcenter">
					<button class="btn btn-link dropdown-toggle" type="button"
						data-toggle="dropdown">
						<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
					</button>
					<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">등록 음악 삭제</a></li>
						<li><a href="#">등록 음악 수정</a></li>
					</ul>
				</div>
			</li>
			<li><button type="button" onclick="initStars()" class="btn btn-default command-button">다시하기</button></li>
		</ul>
	
		<ul class="nav navbar-nav navbar-right">
			<li><button type="button" onclick="window.location='./main.box';" class="btn btn-default command-button">취소</button></li>
			<li><button type="button" onClick="getStars()" class="btn btn-warning command-button">추천받기</button></li>
		</ul>
	</div>
	
	<!-- <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul> -->
    
	<!-- /.container --> </nav>
	
	<c:forEach var="b" items="${musiclist}">
		<div class="col-md-3 portfolio-item">
			
			<div>
				<img class="img-responsive img-center"
				src="
	                  <c:url value='/img/${b.albumcoverfilepath}'/>"
				alt="">
			</div>
			
			<div class="infoi">
				<div class="musicrating">
					<center class="${b.music_num}">
						<div class='star'></div>
					</center>
				</div>
			</div>
			
			<div class="well well-sm">
				<c:out value="${b.music_title}" />
				<br>
			</div>
		</div>
	</c:forEach>
	
	<%@ include file= "/WEB-INF/views/front/footer.jsp" %>    
</body>
</html>