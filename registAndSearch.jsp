<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>식빵굽냥</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
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
							<h2 style="color:powderblue; font-size:40px">우리 동네 고양이</h2>
							<p style="color:powderblue; font-size:25px">당신에게 맞는 고양이를 찾아보세요!</p>
							<ul class="actions special">
								<li>
									<a href="MyCatViewAction" class="button primary" style="background-color:coral; font-size:20px">울 동네 고양이</a>
								</li>
							</ul>
						</div>
					</section>

				<!-- Footer -->
					<jsp:include page="footer.jsp"/>

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