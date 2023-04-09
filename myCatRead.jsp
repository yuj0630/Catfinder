<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<img src="${PATH}" width="400" height="200"><br>
			<p>이름</p> <p class="content">${CAT.name}</p><br>
			<p>나이</p> <p class="content">${CAT.age}</p><br>
			<p>성격</p> <p class="content">${CAT.attitude}</p><br>
				<c:choose>
				<c:when test="${CAT.isNeutered == 1}">
					<p>중성화 여부</p> <p class="content">예</p><br>
				</c:when>
				<c:otherwise>
					<p>중성화 여부</p> <p class="content">아니오</p><br>
				</c:otherwise>
			</c:choose>
			<p>먹이 선호</p> <p class="content">${CAT.foodType}</p><br>	
			<p>기타 코멘트</p> <p class="content">${CAT.comment}</p><br>											
		</div>
		<input type="button" value="뒤로" onclick="move('MyCatViewAction');"/>

	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>