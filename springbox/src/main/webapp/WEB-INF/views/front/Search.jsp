<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" />

</head>
<style>
input[type=text], select {
	width: 600px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#autocomplete").focus();
		
		$('#autocomplete').autocomplete({
			//lookup: countries,
			serviceUrl: '/springbox/get_keyword.box',
			transformResult : function(response) {
				var jdata = JSON.parse(response);
				return {
		            suggestions: $.map(jdata, function(value) {
		                return { value: value.keyword };
		            })
		        };
		    },
		    onSelect: function (suggestion) {
		        //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
		        // call Search()
		        console.log(suggestion.value);
		    },
		    triggerSelectOnValidInput : false,
		});
	});
</script>

<body>
	<br>
	<br>
	<br>
	<br>
	<center>
	
		<input type="text" id="autocomplete">

	</center>

	<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
</body>
</html>