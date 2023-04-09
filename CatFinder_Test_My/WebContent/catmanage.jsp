<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>       
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <title>식빵굽냥</title>
    
    <style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }

        #topForm{
            text-align :right;
        }

        #board, #pageForm, #searchForm{
            text-align :center;
        }
        
        #bList{
            text-align :center;
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
	   
 
<div id="wrap">
 
    <!-- 글목록 위 부분-->
    <br>
    	<ul class="actions fit">
		<li><a href="myCatList.jsp" class="button fit">내 고양이</a></li>
		<li><a href="catInfo.jsp" class="button fit">고양이 정보</a></li>
		<li><a href="myCatWrite.jsp" class="button fit">글 쓰기</a></li>
		<li><a href="catIndex.jsp" class="button fit">고양이 검색</a></li>
    </ul>
    
    <!-- 게시글 목록 부분 -->
    <br>
    <div id="board">
        <table id="bList" width="800" border="3" bordercolor="lightgray">
            <tr heigh="30">
                <td>User2</td>
                <td>제목</td>
                <td>내용</td>
                <td>작성일자</td>
                <td>ID</td>
            </tr>
        <c:forEach var="board" items="${requestScope.list}">
            <tr>
                <td>${board.board_num}</td>
                <td>
                    <a href="BoardDetailAction.bo?num=${board.board_num}&pageNum=${pageNum}">
                    ${board.board_subject}
                    </a>
                </td>
                <td>
                    <a href="#">
                    ${board.board_id}
                    </a>
                </td>
                <td>${board.board_date}</td>
                <td>${board.board_count}</td>
            </tr>
        </c:forEach>
        </table>
    </div>
    
    <!-- 페이지 넘버 부분(구현 안됨) -->
    <br>
    <div id="pageForm">
        <c:if test="${startPage != 1}">
            <a href='BoardListAction.bo?page=${startPage-1}'>[ 이전 ]</a>
        </c:if>
        
        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
            <c:if test="${pageNum == spage}">
                ${pageNum}&nbsp;
            </c:if>
            <c:if test="${pageNum != spage}">
                <a href='BoardListAction.bo?page=${pageNum}'>${pageNum}&nbsp;</a>
            </c:if>
        </c:forEach>
        
        <c:if test="${endPage != maxPage }">
            <a href='BoardListAction.bo?page=${endPage+1 }'>[다음]</a>
        </c:if>
    </div>
</div>
    <input type="button" value="처음으로" onclick="move('registAndSearch.jsp');"/> 
   	<!-- Footer -->
	<jsp:include page="footer.jsp"/>

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