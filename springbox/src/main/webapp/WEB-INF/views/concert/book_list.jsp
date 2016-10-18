<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/front/header.jsp"%>

<style>



</style>
</head>
<body>

예매 정보 페이지 입니다.
<a href="concert_detail.box?concert_num=${paymentdata.concert_num}">클릭 하면 디테일 페이지로</a>

마이티켓

전체예매내역 &nbsp; 취소내역

<!-- ---------------------예매내역이 없을 때-------------------------------- -->

<c:if test="${empty paymentdatadata}">

<table border=1px> <tr align="center" valign="middle">
						<td colspan="4" height="200" width="800">
						<font size=2>예매내역이 없습니다.</font></td>
					</tr>
</table>
</c:if>


<!-- --------------------------예매내역이 있을 때------------------------------------ -->


<c:if test="${!empty paymentdatadata}">

</c:if>






<%@ include file="/WEB-INF/views/front/footer.jsp"%>

</body>
</html>