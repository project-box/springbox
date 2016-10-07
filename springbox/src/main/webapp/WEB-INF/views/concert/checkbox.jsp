<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(document).ready(function(){
			$(":checkbox").click(function(){
				if($(this).is(":checked")){
					alert($(this).val());
				}	
			});					
		}); 
	</script>
</head>
<body>


<input type=checkbox id=1 value="1">
<input type=checkbox id=2 value="2">
<input type=checkbox id=3 value="3">

<div></div>

</body>

</html>
    