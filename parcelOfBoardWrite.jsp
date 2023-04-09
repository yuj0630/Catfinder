<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
  <title>Elements - Spectral by HTML5 UP</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
  <link rel="stylesheet" href="assets/css/main.css" />
  <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <title>�Ծ�, �о� �Խ��� - �۾���</title>

    <style type="text/css">
        #title{
            height : 16;
            font-family :'����';
            font-size : 18;
            text-align :center;
        }
    </style>

</head>
<body>

  		<!-- Page Wrapper -->
  			<div id="page-wrapper">
  				<!-- Header -->
  				<jsp:include page="header.jsp"/>

          <!--�۾���-->
    <br>
    <b><font size="6" color="gray">�۾���</font></b>
    <br>

    <form method="post" action="FreeBoardWriteAction" name="boardForm" enctype="multipart/form-data">
    <input type="hidden" name="board_id" value="${sessionScope.sessionID}">
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <!-- �з� -->
        <tr>
          <td id="title">�� ��</td>
          <td>
	          <select name="ca_name" required="" itemname="�з�" style="background-image: url(&quot;../js/wrest.gif&quot;); background-position: right top; background-repeat: no-repeat;">
	            <option value="">�����ϼ���</option>
	            <option value="�о�">�о�</option>
	            <option value="�Ծ�">�Ծ�</option>
	          </select>
          </td>
        </tr>
        <!-- ���� -->
        <tr>
          <td id="title">�� ��</td>
          <td><input name="board_subject" type="text" size="70" maxlength="100" value=""/></td>
        </tr>
        <!-- ���� -->
        <tr>
            <td id="title">�� ��</td>
            <td><textarea name="board_content" cols="72" rows="20"></textarea></td>
        </tr>
        <!-- ����÷�� -->
        <tr>
            <td id="title">����÷��</td>
            <td><input type="file" name="board_file" /></td>
        </tr>

        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="�ۼ����" >
                <input type="submit" value="���" >
                <input type="button" value="���" >
            </td>
        </tr>
    </table>
    </form>
  </div>
  <!-- ������ �ϴ� -->
	 <jsp:include page="footer.jsp"/>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
		<script>
		
		</script>
</body>
</html>
