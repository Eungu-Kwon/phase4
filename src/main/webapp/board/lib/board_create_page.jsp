
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CirclePack.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Sprayed Strokes   
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20110329
-->
<% 
	Board board = new Board(request.getParameter("cid"), request.getParameter("tid"));
	DBHelper db = DBHelper.getInstance();
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>The Coffee Shop</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="../css/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrapper">
		<div id="menu">
			<ul>
				<li><a href="/phase4/mainpage/lib/mainpage.jsp" accesskey="1">Home</a></li>
				<li class="active"><a href="#" accesskey="2">Photos</a></li>
				<li><a href="#" accesskey="3">Links</a></li>
				<li><a href="#" accesskey="4">About</a></li>
				<li><a href="#" accesskey="5">Contact</a></li>
			</ul>
		</div>
		<!-- end #menu -->
		<div id="header">
			
		</div>
		<!-- end #header -->
		<div id="content">
			<div class="Article">
				<div class="ArticleTopBtns">
					<div class="left_area"></div>
					<div class="right_area"></div>
				</div>
				<div class="ArticleContentBox">
					<div class="article_header"></div>
					<div class="article_container">
						<form action="board_create_process.jsp?cid=<%=request.getParameter("cid")%>&tid=<%=request.getParameter("tid") %>" method="post" accept-charset="utf-8">
							<div class="article_board">
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">Title</label>
									<input type="title" class="form-control"
										id="exampleFormControlInput1" name="title">
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label">Content</label>
									<textarea class="form-control" id="exampleFormControlTextarea1"
										rows="6" name="content"></textarea>
								</div>
							</div>
							<div class="CommentBox">
								<ul class="comment_list">
									<li class="CommentItem">
										<div class="comment_area"></div>
									</li>
								</ul>
								<div class="CommentWriter">
									<button type="submit" class="btn btn-primary"
										id="comment_submit">submit</button>
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>

			<!-- end #posts -->
			<div id="links">
				<ul>
					<%
             out.println("<li><a href=\"schedule.jsp?cid=" + request.getParameter("cid") + "\">스케줄</a></li>");
             out.println(Tab.showTabList(db,Integer.parseInt(request.getParameter("cid"))));
             %>
				</ul>
			</div>
			<!-- end #links -->
			<div style="clear: both;">&nbsp;</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
