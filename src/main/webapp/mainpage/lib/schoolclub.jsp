<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
    
<!-- //mainpage/lib 안에 있는 모든 Jsp 파일에 똑같이 위에 초기화 시켜줄거임. -->
 <%	DBHelper db = DBHelper.getInstance();
 HttpSession sess = request.getSession();
/*  String id = (String)sess.getAttribute("id"); */
String id="xdpzkm748";
/* id=""; */
 DBHelper dbhelper = DBHelper.getInstance();
 String query = "";
 ResultSet rs = dbhelper.runSql(query);
 	
 %>
<!DOCTYPE html>
<html>
 <head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="<%=request.getContextPath()%>/mainpage/css/club.css" rel="stylesheet" type="text/css" />
	<title>Insert title here</title>
<!-- 네브바 --><!-- 
네브바는 일단 schoolclub만 만들어놓고 나중에 다른 페이지 들에도 적용시킬 예 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" id="projectname" href="#">ALL CLub'S</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
           	  <li class="nav-item">
               <a class="nav-link "  href="./mainpage.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="./schoolclub.jsp">schoolCLUB</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="./miniclub.jsp">miniCLUB</a>
               </li>
              <li class="nav-item">
                <a class="nav-link" href="#">About US</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  My Club's
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><p class="dropdown-item" id="school" >My school clubs'</p></li>
                  <% if (!id.isEmpty()) 
                  	{   query = "select cname from circle c, belongs_to b where b.cid=c.id and b.user_id='"+id+"' and c.iscircle='Y'";
						rs = dbhelper.runSql(query);
						while(rs.next()){
							out.println("<li><p class='dropdown-item' href='#'>"+rs.getString(1)+"</p></li>");
						}
                  	}
						%>
                  <li><hr class="dropdown-divider"></li>
                  <li><p class="dropdown-item" id="mini"  >My  mini club's</p></li>
                  <% if (!id.isEmpty()) 
                  	{   query = "select cname from circle c, belongs_to b where b.cid=c.id and b.user_id='"+id+"' and c.iscircle='N'";
						rs = dbhelper.runSql(query);
						while(rs.next()){
							out.println("<li><p class='dropdown-item' href='#' >"+rs.getString(1)+"</p></li>");
						}
                  	}
						%>
                  <li><hr class="dropdown-divider" ></li>
                  <li><a class="dropdown-item" id="mypage" href="#" >Go to my page</a></li>  <!-- mypage url -->
                </ul>
              </li>
              
            </ul>
             <% if (id.isEmpty())  
	            {
	           	    out.println("<form class='d-flex'>");
	           	    out.println("<button class='btn btn-outline-success' type='submit'>Sign-in</button> "); 
	 	            out.println("<button class='btn btn-outline-success' type='submit'>Join</button>");
	 	            out.println("</form>"); }
            %>
          </div>
        </div>
      </nav>

    
  </head>
  <body>
      <div id="all">
        <div class="banner">
          <!-- <div class="banner_title">Enjoy School club</div> -->
          <div class="banner_title">
            <p id="main_title">Enjoy School club</p>
            <p id="sub_title">Join our school clubs. It makes your School life more lively. <br>Also you can make club.</p>
          </div>
          <img class="banner_img" id="upload_bg"  src="<%=request.getContextPath()%>/mainpage/images/main.jpg" alt="My Image">
        </div>
        <div class="contents">
          <div class="toolbar">

            <!-- <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
              <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
              <label class="btn btn-outline-primary" for="btnradio1">All</label>
            
              <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
              <label class="btn btn-outline-primary" for="btnradio2">schoolclub</label>
            
              <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
              <label class="btn btn-outline-primary" for="btnradio3">miniclub</label>
            </div> -->
            
            <select id="select_option" name="categorys" id="cotegory-select">
              <option value="">--Please choose an option--</option>
              <option value="dog">Dog</option>
              <option value="cat">Cat</option>
              <option value="hamster">Hamster</option>
              <option value="parrot">Parrot</option>
              <option value="spider">Spider</option>
              <option value="goldfish">Goldfish</option>
            </select>

             <button class="create" onClick="location.href='<%=request.getContextPath()%>/mainpage/lib/makeclub.html'">➕ Make</button>
      
            
          </div>

          <div class="schoolclub">
            <div class="card" style="width: 18rem;">
              <img src="main.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
            <div class="card" style="width: 18rem;">
              <img src="main.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
            <div class="card" style="width: 18rem;">
              <img src="main.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
            <div class="card" style="width: 18rem;">
              <img src="main.png" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
        </div>
      </div>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>