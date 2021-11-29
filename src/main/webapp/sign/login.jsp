<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign In / Up</title>
        <link rel="stylesheet" href="login.css">
    </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">로그인</button>
                    <button type="button" class="togglebtn" onclick="register()">회원가입</button>
                </div>
                <!-- <div class="social-icons">
                    <img src="img/fb.png" alt="facebook">
                    <img src="img/tw.png" alt="twitter">
                    <img src="img/gl.png" alt="google">
                </div> -->
                <form method="post" id="login" action="signinresponse.jsp" class="input-group">
                    <input type="text" class="input-field" placeholder="아이디" name="id" required>
                    <input type="password" class="input-field" placeholder="패스워드" name="pass" required>
                    <button class="submit">로그인</button>
                </form>
                <form method="post" id="register" action="signupresponse.jsp" class="input-group">
                    <input type="text" class="input-field" placeholder="아이디" name="reg-id" required>
                    <input type="password" class="input-field" placeholder="패스워드" name="reg-pass" required>
                    <input type="text" class="input-field" placeholder="이름" name="reg-name" required>
                    <input type="email" class="input-field"	 placeholder="이메일" name="reg-email"required>
                    <div>
                    <label>생일</label>
                    <input type="date" name="reg-date" class="input-field" 
				       min="1990-01-01" max="2004-12-31" value="2000-01-01" id="r-date">
				       </div>
				    <select name="reg-department" class="input-field">
						<option value="none" selected disabled hidden>학과를 선택해주세요</option>
						<%
						DBHelper dbhelper = DBHelper.getInstance();
						String query = "SELECT * FROM DEPARTMENT";
						
						ResultSet rs = dbhelper.runSql(query);
						while(rs.next()){
							out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
						}
						%>
					</select>
                    <button class="submit">등록</button>
                </form> 
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
            
            function getCookie(name) {
           	  let matches = document.cookie.match(new RegExp(
           	    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
           	  ));
           	  return matches ? decodeURIComponent(matches[1]) : undefined;
           	}
            
            window.onload = function(){
            	if(getCookie('sign') == 'up'){
            		register();
            	}
           	}
        </script>
    </body>
</html> 