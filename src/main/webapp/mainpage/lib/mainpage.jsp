<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "Circle.*" %>
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
    
<!DOCTYPE html>
 <%	DBHelper db = DBHelper.getInstance();
 
 HttpSession sess = request.getSession();
	  String id = (String)sess.getAttribute("id"); 
	 //String id="xdpzkm748";
	 //  String id=""; 
	 DBHelper dbhelper = DBHelper.getInstance();
	 String query = "";
	 ResultSet rs = dbhelper.runSql(query);
	 
	 request.setCharacterEncoding("UTF-8");
	
 %>
 
<html>
  <head>
  
  	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link href="<%=request.getContextPath()%>/mainpage/css/main.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  	
  
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
                  <% if (id!=null) 
                  	{   query = "select cname from circle c, belongs_to b where b.cid=c.id and b.user_id='"+id+"' and c.iscircle='Y'";
						rs = dbhelper.runSql(query);
						while(rs.next()){
							out.println("<li><p class='dropdown-item' href='#'>"+rs.getString(1)+"</p></li>");
						}
                  	}
						%>
                  <li><hr class="dropdown-divider"></li>
                  <li><p class="dropdown-item" id="mini"  >My  mini club's</p></li>
                  <% if  (id!=null) 
                  	{   query = "select cname from circle c, belongs_to b where b.cid=c.id and b.user_id='"+id+"' and c.iscircle='N'";
						rs = dbhelper.runSql(query);
						while(rs.next()){
							out.println("<li><p class='dropdown-item' href='#' >"+rs.getString(1)+"</p></li>");
						}
                  	}
						%>
                  <li><hr class="dropdown-divider" ></li>
                  <li><a class="dropdown-item" id="mypage" href="/phase4/mypage/mypage.jsp" >Go to my page</a></li>  <!-- mypage url -->
                </ul>
              </li>
              
            </ul>
             <% if (id==null)  
	            {
	           	    out.println("<div class='d-flex'>");
	           	    out.println("<button class='btn btn-outline-success' onclick=\"window.location.href='/phase4/sign/login.jsp';\">Sign-in</button> "); 
	 	            /* out.println("<button class='btn btn-outline-success' href='makeclub.jsp' type='submit'>Join</button>"); */
	 	            out.println("</div>"); 
	 	         }
             else{
            	 out.println("<div class='d-flex'>");
	           	    out.println("<button class='btn btn-outline-success' onclick=\"window.location.href='/phase4/sign/logout.jsp'; alert('Log out successed');\">Logout</button> "); 
	           	    //out.println("<script>alert('Log out successed')</script>");
	           	   
	           	    
	 	            /* out.println("<button class='btn btn-outline-success' href='makeclub.jsp' type='submit'>Join</button>"); */
	 	            out.println("</div>"); 
            	 
             }
            %>
          </div>
        </div>
      </nav>
    
    
    <title>Hello, world!</title>
  </head>
  <body>

    <div id="mainsection">
        <img id="main_image" src="<%=request.getContextPath()%>/mainpage/images/main.jpg" alt="My Image">
        <div id="search_form">
            <form name="input" action="./detail.jsp" method="get">
                <input id='search' type='text' placeholder="search any clubs you want."/>
                <input id="search_submit" type='submit'>
                
            </form>
        </div>
        
    </div>
    



    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  </body>
</html>