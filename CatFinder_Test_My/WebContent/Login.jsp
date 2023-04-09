<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <style>
      #login-form{
         width:500px;

         margin:80px auto;

         border: 1px solid gray;

         border-radius: 15px;

         padding: 15px;
       }
    </style>
  </head>
  <body class="is-preload">

    <!-- Menu Toggle -->
   	<jsp:include page="header.jsp"/>


    <!-- Main -->
    <section>
      <div class="inner">
        <br>
        <h2 style="color:white; text-align:center; font-size:40px ; color:yellowgreen">로그인</h2>

        <form id="login-form" action="LoginAction" method="POST"> <!--여기 action 부분에 내용을 전송받을 url을 넣어줘야 함.-->
          <label class="legend" style="text-align:center; ">아이디</label>         <!--action 에 php파일로 하면 php파일에서 #_REQUEST['user-id']라고 선언하면 user-id라는 변수로 해당 값이 넘어옴-->
          <input type="text" name="user-id">
          <label class="legend" style="text-align:center; margin:10px ">비밀번호</label>
          <input type="password" name="password">

          <br>
          <ul  >
            <div style="text-align:center; "><input type="submit" class="button primary"
              style="background-color:orange ;font-size:20px; width:300px" name="" value="로그인"></div> <!-- 이거 디비랑 연동해야됨.-->
            <br>
          <div style="text-align:center; "><a href="index.jsp" class="button primary"
            style="background-color:orange; font-size:20px">메인화면으로 돌아가기</a> </div> <!--메인 페이지로 돌아가기-->
          </ul>


      </div>
    </section>

    <!-- Footer -->
     	<jsp:include page="footer.jsp"/>

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
