<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<title>식빵굽냥</title>
<script type="text/javascript">
	function move(url) {
		location.href = url;
	}
	function boardWriteCheck() {
		var form = document.BoardWriteForm;
		return true;
	}
</script>
</head>

<body>
	<div class="wrapper">
		<jsp:include page="header.jsp" />
		<div class="inner">
			<form name="BoardWriteForm" method="POST"
				enctype="multipart/form-data" action="MyCatWriteAction">
				<table class="table table-striped" summary="글쓰기 전체 테이블">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<h3>게시글 등록</h3>
					<tr>
						<td>냥이 이름</td>
						<td><input type="text" name="NAME"></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="text" name="AGE"></td>
					</tr>
					<tr>
						<td>성격</td>
						<td><input type="text" name="ATTITUDE"></td>
					</tr>
					<tr>
						<td>중성화</td>
						<td><input type="text" name="NEUTERED" placeholder="예/아니오"></td>
					</tr>
					<tr>
						<td>선호 먹이</td>
						<td><input type="text" name="FOOD_TYPE"></td>
					</tr>
					<tr>
						<td>코멘트</td>
						<td><textarea name="COMMENT" rows="10" cols="100"></textarea></td>
					</tr>
					<tr>
						<td>사진 등록</td>
						<td><input type="file" name="IMAGE"></td>
					</tr>
					<tr>
						<td colspan="2"><div align="center">
								<input type="submit" value="등록">&nbsp;&nbsp; <input
									type="button" value="뒤로" onclick="move('MyCatList.jsp');">
							</div></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />

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
