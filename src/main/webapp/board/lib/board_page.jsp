<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import= "Circle.*" %>
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

<%	DBHelper db = DBHelper.getInstance();%>

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
<link href="../css/default.css" rel="stylesheet" type="text/css" />
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
  	<div class="Article">
        <div class="ArticleTopBtns">
            <div class="left_area">

            </div>
            <div class="right_area">
                <a href="https://cafe.naver.com/joonggonara?iframe_url=%2FArticleRead.nhn%3Fclubid%3D10050146%26articleid%3D881888998%26referrerAllArticles%3Dfalse%26menuid%3D155%26page%3D1%26boardtype%3DL" role="button" class="BaseButton btn_prev BaseButton--skinGray size_default"><svg aria-hidden="true" class="svg-icon ico-post-btn-arrow-up-323232"><use xlink:href="#ico-post-btn-arrow-up-323232"></use></svg><span class="BaseButton__txt">
                    이전글
                </span></a>
            </div>

        </div>
 		<div class="ArticleContentBox">
             <div class="article_header">

             </div>
             <div class="article_container">
				<p>아무거나 아무거나</p>
             </div>
    		
    	</div>
    </div> 	

    <!-- end #posts -->
    <div id="links">
      <ul>
        <li>
          <h2>Archives</h2>
          <ul>
                  <%out.println(Board.showBoard(db, 3, 3));%>
          </ul>
        </li>
        <li>
          <h2>Categories</h2>
          <ul>
            <li><a href="#">Donec Dictum Metus</a></li>
            <li><a href="#">Etiam Rhoncus Volutpat</a></li>
            <li><a href="#">Integer Gravida Nibh</a></li>
            <li><a href="#">Maecenas Luctus Lectus</a></li>
            <li><a href="#">Mauris Vulputate Dolor Nibh</a></li>
            <li><a href="#">Nulla Luctus Eleifend</a></li>
            <li><a href="#">Posuere Augue Sit Nisl</a></li>
          </ul>
        </li>
        <li>
          <h2>Blog Roll</h2>
          <ul>
            <li><a href="#">Donec Dictum Metus</a></li>
            <li><a href="#">Etiam Rhoncus Volutpat</a></li>
            <li><a href="#">Integer Gravida Nibh</a></li>
            <li><a href="#">Maecenas Luctus Lectus</a></li>
            <li><a href="#">Mauris Vulputate Dolor Nibh</a></li>
            <li><a href="#">Nulla Luctus Eleifend</a></li>
            <li><a href="#">Posuere Augue Sit Nisl</a></li>
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
  <p id="legal">Copyright &copy; 2007 The Coffee Shop. Designed by <a href="http://www.freecsstemplates.org/">Free CSS Templates</a></p>
  <p id="brand">The Coffee Shop</p>
</div>
<!-- end #footer -->
</body>
</html>
