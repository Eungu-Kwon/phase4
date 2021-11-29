<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" id="projectname" href="#">ALL CLub'S</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">schoolCLUB</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">miniCLUB</a>
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
    
      <link href="<%=request.getContextPath()%>/mainpage/css/sub.css" rel="stylesheet" type="text/css" />
    


  </head>
  <body>


    <div id="all">
        <div class="banner">
          <div class="banner_title">
            <p id="main_title">Make club</p>
            <!-- <p id="sub_title">Join our school clubs. It makes your School life more lively. <br>Also you can make club.</p> -->
          </div>
          <img class="banner_img" id="upload_bg"  src="main.png">
        </div>
        <div class="contents">

            <form name="input" action="response.jsp" method="get">


                <div class="input-group input-group-sm mb-3">
                    <span class="input-group-text" id="inputGroup-sizing-sm">Circle Name </span>
                    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                    
                </div>

                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">Description</span>
                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                  </div>
                  
                  <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon2">Your Phone Num</span>
                    <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                  </div>
            
               
                
                Project name  :
                <select name="projectName">
                    <option value="ProductX" selected>ProductX</option>
                    <option value="ProductY" selected>ProductY</option>
                    <option value="ProductZ" selected>ProductZ</option>
                    <option value="Computerization" selected>Computerization</option>
                    <option value="Reorganization" selected>Reorganization</option>
                    <option value="Newbenefits" selected>Newbenefits</option>
                </select>
                    Department  :
                <select name="dNum">
                    <option value="1" selected>1</option>
                    <option value="4" selected>4</option>
                    <option value="5" selected>5</option>
                </select>
                    Salary : <input type="text" name="salary"/>
                      
                    <button type="submit" class="btn btn-primary">Sign in</button>
                <input type="submit" value="submit"/>
		        <input type="reset" value="Reset" style="background-color: red; color: white" />
	
			
		
	</form>



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


