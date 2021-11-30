<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>
    
    
<%
DBHelper dbhelper = DBHelper.getInstance();
String query = "";
ResultSet rs = dbhelper.runSql(query);

request.setCharacterEncoding("UTF-8");

String cname = request.getParameter("cname");
String cid="0";

query = "select id from circle where cname like '%"+cname+"%'" ;
rs = dbhelper.runSql(query);
while(rs.next())
	cid=String.valueOf(rs.getInt(1));

response.sendRedirect("/phase4/mainpage/lib/detailclub.jsp?cid="+cid); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>