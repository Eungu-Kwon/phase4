<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "Circle.*" %>
<%@ page import= "java.sql.*" %>
    
<!DOCTYPE html>
 <%	DBHelper db = DBHelper.getInstance();%>
 
<html>
  <head>
  
  	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link href="<%=request.getContextPath()%>/mainpage/css/main.css" rel="stylesheet" type="text/css" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  	
  
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" id="projectname" href="#">ALL CLub'S</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="./mainpage.jsp">Home</a>   <!-- //active해주면 글씨 진하게  됨 -->
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
                  my Info
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <li><p class="dropdown-item" >My clubs'</p></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><p class="dropdown-item" >My  mini club's</p></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Go to my page</a></li>
                </ul>
              </li>
              
            </ul>
            <form class="d-flex">
              <button class="btn btn-outline-success" type="submit">Sign-in</button> 
              <button class="btn btn-outline-success" type="submit">Join</button>
            </form>
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