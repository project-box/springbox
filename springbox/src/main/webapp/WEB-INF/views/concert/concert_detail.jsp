<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

추천공연 디테일 페이지 입니다.

<a href="book.box"><button type="button">예매하기</button></a>
<a href="concert_list.box">클릭 하면 리스트로</a>


<h3>${concertdata.concert_title}</h3>
<img src="./img/${concertdata.posterfilepath}" width="157" height="191" alt="title" />







</body>
</html>