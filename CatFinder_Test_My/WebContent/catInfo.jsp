<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>식빵굽냥</title>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/photoBoard.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <!-- Header -->
   <jsp:include page="header.jsp"/>
    <!-- Page Wrapper -->
    <div id="page-wrapper">
    </div>
        <!-- 글목록 위 부분-->
    <br>
    	<ul class="actions fit">
		<li><a href="myCatList.jsp" class="button fit">내 고양이</a></li>
		<li><a href="catmanage.jsp" class="button fit">고양이 관리</a></li>
		<li><a href="myCatWrite.jsp" class="button fit">글 쓰기</a></li>
		<li><a href="catIndex.jsp" class="button fit">고양이 검색</a></li>
    </ul>
 
				<div align="right">
					<div class="round-button">
						<div class="round-button-circle">
							<a href="http://example.com" class="round-button">+</a></p>
						</div>
					</div>
				</div>

                <div class="row">

                    <div class="col-lg-3 col-md-4 col-xs-6 thumb">
               			 <a href="catInfoForm.jsp" class="fancybox" rel="ligthbox">
                   			 <img src="images/photoboard/1.jpg" class="zoom img-fluid " alt="">
               			 </a>
           			</div>
      
		            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
		                <a href="catInfoForm.jsp" class="fancybox" rel="ligthbox">
		                    <img src="images/photoboard/2.jpg" class="zoom img-fluid" alt="">
		                </a>
		            </div>

		            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
		                <a href="catInfoForm.jsp" class="fancybox" rel="ligthbox">
		                    <img src="images/photoboard/3.jpg" class="zoom img-fluid " alt="">
		                </a>
		            </div>

		            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
		                <a href="catInfoForm.jsp" class="fancybox" rel="ligthbox">
		                    <img src="images/photoboard/4.jpg" class="zoom img-fluid " alt="">
		                </a>
		            </div>

		            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
		                <a href="CatInfoForm.jsp" class="fancybox" rel="ligthbox">
		                    <img src="images/photoboard/5.jpg" class="zoom img-fluid " alt="">
		                </a>
		            </div>

		            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
		                <a href="CatInfoForm.jsp" class="fancybox" rel="ligthbox">
		                    <img src="images/photoboard/6.jpg" class="zoom img-fluid " alt="">
		                </a>
		            </div>
		            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
		                <a href="CatInfoForm.jsp" class="fancybox" rel="ligthbox">
		                    <img src="images/photoboard/7.jpg" class="zoom img-fluid " alt="">
		                </a>
		            </div>

		            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
		                <a href="CatInfoForm.jsp" class="fancybox" rel="ligthbox">
		                    <img src="images/photoboard/8.jpg" class="zoom img-fluid " alt="">
		                </a>
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