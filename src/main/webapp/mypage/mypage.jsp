<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="mypage.css">
    </head>
<body>
<%
HttpSession sess = request.getSession();
String id = (String)sess.getAttribute("id");
DBHelper dbhelper = DBHelper.getInstance();
String query = "SELECT * FROM USERS WHERE Id = 'dmsrn135'";
ResultSet rs = dbhelper.runSql(query);
if (!rs.next()){
	out.println("<script>alert('회원정보를 확인해주세요'); history.back();</script>");
}
int dep = rs.getInt(5);
%>
	<form method="post" action="mypageresponse.jsp">
		<section class="mypage">
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
	    </section>
	</form>
</body>
</html>