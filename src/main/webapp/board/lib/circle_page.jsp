<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import= "CirclePack.*" %>
<%@ page import= "java.sql.*" %>
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
<
<%	DBHelper db = DBHelper.getInstance();
	Circle circle = new Circle(db,"3");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>The Coffee Shop</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="<%=request.getContextPath()%>/board/css/default.css" rel="stylesheet" type="text/css" />
<style>
#header h2 {
	float: right;
	width: 494px;
	height: 34px;
	padding: 180px 20px 0 0;
	background: url(<%=circle.getThumbnail()%>) no-repeat;
	text-transform: lowercase;
	text-align: right;
	letter-spacing: -1px;
	font-size: 22px;
	font-weight: normal;
	font-style: italic;
	color: #FFFFFF;
}
</style>
</head>
<body>
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
    <h2><a href="#">Free CSS Templates</a></h2>
  </div>
  <!-- end #header -->
  <div id="content">
    <div id="posts">
      <div class="ArticleTopBtns">
            <div class="left_area">
            </div>
            <div class="right_area">
              <button type="button" class="btn btn-secondary" onclick="location.href='board_create_page.jsp?&cid=<%=request.getParameter("cid")%>&tid=<%=request.getParameter("tid")%>'" href="">create board</button>
            </div>
        </div>
      <%
      	out.println(Board.showBoardList(db, 3, 3));
      %>
      <div class="post">
        <h2 class="title">A Few Examples of Common Tags</h2>
        <div class="story">
          <p><strong></strong>This is an example of a paragraph followed by a blockquote. In posuere eleifend odio. Quisque semper augue mattis wisi. Maecenas ligula. Pellentesque viverra vulputate enim. Aliquam erat volutpat lorem ipsum dolorem.</p>
          <blockquote>
            <p>Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus. Donec placerat odio</p>
          </blockquote>
          <h3>Heading Level Three</h3>
          <p>An unordered list example:</p>
          <ul>
            <li>List item number one</li>
            <li>List item number two</li>
            <li>List item number three</li>
          </ul>
          <p>An ordered list example:</p>
          <ol>
            <li>List item number one</li>
            <li>List item number two</li>
            <li>List item number three</li>
          </ol>
        </div>
        <div class="meta">
          <p class="date">Posted on February 22, 2007 by Admin</p>
          <p class="file">Filed under <a href="#">Uncategorized</a> | <a href="#">Edit</a> | <a href="#">28 Comments</a></p>
        </div>
      </div>
    </div>
    <!-- end #posts -->
    <div id="links">
      <ul>
        <li>
          <h2><%=circle.getCname()%></h2>
          <ul>
            <li><a>total number : 20 </a></li>
            <li><a>Category : <%=circle.getCategoryName()%></a></li>
            <li><a>Manager : <%=circle.getManager()%></a></li>
            <li><a>phone-number : <%=circle.getPhoneNum()%></a></li>
          </ul>
        </li>
        <li>
          <h2></h2>
          <ul>
             <% out.println(Tab.showTabList(db,3));%>
          </ul>
          <button type="button" class="btn btn-secondary">Add Tab</button>
        </li>
      </ul>
    </div>
    <!-- end #links -->
    <div style="clear: both;">&nbsp;</div>
  </div>
</div>
<!-- end #content -->
<div id="footer">
  <p id="legal">Copyright &copy; 2007 The Coffee Shop. Designed by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a></p>
  <p id="brand">The Coffee Shop</p>
</div>
<!-- end #footer -->
</body>
</html>