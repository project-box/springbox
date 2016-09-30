<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="/springbox/css/bbs.css" />
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/springbox/js/theme.js"></script>
</head>

<body>
 <div id="bbswrite_wrap">
  <h2 class="bbswrite_title">테마곡</h2>
  <form method="post" action="/springbox/theme_write_ok.nhn">
   <table id="bbswrite_t">
    <tr>
     <th>번호</th>
     <td>
     <input name="theme_music_num" id="theme_music_num" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>음악장르</th>
     <td>
      <input type="genre" name="theme_music_gemre" id="theme_music_genre" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>아티스트</th>
     <td>
      <input name="theme_music_artist" id="theme_music_artist" size="40" 
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>제목</th>
     <td>
      <textarea name="theme_music_title"  id="theme_music_title" rows="8" cols="50"
      class="input_box"></textarea>
     </td>
    </tr> 
    
    <tr>
     <th>앨범</th>
     <td>
      <textarea name="theme_music_album"  id="theme_music_album" rows="8" cols="50"
      class="input_box"></textarea>
     </td>
    </tr> 
    
   </table>
   
   <div id="bbswrite_menu">
    <input type="get" value="담기" class="input_button" 
    onclick="$('#theme_music_num').focus();" />
   </div>
  </form>
 </div>
</body>
</html>