<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<title>MyPage로 이동</title>
</head>
<body>
	<form action="myPage" method="post" >
		아이디 입력: <input type=text name=id size=10><br>
		비밀번호 입력: <input type=text name=password size=10><br>
		<input type=submit value='MyPage'>
	</form>
</body>
</html>