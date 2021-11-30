<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>
 <%	
	
	request.setCharacterEncoding("UTF-8");
 	HttpSession tempSession = request.getSession();
	String userId = (String)tempSession.getAttribute("id");
	Circle circle = new Circle(request.getParameter("cid"));
	
	if (userId.equals(circle.getManager())== false){
		String msg = "동아리 매니저만 접근할 수 있습니다.";
		out.println("<script>alert('"+msg+"');</script>");
		String s= "location.href='circle_page.jsp?cid="+circle.getId()+"';";
		out.println("<script>"+ s+"</script>");
		if(1==1) return;
		
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
    <link href="/phase4/mainpage/css/sub.css" rel="stylesheet" type="text/css" />


  </head>
  <body>


    <div id="all">
        <div class="contents">

            <form name="input" action="tab_create_process.jsp?cid=<%=request.getParameter("cid") %>" method="post">

                <div class="input-group mb-3">
                  <span class="input-group-text" >Tab</span>
                  <input type="text" name="tname" class="form-control" placeholder="탭 메뉴 이름을 입력해주세요">    
                </div>
                  <!-- <input type="image" src="/examples/images/submit_icon.png" alt="제출버튼"> -->
                    <div id="btn_sr">
                      <input type="submit" class="btn btn-primary" value="submit"></input>
                  </div>
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


