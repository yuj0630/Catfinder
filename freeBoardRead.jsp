<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
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
			<table class="table table-striped" summary="글쓰기 전체 테이블">
				<form name="BoardWriteForm" method="post"
					action="FreeBoardWriteAction">

					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>


					<table summary="테이블 구성">
						<h3>게시글 등록</h3>
						<tr>
							<td>제 목</td>
							<td><input type=text name=TITLE readonly="readonly" value="${BOARD.boardTitle}"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type=text name=WRITER readonly="readonly" value="${BOARD.userId}"></td>
						</tr>
						<tr>
							<td>작성일</td>
							<td><input type=text name=DATE readonly="readonly" value="${BOARD.boardDate}"></td>
						</tr>
						<tr>
							<td>내 용</td>
							<td><textarea name=CONTENT rows="10" cols="100" readonly="readonly">${BOARD.boardContent}</textarea></td>
						</tr>
						<tr>
							<td colspan="2"><div align="center">
									<input type="button" value="뒤로" onclick="move('FreeBoardViewAction');">
								</div></td>
						</tr>
					</table>
				</form>
			</table>
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
