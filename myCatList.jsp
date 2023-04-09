<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<title></title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/photoBoard.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>

<body class="landing is-preload">

	<!-- Page Wrapper -->
	<div id="page-wrapper">
		<!-- Header -->
		<jsp:include page="header.jsp" />
	</div>


	<article id="main">
		<section id="banner">
			<div class="inner">
				<h2 style="color: orange">우리 동네 고양이</h2>
			</div>
		</section>

		<div class="container page-top">

			<div align="right">
				<div class="round-button">
					<div class="round-button-circle">
						<a href="myCatWrite.jsp" class="button">글쓰기</a>
						</p>
					</div>
				</div>
			</div>

			<div class="row">
				<c:choose>
					<c:when test="${MY_CAT_LIST.listSize > 1}">
						<c:forEach var="cnt" begin="0" end="${MY_CAT_LIST.listSize-1 }">
							<div class="col-lg-3 col-md-4 col-xs-6 thumb">
								<a href="MyCatReadAction?ID=${MY_CAT_LIST.id[cnt]}"
									class="fancybox" rel="ligthbox"> <img
									src="${MY_CAT_LIST.filePath[cnt]}" class="zoom img-fluid "
									style="height: 250px;"><br>
									<h4>이름 : ${MY_CAT_LIST.name[cnt]}</h4>
								</a>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</div>
		</div>

	</article>
	<jsp:include page="footer.jsp" />



	<!-- Scripts -->


	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css"
		media="screen">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>

	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>

	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script src="assets/js/photoBoard.js"></script>
</body>

</html>
