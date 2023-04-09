<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${param.LOGIN_RESULT == 'SUCCESS' }">
			<script>
				location.href='../index.jsp';
			</script>
		</c:when>
		<c:when test="${param.LOGIN_RESULT == 'ID_FAIL' }">
			<script>
				alert('없는 아이디 입니다.');
				location.href='../Login.jsp';
			</script>
		</c:when>
		<c:when test="${param.LOGIN_RESULT == 'PASSWORD_FAIL' }">
			<script>
				alert('비밀번호가 일치하지 않습니다.');
				location.href='../Login.jsp';
			</script>
		</c:when>
		<c:when test="${param.LOGIN_RESULT == 'BACK' }">
			<script>
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
</body>
</html>