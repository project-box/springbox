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

<!-- <tr class="">
<th scope="row">평점</th>
                    <td><input id="point0" name="point" fw-filter="" fw-label="평점" fw-msg="" value="5" type="radio" checked="checked"  /><label for="point0" ><span class="point5"><em>★★★★★</em></span></label>
<input id="point1" name="point" fw-filter="" fw-label="평점" fw-msg="" value="4" type="radio"  /><label for="point1" ><span class="point4"><em>★★★★</em></span></label>
<input id="point2" name="point" fw-filter="" fw-label="평점" fw-msg="" value="3" type="radio"  /><label for="point2" ><span class="point3"><em>★★★</em></span></label>
<input id="point3" name="point" fw-filter="" fw-label="평점" fw-msg="" value="2" type="radio"  /><label for="point3" ><span class="point2"><em>★★</em></span></label>
<input id="point4" name="point" fw-filter="" fw-label="평점" fw-msg="" value="1" type="radio"  /><label for="point4" ><span class="point1"><em>★</em></span></label></td>
                </tr> -->






</body>
</html>