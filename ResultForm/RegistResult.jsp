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
		<c:when test="${param.REGIST_RESULT == 'SUCCESS' }">
			<script>
				alert('회원 가입에 성공 했습니다.');
				location.href='../index.jsp';
			</script>
		</c:when>
		<c:when test="${param.REGIST_RESULT == 'ID_FAIL' }">
			<script>
				alert('이미 있는 아이디 입니다.');
				location.href='../Register.jsp';
			</script>
		</c:when>
		<c:when test="${param.REGIST_RESULT == 'PASSWORD_FAIL' }">
			<script>
				alert('비밀번호가 일치하지 않습니다.');
				location.href='../Register.jsp';
			</script>
		</c:when>
		<c:when test="${param.REGIST_RESULT == 'BACK' }">
			<script>
				history.back();
			</script>
		</c:when>
		<c:when test="${param.REGIST_RESULT == 'FAIL' }">
			<script>
				alert('회원가입에 실패 했습니다.');
				location.href='../Register.jsp';
			</script>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
</body>
</html>