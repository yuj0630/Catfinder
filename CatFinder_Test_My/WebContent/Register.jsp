<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <style>
      #login-form{
         width:450px;

         text-align: center;

         margin:80px auto;

         border: 1px solid gray;

         border-radius: 5px;

         padding: 20px;
       }
    </style>
  </head>
  <body class="is-preload" >

    <!-- Menu Toggle -->
    <jsp:include page="header.jsp" />


    <!-- Main -->
    <section>
      <div class="inner">
        <br>
        <h2 style="color:white; text-align:center; font-size:40px ; color:yellowgreen">회원가입 <br></h2>


        <form id="login-form" action="RegistAction" method="POST"> <!--여기 action 부분에 내용을 전송받을 url을 넣어줘야 함.-->
          <label class="legend">아이디</label>         <!--action 에 php파일로 하면 php파일에서 #_REQUEST['user-id']라고 선언하면 user-id라는 변수로 해당 값이 넘어옴-->
          <input type="text" name="user-id">
          <label class="legend">비밀번호</label>
          <input type="password" name="password">
          <label class="legend">비밀번호 확인</label>
          <input type="password" name="passwordConfirm">
          <label class="legend">이메일</label>
          <input type="text" name="Email">
          <br>
        <ul class="actions special">
          <li><input type="submit" class="button primary" style="background-color:orange ;font-size:20px" name="" value="가입하기" ></li> <!-- 이거 디비랑 연동해야됨.-->
          <li><a href="index.html" class="button primary" style="background-color:orange; font-size:20px">취소</a> </li> <!--메인 페이지로 돌아가기-->
        </ul>
        </form>
		    
		<!-- Footer -->
		<jsp:include page="footer.jsp"/>
		
      </div>
    </section>

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