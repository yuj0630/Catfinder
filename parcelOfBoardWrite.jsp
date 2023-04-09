<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
  <title>Elements - Spectral by HTML5 UP</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
  <link rel="stylesheet" href="assets/css/main.css" />
  <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <title>입양, 분양 게시판 - 글쓰기</title>

    <style type="text/css">
        #title{
            height : 16;
            font-family :'굴림';
            font-size : 18;
            text-align :center;
        }
    </style>

</head>
<body>

  		<!-- Page Wrapper -->
  			<div id="page-wrapper">
  				<!-- Header -->
  				<jsp:include page="header.jsp"/>

          <!--글쓰기-->
    <br>
    <b><font size="6" color="gray">글쓰기</font></b>
    <br>

    <form method="post" action="FreeBoardWriteAction" name="boardForm" enctype="multipart/form-data">
    <input type="hidden" name="board_id" value="${sessionScope.sessionID}">
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <!-- 분류 -->
        <tr>
          <td id="title">분 류</td>
          <td>
	          <select name="ca_name" required="" itemname="분류" style="background-image: url(&quot;../js/wrest.gif&quot;); background-position: right top; background-repeat: no-repeat;">
	            <option value="">선택하세요</option>
	            <option value="분양">분양</option>
	            <option value="입양">입양</option>
	          </select>
          </td>
        </tr>
        <!-- 제목 -->
        <tr>
          <td id="title">제 목</td>
          <td><input name="board_subject" type="text" size="70" maxlength="100" value=""/></td>
        </tr>
        <!-- 내용 -->
        <tr>
            <td id="title">내 용</td>
            <td><textarea name="board_content" cols="72" rows="20"></textarea></td>
        </tr>
        <!-- 파일첨부 -->
        <tr>
            <td id="title">파일첨부</td>
            <td><input type="file" name="board_file" /></td>
        </tr>

        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="작성취소" >
                <input type="submit" value="등록" >
                <input type="button" value="목록" >
            </td>
        </tr>
    </table>
    </form>
  </div>
  <!-- 페이지 하단 -->
	 <jsp:include page="footer.jsp"/>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		<script>
		
		</script>
</body>
</html>
