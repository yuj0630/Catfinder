<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Elements - Spectral by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="landing is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">
				<!-- Header -->
				<jsp:include page="header.jsp"/>
				<!-- Main -->
					<article id="main">
								<section id="banner">
									<div class="inner">
										<h2 style="color:powderblue; font-size:50px">입양, 분양 게시판</h2>
										<p style="color:powderblue; font-size:25px">데려가주세요<br>데려왔습니다</p>
									</div>
								</section>

                <body>
									<!--타입바-->
									<div>
										<form name="fboardlist" id="fboardlist" method="post">
											<input type='hidden' name='bo_table' value='parcelOutBoard'>
											<input type='hidden' name='sfl'  value=''>
											<input type='hidden' name='stx'  value=''>
											<input type='hidden' name='spt'  value=''>
											<input type='hidden' name='sca'  value=''>
											<input type='hidden' name='page' value='1'>
											<input type='hidden' name='sw' id='sw'  value=''>
											<table width=100% border=0 cellpadding=0 cellspacing=0>
											<tr><td colspan=5 height=2 class=mw_basic_line_color></td></tr>
											<tr class=mw_basic_list_title align=center>
									    <td width=70>번호</td>
											<td>글제목</td>
      	              <td width=100>글쓴이</td>
											<td width=70>날짜</td>
											<td width=70>조회</td> </tr>
											<tr><td colspan=5 height=1 class=mw_basic_line_color></td></tr>
											<tr align=center bgcolor='#f8f8f9'>
              	  </div>
									<!--게시글-->

									<div>
									<tr align=center bgcolor='#f8f8f9'>
						        <td><span class=mw_basic_list_num>1</span>    </td>
										<td class=mw_basic_list_subject align='left'>
      								<a href="게시글1.html"><span class=mw_basic_list_notice>첫번째 게시글</span></a>
										</td>
                 		<td><nobr class=mw_basic_list_name><align='absmiddle'><span class='member'>김태훈</span></nobr></td>
										<td class=mw_basic_list_datetime>05/20</td>
										<td class=mw_basic_list_hit>1</td>
									</tr>
									<tr><td colspan=5 height=1 style="border-top:1px dotted #e7e7e7"></td></tr>
									</div>
									<div>
										<table width=100%>
											<tr>
												<!--글쓰기-->
										    <td height="40">
										        <a href="parcelOfBoardWrite.jsp"><img src="images/글쓰기.jpg" align="absmiddle"></a>
										    </td>
													<!--검색-->
												<div>
										    	<td align="right" width="100">
										        <form name=fsearch method=get>
										        	<input type=hidden name=bo_table value="parcelOutBoard">
										        	<input type=hidden name=sca value="">
										        	<select name=sfl style="color:black;">
									            		<option value='wr_subject'>제목</option>
									            		<option value='wr_content'>내용</option>
									            		<option value='wr_subject||wr_content'>제목+내용</option>
									            		<option value='mb_id,1'>아이디</option>
									        		</select>
										        <input name=stx maxlength=15 size=10 itemname="검색어" required value='' style="color:black;">
											    <input type=image src="images/검색.jpg" border=0 align=absmiddle>
									        	</form>
										   	 	</td>
												</div>
											</tr>
										</table>

										</td></tr></table>

										<script>
										$(window).load(function () {
										    $(".icon_gall_new").each(function () {
										        var is_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
										                $(this).css('display', 'block');
										    });
										});
										</script>

										<style type="text/css">
										</style>
									</div>
									<jsp:include page="footer.jsp"/>
                </body>



		</div>
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