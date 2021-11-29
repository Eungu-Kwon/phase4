<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="mypage.css">
    </head>
<body>
<%
HttpSession sess = request.getSession();
String id = (String)sess.getAttribute("id");
//id = "dmsrn135";
DBHelper dbhelper = DBHelper.getInstance();
String query = "SELECT * FROM USERS WHERE Id = '" + id + "'";
ResultSet rs = dbhelper.runSql(query);
if (!rs.next()){
	out.println("<script>alert('회원정보를 확인해주세요'); history.back();</script>");
	return;
}
int dep = rs.getInt(5);
%>
	<section class="mypage">
		<form method="post" action="mypageresponse.jsp">
		
	        <h1 class="mypage">회원 정보 수정</h1>
	        <div class="mypage" class="input">
	            <div class="mypage" class="label">
	                <label class="mypage">이름</label>
	            </div>
	            <% out.println("<input class='mypage' type='text' name='name' value='" + rs.getString(3) + "' readonly>"); %>
	            <div class="mypage" class="label">
	                <label class="mypage">아이디</label>
	            </div>
	            <% out.println("<input class='mypage' type='text' name='id' value='" + rs.getString(1) + "' readonly>"); %>
	            <div class="mypage" class="label">
	                <label class="mypage">패스워드</label>
	            </div>
	            <% out.println("<input class='mypage' type='password' name='pass'>"); %>
	            <div class="mypage" class="label">
	                <label class="mypage">이메일</label>
	            </div>
	            <% out.println("<input class='mypage' type='text' name='email' value='" + rs.getString(4) + "'>"); %>
	           
	            <div class="mypage" class="label">
	                <label class="mypage">생일</label>
	            </div>
	            <%
	            String str = new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate(6));
	            out.println("<input class='mypage' type='date' name='date' min='1990-01-01' max='2004-12-31' value='" + str + "'>");
	            %>
	             <div class="mypage" class="label">
	                <label class="mypage">학과</label>
	            </div>
	            <select name="department" class="mypage">
	                <%
	                query = "SELECT * FROM DEPARTMENT";
	                ResultSet rs1 = dbhelper.runSql(query);
					while(rs1.next()){
						if(rs1.getInt(1) != dep)
							out.println("<option value='" + rs1.getString(1) + "'>" + rs1.getString(2) + "</option>");
						else
							out.println("<option value='" + rs1.getString(1) + "' selected>" + rs1.getString(2) + "</option>");
					}
	                %>
	            </select>
	        </div>
	        <input class="mypage" type="submit" value="설정">
        </form>
        <hr>
		<label class="circles">가입된 동아리</label>
		
		<%
		out.println("<table border=\"1\">");
		query = "SELECT CName, Cid FROM BELONGS_TO, CIRCLE WHERE User_Id = '" + id + "' AND Cid=Id";
		ResultSet rs2 = dbhelper.runSql(query);
		out.println("<th>이름</th><th> </th>");
		while(rs2.next()){
			out.println("<tr>");
			out.println("<td>" + rs2.getString(1) + "</td>");
			out.println("<td class='del-btn'><button onclick=\"delete_btn_clicked('" + id + "', " + rs2.getString(2) + ")\"'>X</button></td>");
			out.println("</tr>");
		}
		out.println("</table>");
		%>
		<hr>
		<label class="circles">회원 탈퇴</label>
		<% out.println("<button class=\"mypage\" onclick=\"delete_user_clicked('" + id + "')\">회원 탈퇴</button>"); %>
    </section>
    <script> 
    function delete_btn_clicked(id, cid){
    	var ret = confirm("동아리를 탈퇴하시겠습니까?");
    	if(ret)
    		window.location.href='deletecircle.jsp?id=' + id + '&cid=' + cid;
    }
    function delete_user_clicked(id){
    	var ret = confirm("회원 탈퇴하시겠습니까?");
    	if(ret)
    		window.location.href='deleteuser.jsp?id=' + id;
    }
    </script>
</body>
</html>