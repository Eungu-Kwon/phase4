<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>

 <%	
 
 HttpSession sess = request.getSession();
	  String id = (String)sess.getAttribute("id"); 
	 //String id="xdpzkm748";
	 //  String id=""; 
	 
	 DBHelper dbhelper = DBHelper.getInstance();
	 String query = "";
	 ResultSet rs = dbhelper.runSql(query);
	 
	 request.setCharacterEncoding("UTF-8");

	 String cid = request.getParameter("cid");
	 if (cid.equals(String.valueOf(0)))
	 {
		out.println("<script>alert('There are no such club')</script>");
	 }

	
 %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>

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
               <a class="nav-link active"  href="./mainpage.jsp">Home</a>
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
                  	{   query = "select c.cname,c.id from circle c, belongs_to b where b.cid=c.id and b.user_id='"+id+"' and c.iscircle='Y'";
						rs = dbhelper.runSql(query);
						while(rs.next()){
							out.println("<li><a class='dropdown-item' href='/phase4/board/lib/circle_page.jsp?cid="+rs.getString(2)+"' >"+rs.getString(1)+"</a></li>");
						}
                  	}
						%>
                  <li><hr class="dropdown-divider"></li>
                  <li><p class="dropdown-item" id="mini"  >My  mini club's</p></li>
                  <% if  (id!=null) 
                  	{   query = "select c.cname,c.id  from circle c, belongs_to b where b.cid=c.id and b.user_id='"+id+"' and c.iscircle='N'";
						rs = dbhelper.runSql(query);
						while(rs.next()){
							out.println("<li><a class='dropdown-item' href='/phase4/board/lib/circle_page.jsp?cid="+rs.getString(2)+"' >"+rs.getString(1)+"</a></li>");
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

    <link href="<%=request.getContextPath()%>/mainpage/css/subdetail.css" rel="stylesheet" type="text/css" />

  </head>
  <body>


    <div id="all">
        <div class="banner">
          <div class="banner_title">
            <p id="main_title">Apply club</p>
            <!-- <p id="sub_title">Join our school clubs. It makes your School life more lively. <br>Also you can make club.</p> -->
          </div>
          <img class="banner_img" id="upload_bg"  src="<%=request.getContextPath()%>/mainpage/images/main.jpg">
        </div>
        <div class="contents">

          <div class="detailcard" >
            
            
            <%
            	query="select cname,thumbnail,max_person,start_date,end_date,phone_num,category_id,description,iscircle from circle where id="+cid;
            	rs = dbhelper.runSql(query);
	        	int count=0;
				while(rs.next()){
	
		            	out.println("<img src='"+rs.getString(2)+"' class='card-img-top' alt='thumnamil'>");
		            	out.println("<div class='card-body'>");
						out.println("<h2 class='card-title'>"+rs.getString(1)+"</h2>");
						out.println("<p class='card-text'>"+rs.getString(8)+"</p>");
						out.println("<p class='card-text'>"+"회원 수:  "+rs.getString(3)+" 명</p>");
						out.println("<p class='card-text'>"+"모집 기간:  "+rs.getString(4)+" ~ "+rs.getString(5)+"</p>");
						out.println("<p class='card-text'>"+"Contact:  "+rs.getString(6)+"</p>");
						out.println("<p class='card-text'>"+"카테고리:  "+rs.getString(7)+"</p>");
						if ((rs.getString(9)).equals("Y"))
								out.println("<p class='card-text'>동아리 </p>");
						else
							out.println("<p class='card-text'>소모임  </p>");
						out.println("<button class='btn btn-outline-primary' onclick=\"window.location.href='/phase4/mainpage/lib/joinclub.jsp?cid="+cid+"';\">JOIN US</button> "); 
				}
			
			%>
            
           
         <!--      <button class='btn btn-primary' onclick="window.location.href='/phase4/mainpage/lib/mainpage.jsp';\">Join-us</button> -->
              <button class='btn btn-light' onclick="window.location.href='/phase4/mainpage/lib/schoolclub.jsp';">Back</button>
   
              <!-- <a href="#" class="btn btn-primary">Join US</a> -->
            </div>
          </div>


        </div>
  
    </div>
    

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>


