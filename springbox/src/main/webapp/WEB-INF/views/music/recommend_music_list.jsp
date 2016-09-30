<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%-- <%@ include file= "/box/header.jsp" %> --%>

	<title>b o x</title>
<body>

    <div class="container">
    
    <table class="table table-striped">
			    <thead>
			      <tr>
			      	<th></th>
			        <th>제목</th>
			        <th>아티스트</th>
			        <th>장르</th>
			        <th>앨범</th>			      
			      </tr>
			    </thead>
			    <tbody>
				    <c:forEach var="b" items="${musiclist}">
				    	<tr>
				    		<!-- 임시로 모든 url을 곡 디테일로 보냄 -->
				    		<td><a href="./musicDetailAction.box?num=${b.id}">
				    		<img src="<c:url value='/img/${b.albumcoverfilepath}'/>" alt="" width=40px height=40px>
				    		</a></td>
			            	<td><a href="./musicDetailAction.box?num=${b.id}"><c:out value="${b.title}"/></a></td>
			            	<td><a href="./musicDetailAction.box?num=${b.id}"><c:out value="${b.artist}"/></a></td>
							<td><a href="./musicDetailAction.box?num=${b.id}"><c:out value="${b.genre}"/></a></td>
							<td><a href="./musicDetailAction.box?num=${b.id}"><c:out value="${b.album}"/></a></td>
						</tr>
					</c:forEach>
			    </tbody>
			  </table>
    
    <br><br><br><br><br><br><br>
    
<%-- <%@ include file= "/box/footer.jsp" %>  --%>

</body>
</html>