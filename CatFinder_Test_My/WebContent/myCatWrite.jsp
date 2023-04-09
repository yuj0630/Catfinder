<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
  <link rel="stylesheet" href="assets/css/main.css" />
  <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
  <title>식빵굽냥</title>
  <script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardWriteCheck() {
		var form = document.BoardWriteForm;
		return true;
	}
    </script>
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
    <b><font size="6" color="gray">고양이 등록</font></b>
    <br>

    <form method="post" action="BoardWriteAction.bo" name="boardForm" enctype="multipart/form-data">
    <input type="hidden" name="board_id" value="${sessionScope.sessionID}">
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <!-- 작성자  -->
    	<tr>
			<td>작성자</td>
			<td><input type=text name=name size=10 maxlength=8></td>
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
                <input type="submit" value="등록" onclick="move('myCatResult.jsp');">&nbsp;&nbsp;
                <input type="button" value="목록" onclick="move('myCatList.jsp');">
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