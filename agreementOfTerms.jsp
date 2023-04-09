<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>식빵굽냥</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <style>
      #login-form{
         width:650px;

         margin:80px auto;

         border: 5px solid gray;

         border-radius: 15px;

         padding: 15px;
       }
    </style>
  </head>

  <body class="is-preload">

    <!-- Menu Toggle -->
    <jsp:include page="header.jsp" />
    
    <!-- Main -->
    <section>
      <div class="inner">
        <br>
        <h2 style="color:white; text-align:center; font-size:40px ; color:orange">개인정보 수집 동의서</h2>

        <form id="login-form" action="#" method="GET"> <!--여기 action 부분에 내용을 전송받을 url을 넣어줘야 함.-->
          <!--action #에 php파일로 하면 php파일에서 #_REQUEST['user-id']라고 선언하면 user-id라는 변수로 해당 값이 넘어옴-->
		 	 ■ 개인정보의 수집 및 이용목적<br>
				본 사이트는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
				ο 서비스 제공에 관한 계약 이행<br>
				ο 회원 관리<br>
				회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 고지사항 전달<br>
				ο 마케팅 및 광고에 활용<br>
				접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br><br>
				■ 개인정보의 보유 및 이용기간<br>
				회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.<br><br>
				■ 개인정보의 제3자 제공에 관한 사항<br>
				본 사이트는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>
			 <br>
            <h2 style="text-align:center">위 내용에 동의하십니까?</h2>

          <span style="text-align:center">
          <a href="Register.jsp" class="button primary"
            style="background-color:transparent; border:1px solid white; border-radius:10px;
            font-size:20px; width:300px;">네</a> <!--동의-->
          <a href="index.jsp" class="button primary"
            style="background-color:transparent; border:1px solid white; border-radius:10px;
            font-size:20px; width:300px;">아니요</a> <!--메인 페이지로 돌아가기-->
            </span>

      </div>
    </section>

    <!-- Footer -->
      <jsp:include page="footer.jsp" />

  </div>
  
    <!-- Script -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>