<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %> 

    
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pass");

DBHelper db = DBHelper.getInstance();

String sql = "SELECT * FROM USERS WHERE Id = '" + id + "' AND Pwd = '" + pwd + "'";

ResultSet rs = db.runSql(sql);


	//response.sendRedirect("main.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>