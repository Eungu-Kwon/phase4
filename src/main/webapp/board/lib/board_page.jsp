<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import= "CirclePack.*" %>
<%@ page import= "CirclePack.Comment" %>
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

<%	
	int cid = Integer.parseInt(request.getParameter("cid"));
	int tid = Integer.parseInt(request.getParameter("tid"));
	int id = Integer.parseInt(request.getParameter("id"));
	DBHelper db = new DBHelper();
	Board board = new Board(request.getParameter("cid"),request.getParameter("tid"),request.getParameter("id"));
	Circle circle = new Circle(request.getParameter("cid"));
%>

<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Sprayed Strokes   
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20110329
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>The Coffee Shop</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
            <div class="left_area">
            </div>
            <div class="right_area">
              <form action="board_update_page.jsp?cid=<%=request.getParameter("cid")%>&tid=<%=request.getParameter("tid")%>&id=<%=request.getParameter("id")%>" method="post" accept-charset="utf-8">
              	<button type="submit" class="btn btn-secondary">modify</button>
              </form>
              <form action="board_delete_process.jsp?cid=<%=request.getParameter("cid")%>&tid=<%=request.getParameter("tid")%>&id=<%=request.getParameter("id")%>" method="post" accept-charset="utf-8">
              	<button type="submit" class="btn btn-secondary">delete</button>
              </form>
              
            </div>
        </div>
 		<div class="ArticleContentBox">
             <div class="article_header">
               <h2><%=board.getTitle()%></h2>
             </div>
             <div class="right_area">
              <p>Writer : <%=board.getUserId()%></p>
             </div>
             <div class="article_container">
               <div class="article_board">
                <p><%=board.getContent()%></p>
               </div>
               
                <div class="CommentBox">
                    <ul class="comment_list">
                        <%=Comment.getCommentListHTML(db, tid, cid, id)%>
                    </ul>
                    <div class="CommentWriter">
                    	<form action="comment_create_process.jsp?cid=<%=board.getCid()%>&tid=<%=board.getTid()%>&bid=<%=board.getId()%>" method="post" accept-charset="utf-8">
	                    	<div class="mb-3" id="comment_area">
	                            <label for="exampleFormControlInput1" class="form-label">댓글</label>
	                            <textarea class="form-control" id="exampleFormControlTextarea1"
										rows="2" name="content" placeholder="댓글을 입력하세요"></textarea>
	                        </div>
	                        <button type="submit" class="btn btn-primary" id="comment_submit">submit</button>
                    	</form>
                        
                    </div>
                </div>
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
        <li>
          <h2>Tab</h2>
          <ul>
             <%
             out.println("<li><a href=\"schedule.jsp?cid=" + circle.getId() + "\">스케줄</a></li>");
             out.println(Tab.showTabList(db,circle.getId()));
             %>
             
          </ul>
        </li>

      </ul>
    </div>
    <!-- end #links -->
    <div style="clear: both;">&nbsp;</div>
  </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>