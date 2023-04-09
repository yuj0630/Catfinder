<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<table class="bbs table-striped" width="800" height="100" border="2">
				<colgroup>
					<col width="50" />
					<col width="100" />
					<col width="100" />
					<col width="50" />
				</colgroup>
				<thead>
					<tr>
						<th style="width: 20%; text-align: center">글 번호</th>
						<th style="width: 20%; text-align: center">제목</th>
						<th style="width: 20%; text-align: center">작성자</th>
						<th style="width: 20%; text-align: center">날짜</th>
					</tr>
				</thead>
				<tbody>

					<c:choose>
						<c:when test="${FREE_BOARD_LIST.listSize<1}">
							<tr>
								<td align="center">0</td>
								<td align="center"
									style="cursor: pointer;">게시글이 없습니다.</td>
								<td align="center">운영자</td>
								<td align="center">2019-06-07</td>
							</tr>
						</c:when>

						<c:otherwise>
							<c:forEach var="cnt" begin="0"
								end="${FREE_BOARD_LIST.listSize-1}">
								<tr>
									<td align="center">${FREE_BOARD_LIST.boardId[cnt] }</td>
									<td align="center"
										onclick="location.href='FreeBoardReadAction?BOARD_ID=${FREE_BOARD_LIST.boardId[cnt]}'"
										style="cursor: pointer;">${FREE_BOARD_LIST.boardTitle[cnt] }</td>
									<td align="center">${FREE_BOARD_LIST.userId[cnt] }</td>
									<td align="center">${FREE_BOARD_LIST.boardDate[cnt] }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
				</tfoot>
			</table>
			<c:choose>
				<c:when test="${sessionScope.LOGIN_ID != null}">
					<button onclick="move('freeBoardWrite.jsp');">글쓰기</button>
				</c:when>
			</c:choose>
			<button onclick="move('boardElement.jsp');">처음으로</button>
		</div>
	</div>


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