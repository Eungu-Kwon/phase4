
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="CirclePack.*"%>
<%@ page import="java.sql.*, java.text.*"%>
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
	//Board board = new Board(request.getParameter("cid"), request.getParameter("tid"));
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

<style>
input[type="date"] {
    margin-left: 10px;
    margin-right: 10px;
}
.CommentWriter {
    display: inline-block;
}
</style>

</head>
<body>
<%
ResultSet rs = null;
if(request.getParameter("id") != null){
	String sql = "SELECT * FROM SCHEDULES WHERE ID="+request.getParameter("id");
	DBHelper db = DBHelper.getInstance();
	rs = db.runSql(sql);
	rs.next();
}

%>
	<div id="wrapper">
		<div id="menu">
			<ul>
				<li><a href="#" accesskey="1">Home</a></li>
				<li class="active"><a href="#" accesskey="2">Photos</a></li>
				<li><a href="#" accesskey="3">Links</a></li>
				<li><a href="#" accesskey="4">About</a></li>
				<li><a href="#" accesskey="5">Contact</a></li>
			</ul>
		</div>
		<!-- end #menu -->
		<div id="header">
			<h1>The Coffee Shop</h1>
			<h2>
				<a href="#">Free CSS Templates</a>
			</h2>
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
						<form action="schedule_create_process.jsp?cid=<%=request.getParameter("cid")%>" method="post" accept-charset="utf-8">
						<% if(rs != null) out.print("<input name=\"sid\" value=\"" + request.getParameter("id") + "\" hidden></input>"); %>
							<div class="article_board">
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">Title</label>
									<% if(rs != null) out.print("<input type=\"title\" class=\"form-control\"id=\"exampleFormControlInput1\" name=\"title\" value='" + rs.getString(8) + "' required>");
										else out.print("<input type=\"title\" class=\"form-control\"id=\"exampleFormControlInput1\" name=\"title\" required>");%>
								</div>
								<div><% 
								if(rs != null){
									String start_str = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate(6));
									String end_str = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate(7));
									out.print("<label>기간 :</label><input name=\"start_date\" type=\"date\" value='" + start_str + "' required></input> ~ <input name=\"end_date\" type=\"date\" value='" + end_str + "' required></input>");
								}
								else
									out.print("<label>기간 :</label><input name=\"start_date\" type=\"date\" required></input> ~ <input name=\"end_date\" type=\"date\" required></input>");
								%>
								<label>표시 색</label>
								<select name="sel_color">
									<option value='red'>red</option>
									<option value='green'>green</option>
									<option value='blue'>blue</option>
									<option value='yellow'>yellow</option>
									<option value='orange'>orange</option>
									<option value='purple'>purple</option>
								</select>
								</div>
								<div class="mb-3">
									<label for="exampleFormControlTextarea1" class="form-label">Content</label>
									<% if(rs != null) out.print("<textarea class=\"form-control\" id=\"exampleFormControlTextarea1\" rows=\"6\" name=\"content\" required>" + rs.getString(5) + "</textarea>");
										else out.print("<textarea class=\"form-control\" id=\"exampleFormControlTextarea1\" rows=\"6\" name=\"content\"' required></textarea>");
									%>
								</div>
							</div>
							<div class="CommentBox">
								<ul class="comment_list">
									<li class="CommentItem">
										<div class="comment_area"></div>
									</li>
								</ul>
								<div class="CommentWriter">
								<%
								if(rs == null){
									out.print("<button type=\"submit\" class=\"btn btn-primary\" id=\"comment_submit\">submit</button>");
								}
								else{
									out.print("<button type=\"submit\" formaction=\"/phase4/board/lib/schedule_update_process.jsp?cid=" + request.getParameter("cid") + "\" class=\"btn btn-primary\" id=\"comment_submit\">Modify</button>");
									out.print("<button type=\"submit\" formaction=\"/phase4/board/lib/schedule_delete_process.jsp?cid=" + request.getParameter("cid") + "\" class=\"btn btn-primary\" id=\"comment_submit\">Delete</button>");
								}
								%>
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>

			<!-- end #posts -->
			<div id="links">
				<ul>
					<li>
						<h2>Archives</h2>
						<ul>
							<li><a href="#">Donec Dictum Metus</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- end #links -->
			<div style="clear: both;">&nbsp;</div>
		</div>
	</div>
	<!-- end #content -->
	<div id="footer">
		<p id="legal">
			Copyright &copy; 2007 The Coffee Shop. Designed by <a
				href="http://www.freecsstemplates.org/">Free CSS Templates</a>
		</p>
		<p id="brand">The Coffee Shop</p>
	</div>
	<!-- end #footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
