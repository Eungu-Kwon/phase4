<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pass");

DBHelper db = DBHelper.getInstance();

String sql = "SELECT * FROM USERS WHERE Id = '" + id + "' AND Pwd = '" + pwd + "'";

ResultSet rs = db.runSql(sql);

if(rs.next() == false){
	out.println("<script>alert('아이디와 패스워드를 다시 확인해주세요'); history.back();</script>");
}
else{
	HttpSession hs = request.getSession();
	hs.setAttribute("id", rs.getString(1));
	out.println("<script>window.location.href='/phase4/mypage/mypage.jsp'</script>");
	//response.sendRedirect("main.jsp");
}
%>