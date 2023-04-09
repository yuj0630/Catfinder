<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<title>식빵굽냥</title>
<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardViewCheck() {
		var form = document.BoardViewForm;
		return true;
	}
</script>

<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>

<body>
	<form name="BoardViewForm" method="post">
	<table summary="전체 테이블 구성">
	<tr>
		<td ><div align="center"><h3><b>글 읽기</b></h3></div></td>
	</tr>
	<tr>
		<td colspan=2>
		<table border="1" summary="목록 테이블 구성"> 
    <tr> 
		<td align=center bgcolor=#dddddd width=10%> UserId</td>
		<td bgcolor=#dddddd width=40%>정영운</td>
		<td align=center bgcolor=#dddddd width=10%> UserDate</td>
		<td bgcolor=#dddddd width=40%>2015/11/23</td>
	</tr>
    <tr>
		<td align=center bgcolor=#dddddd> UserEmail </td>
		<td bgcolor=#dddddd > un3561@naver.com </td> 
		<td align=center bgcolor=#dddddd> title </td>
		<td bgcolor=#dddddd> 게시판 예시 3 </td> 
	</tr>
   <tr> 
		<td colspan=4><br>글 내용<br></td>
   </tr>
   <tr>
		<td colspan=4> 조회수  : </td>
   </tr>
	</table>
	</td>
 	</tr>
	<tr>
		<td align=center colspan=1> 
		<div align="center">
		  <input type="button" value="목록" onclick="move('myCatList.jsp');">  
		</div>
		</td>
	</tr>
	</table>
</form>
<jsp:include page="footer.jsp"/>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>