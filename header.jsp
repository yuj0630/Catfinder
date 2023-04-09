<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>식빵굽냥</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>
	<header id="header" class="alt">
		<h1><a href="index.jsp">식빵굽냥</a></h1>
		<nav id="nav">
			<ul>
				<li class="special">
					<a href="#menu" class="menuToggle"><span>메뉴</span></a>
					<div id="menu">
						<ul>
							<li><a href="index.jsp">메인화면</a></li>
							<li><a href="registAndSearch.jsp">우리동네 고양이 등록 / 검색</a></li>
							<li><a href="boardElement.jsp">게시판</a></li>
							<c:choose>
								<c:when test="${sessionScope.LOGIN_ID == null }">
									<li><a href="agreementOfTerms.jsp">회원가입</a></li>
									<li><a href="Login.jsp">로그인</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="LogoutAction">로그 아웃</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</li>
			</ul>
		</nav>
	</header>
	
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