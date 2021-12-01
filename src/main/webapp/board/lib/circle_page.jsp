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
<%	DBHelper db = DBHelper.getInstance();
	Circle circle = new Circle(request.getParameter("cid"));
	int tid = 1;
	if (request.getParameter("tid") != null){
		tid = Integer.parseInt(request.getParameter("tid"));
	}
			
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
    <h1><%=circle.getCname() %></h1>
    
    <h2><a href="#"></a></h2>
  </div>
  <!-- end #header -->
  <div id="content">
    <div id="posts">
      <div class="ArticleTopBtns">
            <div class="left_area">
            </div>
            <div class="right_area">
              <button type="button" class="btn btn-secondary" onclick="location.href='board_create_page.jsp?&cid=<%=request.getParameter("cid")%>&tid=<%=tid%>'" href="">create board</button>
            </div>
        </div>
      <%
      	out.println(Board.showBoardList(db, circle.getId(), tid));
      %>
      <div class="post">
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
          <h2>Tab</h2>
          <ul>
             <% 
             out.println("<li><a href=\"schedule.jsp?cid=" + circle.getId() + "\">스케줄</a></li>");
             out.println(Tab.showTabList(db,circle.getId()));
             %>
          </ul>
        </li>
        <button type="button" class="btn btn-secondary" onclick="location.href='circle_modify_page.jsp?&cid=<%=request.getParameter("cid")%>'" >Manager Page</button>
        <button type="button" class="btn btn-secondary" onclick="location.href='add_tab_page.jsp?&cid=<%=request.getParameter("cid")%>'" >Add Tab</button>
      </ul>
    </div>
    <!-- end #links -->
    <div style="clear: both;">&nbsp;</div>
  </div>
</div>

</body>
</html>
