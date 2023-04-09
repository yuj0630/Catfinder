<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Elements - Spectral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Header -->
		<jsp:include page="header.jsp" />
		<!-- Main -->
		<article id="main">
			<section id="banner">
				<div class="inner">
					<h2 style="color: powderblue; font-size: 40px">게시판</h2>
					<p style="color: powderblue; font-size: 25px">고양이 정보 공유 및 수다</p>
					<ul class="actions special">
						<li><a href="FreeBoardViewAction" class="button primary"
							style="background-color: plum; font-size: 20px">자유게시판 </a> <a
							href="photoBoard.jsp" class="button primary"
							style="background-color: darkorange; font-size: 20px">사진게시판</a> <a
							href="parcelOutBoard.jsp" class="button primary"
							style="background-color: coral; font-size: 20px">입양, 분양 게시판</a></li>
					</ul>
				</div>
			</section>

			<jsp:include page="footer.jsp" />
		</article>
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