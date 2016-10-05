<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>테마곡</title>
    <link rel="stylesheet" href="/springbox/css/bbs.css" type="text/css">
</head>

<body>
	<!-- 게시판 리스트 -->
	<div id="bbslist_wrap">
		<h2 class="bbslist_title">게시판 목록</h2>
		<div id="bbslist_c">글 개수 : ${listcount}</div>

		<table id="bbslist_t">
			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 11pt;" width="8%"
					height="26">
					<div align="center">번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="47%">
					<div align="center">음악 장르</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">아티스트</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="17%">
					<div align="center">제목</div>
				</td>
				<td style="font-family: Tahoma; font-size: 11pt;" width="14%">
					<div align="center">앨범</div>
				</td>
			</tr>

			<!-- 화면 출력 번호  변수 정의 -->		
			<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
			<!-- 반복문 시작 -->
			<c:forEach var="b" items="${themelist}">
			
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">					
 					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
				</td>
				
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="left">						
						
					<c:if test="${t.theme_re_lev != 0}"> 
						<c:forEach var="k" begin="1" end="${t.theme_re_lev}">
							&nbsp;&nbsp;			
						</c:forEach>
						<img src="./images/AnswerLine.gif">	
					</c:if>					
						
		<!-- 	<input type="checkbox" id="size" name="size" value="2"/><font size="2">3</font>	
			<script>		
				      $('#btnChk').click(function() {

                       var gSize = "";

                      $("input[name=size]:checked").each(function() {

                       if(gSize == ""){

                        gSize = $(this).val();

                         } else {
                         
                       gSize = gSize + "," + $(this).val();
                           }
                         });
                            $('#gSize').val(gSize);
                            });
				     </script> 
						 -->
						
					<!-- 제목 출력 부분 -->	
					<a href="theme_cont.nhn?theme_num=${t.theme_num}&page=${page}&state=cont">
							
					</a>
					</div>
					
				</td>

            <div class="recom-wrap">
            <ul class="recom-list">
            <li class="type_4">
             <div class="cover-wrap">
         <a href="#" class="cover" onClick="javascript:playlistLogNDetailView('4001', 'V', 'TODAY'); return false;">
<img onload="this.style.opacity='1';" alt="" src="//image.genie.co.kr/Y/IMAGE/Playlist/Channel/GENIE/PLAYLIST_20160929150334.JPG"
 onerror="this.src='//image.genie.co.kr/imageg/web/common/blank_200.gif';">
 <span class="bgcover c6"></span>
       <span class="mask"></span>
      <span class="category">
             
        </span>
       </a>
  <a href="#" class="all-play" title="바로재생" onclick="javascript:allSongPlayNLog('4001'); return false;">바로재생</a>
       </div>
 <div class="info-wrap">
 <div class="title"><a href="#" onClick="javascript:playlistLogNDetailView('4001', 'V', 'TODAY'); return false;"><span class="profile t6"></span>드라이브 할 때 들으면 좋은 노래</a></div>
  <div class="tag">
                                        
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('GR0004');return false;">#락/메탈</a>
                                       
                                            
<a href="#" onclick="javascript:goTagsSearch('GR0005');return false;">#POP</a>
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('GR0009');return false;">#블루스/포크</a>
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('ST0001');return false;">#휴식</a>
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('ST0004');return false;">#집</a>
                                        
                                            
 <a href="#" onclick="javascript:goTagsSearch('ST0009');return false;">#밤</a>
                                        
                                            
 <a href="#" onclick="javascript:goTagsSearch('ST0015');return false;">#가을</a>
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('ST0029');return false;">#공연</a>
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('SB0004');return false;">#매혹적인</a>
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('SB0021');return false;">#추억</a>
                                        
                                            
<a href="#" onclick="javascript:goTagsSearch('HS0002');return false;">#해외음악</a>
                                                                             
 </div>
 
 
                     <tr>
                     				
					<td><a href="#"><c:out value="${t.theme_music_num}"/>
				     </a></td>
				
					<td><a href="#"><c:out value="${t.theme_music_title}"/>
				     </a></td>
				
					<td><a href="#"><c:out value="${user_id}"/>
				     </a></td>
					
					<td><a href="#"><c:out value="${like_num}"/>
				     </a></td>
					
					<td><a href="#"><c:out value="${view_num}"/>
				     </a></td>
			        </tr>
			
			</c:forEach>
			<!-- 반복문 끝 -->			
		</table>
		

		<div id="bbslist_paging">			
			<c:if test="${page <=1 }">
				[이전]&nbsp;
			</c:if>
			
			<c:if test="${page > 1 }">
				<a href="theme_list.nhn?page=${page-1}">[이전]</a>&nbsp;
			</c:if>			

			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="theme_list.nhn?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>			
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="theme_list.nhn?page=${page+1}">[다음]</a>
			</c:if>			
			
		</div>
		<div id="bbslist_w">
			<input type="button" value="글쓰기" class="input_button"
				onclick="location='theme_write.nhn?page=${page}'">
		</div>
		
	</div>
</body>
</html>