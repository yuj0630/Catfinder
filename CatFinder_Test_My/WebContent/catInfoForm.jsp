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
<style>
h3 {
	width: 200px;
}

div.inner {
	width: 800px;
	height: 800px;
	margin-left: -200px;
}

p {
	display: inline-block;
	width: 100px;
	margin: 10px;
	margin-left: 50px;
	text-align: center;
}
p.content{
	display: inline-block;
	width: 300px;
}
p.profile{
	margin-left: 180px;
	font-weight: bold;	
}
img{
	margin-left: 130px;
}
span{
	margin-left: 200px;
}
</style>
    <script type="text/javascript">
        function move(url){
            location.href=url;
        }
    </script>
</head>
<body>
<!-- Header -->
	 <jsp:include page="header.jsp"/>
	 
	<div style="width: 0px; margin: auto;">
		<br><br>
		<div class="inner">
		    <p class="profile">[고양이 사진]</p><br><br>
			<img src="images/photoboard/1.jpg" width="200" height="200"><br>
			<p>이름</p> <p class="content">체리</p><br>
			<p>성별</p> <p class="content">남</p><br>
			<p>나이</p> <p class="content">1년 8개월</p><br>
			<p>성격</p> <p class="content">온화함</p><br>
			<p>중성화 여부</p> <p class="content">예</p><br>	
			<p>먹이 선호</p> <p class="content">생선, 고양이 사료</p><br>	
			<p>기타 코멘트</p> <p class="content">이 아이는 상냥하지만 화나면 무슨 짓을 할지 모릅니다. 화나게 하지 마세요.</p><br>											
		</div>
		<input type="button" value="뒤로" onclick="move('catInfo.jsp');"/>

	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>