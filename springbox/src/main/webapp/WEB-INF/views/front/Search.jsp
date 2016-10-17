<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file= "/WEB-INF/views/front/header.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
	$(document).ready(function(){
		$("#searchPanel").focus();
	});
</script>

<body>
	<br><br><br><br>
	<center><input type="text" id="searchPanel" name="searchPanel"></center>
</body>
</html>